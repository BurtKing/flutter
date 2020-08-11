import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';

class TitleArrowSelectItem extends StatefulWidget{
  final Map dataMap;
  final Function selectCallBack;
  const TitleArrowSelectItem({Key key, this.dataMap,this.selectCallBack}) : super(key: key);

  @override
  TitleArrowSelectItemState createState() => TitleArrowSelectItemState();
}

class TitleArrowSelectItemState extends State<TitleArrowSelectItem>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
//      height: 45,
      child: Row(
        children: <Widget>[
          Text(widget.dataMap['title'],style: TextStyle(color: AppColors.textColor33,fontSize: 15),),
          Expanded(
            child: Text(
              widget.dataMap['content'],
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textColor33),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            child: Image.asset(
              'assets/images/nextstep@3x.png',
              width: 10,
              height: 18,
            ),
          )
        ],
      ),
    ),onTap: (){
      widget.selectCallBack();
    },);
  }
}