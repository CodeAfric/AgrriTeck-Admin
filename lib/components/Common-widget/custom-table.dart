
import 'package:agriteck_admin/components/Common-widget/dailog-box.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';

import 'custom-drop-down.dart';


class CustomTable extends StatefulWidget {
 final List<Map<String, dynamic>> dataSource;
 final String title;
 final List<String> filter;
 final bool hasDelete,hasEdit;
 final Color backgroundColor,selectedColor;
 final bool horizontalLines,verticalLines;

 CustomTable({Key key,
   @required this.dataSource,
   @required this.title,
   this.filter,
   this.hasDelete=false,
   this.hasEdit=false,
   this.backgroundColor,
   this.selectedColor,
   this.horizontalLines=true,
   this.verticalLines=false}) : super(key: key);

  @override
  _CustomTableState createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  String val;
  bool isSelect=false;
  var breakDown=[];
  int len;
  int selected=0;

  void breakData(){
    len=widget.dataSource.length;
    List<Map<String, dynamic>> list=List();
    for(int i=0;i<len;i+=10){
      var end = (i+10<len)?i+10:len;
      breakDown.add(widget.dataSource.sublist(i,end));
    }
    print('===============================${breakDown.length}');
  }
  @override
  void initState() {
    breakData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*.9,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(widget.title,style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                  Spacer(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  // alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: 15),
                  padding: EdgeInsets.symmetric(
                      horizontal: 15),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: primary.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            //Todo Search here
                          },
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: primary.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            //suffixIcon: SvgPicture.asset("assets/icons/search.svg",color: primary,),
                          ),
                        ),
                      ),
                      Icon(Icons.search,size: 25,color: primaryDark,)
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child: CustomDropDown(
                    itemsList:widget.filter!=null?widget.filter: ["All"],
                    value: val,
                    onChanged: (value) {
                      setState(() {
                        val=value;
                      });
                    }, hint: 'Filter',
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  tableHeaders(widget.dataSource[0].keys.toList()),
          ],
        ),
      ),
            Expanded(
              child: ListView.builder(
                itemCount: breakDown[selected].length,
                itemBuilder: (context, index) {
                  var color=Colors.transparent;
                  return tableRow(breakDown[selected][index].values.toList(), true);
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Spacer(),
                  Text('1 - ${breakDown[selected].length} of $len',style: TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(width: 15,),
                  IconButton(icon:Icon(Icons.arrow_back_ios,color:  selected!=0?Colors.black54:Colors.black26,size: 20,),
                    splashColor: Colors.grey,
                    hoverColor: Colors.grey.withOpacity(.5),
                    onPressed: (){
                    setState(() {
                      if(selected!=0){
                        selected--;
                      }
                    });
                    },),
                  SizedBox(width: 8,),
                  IconButton(icon:Icon(Icons.arrow_forward_ios,color:  selected+1<breakDown.length?Colors.black54:Colors.black26,size: 20,),
                    splashColor: Colors.grey,
                    hoverColor: Colors.grey.withOpacity(.5),
                    onPressed: (){
                      setState(() {
                        if(selected+1<breakDown.length){
                          selected++;
                        }
                      });
                    },)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget tableHeaders(List data){
    return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border(bottom:widget.horizontalLines?
          BorderSide(width: 1,color: Colors.grey):BorderSide.none,),
        ),
        child:  Row(
          children: [
            Expanded(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: widget.dataSource[0].length,
                shrinkWrap: false,
                children: List.generate(widget.dataSource[0].length, (ind) {
                  return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right:widget.verticalLines? BorderSide(width: 1.5, color: Colors.grey):BorderSide.none,
                          left: widget.verticalLines? BorderSide(width: 1.5, color: Colors.grey):BorderSide.none,),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,),
                        child: Text(data[ind].toString(),style:   TextStyle(fontWeight: FontWeight.bold,color: primaryDark,fontSize: 18)),
                      ));
                },),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:10.0),
              child: Text("Actions",style:TextStyle(fontWeight: FontWeight.bold,color: primaryDark,fontSize: 18) ,),
            ),
            SizedBox(width: 8,)
          ],
        ));
  }

  Widget tableRow(List data,bool hasAction){
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelect= isSelect?false:true;
        });
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border(bottom:widget.horizontalLines?
          BorderSide(width: 1,color: Colors.grey):BorderSide.none,),
          color:isSelect?primaryLight:Colors.transparent,
        ),
        child:  GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: widget.dataSource[0].length,
          shrinkWrap: false,
          children: List.generate(widget.dataSource[0].length, (ind) {
            return Container(
                decoration: BoxDecoration(
                  border: Border(
                    right:widget.verticalLines? BorderSide(width: 1.5, color: Colors.grey):BorderSide.none,
                    left: widget.verticalLines? BorderSide(width: 1.5, color: Colors.grey):BorderSide.none,),

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  child: Text(data[ind].toString(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54)),
                ));
            },),
        )),
    );
  }
}
