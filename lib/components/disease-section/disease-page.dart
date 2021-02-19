import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/disease-section/disease-view.dart';
import 'package:agriteck_admin/model-data/diseases-data.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../section-title.dart';
import 'disease-card.dart';

class DiseasePage extends StatefulWidget {
  @override
  _DiseasePageState createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 5),
      child: Column(
        children: [
          SectionTitle(
            color: primary,
            title: "Pest & Disease",
          ),
          ResponsiveWidget(
            tabletScreen: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Wrap(
                spacing: 20,
                runSpacing: 40,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(
                  diseases.length,
                      (index) => DiseaseCard(
                      index: index,
                      width: width * .6,
                      hieght: 350,
                      press: () {}),
                ),
              ),
            ),
            desktopScreen: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Wrap(
                spacing: 15,
                runSpacing:40,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(
                  diseases.length,
                      (index) =>
                          DiseaseCard(
                              index: index,
                              width: 380,
                              hieght: 400,
                              press: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return DiseasesView(
                                      disease: diseases[index] ,
                                    );
                                  },
                                );
                              }),
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
