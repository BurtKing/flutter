import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbrepairefactory/res/colors.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bbrepairefactory/tab_bar/tab_bar.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _pwdController = TextEditingController();
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'assets/images/登录背景.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _main_part(),
          )
        ],
      ),
    );
  }

  Widget _main_part() {
    return Container(
      padding: EdgeInsets.only(top: 300, left: 30, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildUserItem(context, false,
              prefixImgName: 'assets/images/jiaanpei_0020_图层-3.png',
              hintText: '请输入账号'),
          Divider(
            color: Colors.white,
          ),
          _buildUserItem(context, true,
              prefixImgName: 'assets/images/jiaanpei_0021_图层-2.png',
              hintText: '请输入密码'),
          Container(
            height: 40,
            width: double.infinity,
            child: new Row(
              children: <Widget>[
//                Container(
//                  width: 140,
//                  child: CheckboxListTile(
//                    isThreeLine: false,
//                    controlAffinity: ListTileControlAffinity.leading,
//                    dense: true,
//                    title: Text(
//                      '记住密码',
//                      style: TextStyle(fontSize: 13, color: AppColors.textColor66),
//                    ),
//                    value: _isCheck,
//                    onChanged: (value){
//                      setState(() {
//                        _isCheck = value;
//                      });
//                    },
//                  ),
//                ),


                Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    value: _isCheck,
                    onChanged: (bool value) {
                      this.setState(() {
                        _isCheck = !_isCheck;
                      });
                    }),
                Text(
                  '记住密码',
                  style: TextStyle(fontSize: 13, color: AppColors.textColor66),
                ),
                Spacer(),
                MaterialButton(
                    child: Text(
                      '忘记密码',
                      style: TextStyle(color: Color(0xFF2b96ed), fontSize: 13),
                    ),
                    onPressed: () {
                      print('忘记密码');
                    })
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 40,
            width: double.infinity,
            child: FlatButton(
              onPressed: _login,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              color: Theme.of(context).primaryColor,
              child: Text(
                '登录',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            child: MaterialButton(
                child: Text(
                  '账号注册',
                  style: TextStyle(color: Color(0xFF2b96ed), fontSize: 13),
                ),
                onPressed: () {
                  print('账号注册');
                }),
          )
        ],
      ),
    );
  }

  Widget _buildUserItem(BuildContext context, bool isPwd,
      {String prefixImgName, String hintText}) {
    final controller = isPwd ? _pwdController : _nameController;
    controller.addListener(() {
      print('input ${controller.text}');
    });

    return new ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40),
      child: CupertinoTextField(
        controller: controller,
        autocorrect: false,
        autofocus: true,
        obscureText: isPwd,
        textAlign: TextAlign.left,
        placeholder: hintText,
        placeholderStyle: TextStyle(fontSize: 15, color: AppColors.textColor99),
        style: TextStyle(fontSize: 20, color: AppColors.textColor33),
        inputFormatters: [
          BlacklistingTextInputFormatter(RegExp('[\u4e00-\u9fa5]'))
        ],
        clearButtonMode: OverlayVisibilityMode.editing,
        prefix: Image.asset(
          prefixImgName,
          width: 20,
          height: 20,
        ),
        decoration: BoxDecoration(
            color: AppColors.textColorEF,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: AppColors.textColorEF,
                style: BorderStyle.solid,
                width: 1)),
      ),
    );

    return new TextField(
      controller: controller,
      maxLines: 1,
      autocorrect: false,
      autofocus: true,
      obscureText: isPwd,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
      inputFormatters: [
        BlacklistingTextInputFormatter(RegExp('[\u4e00-\u9fa5]'))
      ],
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          fillColor: Colors.black12,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.black12,
              )),
          prefix: Image.asset(
            'assets/images/jiaanpei_0020_图层-3.png',
            width: 20,
            height: 20,
          ),
          suffixIcon: IconButton(
              icon: Image.asset(
                'assets/images/选中.png',
                height: 20,
                width: 20,
              ),
              onPressed: () {
                print('clearBtnClicked');
              })),
    );
  }

  _login() async {
    final userName = _nameController.text;
    final password = _pwdController.text;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userName);
    prefs.setString('password', password);
    print('${prefs.get('username')}~${prefs.get('password')}');
    if (userName.isEmpty) {
      Fluttertoast.showToast(msg: '请输入帐号');
      return;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(msg: '请输入密码');
      return;
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => TabNavigator()),
        (route) => route == null);
  }
}
