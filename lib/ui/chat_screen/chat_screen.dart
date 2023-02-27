import 'package:dailydoc/stores/chat_list/chat_list.dart';
import 'package:dailydoc/stores/conversation_list/conversation_list.dart';
import 'package:dailydoc/stores/send_message/send_message_store.dart';
import 'package:dailydoc/ui/chat_screen/widgets/conversation_details.dart';
import 'package:dailydoc/ui/chat_screen/widgets/send_message_textfeild.dart';
import 'package:dailydoc/utils/device/device_utils.dart';
import 'package:dailydoc/utils/locale/app_localization.dart';
import 'package:dailydoc/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChatScreenDetails extends StatefulWidget {
  const ChatScreenDetails({Key? key}) : super(key: key);

  @override
  State<ChatScreenDetails> createState() => _ChatScreenDetailsState();
}

class _ChatScreenDetailsState extends State<ChatScreenDetails> {
  // List<ChatMessage> messages = [
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  // ];
  //text controllers:-----------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
// Store
  late ConversationListStore _conversationListStore;
  late SendMessageStore _sendMessageStore;
  late ChatListStore _chatListStore;

  String? _chatID = '', chat_title = '', senderId = '', participant = '';
  String textValue = '';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores]
    _conversationListStore = Provider.of<ConversationListStore>(context);
    _sendMessageStore = Provider.of<SendMessageStore>(context);
    _chatListStore = Provider.of<ChatListStore>(context);
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    if (arguments != null) {
      _chatID = arguments['chat_id'];
      chat_title = arguments['chat_title'];
      participant = arguments['participant'];
    }

    // if (!_conversationListStore.loading) {
    _fetchAllMessageList(true);
    // }
  }

  _fetchAllMessageList(bool isRefresh) async {
    if (isRefresh) {
      _conversationListStore.setPageNumber(1);
    } else {
      _conversationListStore.increasePageNumber();
    }

    await Future.delayed(Duration.zero, () {
      _conversationListStore.getChatList('$_chatID/messages?');
    });
  }

  void sendMessage(String query) {
    // _pageNumber = 1;

    var search = '';

    // if (_businessStore.loading) {
    if (textValue.isNotEmpty && textValue != null) {
      search = textValue;
      _sendMessageStore.sendMessage(
          '$_chatID/messages', search, '63cbba1fbed83250e51dcc59');
    } else {}

    // }
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo.shade500,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16, bottom: 3),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  radius: 20,
                  foregroundColor: Theme.of(context).appBarTheme.color,
                  backgroundColor: Colors.blue.shade200,
                  child: Icon(
                    Icons.group,
                    color: Colors.black87,
                  ),
                  // backgroundImage: NetworkImage(item!.image!),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        chat_title!.isNotEmpty ? '$chat_title' : '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        participant!.isNotEmpty
                            ? '$participant Participants'
                            : '0 Participants',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Expanded(child: _buildList(_width, _height)),
                      SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4),
                          child: Text('February 21, 2023'),
                        )),
                  ),
                ],
              ),
              _buildSendMessage(),
            ],
          ),
          Observer(
            builder: (context) {
              try {
                return _sendMessageStore.success
                    ? _refreshcall()
                    : SizedBox.shrink();
              } on Exception {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  _refreshcall() {
    _fetchAllChatList(true);
    _fetchAllMessageList(true);

    return SizedBox.shrink();
  }

  Widget _buildSendMessage() {
    return SendMessageTextfeild(
      textController: _textController,
      onChanged: (value) {
        if (value.isNotEmpty)
          setState(() {
            textValue = _textController.text;
          });
      },
      ontap: () {
        _textController.clear();
        sendMessage(textValue);
      },
    );
  }

  _fetchAllChatList(bool isRefresh) async {
    if (isRefresh) {
      _chatListStore.setPageNumber(1);
    } else {
      _chatListStore.increasePageNumber();
    }

    await Future.delayed(Duration.zero, () {
      _chatListStore.getChatList();
    });
  }

  Widget _buildList(_width, _height) {
    return Observer(builder: (context) {
      Size _size = MediaQuery.of(context).size;

      return (_conversationListStore.loading &&
              _conversationListStore.allEntities.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : _conversationListStore.success ||
                  _conversationListStore.chatDetailsResponse != null
              // ? _buildOfferListGride(_width, _height)
              ? _buildOfferList(_width, _height)

              /* : _chatListStore.seeAllLoading
              ? LoaderWidget() */
              : Container();
    });
  }

  Widget _buildOfferList(width, height) {
    Size _size = MediaQuery.of(context).size;

    return (_conversationListStore.loading &&
            _conversationListStore.allEntities.isEmpty)
        ? Center(child: CircularProgressIndicator())
        : _conversationListStore.success
            ? _conversationListStore.allEntities.isEmpty
                ? Center(
                    //List empty view
                    child: Text(
                      '',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: DeviceUtils.getScaledWidth(context, 3)),
                    ),
                  )
                : ListView.builder(
                    // physics:Axis.vertical,
                    reverse: true,
                    itemCount: _conversationListStore.allEntities.length,
                    itemBuilder: (context, index) {
                      return ConversationDetailsWidget(
                          item: _conversationListStore.allEntities[index]);
                    })
            : SizedBox.shrink();
  }
}

class ChatMessage {
  String? messageContent;
  String? messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}
