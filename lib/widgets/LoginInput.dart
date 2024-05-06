import 'package:flutter/material.dart';

import '../util/color.dart';

class LoginInput extends StatefulWidget {
  final String title;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType? keybordType;

  const LoginInput(
      {super.key,
      required this.title,
      required this.hint,
      required this.onChanged,
      this.focusChanged,
      this.lineStretch = false,
      this.obscureText = false,
      this.keybordType});

  @override
  State<StatefulWidget> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print("has foucs : ${_focusNode.hasFocus}");

      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _input()
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: !widget.lineStretch ? 15 : 0),
            child: const Divider(
              height: 1,
              thickness: 0.5,
            ))
      ],
    );
  }

  _input() {
    return Expanded(
        // zfc 控件检查
        child: TextField(
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            keyboardType: widget.keybordType,
            autofocus: !widget.obscureText,
            // 非密码类型，自动获取焦点
            cursorColor: primary,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
              border: InputBorder.none,
              hintText: widget.hint ?? '',
              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
            )));
  }
}
