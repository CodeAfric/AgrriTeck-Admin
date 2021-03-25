import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/useful-functions.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';

class CommunityCard extends StatefulWidget {

  final int index;
  final Function press;
  final double width, ht;
  final Community community;

  @override
  _CommunityCardState createState() => _CommunityCardState();

  CommunityCard({this.index, this.press,@required this.width,@required this.ht,@required this.community});
}

class _CommunityCardState extends State<CommunityCard> {
  bool isHover=false;
  FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast=FToast();
    fToast.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widget.width,
        height: widget.ht,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: isHover ? Colors.white.withOpacity(0.8) : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            isHover
                ? kDefaultShadow
                : BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 0,
              color: primary.withOpacity(.5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.community.images.isNotEmpty)
              CachedNetworkImage(
                height: 180,
                width: double.infinity,
                imageUrl: "gs://my-portfolio-5adb3.appspot.com/DSC_0194-e1399462629842.jpg",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                new Image.asset(widget.community.images[0], fit: BoxFit.fill,),
              ),
              SizedBox(
                height: 10,
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
                  boxShadow: [if (!isHover) kDefaultCardShadow],
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
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: myPopMenu(context),
                trailing: Text('Replies',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget myPopMenu(BuildContext context) {
    return PopupMenuButton<String>(
        onSelected: (value)async {
          await showToast(context, fToast, Icons.cancel, primaryDark,
          "Sorry this feature is not yet Active");
        },
        child: Text('Translate',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey),),
        itemBuilder: (context) => [
          PopupMenuItem(
              value: "English",
              child: Row(
                children: <Widget>[
                  Text('English')
                ],
              )),
          PopupMenuItem(
              value: "French",
              child: Row(
                children: <Widget>[

                  Text('French')
                ],
              )),
        ]);
  }
}
