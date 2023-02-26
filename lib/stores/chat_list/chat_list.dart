import 'package:dailydoc/data/repository.dart';
import 'package:dailydoc/models/chatlist_model/chat_list.dart';
import 'package:dailydoc/models/post/post_list.dart';
import 'package:dailydoc/stores/error/error_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'chat_list.g.dart';

class ChatListStore = _ChatListStore with _$ChatListStore;

abstract class _ChatListStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _ChatListStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<ChatListResponse?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ChatListResponse?> fetchPostsFuture =
      ObservableFuture<ChatListResponse?>(emptyPostResponse);

  @observable
  ChatListResponse? chatListResponse;

  @observable
  bool success = false;

  @observable
  bool isAccept = false;

  @observable
  int pageNumber = 1;

  @observable
  int pageSize = 10;

  @observable
  ObservableList<ChatListData> seeAllEntities = ObservableList.of([]);

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getChatList() async {
    final future = _repository.getChatList();
    fetchPostsFuture = ObservableFuture(future);

    try {
      future.then((postList) {
        // print('########errrrrr ${postList.message}');
        success = true;
        this.chatListResponse = postList;
        if (pageNumber == 1) {
          seeAllEntities = ObservableList.of([]);
        }
        for (var element in chatListResponse!.data!) {
          print("explore response entity-> $element");
          seeAllEntities.add(element);
        }
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

  @action
  void setChatListEmpty() {
    seeAllEntities = ObservableList.of([]);
  }
  @action
  void setPageNumber(int pageNumber) {
    pageNumber = pageNumber;
  }

  @action
  void increasePageNumber() {
    pageNumber++;
  }

  void resetValues() {
    this.chatListResponse = null;
    this.success = false;
    seeAllEntities = ObservableList.of([]);
    pageNumber = 1;
    pageSize = 10;
  }
}
