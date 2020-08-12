import 'package:car_rental_app_ui/repository/repository.dart';
import 'package:car_rental_app_ui/screen/pages/car_detail_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:meta/meta.dart';

import 'common/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navBarPageSelector = 0;
  int _rowButtonController = 0;
  int _sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        bottomNavigationBar: _bottomNav(sizingInformation),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 35, right: 15, left: 15),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //HeaderWidget
                _headerWidget(),
                SizedBox(
                  height: 10,
                ),
                cardTimeWidget(sizingInformation),
                SizedBox(
                  height: 10,
                ),
                _rowButtons(),
                SizedBox(
                  height: 15,
                ),
                _sliderWidgetCard(sizingInformation),
                SizedBox(
                  height: 15,
                ),
                _popularCarsHeadingWidget(),
                SizedBox(
                  height: 15,
                ),
                _listCarWidgetHorizontal(sizingInformation),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _bottomNav(SizingInformation sizingInformation) {
    return Container(
      height: sizingInformation.screenSize.height * 0.09,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _navBarItem(
            title: "Home",
            image: "assets/home.png",
            onPressed: () {
              setState(() {
                _navBarPageSelector = 0;
              });
            },
            selectedItemColor:
                _navBarPageSelector == 0 ? Colors.red : Colors.white,
            selectedItemIconTextColor:
                _navBarPageSelector == 0 ? Colors.white : Colors.red,
          ),
          _navBarItem(
              title: "Ride",
              image: "assets/ride.png",
              onPressed: () {
                setState(() {
                  _navBarPageSelector = 1;
                });
              },
              selectedItemColor:
                  _navBarPageSelector == 1 ? Colors.red : Colors.white,
              selectedItemIconTextColor:
                  _navBarPageSelector == 1 ? Colors.white : Colors.red),
          _navBarItem(
            title: "Chat",
            image: "assets/chat.png",
            onPressed: () {
              setState(() {
                _navBarPageSelector = 2;
              });
            },
            selectedItemColor:
                _navBarPageSelector == 2 ? Colors.red : Colors.white,
            selectedItemIconTextColor:
                _navBarPageSelector == 2 ? Colors.white : Colors.red,
          ),
          _navBarItem(
              title: "Share Ride",
              image: "assets/share-ride.png",
              onPressed: () {
                setState(() {
                  _navBarPageSelector = 3;
                });
              },
              selectedItemColor:
                  _navBarPageSelector == 3 ? Colors.red : Colors.white,
              selectedItemIconTextColor:
                  _navBarPageSelector == 3 ? Colors.white : Colors.red),
        ],
      ),
    );
  }

  Widget _navBarItem(
      {@required String title,
      @required String image,
      VoidCallback onPressed,
      Color selectedItemColor,
      Color selectedItemIconTextColor}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        decoration: BoxDecoration(
            color: selectedItemColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 25,
              child: Image.asset(
                image,
                color: selectedItemIconTextColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: selectedItemIconTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Image.asset(
                  'assets/profile.jpeg',
                )),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Location",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: <Widget>[
                    Text("Gulshan-e-Iqbalm, Karachi, Pakistan"),
                    Icon(Icons.arrow_drop_down),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Icon(Icons.image),
          )
        ],
      ),
    );
  }


  Widget _rowButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _rowButtonSingleItem(
              image: "assets/car-icon-1.png",
              title: "HATCHBACK",
              selectedItemTextColor:
                  _rowButtonController == 0 ? Colors.red : Colors.black,
              selectedBgColor:
                  _rowButtonController == 0 ? Colors.red : Colors.white,
              selectedItemIconColor:
                  _rowButtonController == 0 ? Colors.white : Colors.red,
              onPressed: () {
                setState(() {
                  _rowButtonController = 0;
                });
              }),
          _rowButtonSingleItem(
              image: "assets/car-icon-2.png",
              title: "SEDAN",
              selectedItemTextColor:
                  _rowButtonController == 1 ? Colors.red : Colors.black,
              selectedBgColor:
                  _rowButtonController == 1 ? Colors.red : Colors.white,
              selectedItemIconColor:
                  _rowButtonController == 1 ? Colors.white : Colors.red,
              onPressed: () {
                setState(() {
                  _rowButtonController = 1;
                });
              }),
          _rowButtonSingleItem(
              image: "assets/car-icon-3.png",
              title: "SUV",
              selectedItemTextColor:
                  _rowButtonController == 3 ? Colors.red : Colors.black,
              selectedBgColor:
                  _rowButtonController == 3 ? Colors.red : Colors.white,
              selectedItemIconColor:
                  _rowButtonController == 3 ? Colors.white : Colors.red,
              onPressed: () {
                setState(() {
                  _rowButtonController = 3;
                });
              }),
          _rowButtonSingleItem(
              image: "assets/car-icon-4.png",
              title: "CROSSOVER",
              selectedItemTextColor:
                  _rowButtonController == 4 ? Colors.red : Colors.black,
              selectedBgColor:
                  _rowButtonController == 4 ? Colors.red : Colors.white,
              selectedItemIconColor:
                  _rowButtonController == 4 ? Colors.white : Colors.red,
              onPressed: () {
                setState(() {
                  _rowButtonController = 4;
                });
              }),
        ],
      ),
    );
  }

  Widget _rowButtonSingleItem({
    @required String image,
    @required String title,
    Color selectedBgColor,
    Color selectedItemIconColor,
    Color selectedItemTextColor,
    VoidCallback onPressed,
  }) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: selectedBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Image.asset(
                image,
                color: selectedItemIconColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: selectedItemTextColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _sliderWidgetCard(SizingInformation sizingInformation) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 260.0,
            aspectRatio: 0.10,
            viewportFraction: 2.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _sliderIndex = index;
              });
            }),
        items: FakeRepository.sliderData.map((sliderData) {
          return Builder(
            builder: (_) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => CarDetailPage(image: sliderData.sliderImage,),
                  ));
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                            height: 190,
                            width: sizingInformation.screenSize.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                sliderData.sliderImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 18,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10))),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    sliderData.rating,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 18,
                            bottom: 0,
                            left: 18,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 135),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10)),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    FakeRepository.sliderData.map((sliderData) {
                                  return Container(
                                    height: 7.0,
                                    width: 7.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _sliderIndex ==
                                              FakeRepository.sliderData
                                                  .indexOf(sliderData)
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width:
                                  sizingInformation.localWidgetSize.width * 0.80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    sliderData.title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        sliderData.totalStar,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("star")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _listCarWidgetHorizontal(SizingInformation sizingInformation) {
    return Container(
      height: 190,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: FakeRepository.listViewData.length,
          itemBuilder: (BuildContext context, int index) {
            return _listViewItem(index, sizingInformation);
          },
        ),
      ),
    );
  }

  Widget _listViewItem(int index, SizingInformation sizingInformation) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: sizingInformation.localWidgetSize.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    FakeRepository.listViewData[index].sliderImage,
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10))),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                Text(
                  FakeRepository.listViewData[index].rating,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        FakeRepository.listViewData[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            FakeRepository.listViewData[index].totalStar,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text("Star"),
                        ],
                      ),
                    ],
                  ),
                  Text(
                      "${FakeRepository.listViewData[index].totalTrips} Trips"),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _popularCarsHeadingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("Popular Cars",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        SizedBox(height: 5,),
        Text("Popular Car: United Arab")
      ],
    );
  }
}
