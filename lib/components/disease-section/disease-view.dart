import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/components/Common-widget/sliding-image.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../constants.dart';

class DiseasesView extends StatefulWidget {
  final Diseases disease;
  DiseasesView({Key key, this.disease}) : super(key: key);

  @override
  _DiseasesViewState createState() => _DiseasesViewState();
}

class _DiseasesViewState extends State<DiseasesView> {
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    padding:
                        const EdgeInsets.only(right: 15, top: 15, left: 15),
                    child: SizedBox(
                      width: 150,
                      child: RoundedButton(
                        color: primaryDark,
                        text: 'Train Model',
                        textColor: Colors.white,
                        fontSize: 14,
                        horizontalPadding: 15,
                        press: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Tooltip(
                      message: "Close Window",
                      child: IconButton(
                          splashColor: Colors.grey,
                          hoverColor: Colors.grey,
                          highlightColor: Colors.white,
                          icon: Icon(
                            FontAwesome.close,
                            color: Colors.redAccent,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageSlider(
                          items: widget.disease.images,
                          ht: ht,
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
                                TextSpan(text: widget.disease.description),
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
                                    text: 'Causes of Disease:\n',
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: widget.disease.description),
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
                                    text: 'Signs of Disease:\n',
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: widget.disease.description),
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
                                    text: 'Preventive Measures:\n',
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: widget.disease.description),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      desktopScreen: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: primary, width: 1.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(10, 20),
                  blurRadius: 100,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: primaryLight.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CustomImageSlider(
                            items: widget.disease.images,
                            ht: ht,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          SizedBox(
                            width: 200,
                            child: RoundedButton(
                              color: primaryDark,
                              text: 'Train Model',
                              textColor: Colors.white,
                              fontSize: 14,
                              horizontalPadding: 15,
                              press: () {},
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Tooltip(
                          message: "Close Window",
                          child: IconButton(
                              splashColor: Colors.grey,
                              hoverColor: Colors.grey,
                              highlightColor: Colors.white,
                              icon: Icon(
                                FontAwesome.close,
                                color: Colors.redAccent,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ht - 118,
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomImageSlider(
                            items: widget.disease.images,
                            ht: ht,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.disease.name,
                                    style: TextStyle(
                                        fontSize: 24,
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
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: widget.disease.description),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: primaryLight.withOpacity(0.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Causes of Disease:\n',
                                            style: TextStyle(
                                                fontSize: 20,
                                                height: 1.5,
                                                color: primaryDark,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: widget.disease.description),
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
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Signs of Disease:\n',
                                            style: TextStyle(
                                                fontSize: 20,
                                                height: 1.5,
                                                color: primaryDark,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: widget.disease.description),
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
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Preventive Measures:\n',
                                            style: TextStyle(
                                                fontSize: 20,
                                                height: 1.5,
                                                color: primaryDark,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: widget.disease.description),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
