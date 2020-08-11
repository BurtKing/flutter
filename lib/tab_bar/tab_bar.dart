import 'package:flutter/material.dart';
import 'package:bbrepairefactory/pages/homepage/home_page.dart';
import 'package:bbrepairefactory/pages/inquirypage/inquiry_publish_page.dart';
import 'package:bbrepairefactory/res/colors.dart';
import 'package:bbrepairefactory/pages/inquiryorderpage/inquiry_order_list_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _currentIndex = 0;
  final _pageController = PageController(initialPage: 0);

  final _modelList = [
    TabNavigatorItemModel('首页', 'assets/images/bottom_home.png',
        'assets/images/bottom_home_pre.png', HomePage()),
    TabNavigatorItemModel('询价单', 'assets/images/bottom_list.png',
        'assets/images/bottom_list_pre.png', InquiryOrderList()),
    TabNavigatorItemModel('', 'assets/images/bottom_publish.png',
        'assets/images/bottom_publish.png', InquiryBaseInfoPage()),
    TabNavigatorItemModel('采购单', 'assets/images/bottom_RFQ.png',
        'assets/images/bottom_RFQ_pre.png', HomePage()),
    TabNavigatorItemModel('我的', 'assets/images/bottom_mine.png',
        'assets/images/bottom_mine_pre.png', HomePage()),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: PageView(
        controller: _pageController,
        children: _modelList.map((e) => e.controller).toList(),
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) => print(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InquiryBaseInfoPage()));
          } else {
            _pageController.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items:
            List<BottomNavigationBarItem>.generate(_modelList.length, (index) {
          var model = _modelList[index];
          return BottomNavigationBarItem(
              icon: Image.asset(model.imageName,
                  width: index == 2 ? 50 : 24, height: index == 2 ? 50 : 24),
              activeIcon: Image.asset(
                model.activeImagename,
                width: index == 2 ? 50 : 24,
                height: index == 2 ? 50 : 24,
              ),
              title: Text(
                model.title,
                style: TextStyle(
                    color: index == _currentIndex
                        ? Colors.green
                        : AppColors.textColor66),
              ));
        }),
      ),
    );
  }
}

class TabNavigatorItemModel {
  final String title;
  final String imageName;
  final String activeImagename;
  final Widget controller;
  TabNavigatorItemModel(
      this.title, this.imageName, this.activeImagename, this.controller);
}
