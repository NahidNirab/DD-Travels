import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/CustomHttp/customhttp.dart';
import 'package:travel_app/custom_widget/hotel_data.dart';
import 'package:travel_app/custom_widget/resturant_data.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/providers/hotel_provider.dart';
import 'package:travel_app/screens/hotel_detils_pge.dart';
import 'package:travel_app/screens/login_page.dart';
import 'package:travel_app/utils/constance.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String Address = "";
  int currentindex = 0;
  bool selected = true;
  late HotelProvider hotelProvider;
  var data;
  GoogleMapController? mapController;
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(23.42796133580664, 90.085749655962), zoom: 14);

  Set<Marker> markers = {};
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: currentindex);
    super.initState();
  }

  void didChangeDependencies() {
    hotelProvider = Provider.of<HotelProvider>(context);
    hotelProvider.allHotel();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Where do\nyou wanna go?",
                    style: mytextstyle(Colors.white, 25.sp, FontWeight.w800),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55.h,
                        width: 55.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Center(
                          child: Icon(
                            Icons.shower,
                            size: 35.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Rainy",
                        style:
                            mytextstyle(Colors.white, 14.sp, FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.png"), fit: BoxFit.cover),
              ),
            ),
            Positioned(
                top: 180.h,
                height: 200.h,
                child: Container(
                  width: 414.w,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40.r)),
                )),
            Positioned(
                top: 158,
                child: Container(
                  width: 414,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.location_on_outlined),
                                      hintText: "Select Destination",
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0.w),
                                child: InkWell(
                                  onTap: () {
                                    _modalBottomSheet();
                                  },
                                  child: Container(
                                    height: 55.h,
                                    width: 65.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: Color(0xff08BA64)),
                                    child: Icon(
                                      Icons.map,
                                      size: 30.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Date",
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 55.h,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.search,
                                    size: 30.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 55.h,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.filter_list,
                                    size: 30.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.h),
                        child: Container(
                          width: 400.w,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      pageController!.jumpToPage(0);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selected == true
                                                ? Colors.redAccent
                                                : Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    height: 50.h,
                                    width: 150.w,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/hotel.png",
                                          width: 50.w,
                                        ),
                                        Text("Hotel/Resort")
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      pageController!.jumpToPage(1);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: Colors.white),
                                    height: 50.w,
                                    width: 140.w,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/res.png",
                                          width: 50.w,
                                        ),
                                        Text("Restaurant")
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.white),
                                  height: 50.h,
                                  width: 150.w,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "images/plane.png",
                                        width: 50.w,
                                      ),
                                      Text("Air Ticket")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 435.h,
                        child: PageView(
                          controller: pageController,
                          children: [
                            HotelData(),
                            ResturantData(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  _modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              height: 700.h,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          height: 500.h,
                          width: double.infinity,
                          child: GoogleMap(
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            initialCameraPosition: initialCameraPosition,
                            markers: markers,
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            onMapCreated: (GoogleMapController controller) {
                              googleMapController = controller;
                            },
                          ),
                        )
                      ]),
                    ),
                  ),
                  Expanded(child: Text(Address)),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 10.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          Position position = await _determinePosition();
                          setState(() {});
                          googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude),
                                  zoom: 14)));

                          markers.clear();
                          setState(() {});
                          markers.add(Marker(
                              markerId: const MarkerId('currentLocation'),
                              position: LatLng(
                                  position.latitude, position.longitude)));
                        },
                        child: Text("Use Location"),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
