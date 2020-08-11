import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';

class GridViewSelectDialog extends Dialog {
//  timer(context) {
//    var time = Timer.periodic(Duration(milliseconds: 1500), (t) {
//      print('执行');
//      Navigator.pop(context);
//      t.cancel();
//    });
//  }
  final List dataList;
  final Function selectInquiryCallBack;
  GridViewSelectDialog(
      {Key key, this.dataList, this.selectInquiryCallBack})
      : super(key: key);

  var _currentSelectType = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    timer(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 260,
          width: 300,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 10,
              ),
              Text(
                '询价类型',
                style: TextStyle(
                  color: AppColors.textColor33,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 10,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: dataList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 10,
                        childAspectRatio: 5 / 2),
                    itemBuilder: (BuildContext context, int index) {
                      return FlatButton(
                        onPressed: () {
                          _currentSelectType = dataList[index];
                        },
                        child: Text(
                          dataList[index],
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        color: AppColors.themeColor,
                        shape: StadiumBorder(),
                      );
                    }),
              )),
              Row(
                children: <Widget>[
                  Expanded(
                      child: FlatButton(
                    onPressed: () {
                      print('cancel');
                      Navigator.pop(context);
                    },
                    child: Text('取消',
                        style: TextStyle(
                            color: AppColors.textColor66, fontSize: 15)),
                    color: Colors.white,
                  )),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        print('sure');
                        selectInquiryCallBack(_currentSelectType);
                        Navigator.pop(context);
                      },
                      child: Text('确定',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      color: AppColors.themeColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
