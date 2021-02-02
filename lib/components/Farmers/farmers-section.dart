import 'package:flutter/material.dart';

import 'farmers-card.dart';

class FarmersSection extends StatefulWidget {
  @override
  _FarmersSectionState createState() => _FarmersSectionState();
}

class _FarmersSectionState extends State<FarmersSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FarmerCard(),
    );
  }
}
