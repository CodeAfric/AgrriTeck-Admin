import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchBar extends StatefulWidget {
  final Function(String value) onChange;
  final String hint;
  const SearchBar({Key key, this.onChange,this.hint}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          left: 20,right: 20,top: 35),
      padding: EdgeInsets.symmetric(
          horizontal: 20),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: primary.withOpacity(0.23),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: widget.onChange,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: primary.withOpacity(0.7),
                  fontWeight: FontWeight.bold
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                //suffixIcon: SvgPicture.asset("assets/icons/search.svg",color: primary,),
              ),
            ),
          ),
          Icon(FontAwesome.search,color: primary.withOpacity(0.7),size: 25,)
          // SvgPicture.asset(
          //   "assets/icons/search.svg",
          //   color: primaryDark,
          //   width: 25,
          //   height: 25,),
        ],
      ),
    );
  }
}
