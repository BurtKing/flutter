import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';
import 'package:bbrepairefactory/widget/search_bar.dart';
import 'package:bbrepairefactory/widget/arrow_select_item.dart';
import 'package:bbrepairefactory/widget/gridview_select_dialog.dart';
import 'package:bbrepairefactory/models/inquiry_model.dart';

class InquiryBaseInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InquiryBaseInfoPageState();
  }
}

class InquiryBaseInfoPageState extends State<InquiryBaseInfoPage> {

  String _group = '精准询价';
  var _currentPage = 0;
  final _pageController = PageController(initialPage: 0);
  var _InfoCount = 5;
  List _inquiryTypeList = ['人保财险','燕赵财险','普通询价'];

  InquiryModel _model = InquiryModel(inquiryType: '人保财险',lisenceNO: '京A123123',registerNO: 'RDAAHJKHJKGJ56785785785678',assistant: '马双',pics: ['']);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            color: Colors.black45,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: CupertinoSegmentedControl(
              groupValue: _group,
              selectedColor: AppColors.themeColor,
              unselectedColor: Colors.white,
              children: {
                '精准询价': Container(
                  child: Text('精准询价'),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
                '快速询价': Container(
                  child: Text('快速询价'),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              },
              onValueChanged: (value) {
                print(value);
                setState(() {
                  _group = value;
                  if (_group == '精准询价') {
                    _pageController.jumpToPage(0);
                  } else {
                    _pageController.jumpToPage(1);
                  }
                });
              }),
        ),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
              body: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                        child: SearchBar(
                          preIconName: 'assets/images/icon-搜索@3x.png',
                          sufIconName: 'assets/images/扫描新@3x.png',
                          placeholder: '123',
                        ),
                        height: 45,
                        margin: EdgeInsets.all(20),
                      );
                    } else if (index == 1) {
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, top: 5, bottom: 5, right: 20),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '2008 江淮 同悦 三厢 1.3L 手动挡 标准型 （HFC730AG）',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textColor33),
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/images/nextstep@3x.png',
                                  width: 15,
                                  height: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          print('select car Click');
                        },
                      );
                    } else if (index == 2) {
                      return Container(
//                        color: Colors.blue,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                                Border.all(width: 1, color: Colors.black12)),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: _InfoCount,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if(_model.inquiryType == '人保财险'){
                              if(index == 0){
                                return TitleArrowSelectItem(dataMap: {'title':'询价类型','content':_model.inquiryType},selectCallBack: (){
                                  print('to select 询价类型');
                                  showDialog(context: context,builder: (context){
                                    return GridViewSelectDialog(dataList:_inquiryTypeList,selectInquiryCallBack: (str){
                                      setState(() {
                                        _model.inquiryType = str;
                                        if(str == '人保财险'){
                                          _InfoCount = 5;
                                        }else if(str == '燕赵财险'){
                                          _InfoCount = 4;
                                        } else{
                                          _InfoCount = 3;
                                        }
                                      });
                                      print('callback $str');
                                    },);
                                  });
                                },);
                              }else if(index == 1){
                                return TitleArrowSelectItem(dataMap: {'title':'车牌号','content':_model.lisenceNO},selectCallBack: (){
                                  print('to select 车牌号');
                                },);
                              }else if(index == 2){
                                return TitleArrowSelectItem(dataMap: {'title':'报案号','content':_model.registerNO},selectCallBack: (){
                                  print('to select 报案号');
                                },);
                              }else if(index == 3){
                                return TitleArrowSelectItem(dataMap: {'title':'定损员','content':_model.assistant},selectCallBack: (){
                                  print('to select 定损员');
                                },);
                              }else{
                                return TitleArrowSelectItem(dataMap: {'title':'车辆图片','content':_model.pics.length == 0 ? '至少上传一张' : '已选择${_model.pics.length}张'},selectCallBack: (){
                                  print('to select 车辆图片');
                                },);
                              }
                            }else if(_model.inquiryType == '燕赵财险'){
                              if(index == 0){
                                return TitleArrowSelectItem(dataMap: {'title':'询价类型','content':_model.inquiryType},selectCallBack: (){
                                  print('to select 询价类型');
                                  showDialog(context: context,builder: (context){
                                    return GridViewSelectDialog(dataList:_inquiryTypeList,selectInquiryCallBack: (str){
                                      setState(() {
                                        _model.inquiryType = str;
                                        if(str == '人保财险'){
                                          _InfoCount = 5;
                                        }else if(str == '燕赵财险'){
                                          _InfoCount = 4;
                                        } else{
                                          _InfoCount = 3;
                                        }
                                      });
                                      print('callback $str');
                                    },);
                                  });
                                },);
                              }else if(index == 1){
                                return TitleArrowSelectItem(dataMap: {'title':'车牌号','content':_model.lisenceNO},selectCallBack: (){
                                  print('to select 车牌号');
                                },);
                              }else if(index == 2){
                                return TitleArrowSelectItem(dataMap: {'title':'定损员','content':_model.assistant},selectCallBack: (){
                                  print('to select 定损员');
                                },);
                              }else{
                                return TitleArrowSelectItem(dataMap: {'title':'车辆图片','content':_model.pics.length == 0 ? '至少上传一张' : '已选择${_model.pics.length}张'},selectCallBack: (){
                                  print('to select 车辆图片');
                                },);
                              }
                            } else{
                              if(index == 0){
                                return TitleArrowSelectItem(dataMap: {'title':'询价类型','content':_model.inquiryType},selectCallBack: (){
                                  print('to select 询价类型');
                                  showDialog(context: context,builder: (context){
                                    return GridViewSelectDialog(dataList:_inquiryTypeList,selectInquiryCallBack: (str){
                                      setState(() {
                                        _model.inquiryType = str;
                                        if(str == '人保财险'){
                                          _InfoCount = 5;
                                        }else if(str == '燕赵财险'){
                                          _InfoCount = 4;
                                        } else{
                                          _InfoCount = 3;
                                        }
                                      });
                                      print('callback $str');
                                    },);
                                  });
                                },);
                              }else if(index == 1){
                                return TitleArrowSelectItem(dataMap: {'title':'车牌号','content':_model.lisenceNO},selectCallBack: (){
                                  print('to select 车牌号');
                                },);
                              }else{
                                return TitleArrowSelectItem(dataMap: {'title':'车辆图片','content':_model.pics.length == 0 ? '至少上传一张' : '已选择${_model.pics.length}张'},selectCallBack: (){
                                  print('to select 车辆图片');
                                },);
                              }
                            }
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(40),
                        child: FlatButton(
                          onPressed: () {
                            print('next');
                          },
                          child: Text(
                            '去询价',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          color: Theme.of(context).primaryColor,
                          shape: StadiumBorder(
                            side: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ),
            Container(
              color: Colors.red,
            )
          ],
        ));
  }
}
