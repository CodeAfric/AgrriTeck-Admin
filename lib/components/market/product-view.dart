import 'package:agriteck_admin/components/Common-widget/comment-card.dart';
import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/components/Common-widget/sliding-image.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/model-data/test-data.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:async_loader/async_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../constants.dart';

class ProductView extends StatefulWidget {
  final Market product;

  ProductView({Key key, this.product}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  List<Comments> comments = [];
  getComments() {
    ListGenerator.someComments().forEach((element) {
      if (element.postId == widget.product.productId) {
        comments.add(element);
      }
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    var _asyncLoader = new AsyncLoader(
        key: _asyncLoaderState,
        initState: () => getComments(),
        renderLoad: () => Center(child: new CircularProgressIndicator()),
        renderError: ([error]) => Center(child: Text('Error Loading data')),
        renderSuccess: ({data}) => ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600,minHeight: 400),
          child: Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return comments.length == 0
                    ? Center(child: Text('Empty Data'))
                    : CommentCard(comments[index]);
              },
            ),
          ),
        ));
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    padding: const EdgeInsets.only(top: 15, right: 15),
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
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageSlider(
                          items: widget.product.images,
                          ht: ht,
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
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product Description',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primaryDark,
                                        fontFamily: "SF Pro Display",
                                        decoration: TextDecoration.underline),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.product.productDescription,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200,
                                        height: 1.5),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          leading: AnimatedContainer(
                            duration: Duration(seconds: 500),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(widget.product.farmer['img']),
                              ),
                            ),
                          ),
                          title: Text(
                            'Contact Info',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: primaryDark,
                                fontFamily: "SF Pro Display",
                                decoration: TextDecoration.underline),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${widget.product.farmer['name']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Location: ${widget.product.farmer['Location']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Phone: ${widget.product.farmer['phone']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          trailing: Column(
                            children: [
                              Text(
                                'Qty : ${widget.product.quantity} ${widget.product.measure}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                    fontFamily: "SF Pro Display",
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Price : GH₵${widget.product.price} ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                    fontFamily: "SF Pro Display",
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: ListTile(
                              title: Text(
                                'Comments',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: primaryLight,
                                    fontFamily: "SF Pro Display",
                                    fontSize: 15),
                              ),
                              subtitle: _asyncLoader),
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
      desktopScreen: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.9),
        child: Center(
          child: Container(
            width: double.infinity,
            height: ht,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(10, 20),
                  blurRadius: 100,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 15),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomImageSlider(
                        items: widget.product.images,
                        ht: ht,
                      ),
                    ),
                    Container(
                        width: (wt * .5) - 10,
                        height: ht - 100,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Product Description',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: primaryDark,
                                              fontFamily: "SF Pro Display",
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          widget.product.productDescription,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w200,
                                              height: 1.5),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              ListTile(
                                leading: AnimatedContainer(
                                  duration: Duration(seconds: 500),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          widget.product.farmer['img']),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Contact Info',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: primaryDark,
                                      fontFamily: "SF Pro Display",
                                      decoration: TextDecoration.underline),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${widget.product.farmer['name']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "SF Pro Display",
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Location: ${widget.product.farmer['Location']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "SF Pro Display",
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Phone: ${widget.product.farmer['phone']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "SF Pro Display",
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      'Qty : ${widget.product.quantity} ${widget.product.measure}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontFamily: "SF Pro Display",
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Price : GH₵${widget.product.price} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontFamily: "SF Pro Display",
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ListTile(
                                    title: Text(
                                      'Comments',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: primaryLight,
                                          fontFamily: "SF Pro Display",
                                          fontSize: 15),
                                    ),
                                    subtitle: _asyncLoader),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
