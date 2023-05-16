import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/custom_widget/hotel_data.dart';
import 'package:travel_app/providers/hotel_provider.dart';
import 'package:travel_app/utils/constance.dart';

import '../models/hotel_model.dart';

class HotelDetailsPage extends StatefulWidget {
  static const String routeName = '/hotel_details';

  HotelDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  HotelList? hotelList;
  HotelProvider? hotelProvider;
  HotelModel? hotelModel;

  void didChangeDependencies() {
    hotelProvider = Provider.of<HotelProvider>(context);
    hotelProvider!.allHotel();
    // hotelProvider!.hotelModel!.hotelList;
    final argList = ModalRoute.of(context)!.settings.arguments as List;

    hotelList = argList[0];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  // child: CachedNetworkImage(
                  //   imageUrl:
                  //       "https://ddtravels.safafirm.com/${hotelList!.photo}",
                  //   width: double.infinity,
                  //   height: 200.h,
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) => SpinKitFadingCircle(
                  //     color: Colors.greenAccent,
                  //   ),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  height: 200.h,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    height: 700.h,
                    width: 414.w,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffF4B806),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("${hotelList!.hotelRating!.star}"),
                                ],
                              ),
                              CircleAvatar(
                                child:
                                    Icon(Icons.youtube_searched_for_outlined),
                              )
                            ],
                          ),
                          // social link

                          SizedBox(
                            height: 10,
                          ),
                          Text("${hotelList!.name}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                              )),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                "${hotelList!.location}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${hotelList!.description}",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Available Offers",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month_outlined),
                                      Text("Change Date")
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text("More"),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("Services"),
                              Row(
                                children: [
                                  Icon(Icons.check),
                                  Text("Laundry Service"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check),
                                  Text("${hotelList!.services}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check),
                                  Text("${hotelList!.services}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check),
                                  Text("${hotelList!.services}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check),
                                  Text("${hotelList!.services}"),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Letest Review
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      "Latest Review",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_rounded))
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.teal,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "name",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20.sp,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffF4B806),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffF4B806),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffF4B806),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffF4B806),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffF4B806),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text("20 Feb, 2023")
                                      ],
                                    ),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Image.asset(
                                "images/map.png",
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                leading: Icon(Icons.facebook_rounded),
                                title: Text(
                                  "Facebook Page",
                                  style: TextStyle(),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                leading: Icon(Icons.my_library_books_rounded),
                                title: Text(
                                  "Visit Website",
                                  style: TextStyle(),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                leading: Icon(Icons.my_library_books_rounded),
                                title: Text(
                                  "Privacy Policy",
                                  style: TextStyle(),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text(
                                  "How to Claim?",
                                  style: TextStyle(),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                leading: Icon(
                                  Icons.headset_mic_outlined,
                                ),
                                title: Text(
                                  "Help & Support",
                                  style: TextStyle(),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //       Container(
                //     height: 150,
                //     width: double.infinity,
                //     child: FutureBuilder<HotelModel>(
                //         future: hotelProvider.hotelModel.hotelList,
                //         builder: (context, snapshot) {
                //           if (snapshot.connectionState ==
                //               ConnectionState.waiting) {
                //             return Center(
                //               child: CircularProgressIndicator(),
                //             );
                //           } else if (snapshot.hasError) {
                //             return Center(child: CircularProgressIndicator());
                //           } else if (snapshot.data == null) {
                //             return Text("snapshot data are null");
                //           }
                //           return Container(
                //             height: 150,
                //             width: double.infinity,
                //             child: ListView.builder(
                //                 scrollDirection: Axis.horizontal,
                //                 itemCount: hotelProvider!
                //                     .hotelModel!.hotelList!.length,
                //                 // popularDealsModel!.popularDeals!.length,
                //                 itemBuilder: (context, index) {
                //                   var data = hotelProvider!
                //                       .hotelModel!
                //                       .hotelList![index];
                //                   //    snapshot.data!.popularDeals![index];
                //                   return Padding(
                //                     padding: EdgeInsets.only(
                //                       right: 10.0.w,
                //                     ),
                //                     child: Container(
                //                       height: 150.h,
                //                       width: 400.w,
                //                       color: Colors.white70,
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Container(
                //                             height: double.infinity,
                //                             width: 100,
                //                             // child: CachedNetworkImage(
                //                             //   imageUrl:
                //                             //       "https://ddtravels.safafirm.com/${data.photo}",
                //                             //   width: double.infinity,
                //                             //   height: 250,
                //                             //   fit: BoxFit.cover,
                //                             //   placeholder: (context, url) =>
                //                             //       SpinKitFadingCircle(
                //                             //     color: Colors.greenAccent,
                //                             //   ),
                //                             //   errorWidget:
                //                             //       (context, url, error) =>
                //                             //           Icon(Icons.error),
                //                             // ),

                //                             // NetworkImage(
                //                             //     "https://ddtravels.safafirm.com/${data.photo}"),
                //                           ),
                //                           Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment
                //                                     .spaceBetween,
                //                             children: [
                //                               Column(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   Text(
                //                                     "${data.name}",
                //                                     style: TextStyle(
                //                                         fontSize: 18),
                //                                   ),
                //                                   Row(
                //                                     children: [
                //                                       Icon(
                //                                         Icons.location_on,
                //                                         size: 14,
                //                                       ),
                //                                       Text(
                //                                         "${data.location}",
                //                                         style: TextStyle(
                //                                             fontSize: 13,
                //                                             color: Color(
                //                                                 0xff9C9C9C)),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ],
                //                               ),
                //                               Column(
                //                                 children: [
                //                                   Row(
                //                                     children: [
                //                                       Icon(
                //                                         Icons.star,
                //                                         color:
                //                                             Color(0xffF4B806),
                //                                       ),
                //                                       Icon(
                //                                         Icons.star,
                //                                         color:
                //                                             Color(0xffF4B806),
                //                                       ),
                //                                       Icon(
                //                                         Icons.star,
                //                                         color:
                //                                             Color(0xffF4B806),
                //                                       ),
                //                                       Icon(
                //                                         Icons.star,
                //                                         color:
                //                                             Color(0xffF4B806),
                //                                       ),
                //                                       Icon(
                //                                         Icons.star,
                //                                         color:
                //                                             Color(0xffF4B806),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                   Text("Riview")
                //                                 ],
                //                               ),
                //                             ],
                //                           ),
                //                           Column(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment
                //                                     .spaceBetween,
                //                             children: [
                //                               Container(
                //                                 decoration: BoxDecoration(
                //                                   image: DecorationImage(
                //                                     image: AssetImage(
                //                                         "images/offershap.png"),
                //                                     fit: BoxFit.fitHeight,
                //                                   ),
                //                                 ),
                //                                 height: 40,
                //                                 width: 40,
                //                                 child: Center(
                //                                   child: Text(
                //                                     "${data.discount}%",
                //                                     style: TextStyle(
                //                                         fontSize: 13,
                //                                         fontWeight:
                //                                             FontWeight.w700,
                //                                         color: Colors.white),
                //                                   ),
                //                                 ),
                //                               ),
                //                               Column(
                //                                 children: [
                //                                   Text("available offer"),
                //                                   Text(
                //                                     "${data.offerPrice}\$",
                //                                     style: mytextstyle(
                //                                       Color(0xff08BA64),
                //                                       15.sp,
                //                                       FontWeight.w700,
                //                                     ),
                //                                   ),
                //                                   Text(
                //                                     " ${data.price}\$",
                //                                     style: TextStyle(
                //                                       decoration:
                //                                           TextDecoration
                //                                               .lineThrough,
                //                                       color:
                //                                           Color(0xff08BA64),
                //                                       fontSize: 13.sp,
                //                                       fontWeight:
                //                                           FontWeight.w300,
                //                                     ),
                //                                   )
                //                                 ],
                //                               ),
                //                             ],
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   );
                //                 }),
                //           );
                //         }),
                //   ),
              ],
            )),
      ),
    );
  }
}
