import 'package:dailydoc/data/repository.dart';
import 'package:dailydoc/models/chatlist_model/chat_list.dart';
import 'package:dailydoc/models/send_message/send_message.dart';
import 'package:dailydoc/stores/error/error_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'send_message_store.g.dart';

class SendMessageStore = _SendMessageStore with _$SendMessageStore;

abstract class _SendMessageStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _SendMessageStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<SendMessageResponse?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<SendMessageResponse?> fetchPostsFuture =
      ObservableFuture<SendMessageResponse?>(emptyPostResponse);

  @observable
  SendMessageResponse? postList;

  @observable
  bool success = false;

  @observable
  bool isAccept = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future sendMessage(String params, String message, String id) async {
    final future = _repository.sendMessage( params,  message,  id);
    fetchPostsFuture = ObservableFuture(future);

    try {
      future.then((postList) {
        print('########errrrrr ${postList.data}');
        success = true;
        this.postList = postList;
      }).catchError((error) {
        final dioError = error as DioError;
        print('########errrrrr ${dioError.message}');
        success = false;
        errorStore.errorMessage = "Something went wrong!";
      });
    } catch (e) {}
  }

  @action
  void setSuccess(bool value) {
    success = value;
  }



  void resetValues() {
    this.postList = null;
    this.success = false;
  }
}
