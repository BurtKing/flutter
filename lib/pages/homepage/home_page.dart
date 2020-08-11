import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bbrepairefactory/widget/hot_brand_item.dart';
import 'package:bbrepairefactory/widget/home_page_wrap_item.dart';
import 'package:bbrepairefactory/widget/hot_part_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List brandList = [
    {'icon': 'assets/images/brand_all@2x.png', 'name': '全部'},
    {'icon': 'assets/images/brand_audi@2x.png', 'name': '奥迪'},
    {'icon': 'assets/images/brand_benz@2x.png', 'name': '奔驰'},
    {'icon': 'assets/images/brand_bmw@2x.png', 'name': '宝马'},
    {'icon': 'assets/images/brand_buick@2x.png', 'name': '别克'},
    {'icon': 'assets/images/brand_dos@2x.png', 'name': '大众'},
    {'icon': 'assets/images/brand_ford@2x.png', 'name': '福特'},
    {'icon': 'assets/images/brand_honda@2x.png', 'name': '本田'},
    {'icon': 'assets/images/brand_nissan@2x.png', 'name': '日产'},
    {'icon': 'assets/images/brand_toyota@2x.png', 'name': '丰田'}
  ];

  List founctionList = [
    {'icon': 'assets/images/icon-配件商城@2x.png', 'name': '配件商城'},
    {'icon': 'assets/images/理赔进度@2x.png', 'name': '理赔进度'},
    {'icon': 'assets/images/保费测算@2x.png', 'name': '保费测算'},
    {'icon': 'assets/images/保险保障@2x.png', 'name': '保险保障'},
    {'icon': 'assets/images/服务优势@2x.png', 'name': '服务优势'},
    {'icon': 'assets/images/EPC@2x.png', 'name': 'EPC查询'}
  ];

  List partList = [
    {
      'quality': '售后品牌件',
      'partName': '前保险杠皮gfhakjsjhfgkasjhfghsajkfhghaksjfgahsjkfgkasjfgkajfgk',
      'carType': '奇俊（08/11-14/03）',
      'price': '234.00',
      'tax': '(含税含运)',
      'source':'assets/images/CAPA认证_icon_tag_sel@2x.png'
    },
    {
      'quality': '售后品牌件',
      'partName': '弯灯（左）',
      'carType': '大众途锐',
      'price': '345.00',
      'tax': '(含税含运)',
      'source':'assets/images/icon-直供@2x.png'
    },
    {
      'quality': '售后品牌件',
      'partName': '弯灯（左）',
      'carType': '大众途锐',
      'price': '345.00',
      'tax': '(含税含运)',
      'source':'assets/images/AQC@2x.png'
    },
    {
      'quality': '售后品牌件',
      'partName': '弯灯（左）',
      'carType': '大众途锐',
      'price': '345.00',
      'tax': '(含税含运)',
      'source':'assets/images/AQC@2x.png'
    },
    {
      'quality': '售后品牌件',
      'partName': '弯灯（左）',
      'carType': '大众途锐',
      'price': '345.00',
      'tax': '(含税含运)',
      'source':'assets/images/AQC@2x.png'
    },
    {
      'quality': '售后品牌件',
      'partName': '弯灯（左）',
      'carType': '大众途锐',
      'price': '345.00',
      'tax': '(含税含运)',
      'source':'assets/images/AQC@2x.png'
    },
    {
      'quality': '售后品牌件',
      'partName': '弯灯（左）',
      'carType': '大众途锐',
      'price': '345.00',
      'tax': '(含税含运)',
      'source':'assets/images/AQC@2x.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: Offstage(
            offstage: true,
            child: new AppBar(),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return new Container(
                height: 240,
                child: Swiper(
                    pagination: new SwiperPagination(),
//                control: new SwiperControl(),
                    autoplay: true,
                    autoplayDelay: 2000,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "http://via.placeholder.com/350x150",
                        fit: BoxFit.fill,
                      );
                    }),
              );
            } else if (index == 1) {
//              return new HotBrandItem(
//                firstList: firstList,
//                secondList: secondList,
//                title: '热搜品牌',
//              );
//            return new WrapItem(title: '热搜品牌',dataList: List.from(firstList)..addAll(secondList),);
              return new WrapItem(
                title: '热搜品牌',
                dataList: brandList,
                rowItemCount: 5,
              );
            } else if (index == 2) {
//              return new HotBrandItem(
//                firstList: secondList,
//                secondList: firstList,
//                title: '特色专区',
//              );
              return new WrapItem(
                title: '特色专区',
                dataList: founctionList,
                rowItemCount: 4,
              );
            } else {
//              return Divider(height: 40,color: Colors.green,thickness: 40,);
              return HotPartItem(
                dataList: partList,
              );
            }
          },
//          separatorBuilder: (BuildContext context,int index){
//            return Divider(height: 10,color: Colors.purple,thickness: 10,);
//          },
          itemCount: 4),
    );
  }
}
