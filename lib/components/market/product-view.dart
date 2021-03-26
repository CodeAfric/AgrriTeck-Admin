import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../constants.dart';

class ProductView extends StatefulWidget {
  final Market product;
  ProductView({Key key,this.product}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  @override
  Widget build(BuildContext context) {
    var ht=MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,right: 15),
                    child: Tooltip(
                      message: "Close Window",
                      child: IconButton(
                          splashColor: Colors.grey,
                          hoverColor: Colors.grey,
                          highlightColor: Colors.white,
                          icon: Icon(
                            FontAwesome.close,
                            color: Colors.redAccent,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 1,
                child:  SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    //margin: EdgeInsets.symmetric(horizontal: 20,),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.8,
                            initialPage: 0,
                            aspectRatio: 2,
                            enableInfiniteScroll: true,
                            reverse: true,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                          ),
                          items: widget.product.images.map((item) => Center(
                            child: Image.asset(item,width: double.infinity,fit: BoxFit.fill,height:(ht-100)*.7 ,),
                          )).toList(),
                        ),

                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
      desktopScreen: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.9),
        child: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal: 250,vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                offset: Offset(10, 20),
                blurRadius: 100,
                color: Colors.black.withOpacity(0.7),
              ),],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,right: 15),
                      child: Tooltip(
                        message: "Close Window",
                        child: IconButton(
                            splashColor: Colors.grey,
                            hoverColor: Colors.grey,
                            highlightColor: Colors.white,
                            icon: Icon(
                              FontAwesome.close,
                              color: Colors.redAccent,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    )
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              initialPage: 0,
                              aspectRatio: 2,
                              enableInfiniteScroll: true,
                              reverse: true,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                            ),
                            items: widget.product.images.map((item) => Center(
                              child: Image.asset(item,width: double.infinity,fit: BoxFit.fill,height:(ht-100)*.7 ,),
                            )).toList(),
                          ),
                          ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.product.productName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primary,
                                        fontFamily: "SF Pro Display",
                                        fontSize: 20),
                                  ),
                                  Text(
                                    widget.product.timeStamp,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        color: Colors.grey,
                                        fontFamily: "SF Pro Display",
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.product.productDescription,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                      height: 1.5),
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Text(
                                  'Qty : ${widget.product.quantity} ${widget.product.measure}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontFamily: "SF Pro Display",
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Container(
                                  //margin: EdgeInsets.only(right: 10,bottom: 10),
                                  decoration: BoxDecoration(
                                    color: primaryLight,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                                  child: Text(
                                    'GH₵${widget.product.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontFamily: "SF Pro Display",
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
