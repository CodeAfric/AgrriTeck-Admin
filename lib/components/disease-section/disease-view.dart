import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
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
        padding: EdgeInsets.symmetric(vertical: 150, horizontal: 200),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
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
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                  padding: EdgeInsets.all(15),
                  height: 250,
                  width: double.infinity,
                ),
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
                    Spacer(),
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
                  height: ht-115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [kDefaultCardShadow],
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      //margin: EdgeInsets.symmetric(horizontal: 150,vertical: 20),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(widget.disease.images[0],width: double.infinity,fit: BoxFit.fill,height:(ht-100)*.7 ,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.disease.name,
                              style: TextStyle(
                                  fontSize: 20,
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
                                    fontSize: 18,
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
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Causes of Disease:\n',style:  TextStyle(
                                      fontSize: 18,
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
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Signs of Disease:\n',style:  TextStyle(
                                      fontSize: 18,
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
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:  'Preventive Measures:\n',style:  TextStyle(
                                      fontSize: 18,
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
