import 'package:agriteck_admin/components/Common-widget/animated-widget.dart';
import 'package:agriteck_admin/components/Common-widget/sliding-image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              AnimatedImage(),
            ],
          ),
          Image.network("gs://agriteck-38b85.appspot.com/creative-material-for-the-harvest-of-farmers-in-autumn-png_57209.jpg",
          width: 300,height: 200,)
        ],
        
      ),
    );
  }
}
