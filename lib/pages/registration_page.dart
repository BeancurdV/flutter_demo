import 'package:demo001/widgets/LoginInput.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationState();
  }
}

class RegistrationState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          // 自适应键盘
          children: [
            LoginInput(
                title: '用户名',
                hint: '请输入用户名',
                onChanged: (text) {
                  print(text);
                }),
            LoginInput(
                title: '密码',
                hint: '请输入密码',
                obscureText: true,
                lineStretch: true,
                onChanged: (text) {
                  print(text);
                }),
          ],
        ),
      ),
    );
  }
}
