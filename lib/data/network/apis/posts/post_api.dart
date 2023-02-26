import 'dart:async';
import 'dart:convert';

import 'package:dailydoc/data/network/constants/endpoints.dart';
import 'package:dailydoc/data/network/dio_client.dart';
import 'package:dailydoc/data/network/rest_client.dart';
import 'package:dailydoc/models/chat_details_model/chat_details.dart';
import 'package:dailydoc/models/chatlist_model/chat_list.dart';
import 'package:dailydoc/models/device/device_model.dart';
import 'package:dailydoc/models/post/post_list.dart';
import 'package:dailydoc/models/send_message/send_message.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  /// Returns list of post in response

  Future<ChatDetailsResponse> getConversationList(String params) async {
    try {
      final res = await _dioClient.get(Endpoints.conversations + params);
      return ChatDetailsResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<ChatListResponse> getChatList() async {
    try {
      final res = await _dioClient.get(Endpoints.chat_list);
      return ChatListResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<SendMessageResponse> sendMessage(String params,String message, String id) async {
    try {
      var body = {
        "text": message,
        "sender": id,
      };
      final res = await _dioClient.post(Endpoints.send_message+ params,
          data: json.encode(body));
      return SendMessageResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
