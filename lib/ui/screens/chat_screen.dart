import 'dart:convert';

import 'package:dailydoc/models/chatlist_model/chat_list.dart';
import 'package:dailydoc/stores/chat_list/chat_list.dart';
import 'package:dailydoc/ui/screens/widgets/chat_list_ui.dart';
import 'package:dailydoc/utils/device/device_utils.dart';
import 'package:dailydoc/utils/locale/app_localization.dart';
import 'package:dailydoc/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _firstController =
      ScrollController(initialScrollOffset: 0);
// Store
  late ChatListStore _chatListStore;
  //text controllers:-----------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores]
    _chatListStore = Provider.of<ChatListStore>(context);

    // check to see if already called api
    /*if (_categoryStore.entities.isEmpty && !_categoryStore.loading) {
      _categoryStore.getCategories();
    }*/
    if (!_chatListStore.loading) {
      _fetchAllOfferList(true);
    }
  }

  _fetchAllOfferList(bool isRefresh) async {
    if (isRefresh) {
      _chatListStore.setPageNumber(1);
    } else {
      _chatListStore.increasePageNumber();
    }

    await Future.delayed(Duration.zero, () {
      _chatListStore.getChatList();
    });
  }

  Future<ChatListResponse> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://dd-chat-0.onrender.com/api/conversations'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ChatListResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<ChatListResponse> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 30, bottom: 15, right: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  DeviceUtils.getScaledWidth(context, 10)),
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
                hintText: 'Search sender by name',
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
                contentPadding: EdgeInsets.all(16),
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(child: _buildList(_width, _height)),
      ],
    );
  }

  Widget _buildList(_width, _height) {
    return Observer(builder: (context) {
      Size _size = MediaQuery.of(context).size;

      return (_chatListStore.loading && _chatListStore.seeAllEntities.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : _chatListStore.success || _chatListStore.chatListResponse != null
              // ? _buildOfferListGride(_width, _height)
              ? _buildOfferList(_width, _height)

              /* : _chatListStore.seeAllLoading
              ? LoaderWidget() */
              : Container();
    });
  }

  Widget _buildOfferList(width, height) {
    Size _size = MediaQuery.of(context).size;

    return (_chatListStore.loading && _chatListStore.seeAllEntities.isEmpty)
        ? Center(child: CircularProgressIndicator())
        : _chatListStore.success
            ? _chatListStore.seeAllEntities.isEmpty
                ? Center(
                    //List empty view
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('home_no_store_offers_nearby'),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: DeviceUtils.getScaledWidth(context, 3)),
                    ),
                  )
                : ListView.builder(
                    // physics:Axis.vertical,
                    itemCount: _chatListStore.seeAllEntities.length,
                    itemBuilder: (context, index) {
                      return ChatListWidget(
                          item: _chatListStore.seeAllEntities[index]);
                    })
            // RefreshIndicator(
            //     onRefresh: () {
            //       return _fetchAllOfferList(true);
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: DeviceUtils.getScaledWidth(context, 6.6),

            //         // vertical: DeviceUtils.getScaledHeight(context, 1.8)
            //       ),
            //       child: ListView.builder(
            //         // To make listView scrollable
            //         // even if there is only a single item.
            //         physics: const AlwaysScrollableScrollPhysics(),
            //         itemCount: _chatListStore.seeAllEntities.length,
            //         itemBuilder: (_, index) {
            //           // if (index < _chatListStore.seeAllEntities.length) {
            //           return Text('data');
            //           //                         Column(
            //           //   children: [
            //           //     Divider(height: 10),
            //           //     GestureDetector(
            //           //       onTap: () {},
            //           //       child: ListTile(
            //           //         leading: CircleAvatar(
            //           //           foregroundColor: Theme.of(context).appBarTheme.color,
            //           //           backgroundColor: Colors.grey,
            //           //           child: Icon(Icons.ac_unit),
            //           //           // NetworkImage(item!.image!),
            //           //         ),
            //           //         title: Row(
            //           //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           //           children: [
            //           //             Text(
            //           //               'item!.title!',
            //           //               style: TextStyle(fontWeight: FontWeight.bold),
            //           //             ),
            //           //           ],
            //           //         ),
            //           //         subtitle: Container(
            //           //           child: Row(
            //           //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           //             children: [
            //           //               Text(
            //           //                 'item!.lastMessage!',
            //           //                 style: TextStyle(
            //           //                   color: Colors.grey,
            //           //                   fontSize: 15,
            //           //                 ),
            //           //               ),
            //           //               Text(
            //           //                 'item!.createdAt!',
            //           //                 style: TextStyle(
            //           //                   color: Colors.grey,
            //           //                   fontSize: 14,
            //           //                 ),
            //           //               ),
            //           //             ],
            //           //           ),
            //           //         ),
            //           //       ),
            //           //     ),

            //           //   ],
            //           // );
            //           //   } else if (index ==
            //           //           _chatListStore.seeAllEntities.length &&
            //           //       _chatListStore.seeAllEntities.length <
            //           //           _chatListStore
            //           //               .seeAllResponse!.totalCount! &&
            //           //       !_chatListStore.loading) {
            //           //     _fetchAllOfferList(false);
            //           //     return Center(
            //           //         child: Padding(
            //           //       padding: EdgeInsets.all(
            //           //           DeviceUtils.getScaledWidth(context, 3.5)),
            //           //       child: CircularProgressIndicator(
            //           //         strokeWidth:
            //           //             DeviceUtils.getScaledWidth(context, 0.5),
            //           //       ),
            //           //     ));
            //           //   } else {
            //           //     return Container();
            //           //   }
            //           // },
            //           // separatorBuilder: (BuildContext context, int index) {
            //           //   return SizedBox(
            //           //     height: DeviceUtils.getScaledHeight(context, 0.5),
            //           //   );
            //         },
            //       ),

            //       //       GridView.builder(
            //       //           padding: EdgeInsets.zero,
            //       //           // physics: const ScrollPhysics(),
            //       //           physics: AlwaysScrollableScrollPhysics(),
            //       //           shrinkWrap: true,
            //       //           /*padding:
            //       // EdgeInsets.only(bottom: DeviceUtils.getScaledWidth(context, 3)),*/
            //       //           itemCount: _chatListStore.seeAllEntities.length + 1,
            //       //           gridDelegate:
            //       //               SliverGridDelegateWithFixedCrossAxisCount(
            //       //             crossAxisCount: 2,
            //       //             crossAxisSpacing:
            //       //                 DeviceUtils.getScaledHeight(context, 1.0),
            //       //             mainAxisSpacing:
            //       //                 DeviceUtils.getScaledHeight(context, 0.8),
            //       //             childAspectRatio: Responsive.isTablet(context)
            //       //                 ? width / (height / 2.5)
            //       //                 : Responsive.isSmallMobile(context)
            //       //                     ? width / (height / 2.7)
            //       //                     : width / (height / 1.8),
            //       //           ),
            //       //           itemBuilder: (_, index) {
            //       //             if (index < _chatListStore.seeAllEntities.length) {
            //       //               return ExploreWidget(
            //       //                 userLat: _locationStore.getLatitude(),
            //       //                 userLng: _locationStore.getLongitude(),
            //       //                 isPromo: true,
            //       //                 isCashback: false,
            //       //                 item: _chatListStore.seeAllEntities[index],
            //       //                 borderColor: _themeStore.darkMode
            //       //                     ? Colors.transparent
            //       //                     : Colors.grey.shade300,
            //       //                 color: AppColors.itemColors[Random()
            //       //                     .nextInt(AppColors.itemColors.length)],
            //       //               );
            //       //             } else if (index ==
            //       //                     _chatListStore.seeAllEntities.length &&
            //       //                 _chatListStore.seeAllEntities.length <
            //       //                     _chatListStore
            //       //                         .seeAllResponse!.totalCount! &&
            //       //                 !_chatListStore.seeAllLoading) {
            //       //               _fetchAllOfferList(false);
            //       //               return LoaderWidget();
            //       //             } else {
            //       //               return Container();
            //       //             }
            //       //           }),
            //     ),
            //   )

            : SizedBox.shrink();
  }
}
