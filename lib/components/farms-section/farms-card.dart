import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class FarmsCard extends StatefulWidget {
  const FarmsCard(
      {Key key,
      this.index,
      this.press,
      @required this.ht,
      this.farms,
      @required this.width})
      : super(key: key);

  final int index;
  final Function press;
  final double width, ht;
  final Farms farms;

  @override
  _FarmsCardState createState() => _FarmsCardState();
}

class _FarmsCardState extends State<FarmsCard> {
  bool isHover = false;

  // Colors
  // Color cardBackground = Colors.white;
  // Color borderColor = primaryLight;
  // Color borderColorLight = primaryLight.withOpacity(0.5);
  // Color textColor = Colors.black54;
  // Color textColorLight = Colors.grey.shade700;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
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
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  topLeft: Radius.circular(14),
                ),
                child: Image.asset(
                  widget.farms.images[0],
                  fit: BoxFit.fill,
                  height: 155,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10, left: 16),
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
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Crops on Farm:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primary,
                          fontSize: 14),
                    ),
                  ),
                  subtitle: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        widget.farms.cropType.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 4,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.farms.cropType[index],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
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
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Location:",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primary,
                                fontSize: 14),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
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
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Farm Size:",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primary,
                                fontSize: 14),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            widget.farms.farmSize.toString() != null
                                ? widget.farms.farmSize.toString() + " Acr"
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
                    padding: const EdgeInsets.only(bottom: 5),
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
