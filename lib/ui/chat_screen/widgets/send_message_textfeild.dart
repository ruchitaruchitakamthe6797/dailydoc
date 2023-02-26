import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SendMessageTextfeild extends StatelessWidget {
  TextEditingController textController;
  final ontap;
 final ValueChanged? onChanged;
   SendMessageTextfeild({Key? key, required this.textController,required this.ontap,required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                controller:textController,
                //  _textController,
                onChanged: onChanged,
                // (value) {
                //   if (value.isNotEmpty)
                //     setState(() {
                //       textValue = _textController.text;
                //     });
                // },
                decoration: InputDecoration(
                    hintText: "Send a message",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap:ontap,
                //  () {
                //   _textController.clear();
                //   sendMessage(textValue);
                // },
                child: Icon(
                  Icons.send,
                  color: Colors.grey.shade600,
                  size: 23,
                ),
                // backgroundColor: Colors.blue,
                // elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
