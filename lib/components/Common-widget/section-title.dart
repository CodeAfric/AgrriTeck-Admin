import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 25),
            padding: EdgeInsets.only(bottom: 50),
            width: 8,
            height: 100,
            color: primaryLight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline2.copyWith(
                    fontWeight: FontWeight.bold, color: primaryDark),
              ),
              Container(
                height: 8,
                width: 120,
                color: color,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 8,
                  width: 80,
                  color: primaryDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
