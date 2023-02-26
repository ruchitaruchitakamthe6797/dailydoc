import 'package:dailydoc/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  var tabController;

  CustomAppBar({this.tabController});
  //text controllers:-----------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo.shade500,
      leading: Icon(Icons.menu),
      title: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(DeviceUtils.getScaledWidth(context, 10)),
          // color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.blue,
            style: BorderStyle.solid,
          ),
        ),
        child: TextField(
          textAlign: TextAlign.start,
          controller: _textController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search Provider',
            hintStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  DeviceUtils.getScaledWidth(context, 10)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            contentPadding: EdgeInsets.all(14),
            fillColor: Colors.white,
          ),
        ),
      ),
      elevation: 0.7,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Icon(Icons.search),
            SizedBox(width: 30),
            // Icon(Icons.more_vert),
          ],
        )
        // Icon(Icons.search),
        // SizedBox(
        //   width: 20,
        // ),
        // Icon(
        //   Icons.more_vert,
        // )

        //* we can use like that
        // Icon(Icons.search),
        // Padding(padding: EdgeInsets.symmetric(horizontal:10)),
        //     Icon(Icons.more_vert),
      ],
      bottom: TabBar(
        controller: tabController,
        indicatorColor: Colors.white,
        tabs: [
          // const Tab(icon: Icon(Icons.camera_alt)),
          Tab(text: "Messages"),
          Tab(text: "Patients"),
          // Tab(text: "CALLS"),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
