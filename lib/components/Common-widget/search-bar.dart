import 'package:agriteck_admin/home_screen.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchBar extends StatefulWidget {
  final Function(String value) onChange;
  final String hint;
  final NavIcons page;
  const SearchBar({Key key, this.onChange,this.hint,this.page}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: 20),
      height: 40,
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
                hintText: widget.page==NavIcons.Farms?'Search a Farm':
                widget.page==NavIcons.Farms?'Search for a Farm':
                widget.page==NavIcons.Users?'Search for a Farmer':
                widget.page==NavIcons.Market?'Search for a Product':
                widget.page==NavIcons.Diseases?'Search a Disease':
                widget.page==NavIcons.Crops?'Search a Crop':
                widget.page==NavIcons.Vendors?'Search for a Vendor':
                widget.page==NavIcons.Investors?'Search for an Investor':
                widget.page==NavIcons.Groups?'Search for a Group':''
                ,
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
          Icon(FontAwesome.search,color: primary.withOpacity(0.7),size: 20,)
        ],
      ),
    );
  }
}
