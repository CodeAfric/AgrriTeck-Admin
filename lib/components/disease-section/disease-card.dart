import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class DiseaseCard extends StatefulWidget {
  const DiseaseCard(
      {Key key,
      this.index,
      this.press,
      @required this.ht,
      this.diseases,
      @required this.width})
      : super(key: key);

  final int index;
  final Function press;
  final double width, ht;
  final Diseases diseases;

  @override
  _DiseaseCardState createState() => _DiseaseCardState();
}

class _DiseaseCardState extends State<DiseaseCard> {
  bool isHover = false;
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
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: primaryLight, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            isHover ? kDefaultCardHoverShadow : kDefaultCardShadow,
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                topLeft: Radius.circular(14),
              ),
              child: CachedNetworkImage(
                height: 200,
                width: double.infinity,
                imageUrl:
                    "gs://my-portfolio-5adb3.appspot.com/DSC_0194-e1399462629842.jpg",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Image.asset(
                  widget.diseases.images[0],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.diseases.name,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryDark),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.diseases.description,
                style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Read More >>',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: "SF Pro Display",
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
