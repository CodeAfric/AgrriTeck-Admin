import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../constants.dart';

class DiseasesView extends StatefulWidget {
  final Diseases disease;
  DiseasesView({Key key,this.disease}) : super(key: key);

  @override
  _DiseasesViewState createState() => _DiseasesViewState();
}

class _DiseasesViewState extends State<DiseasesView> {

  @override
  Widget build(BuildContext context) {
    var ht=MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: 150,
                      child: RoundedButton(
                        color: primaryDark,
                        text: 'Train Model',
                        textColor: Colors.white,
                        fontSize: 14,
                        horizontalPadding: 15,
                        press: (){

                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Tooltip(
                      message: "Close Window",
                      child: IconButton(
                          splashColor: Colors.grey,
                          hoverColor: Colors.grey,
                          highlightColor: Colors.white,
                          icon: Icon(
                            FontAwesome.close,
                            color: Colors.redAccent,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  )
                ],
              ),
              Center(
                child:  Container(
                  height: ht-150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [kDefaultCardShadow],
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 20,),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: false,
                            ),
                            items: widget.disease.images.map((item) => Center(
                              child: Image.asset(item,width: double.infinity,fit: BoxFit.fill,height:(ht-100)*.7 ,),
                            )).toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.disease.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryDark),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Causes of Disease:\n',style:  TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: primaryDark,
                                      fontWeight: FontWeight.bold) ),
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Signs of Disease:\n',style:  TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: primaryDark,
                                      fontWeight: FontWeight.bold) ),
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Preventive Measures:\n',style:  TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: primaryDark,
                                      fontWeight: FontWeight.bold) ),
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
      desktopScreen: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.9),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 250,vertical: 10),
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                offset: Offset(10, 20),
                blurRadius: 100,
                color: Colors.black.withOpacity(0.7),
              ),],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: 200,
                        child: RoundedButton(
                          color: primaryDark,
                          text: 'Train Model',
                          textColor: Colors.white,
                          fontSize: 14,
                          horizontalPadding: 15,
                          press: (){

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Tooltip(
                        message: "Close Window",
                        child: IconButton(
                            splashColor: Colors.grey,
                            hoverColor: Colors.grey,
                            highlightColor: Colors.white,
                            icon: Icon(
                              FontAwesome.close,
                              color: Colors.redAccent,
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    )
                  ],
                ),
                Container(
                  height: ht-118,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [kDefaultCardShadow],
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: false,
                            ),
                            items: widget.disease.images.map((item) => Center(
                              child: Image.asset(item,width: double.infinity,fit: BoxFit.fill,height:(ht-100)*.7 ,),
                            )).toList(),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.disease.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryDark),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Causes of Disease:\n',style:  TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: primaryDark,
                                      fontWeight: FontWeight.bold) ),
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Signs of Disease:\n',style:  TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: primaryDark,
                                      fontWeight: FontWeight.bold) ),
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Preventive Measures:\n',style:  TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: primaryDark,
                                      fontWeight: FontWeight.bold) ),
                                  TextSpan(
                                      text:  widget.disease.description ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
