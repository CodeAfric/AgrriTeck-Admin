import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/components/Common-widget/search-bar.dart';
import 'package:agriteck_admin/components/disease-section/disease-view.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Common-widget/section-title.dart';
import 'disease-card.dart';

class DiseasePage extends StatefulWidget {
  @override
  _DiseasePageState createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  @override
  void initState() {
    getUpdate();
    super.initState();
  }
  void getUpdate(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List diseases= Provider.of<AppProviders>(context, listen: false).diseasesData;
      Provider.of<AppProviders>(context, listen: false).updateSearchDisease(diseases);
    });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<AppProviders>(
        builder: (context, value, child) {
          List diseases = value.searchDisease;
          List search = value.diseasesData;
          return Container(
            padding: EdgeInsets.only(top: 50, bottom: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionTitle(
                      color: primary,
                      title: "Pest & Disease",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: 200,
                        child: RoundedButton(
                          color: primaryDark,
                          text: 'Train Model',
                          textColor: Colors.white,
                          fontSize: 14,
                          horizontalPadding: 15,
                          press: (){

                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                    width: width * 0.6,
                    child: SearchBar(
                      onChange: (val) {
                        List<Diseases> newData=[];
                        setState(() {
                          if(val.isNotEmpty){
                            search.forEach((element) {
                              if(element.name.toString().toLowerCase().contains(val.toLowerCase())){
                                newData.add(element);

                              }
                            });
                            Provider.of<AppProviders>(context, listen: false).updateSearchDisease(newData);
                          }else{
                            Provider.of<AppProviders>(context, listen: false).updateSearchDisease(search);
                          }

                        });
                      },
                      hint: "Search Disease",
                    )),
                ResponsiveWidget(
                  tabletScreen: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 40,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(
                        diseases.length,
                            (index) =>
                            DiseaseCard(
                                index: index,
                                width: width * .35,
                                diseases: diseases[index],
                                ht: 380,
                                press: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return DiseasesView(
                                        disease: diseases[index],
                                      );
                                    },
                                  );
                                }),
                      ),
                    ),
                  ),
                  desktopScreen: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 40,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(
                        diseases.length,
                            (index) =>
                            DiseaseCard(
                                index: index,
                                width: 380,
                                diseases: diseases[index],
                                ht: 380,
                                press: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return DiseasesView(
                                        disease: diseases[index],
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
    );
  }
}
