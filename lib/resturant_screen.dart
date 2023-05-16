import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResturantScreen extends StatefulWidget {
  const ResturantScreen({super.key});

  @override
  State<ResturantScreen> createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "images/res.png",
                    height: 260,
                    width: 414,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber),
                        child: Center(
                            child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blueGrey,
                        ))),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber),
                        child: Center(
                            child: Icon(
                          Icons.image,
                          color: Colors.blueGrey,
                        ))),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber),
                        child: Center(
                            child: Icon(
                          Icons.more_horiz,
                          color: Colors.blueGrey,
                        ))),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        height: 36,
                        width: 101,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber),
                        child: Center(child: Text("Resturant"))),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.8)),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent.shade700,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "4.8",
                                style: TextStyle(
                                    color: Colors.amberAccent.shade700,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "images/jahaj.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "images/res.png",
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Tasty Resturant",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.black38,
                                    ),
                                    Text("Dhaka")
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "Aura Raja Ampat Dive Resort is a hotel in a good\nneighborhood, which is located at...\nRead more....")),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      color: Colors.black54,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.menu_book,
                                color: Colors.black54,
                                size: 30,
                              ),
                              Text("Menu")
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.black54,
                                size: 30,
                              ),
                              Text("Contact")
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.grid_on_rounded,
                                color: Colors.black54,
                                size: 30,
                              ),
                              Text("Order Online")
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Claim 50% Discount",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.arrow_right_alt)
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                            height: 226, width: 366, "images/2.png")),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Latest Reviews",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black)),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        )),

                    // page review//

                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(),
                            title: Text(
                              'John Smith',
                              textScaleFactor: 1,
                            ),
                            trailing: Text("20 Feb,2020"),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent.shade700,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent.shade700,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent.shade700,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent.shade700,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent.shade700,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Very good hotel. It gave an amazing service,\nquality and discounts were awesome. Very good\nhotel. It gave an amazing service,\nqualityand discounts were awesome...",
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                            height: 226, width: 366, "images/2.png")),

                    SizedBox(
                      height: 10,
                    ),

                    //   ResturantFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
