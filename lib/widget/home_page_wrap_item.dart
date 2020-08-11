import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';

class WrapItem extends StatelessWidget {
  final String title;
  final List dataList;
  final int rowItemCount;

  WrapItem({Key key, this.title, this.dataList,this.rowItemCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        padding: EdgeInsets.all(10),
        color: AppColors.textColorEF,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            color: Colors.white,
            child: new Column(
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
                      title,
                      style:
                          TextStyle(color: AppColors.textColor33, fontSize: 15),
                    )
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.white,
                ),
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: dataList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowItemCount,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.0
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return warp_item(dataList[index]);
                      })
                ),
//                Wrap(
//                  spacing: 50,
//                  runSpacing: 20,
//                  children: <Widget>[
//                    for(Map map in dataList) warp_item(map)
//                  ],
//                ),
                Divider(
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}

class warp_item extends StatelessWidget {
  final Map map;
  warp_item(this.map);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () => _selectBrand(map['name']),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            map['icon'],
            height: 30,
            width: 30,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 3),
            child: new Text(
              map['name'],
              style: new TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor33),
            ),
          )
        ],
      ),
    );
  }
}

void _selectBrand(String str) {
  print(str);
}
