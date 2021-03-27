import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/search-bar.dart';
import 'package:agriteck_admin/components/market/product-view.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../Common-widget/section-title.dart';
import 'market-card.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  void getUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List market =
          Provider.of<AppProviders>(context, listen: false).marketData;
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchMarket(market);
    });
  }

  @override
  void initState() {
    getUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<AppProviders>(builder: (context, value, child) {
      List products = value.searchProduct;
      List search = value.marketData;
      return Container(
        padding: EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          children: [
            ResponsiveWidget(
              tabletScreen: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 45,
                  alignment: WrapAlignment.spaceAround,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(
                      products.length,
                      (index) => MarketCard(
                          height: 310,
                          width: 330,
                          imageSize: 90,
                          product: products[index],
                          press: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return ProductView(
                                  product: products[index],
                                );
                              },
                            );
                          })),
                ),
              ),
              desktopScreen: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 40,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                      products.length,
                      (index) => MarketCard(
                          height: 310,
                          width: 320,
                          imageSize: 90,
                          product: products[index],
                          press: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return ProductView(
                                  product: products[index],
                                );
                              },
                            );
                          })),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      );
    });
  }
}
