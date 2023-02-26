import 'package:dailydoc/models/chat_details_model/chat_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConversationDetailsWidget extends StatelessWidget {
  Messages? item;
  ConversationDetailsWidget({Key? key, this.item}) : super(key: key);

  String currentdate = '';

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    var newFormat = DateFormat("dd MMM yyyy");
    var currentDateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour, DateTime.now().minute);
    print(currentDateTime);
    print(dateFormat);
    String today = newFormat.format(DateTime.now());
    // var date = widget.item!.messageTime;
    String datenow = item!.createdAt!.replaceAll('T', ' ');
    String dateNow = datenow.replaceAll('.721Z', '');
    DateTime date = dateFormat.parse(dateNow);
    if (dateFormat.parse(currentDateTime.toString()).toString() == date) {
      // currentdate = dateFormat.parse(currentDateTime.toString()).toString();
      currentdate = 'Now';
    }
    currentdate = DateFormat.jm().format(date);
    // currentdate = DateFormat('MMM d').format(date);
    print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
    print(DateFormat('EEEE').format(date)); // prints Tuesday
    print(DateFormat('EEEE, d MMM, yyyy')
        .format(date)); // prints Tuesday, 10 Dec, 2019
    print(DateFormat('MMM d').format(date));
    print(DateFormat('h:mm a').format(date));
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (
            // item!.messageType == "receiver"
            //   ? Alignment.topLeft
            // :
            Alignment.topRight),
        child: Column(
          crossAxisAlignment: (
              // item!.messageType == "receiver"
              //   ? CrossAxisAlignment.start
              //   :
              CrossAxisAlignment.end),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (
                    // item!.messageType == "receiver"
                    //   ? Colors.grey.shade200
                    //   :
                    Colors.blue[200]),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                item!.text!,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  // left: item!.messageType == "receiver" ? 5 : 0,
                  // right: item!.messageType == "receiver" ? 0 : 5,
                  right: 5,
                  top: 5),
              child: Text(
                currentdate,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
    //   },
    // );
  }
}
