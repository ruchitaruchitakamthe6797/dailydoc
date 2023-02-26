import 'package:dailydoc/ui/bottom_bar/bottom_bar.dart';
import 'package:dailydoc/ui/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String chatScreenDetails = '/chatScreenDetails';
  static const String bottomBar = '/bottomBar';


  static final routes = <String, WidgetBuilder>{
    bottomBar: (BuildContext context) => MyNavigationBar(),
    chatScreenDetails: (BuildContext context) => ChatScreenDetails(),
    // splash: (BuildContext context) => ChatScreenDetails(),


  };
}



