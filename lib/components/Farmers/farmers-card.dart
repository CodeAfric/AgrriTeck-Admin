import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';

class FarmerCard extends StatefulWidget {
  const FarmerCard(
      {Key key,
        this.index,
        this.press,
        @required this.height,
        @required this.width,
        this.farmers,
        this.imageSize})
      : super(key: key);

  final int index;
  final Function press;
  final double width, height, imageSize;
  final Farmers farmers;

  @override
  _FarmerCardState createState() => _FarmerCardState();
}

class _FarmerCardState extends State<FarmerCard> {
  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: widget.width,
        decoration: BoxDecoration(
          color: isHover
              ? primaryLight.withOpacity(0.7)
              :primaryLight.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, -40),
              child: AnimatedContainer(
                duration: duration,
                height: 90,
                width: widget.imageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 7),
                  boxShadow: [if (!isHover) kDefaultCardShadow],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.farmers.img),
                  ),
                ),
              ),
            ),
            Transform.translate(
                offset: Offset(0, -30),
                child: Container(
                  child: Column(
                    children: [
                      itemRow(context,'Name',widget.farmers.name),
                      itemRow(context,'Age',widget.farmers.age.toString()+' Years'),
                      itemRow(context,'Location',widget.farmers.location),
                      itemRow(context,'Speciality',widget.farmers.specialized),
                      itemRow(context,'NO. Plot',widget.farmers.numFarms.toString()),
                      itemRow(context,'Total Farm Size',widget.farmers.farmSize.toString() +' Acr'),
                    ],
                  ),
                )),


          ],
        ),
      ),
    );
  }

  Widget itemRow(BuildContext context,String lab,String content){
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1,color: Colors.grey)),
        boxShadow: [if (!isHover) kDefaultCardShadow],
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
              child: Text(lab+' :',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 12),overflow: TextOverflow.clip,softWrap: true,)),
          Text(content,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 12),),
        ],
      ),
    );
  }
}
