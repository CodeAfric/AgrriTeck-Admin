import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/sliding-image.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../constants.dart';

class ViewCommunity extends StatefulWidget {
  final Community community;
  ViewCommunity({Key key, this.community}) : super(key: key);
  @override
  _ViewCommunityState createState() => _ViewCommunityState();
}

class _ViewCommunityState extends State<ViewCommunity> {
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageSlider(
                              items: widget.community.images,
                              ht: ht,
                            ),
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    widget.community.name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: primaryDark),
                                  ),
                                  SizedBox(width: 30,),
                                  Icon(Icons.location_on_sharp,color: Colors.grey,size: 15,),
                                  Text(
                                    widget.community.location,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              leading: AnimatedContainer(
                                duration: Duration(seconds: 500),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(widget.community.userImage),
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.date_range_rounded,color: Colors.grey,size: 15,),
                                    SizedBox(width: 8,),
                                    Text(widget.community.date, style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),),
                                    SizedBox(width: 30,),
                                    Icon(FontAwesome.tree,color: Colors.grey,size: 15,),
                                    SizedBox(width: 8,),
                                    Text(widget.community.relatedCrop, style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: ListTile(
                                title: Text(widget.community.question,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(widget.community.description,
                                    style: TextStyle(
                                        fontSize: 13,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text('Replies'),

                          ],
                        ),
                      ),
                    ),
                  )),
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
            width: MediaQuery.of(context).size.width * .8,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                Container(
                  height: ht - 118,
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
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageSlider(
                            items: widget.community.images,
                            ht: ht,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Text(
                                  widget.community.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: primaryDark),
                                ),
                                SizedBox(width: 30,),
                                Icon(Icons.location_on_sharp,color: Colors.grey,size: 15,),
                                Text(
                                  widget.community.location,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            leading: AnimatedContainer(
                              duration: Duration(seconds: 500),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.community.userImage),
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.date_range_rounded,color: Colors.grey,size: 15,),
                                  SizedBox(width: 8,),
                                  Text(widget.community.date, style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),),
                                  SizedBox(width: 30,),
                                  Icon(FontAwesome.tree,color: Colors.grey,size: 15,),
                                  SizedBox(width: 8,),
                                  Text(widget.community.relatedCrop, style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ListTile(
                              title: Text(widget.community.question,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(widget.community.description,
                                  style: TextStyle(
                                      fontSize: 13,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Replies'),
                          // Container(
                          //   width: double.infinity,
                          //   height: 300,
                          //   color: Colors.grey.withOpacity(0.2),
                          //   child: ListView.builder(
                          //       itemCount: widget.community.comments.length,
                          //       itemBuilder: (BuildContext ctxt, int index) {
                          //         return  Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             ListTile(
                          //               title:Text(widget.community.comments[index]['name'], style: TextStyle(
                          //                   fontSize: 13,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: primaryLight),),
                          //               leading: AnimatedContainer(
                          //                 duration: Duration(seconds: 500),
                          //                 height: 30,
                          //                 width: 30,
                          //                 decoration: BoxDecoration(
                          //                   shape: BoxShape.circle,
                          //                   image: DecorationImage(
                          //                     fit: BoxFit.cover,
                          //                     image: AssetImage(widget.community.comments[index]['senderImage']),
                          //                   ),
                          //                 ),
                          //               ),
                          //               subtitle: Padding(
                          //                 padding: const EdgeInsets.only(top: 10),
                          //                 child: Row(
                          //                   children: [
                          //                     Icon(Icons.date_range_rounded,color: Colors.grey,size: 15,),
                          //                     SizedBox(width: 8,),
                          //                     Text(widget.community.comments[index]['timeStamp'], style: TextStyle(
                          //                         fontSize: 12,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Colors.grey),),
                          //                     SizedBox(width: 30,),
                          //                     Icon(Icons.location_on_sharp,color: Colors.grey,size: 15,),
                          //                     SizedBox(width: 8,),
                          //                     Text(widget.community.comments[index]['location'], style: TextStyle(
                          //                         fontSize: 12,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Colors.grey),),
                          //
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 10),
                          //               child: Text(widget.community.comments[index]['message'],style: TextStyle(
                          //                   fontSize: 13,
                          //                   height: 1.5,
                          //                   fontWeight: FontWeight.w500,
                          //                   color: Colors.grey),),
                          //             ),
                          //           ],
                          //         );
                          //       }
                          //   )
                          // )
                        ],
                      ),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 13),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(activity != null ? activity : '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 13)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              input != null ? input : '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
