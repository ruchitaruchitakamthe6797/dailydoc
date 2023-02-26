import 'package:dailydoc/ui/screens/chat_screen.dart';
import 'package:dailydoc/ui/screens/patient_screen.dart';
import 'package:dailydoc/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class WhatAppHome extends StatefulWidget {
  WhatAppHome({Key? key}) : super(key: key);

  @override
  _WhatAppHomeState createState() => _WhatAppHomeState();
}

class _WhatAppHomeState extends State<WhatAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          // CameraScreen(),
          ChatScreen(),
          PatientScreen(),
          // CallScreen(),
        ],
      ),
      floatingActionButton: keyboardIsOpened
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.indigo.shade500,
              child: Icon(Icons.message),
              onPressed: () {
                print("open chat");
              },
            ),
    );
  }
}
