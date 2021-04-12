import 'package:agriteck_admin/components/Common-widget/custom-drop-down.dart';
import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/components/Common-widget/sliding-image.dart';
import 'package:agriteck_admin/components/Common-widget/textField.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../constants.dart';
import 'dart:io';

class DiseasesAdd extends StatefulWidget {
  final Diseases disease;
  DiseasesAdd({Key key, this.disease}) : super(key: key);

  @override
  _DiseasesAddState createState() => _DiseasesAddState();
}

class _DiseasesAddState extends State<DiseasesAdd> {
  String _name, _location, _investorId, _gender, _phoneNumber, _email;
  List<dynamic> _investorInterest;
  DateTime backButtonPressTime;
  File _image;
  final picker = ImagePickerWeb();
  bool genderVal = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _dateTime;
  TextEditingController _pickDateController =
      TextEditingController(text: 'choose date of birth');
  FToast fToast;

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      tabletScreen: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
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
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, top: 15, left: 15),
                    child: SizedBox(
                      width: 150,
                      child: RoundedButton(
                        color: primaryDark,
                        text: 'Train Model',
                        textColor: Colors.white,
                        fontSize: 14,
                        horizontalPadding: 15,
                        press: () {},
                      ),
                    ),
                  ),
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
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageSlider(
                          items: widget.disease.images,
                          ht: ht,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.disease.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryDark),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(text: widget.disease.description),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Causes of Disease:\n',
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: widget.disease.description),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Signs of Disease:\n',
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: widget.disease.description),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Preventive Measures:\n',
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: widget.disease.description),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      desktopScreen: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: primary, width: 1.0),
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
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: primaryLight.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Add New Disease',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black54,
                                fontSize: 24),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          SizedBox(
                            width: 200,
                            child: RoundedButton(
                              color: primaryDark,
                              text: 'Train Model',
                              textColor: Colors.white,
                              fontSize: 14,
                              horizontalPadding: 15,
                              press: () {},
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Tooltip(
                          message: "Close Window",
                          child: IconButton(
                              splashColor: Colors.grey,
                              hoverColor: Colors.grey,
                              highlightColor: Colors.white,
                              icon: Icon(
                                FontAwesome.close,
                                color: Colors.redAccent,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ht - 118,
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CustomImageSlider(
                              items: widget.disease.images,
                              ht: ht,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            child: Stack(children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  color: Colors.white.withOpacity(.6),
                                  height:
                                      MediaQuery.of(context).size.height * 0.85,
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Form(
                                                key: _formKey,
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      _imageChooser(),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      InputTextField(
                                                        withDecoration: false,
                                                        onSave: (value) {
                                                          setState(() {
                                                            _email = value;
                                                          });
                                                        },
                                                        type: TextInputType
                                                            .multiline,
                                                        label: 'Disease Name',
                                                        validation: (value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Enter your Name';
                                                          } else
                                                            return null;
                                                        },
                                                        isPassword: false,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                        margin: EdgeInsets.only(
                                                            bottom: 18.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color:
                                                                    primary)),
                                                        child: TextFieldTags(
                                                          tagsStyler:
                                                              TagsStyler(
                                                                  tagTextStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                  tagDecoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  tagCancelIcon: Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      size:
                                                                          18.0,
                                                                      color: Colors
                                                                          .white),
                                                                  tagPadding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          6.0)),
                                                          textFieldStyler: TextFieldStyler(
                                                              hintText:
                                                                  'Enter Affected Crops',
                                                              helperText: '',
                                                              textFieldEnabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              textFieldFocusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          0.0)),
                                                          onTag: (tag) {},
                                                          onDelete: (tag) {},
                                                        ),
                                                      ),
                                                      InputTextField(
                                                        withDecoration: false,
                                                        onSave: (value) {
                                                          setState(() {
                                                            _email = value;
                                                          });
                                                        },
                                                        type: TextInputType
                                                            .multiline,
                                                        label:
                                                            'Signs of Disease ',
                                                        validation: (value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Enter your Name';
                                                          } else
                                                            return null;
                                                        },
                                                        isPassword: false,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      InputTextField(
                                                        withDecoration: false,
                                                        onSave: (value) {
                                                          setState(() {
                                                            _email = value;
                                                          });
                                                        },
                                                        type: TextInputType
                                                            .multiline,
                                                        label:
                                                            'Causes of Disease ',
                                                        validation: (value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Enter your Name';
                                                          } else
                                                            return null;
                                                        },
                                                        isPassword: false,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      InputTextField(
                                                        withDecoration: false,
                                                        onSave: (value) {
                                                          setState(() {
                                                            _email = value;
                                                          });
                                                        },
                                                        type: TextInputType
                                                            .multiline,
                                                        label:
                                                            'Prevention Methods',
                                                        validation: (value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Enter your Name';
                                                          } else
                                                            return null;
                                                        },
                                                        isPassword: false,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      InputTextField(
                                                        withDecoration: false,
                                                        onSave: (value) {
                                                          setState(() {
                                                            _email = value;
                                                          });
                                                        },
                                                        type: TextInputType
                                                            .multiline,
                                                        label:
                                                            'Prevention Methods',
                                                        validation: (value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Enter your Name';
                                                          } else
                                                            return null;
                                                        },
                                                        isPassword: false,
                                                      ),
                                                      SizedBox(height: 20.0),
                                                      SizedBox(
                                                          width: 200,
                                                          child: RoundedButton(
                                                              isLoading:
                                                                  isLoading,
                                                              text: 'SUBMIT',
                                                              color: primary,
                                                              press: isLoading
                                                                  ? null
                                                                  : null)),
                                                      SizedBox(
                                                        height: 20,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
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

  Widget _imageChooser() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.white,
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    _image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(50)),
                  width: 150,
                  height: 150,
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black38,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 25),
                        child: Text(
                          'Take photo',
                          style: TextStyle(color: primaryDark),
                        ),
                      ),
                    )
                  ]),
                ),
        ),
      ),
    );
  }

  // Widget getDateOfBirth() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(30),
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: primary.withOpacity(.98),
  //             blurRadius: 2,
  //             offset: Offset(0, 2),
  //           )
  //         ]),
  //     child: Card(
  //       elevation: 2,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //       //margin: EdgeInsets.only(left: 70, right: 20),
  //       child: TextFormField(
  //         onTap: () async {
  //           await showDatePicker(
  //             context: context,
  //             initialDate: DateTime(1900, 1, 1),
  //             firstDate: DateTime(1900, 1, 1),
  //             lastDate: DateTime.now(),
  //             initialDatePickerMode: DatePickerMode.year,
  //             builder: (BuildContext context, Widget child) {
  //               return Theme(
  //                 data: ThemeData(
  //                   primaryColor: primary,
  //                   accentColor: primaryLight,
  //                   buttonBarTheme: ButtonBarThemeData(
  //                     buttonTextTheme: ButtonTextTheme.accent,
  //                   ),
  //                 ),
  //                 child: child,
  //               );
  //             },
  //           ).then((value) {
  //             if (value != null) {
  //               _dateTime = value;
  //               var formatter = new DateFormat('MM/dd/yyyy');
  //               _pickDateController.text = formatter.format(value);
  //             }
  //           });
  //         },
  //         decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(16.0),
  //           prefixIcon: Container(
  //               padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
  //               margin: const EdgeInsets.only(right: 8.0),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(30.0),
  //                       bottomLeft: Radius.circular(30.0),
  //                       topRight: Radius.circular(30.0),
  //                       bottomRight: Radius.circular(10.0))),
  //               child: Icon(
  //                 Icons.date_range_outlined,
  //                 color: primary,
  //               )),
  //           hintStyle: TextStyle(color: primaryLight),
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(30.0),
  //               borderSide: BorderSide.none),
  //           filled: true,
  //           fillColor: Colors.white54,
  //         ),
  //         style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
  //         cursorColor: primary,
  //         controller: _pickDateController,
  //         readOnly: true,
  //       ),
  //     ),
  //   );
  // }

  getImageFromGallery() async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   _image = File(pickedFile.path);
    // } else {
    //   print('No image selected.');
    // }
  }

  getImageFromCamera() async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    // if (pickedFile != null) {
    //   _image = File(pickedFile.path);
    // } else {
    //   await showSnackBar('No image selected.', _scaffoldKey.currentState);
    // }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        setState(() {
                          getImageFromGallery();
                          Navigator.of(context).pop();
                        });
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      setState(() {
                        getImageFromCamera();
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
