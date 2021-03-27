import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';

class MarketCard extends StatefulWidget {
  const MarketCard(
      {Key key,
      this.index,
      this.press,
      @required this.height,
      @required this.width,
      this.product,
      this.imageSize})
      : super(key: key);

  final int index;
  final Function press;
  final double width, height, imageSize;
  final Market product;

  @override
  _MarketCardState createState() => _MarketCardState();
}

class _MarketCardState extends State<MarketCard> {
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
          children: [
            CachedNetworkImage(
              height: 150,
              width: double.infinity,
              imageUrl:
                  "gs://my-portfolio-5adb3.appspot.com/DSC_0194-e1399462629842.jpg",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: new Image.asset(
                    widget.product.images[0],
                    fit: BoxFit.fill,
                  )),
            ),
            ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.productName,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: primary,
                          fontFamily: "SF Pro Display",
                          fontSize: 20),
                    ),
                    Text(
                      widget.product.timeStamp,
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                          fontFamily: "SF Pro Display",
                          fontSize: 10),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.product.productDescription,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        height: 1.5),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Text(
                    'Qty : ${widget.product.quantity} ${widget.product.measure}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontFamily: "SF Pro Display",
                        fontSize: 13),
                  ),
                  Spacer(),
                  Container(
                    //margin: EdgeInsets.only(right: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      'GH₵${widget.product.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: "SF Pro Display",
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
