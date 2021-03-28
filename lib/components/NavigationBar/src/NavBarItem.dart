import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../home_screen.dart';

class NavBarButton extends StatefulWidget {
  final Function touched;
  final bool active;
  final String tex;
  NavBarButton({this.touched, this.active, this.tex,});
  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.touched();
        },
        child: HoverWidget(
          hoverChild: Text(
            widget.tex,
            style: TextStyle(
                color: primaryDark,
                fontWeight: FontWeight.w700,
                fontFamily: "SF Pro Display",
                fontSize: 20),
          ),
          onHover: (event) {

          },
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.active
                  ? Text(
                    widget.tex,
                    style: TextStyle(
                        color: primaryDark,
                        fontWeight: FontWeight.w700,
                        fontFamily: "SF Pro Display",
                        fontSize: 16),
                  )
                  : Text(
                    widget.tex,
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SF Pro Display",
                        fontSize: 16),
                  ),
              AnimatedContainer(
                duration: Duration(milliseconds: 475),
                height: 3.0,
                width: 25.0,
                decoration: BoxDecoration(
                  color: widget.active
                      ? primaryDark
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
class PopUpMenu extends StatefulWidget {
  final Function(NavIcons value) onSelected;

  PopUpMenu({this.onSelected});

  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  String selectedVal="Home";
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<NavIcons>(
        child: Material(
            color: Colors.transparent,
            child: HoverWidget(
              hoverChild: Text(
                selectedVal,
                style: TextStyle(
                    color: primaryDark,
                    fontWeight: FontWeight.w700,
                    fontFamily: "SF Pro Display",
                    fontSize: 20),
              ),
              onHover: (event) {

              },
              child:Row(
                children: [
                  Icon(Icons.menu,color: primaryDark,size: 35,),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedVal,
                        style: TextStyle(
                            color: primaryDark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "SF Pro Display",
                            fontSize: 22),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 475),
                        height: 3.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                          color: primaryDark,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )


        ),
        onSelected: widget.onSelected,
        itemBuilder:(BuildContext context){
          return <PopupMenuEntry<NavIcons>>[
            PopupMenuItem(child: Text('Home'),
              value: NavIcons.Home,
            ),
            PopupMenuItem(child: Text('Farmers'),
              value: NavIcons.Users,
            ),
            PopupMenuItem(child: Text('Farms'),
              value: NavIcons.Farms,
            ),
            PopupMenuItem(child: Text('Diseases'),
              value: NavIcons.Diseases,
            ),
            PopupMenuItem(child: Text('Co-operations'),
              value: NavIcons.Groups,
            ),
            PopupMenuItem(child: Text('Vendors'),
              value: NavIcons.Vendors,
            ),
            PopupMenuItem(child: Text('Investors'),
              value: NavIcons.Investors,
            ),
            PopupMenuItem(child: Text('Market'),
              value: NavIcons.Market,
            ),
            PopupMenuItem(child: Text('Crops'),
              value: NavIcons.Crops,
            ),
            PopupMenuItem(child: Text('Community'),
              value: NavIcons.Community,
            ),
            PopupMenuItem(child: Text('Complaints'),
              value: NavIcons.Complaints,
            )
          ];
        });
  }
}