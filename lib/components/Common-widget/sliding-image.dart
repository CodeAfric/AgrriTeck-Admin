import 'package:agriteck_admin/styles/app-colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

// class CustomSlidingImage extends StatelessWidget {
//   final double ht;
//   final List images;
//   CustomSlidingImage(this.ht, this.images);
//
//   final CarouselController _controller = CarouselController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       margin: EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         children: [
//           CarouselSlider(
//             carouselController: _controller,
//             options: CarouselOptions(
//                 enlargeCenterPage: true, height: 200
//             ),
//             items: images
//                 .map((item) => )
//                 .toList(),
//           ),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               IconButton(icon: Icon(Icons.arrow_back_rounded,size: 40,color: primaryDark,), onPressed: () => _controller.previousPage(),),
//               SizedBox(width: 50,),
//               IconButton(icon: Icon(Icons.arrow_forward,size: 40,color: primaryDark,), onPressed: () => _controller.nextPage(),),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
class CustomImageSlider extends StatefulWidget {
  final List items;
  final double ht;

  CustomImageSlider({this.items, this.ht});
  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  CarouselSliderController _sliderKey = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (widget.ht - 100) * .7,
          child: CarouselSlider.builder(
              controller: _sliderKey,
              unlimitedMode: true,
              slideBuilder: (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.items[index],
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: (widget.ht) * .7,
                  ),
                );
              },
              slideTransform: CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 10),
              ),
              itemCount: widget.items.length),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Align(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 600),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 48,
                    icon: Icon(
                      Icons.chevron_left,
                      color: primary,
                    ),
                    onPressed: () {
                      _sliderKey.previousPage();
                    },
                  ),
                  IconButton(
                    iconSize: 48,
                    icon: Icon(
                      Icons.chevron_right,
                      color: primary,
                    ),
                    onPressed: () {
                      _sliderKey.nextPage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
