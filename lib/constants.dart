import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';

final kDefaultOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultPadding = 20.0;

final kDefaultShadow = BoxShadow(
  offset: Offset(0, 30),
  blurRadius: 30,
  color: primaryDark.withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  color: primaryLight.withOpacity(0.3),
  spreadRadius: 1,
  blurRadius: 2,
  offset: Offset(0, 2), // changes position of shadow
);

final kDefaultCardHoverShadow = BoxShadow(
  color: primaryDark.withOpacity(0.3),
  spreadRadius: 5,
  blurRadius: 10,
  offset: Offset(0, 10), // changes position of shadow
);

var image = [
  {
    'url':
        "https://drive.google.com/file/d/1tTo1forPdXCt02dVhWhoMW539YkVJOSo/view?usp=sharing",
    'title': "Powdery Mildew",
    'description':
        "Powdery mildew is one of the easier plant diseases to identify, as its symptoms are quite distinctive. Infected plants display white powdery spots on the leaves and stems. The lower leaves are the most affected, but the mildew can appear on any above-ground part of the plant."
  },
  {
    'url': "https://picsum.photos/250?image=9",
    'title': "Black Sport",
    'description':
        "Plant resistant varieties. During the growing season, remove and dispose of infected leaves and avoid splashing leaves when watering. Roses that flower on current season’s growth should be pruned back hard before growth starts in the spring to remove infected shoots. In spring and early summer apply a spray of sulfur or copper-based fungicide. Apply this treatment at 1 to 2 week intervals through the growing season periodically alternating the fungicide used."
  },
  {
    'url': "https://picsum.photos/250?image=9",
    'title': "Bacterial Canker or Blight",
    'description':
        "This is a bacterial disease of cool, wet weather areas that attacks cherries, peaches plums, apricots and related trees. It spreads readily from early spring till June when the weather warms up on the West Coast. Most large cherry trees in the Fraser Valley are infected with this disease."
  },
  {
    'url': "https://picsum.photos/250?image=9",
    'title': "Shot Hole",
    'description':
        "Shot Hole is also called Coryneum Blight in the Interior of BC. This disease of peach, apricot, plum and cherry spreads in warm wet weather infecting buds, blossoms, leaves, fruit and twigs (not large branches). Leaves develop numerous small, tan to purplish spots about 6 mm in diameter that drop out causing a shot hole appearance. Red to purplish spots also form on the fruit and can be accompanied by a clear, gummy substance."
  }
];
