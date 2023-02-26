import 'package:dailydoc/models/chat.dart';
import 'package:dailydoc/models/chatlist_model/chat_list.dart';
import 'package:dailydoc/ui/chat_screen/chat_screen.dart';
import 'package:dailydoc/utils/device/device_utils.dart';
import 'package:dailydoc/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatListWidget extends StatelessWidget {
  ChatListData? item;
  ChatListWidget({Key? key, this.item}) : super(key: key);
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
    return Column(
      children: [
        Divider(height: 10),
        GestureDetector(
          onTap: () {
            DeviceUtils.hideKeyboard(context);
            if (item!.sId != null && item!.sId!.isNotEmpty) {
              Navigator.of(context)
                  .pushNamed(Routes.chatScreenDetails, arguments: {
                'chat_id': item!.sId!,
                'chat_title': item!.title!,
                'participant': item!.participants!.length.toString()
              });
            }

            //      Navigator.push(context, MaterialPageRoute(builder: (context){
            //   return ChatScreenDetails();
            // }));
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundColor: Theme.of(context).appBarTheme.color,
              backgroundColor: Colors.blue.shade50,
              child: Icon(
                Icons.group,
                color: Colors.black,
              ),
              // backgroundImage: NetworkImage(item!.image!),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item!.title!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item!.iV!.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    currentdate,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
