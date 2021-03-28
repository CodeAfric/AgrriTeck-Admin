import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../home_screen.dart';

class CustomDropDown extends StatelessWidget {
  final value;
  final List<String> itemsList;
  final Color dropdownColor;
  final Function(dynamic value) onChanged;

  const CustomDropDown({
    @required this.value,
    @required this.itemsList,
    this.dropdownColor,
    @required this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryDark,
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: DropdownButton(
              isExpanded: true,
              icon: null,
              dropdownColor: dropdownColor,
              value: value,
              items: itemsList
                  .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item,style: TextStyle(color: Colors.white),),
              ))
                  .toList(),
              onChanged: (value) => onChanged(value),
            ),
          ),
        ),
      ),
    );
  }
}


