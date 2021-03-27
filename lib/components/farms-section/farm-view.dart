import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class ViewFarm extends StatefulWidget {
  final Farms farms;
  ViewFarm({Key key, this.farms}) : super(key: key);
  @override
  _ViewFarmState createState() => _ViewFarmState();
}

class _ViewFarmState extends State<ViewFarm> {
  @override
  void initState() {
    getFarmer();
    super.initState();
  }

  Future<String> getFarmer() {
    String farmer = "No Farmer";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List farmers =
          Provider.of<AppProviders>(context, listen: false).farmerList;
      farmers.forEach((element) {
        if (element.farmerId == widget.farms.farmerId) {
          setState(() {
            farmer = element.name;
          });
        }
      });
    });
    return Future.value(farmer);
  }

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                height: ht - 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [kDefaultCardShadow],
                ),
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.8,
                            initialPage: 0,
                            aspectRatio: 2,
                            enableInfiniteScroll: true,
                            reverse: true,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                          ),
                          items: widget.farms.images
                              .map((item) => Center(
                                    child: Image.asset(
                                      item,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      height: (ht - 100) * .7,
                                    ),
                                  ))
                              .toList(),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Farm Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: primary,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, bottom: 10, left: 18),
                                child: Row(
                                  children: [
                                    Text(
                                      "Farm ID: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: primaryLight,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.farms.farmId,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Description:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primaryLight,
                                        fontSize: 13),
                                  ),
                                ),
                                subtitle: Text(
                                  widget.farms.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, top: 10),
                                child: Wrap(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  runSpacing: 10,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "Crops on Farm:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: primaryLight,
                                          fontSize: 13),
                                    ),
                                    Container(
                                      child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          alignment: WrapAlignment.start,
                                          children: List.generate(
                                            widget.farms.cropType.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey,
                                                    radius: 4,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    widget
                                                        .farms.cropType[index],
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Location:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: primaryLight,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          widget.farms.location != null
                                              ? widget.farms.location
                                              : "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Farm Size:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: primaryLight,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          widget.farms.farmSize.toString() !=
                                                  null
                                              ? widget.farms.farmSize
                                                      .toString() +
                                                  " Acr"
                                              : "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Farmer",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: primary,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 18),
                                child: Row(
                                  children: [
                                    Text(
                                      "Farmer ID: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: primaryLight,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.farms.farmerId,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),

                              //Todo get farmer name and contact here and insert
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 18),
                                child: Row(
                                  children: [
                                    Text(
                                      "Farmer Name: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: primaryLight,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "Farmer Name Here",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 18),
                                child: Row(
                                  children: [
                                    Text(
                                      "Farmer Contact: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: primaryLight,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "+233 0248485308",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Farm History",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: primary,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: primaryLight,
                                  border: Border(
                                      top: BorderSide(
                                          width: 1, color: Colors.grey)),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Date',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text(
                                          'Activity on Farm',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text(
                                          'Inputs',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: widget.farms.farmState.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return historyRow(
                                          widget.farms.farmState[index]
                                              ['stamp'],
                                          widget.farms.farmState[index]
                                              ['state'],
                                          widget.farms.farmState[index]
                                              ['input']);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ))
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
                          Text(
                            "Farm ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primary,
                                fontSize: 22),
                          ),
                          Text(
                            '#${widget.farms.farmId}',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black54,
                                fontSize: 32),
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
                          child: Container(
                            height: double.infinity,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                viewportFraction: 0.8,
                                initialPage: 0,
                                aspectRatio: 2,
                                enableInfiniteScroll: true,
                                reverse: true,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                              ),
                              items: widget.farms.images
                                  .map((item) => Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              item,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                              height: (ht - 100) * .7,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 500.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 10, left: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Farm ID: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: primary,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            widget.farms.farmId,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black54,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          "Crops on Farm:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: primary,
                                              fontSize: 14),
                                        ),
                                      ),
                                      subtitle: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          alignment: WrapAlignment.start,
                                          children: List.generate(
                                            widget.farms.cropType.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey,
                                                    radius: 4,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    widget
                                                        .farms.cropType[index],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                "Location:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: primary,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                widget.farms.location != null
                                                    ? widget.farms.location
                                                    : "",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                "Farm Size:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: primary,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                widget.farms.farmSize
                                                            .toString() !=
                                                        null
                                                    ? widget.farms.farmSize
                                                            .toString() +
                                                        " Acr"
                                                    : "",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Description:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: primary,
                                              fontSize: 14),
                                        ),
                                      ),
                                      subtitle: Text(
                                        widget.farms.description,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 16,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: primaryLight.withOpacity(0.5),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Farmer",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primary,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 18),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Farmer ID: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: primary,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              widget.farms.farmerId,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),

                                      //Todo get farmer name and contact here and insert
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 18),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Farmer Name: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: primary,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "Farmer Name Here",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 18),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Farmer Contact: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: primary,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "+233 0248485308",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: primaryLight.withOpacity(0.5),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Farm History",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primary,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: primaryLight,
                                        border: Border(
                                            top: BorderSide(
                                                width: 1, color: Colors.grey)),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'Date',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                          Container(
                                              width: 150,
                                              child: Text(
                                                'Activity on Farm',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                          Container(
                                              width: 150,
                                              child: Text(
                                                'Inputs',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              widget.farms.farmState.length,
                                          itemBuilder:
                                              (BuildContext ctxt, int index) {
                                            return historyRow(
                                                widget.farms.farmState[index]
                                                    ['stamp'],
                                                widget.farms.farmState[index]
                                                    ['state'],
                                                widget.farms.farmState[index]
                                                    ['input']);
                                          }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
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

  Widget historyRow(String date, String activity, String input) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: Colors.grey)),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            child: Text(
              date != null ? date : '',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 16),
            ),
          ),
          Container(
            width: 150,
            child: Text(activity != null ? activity : '',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 16)),
          ),
          Container(
            width: 150,
            child: Text(
              input != null ? input : '',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
