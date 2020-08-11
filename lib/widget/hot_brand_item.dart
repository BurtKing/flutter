import 'package:flutter/material.dart';

class HotBrandItem extends StatelessWidget {
  final String title;
  final List firstList;
  final List secondList;

  HotBrandItem({Key key, this.title, this.firstList, this.secondList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        height: 200,
        color: Color(0xEFEFF4),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: new Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: 180,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new ModelTitle(
                    title: title,
                  ),
                  new Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: new BrandSelectFounction(brandData: firstList),
                  ),
                  new Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: new BrandSelectFounction(brandData: secondList),
                  ),
                ],
              ),
            )
        )
    );
  }
}

class ModelTitle extends StatelessWidget {
  final String title;

  ModelTitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
          width: 5,
          height: 15,
          color: Colors.green,
        ),
        new Container(
          margin: EdgeInsets.fromLTRB(5, 2, 0, 0),
          child: Text(title, style: new TextStyle(fontSize: 17)),
        ),
      ],
    );
  }
}

class BrandSelectFounction extends StatelessWidget {
//  List brandData = new List();

  final List brandData;

  BrandSelectFounction({Key key, this.brandData}) : super(key: key);

  List _createButton() {
    List list = new List();
    for (int i = 0; i < brandData.length; i++) {
      BrandSelectFounctionButton button = new BrandSelectFounctionButton();
      button.buttonData = brandData[i];
      list.add(button);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List _buttonList = _createButton();
    // TODO: implement build
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buttonList[0],
        _buttonList[1],
        _buttonList[2],
        _buttonList[3],
        _buttonList[4],
      ],
    );
  }
}

class BrandSelectFounctionButton extends StatelessWidget {
  Map buttonData = new Map();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () => _selectBrand(buttonData['name']),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            buttonData['icon'],
            height: 30,
            width: 30,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 3),
            child: new Text(
              buttonData['name'],
              style: new TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  void _selectBrand(String brand) {
    print('select Brand:' + brand);
  }
}
