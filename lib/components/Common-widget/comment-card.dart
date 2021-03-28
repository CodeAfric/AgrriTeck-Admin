import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final Comments comments;

  CommentCard(this.comments);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AnimatedContainer(
        duration: Duration(seconds: 500),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(comments.senderImage),
          ),
        ),
      ),
      title: Column(
        children: [
          Text(
            comments.senderName,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
          ),
          Text(
            'Comments & Replies',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: primary, fontSize: 18),
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.timer, size: 15, color: Colors.grey),
                SizedBox(
                  width: 5,
                ),
                Text(
                  comments.timeStamp,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: "SF Pro Display",
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(Icons.location_on_sharp, size: 15, color: Colors.grey),
                SizedBox(
                  width: 5,
                ),
                Text(
                  comments.senderLocation,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: "SF Pro Display",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          comments.messageImages != null && comments.messageImages.isNotEmpty
              ? CachedNetworkImage(
            height: 150,
            width: double.infinity,
            imageUrl:
            "gs://my-portfolio-5adb3.appspot.com/DSC_0194-e1399462629842.jpg",
            placeholder: (context, url) =>
            new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Image.asset(
              comments.messageImages,
              fit: BoxFit.fill,
            ),
          )
              : Container(),
          Text(
            comments.message,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "SF Pro Display",
                fontSize: 14,
                height: 1.5),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }


}
