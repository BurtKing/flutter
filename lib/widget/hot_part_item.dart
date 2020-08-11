import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';
import 'package:bbrepairefactory/pages/login/login_page.dart';

class HotPartItem extends StatelessWidget {
  final List dataList;

  HotPartItem({Key key, this.dataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        color: AppColors.textColorEF,
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 5,
                      height: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      '畅销配件',
                      style:
                          TextStyle(color: AppColors.textColor33, fontSize: 15),
                    ),
                    Spacer(),
                    MaterialButton(
                        child: Text(
                          '更多',
                          style:
                              TextStyle(color: Color(0xFF2b96ed), fontSize: 13),
                        ),
                        onPressed: () {
                          print('更多配件');
                        })
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      child: CellItem(
                        map: dataList[index],
                      ),
                      onTap: () {
                        print('tap${index}');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return new Divider();
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                      child: Text(
                        '查看更多……',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13),
                      ),
                      onPressed: () {
                        print('查看更多……');
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

class CellItem extends StatelessWidget {
  final Map map;
  CellItem({Key key, this.map}) : super(key: key);

  final GlobalKey globalKey0 = GlobalKey();
  final GlobalKey globalKey1 = GlobalKey();
  final GlobalKey globalKey2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      key: globalKey0,
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            child: Image.asset(
              'assets/images/accessories@2x.png',
              height: 60,
              width: 60,
              fit: BoxFit.fill,
              key: globalKey1,
            ),
            onPressed: () {
              print('check Pick');
            },
          ),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
//                mainAxisSize: MainAxisSize.max,
//                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 1)),
                      child: Text(
                        map['quality'],
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.green,
                        ),
                      ),
                      key: globalKey2,
                    ),
                    Container(
                      width: 5,
                    ),
                    Expanded(child: Container(
                      child: Text(map['partName'],
                          style: TextStyle(
                              fontSize: 13, color: AppColors.textColor33),
                          softWrap: true,
                          maxLines: 2),
                    ))
                  ]
              ),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              Text(
                map['carType'],
                style: TextStyle(fontSize: 12, color: AppColors.textColor66),
              ),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              Row(
                children: <Widget>[
                  Text(
                    map['price'],
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    map['tax'],
                    style: TextStyle(fontSize: 8, color: AppColors.textColor99),
                  )
                ],
              ),
              Divider(
                height: 3,
                color: Colors.white,
              ),
              Image.asset(
                map['source'],
                width: 30,
                height: 15,
                fit: BoxFit.fill,
              )
            ],
          ))
        ],
      ),
    );
  }
}
