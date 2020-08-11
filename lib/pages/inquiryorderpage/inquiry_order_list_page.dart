import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';

class InquiryOrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InquiryOrderListState();
  }
}

class InquiryOrderListState extends State<InquiryOrderList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '询价单',
          style: TextStyle(fontSize: 15, color: AppColors.textColor33),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){

          })
        ],
        bottom: PreferredSize(child: BottomBar(),preferredSize: const Size.fromHeight(48.0),),
      ),
      body: Container(),
    );
  }
}

class BottomBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }
}
class BottomBarState extends State<BottomBar> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBar(
      tabs: <Widget>[
        Text('语文'),
        Text('数学'),
        Text('英语'),
        Text('体育'),
        Text('音乐'),
      ],
      controller: TabController(length: 5,vsync: this),
    );
  }

}