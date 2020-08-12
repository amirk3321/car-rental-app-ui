import 'package:car_rental_app_ui/repository/repository.dart';
import 'package:car_rental_app_ui/screen/common/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CarDetailPage extends StatefulWidget {
  final String image;

  const CarDetailPage({Key key, @required this.image}) : super(key: key);

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  String _imageHolder = "";

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _headerWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  carGalleryWidget(sizingInformation),
                  SizedBox(
                    height: 15,
                  ),
                  cardTimeWidget(sizingInformation),
                  SizedBox(
                    height: 15,
                  ),
                  _infoWidget(sizingInformation),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _headerWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Ride It",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/chat.png',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _profileRowDataWidget(),
        ],
      ),
    );
  }

  Widget _profileRowDataWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 45,
                width: 45,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: Image.asset(
                      'assets/profile.jpeg',
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ahmed Abdullah",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("85 Trips")
                ],
              )
            ],
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                Text(
                  "4.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget carGalleryWidget(SizingInformation sizingInformation) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Container(
              width: sizingInformation.localWidgetSize.width,
              height: 180,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    _imageHolder == "" ? widget.image : _imageHolder,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: FakeRepository.sliderData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _imageHolder =
                            FakeRepository.sliderData[index].sliderImage;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          FakeRepository.sliderData[index].sliderImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoWidget(SizingInformation sizingInformation) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Ahmed Abdullah",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Sheikh Bin Abdullah Rashid - Dubai -",),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Trip Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("SAR 70.8/day",),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("7 Days Trip",),
                      Text("SAR 70.8/day",),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("780 Total Miles",),
                      Text("FREE",style: TextStyle(color: Colors.red),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("TRIP TOTAL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("SAR 70.8/Day",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Your Info",),
                      Text("ADD",style: TextStyle(color: Colors.red),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Payment Info",),
                      Text("ADD",style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ],
              ),
            )
          ),
          SizedBox(height: 20,),
          Text("You Wan't be charge until Ahmed Configure this Trip"),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            width: sizingInformation.localWidgetSize.width,
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: Text("RIDE NOW",style: TextStyle(fontSize: 18,color: Colors.white),),
          ),
        ],
      )
    );
  }

}
