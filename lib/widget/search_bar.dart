import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';

class SearchBar extends StatelessWidget {
  final String preIconName;
  final String sufIconName;
  final String placeholder;
  SearchBar({Key key, this.preIconName,this.sufIconName,this.placeholder}) : super(key: key);
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: TextField(
        controller: controller,
        maxLines: 1,
        autocorrect: false,
        autofocus: true,
        obscureText: false,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 20, color: AppColors.textColor33),
//      inputFormatters: [
//        BlacklistingTextInputFormatter(RegExp('[\u4e00-\u9fa5]'))
//      ],
        decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: EdgeInsets.all(12.5),
            fillColor: Colors.green.withAlpha(30),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.5),
                borderSide: BorderSide.none),
            prefix: Image.asset(
              preIconName,
              width: 20,
              height: 20,
            ),
            suffixIcon: IconButton(
                icon: Image.asset(
                  sufIconName,
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  print('clearBtnClicked');
                  controller.text = '';
                })
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0), //阴影xy轴偏移量
                blurRadius: 15.0, //阴影模糊程度
                spreadRadius: 1.0 //阴影扩散程度
            )
          ]),
    );
  }
}
