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
              offset: Offset(5, 10),
              blurRadius: 20,
              color: primary.withOpacity(.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 200,
              width: double.infinity,
              imageUrl: "gs://my-portfolio-5adb3.appspot.com/DSC_0194-e1399462629842.jpg",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Image.asset( widget.diseases.images[0],fit: BoxFit.fill,),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.diseases.name,
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
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    widget.diseases.description.length > 250
                        ? TextSpan(
                        text:  widget.diseases
                            .description
                            .substring(0, 250) +
                            "....")
                        : TextSpan(
                        text:  widget.diseases.description + "...."),
                    TextSpan(
                        text: " Read More",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: primary))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
