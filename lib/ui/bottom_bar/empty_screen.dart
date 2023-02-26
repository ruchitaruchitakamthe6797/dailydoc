// ignore_for_file: unused_element


import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  Widget text;
  EmptyPage({Key? key, required this.text}) : super(key: key);

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  //text controllers:-----------------------------------------------------------
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.appBaground,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: widget.text,
            ),
          )),
    );
  }

}
