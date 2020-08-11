
import 'package:bbrepairefactory/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bbrepairefactory/res/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLength;
  final bool autofocus;
  final TextInputType keyboardType;
  final String hintText;
  final bool isInputPwd;
  final Widget prefixIcon;
  final List<TextInputFormatter> inputFormatters;


  CustomTextField({
      this.controller,
      this.maxLength,
      this.autofocus = false,
      this.keyboardType,
      this.hintText,
      this.isInputPwd,
      this.prefixIcon,
      this.inputFormatters});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _isShowPwd = false;
  bool _isHideTextClear = true;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _isHideTextClear = widget.controller.text.isEmpty || !_focusNode.hasFocus ;
    widget.controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
    super.initState();
  }
  
  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChanged);
    _focusNode?.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Center(
          child: TextField(
            maxLength: widget.maxLength,
            maxLines: 1,
            focusNode: _focusNode,
            autofocus: widget.autofocus,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.isInputPwd ? !_isShowPwd : false,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.dividerColor,
                        width: 0.5
                    )
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 0.5
                    )
                ),

                prefixIcon: widget.prefixIcon,

                hintText: widget.hintText ?? '',
                hintStyle: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14.0
                ),
                counterText: ''
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _isHideTextClear ? SizedBox.shrink() : GestureDetector(
              child: Image.asset('assets/images/text_clear_icon.png', width: 18.0, height: 18.0),
              onTap: () => widget.controller.text = '',
            ),
            SizedBox(width: widget.isInputPwd ? 5.0 : 0.0),
            widget.isInputPwd ? GestureDetector(
              child: Image.asset(
                  _isShowPwd ? 'assets/images/password_display_icon.png' : 'assets/images/password_hide_icon.png',
                width: 18.0,
                height: 36.0
              ),
              onTap: () {
                setState(() {
                  _isShowPwd = !_isShowPwd;
                });
              },
            ) : SizedBox.shrink(),
          ],
        )
      ],
    );
  }

  _onTextChanged() {
    bool isEmpty = widget.controller.text.isEmpty;
    if (isEmpty != _isHideTextClear) {
      setState(() {
        _isHideTextClear = isEmpty || !_focusNode.hasFocus;
      });
    }
  }

  _onFocusChanged() {
    if (!_focusNode.hasFocus) {// 失去焦点
      setState(() {
        _isHideTextClear = true;
      });
    } else {
      _onTextChanged();
    }
  }
}
