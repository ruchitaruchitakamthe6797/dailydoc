import 'package:dailydoc/data/repository.dart';
import 'package:dailydoc/models/chat_details_model/chat_details.dart';
import 'package:dailydoc/stores/error/error_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'conversation_list.g.dart';

class ConversationListStore = _ConversationListStore with _$ConversationListStore;

abstract class _ConversationListStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _ConversationListStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<ChatDetailsResponse?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ChatDetailsResponse?> fetchPostsFuture =
      ObservableFuture<ChatDetailsResponse?>(emptyPostResponse);

  @observable
  ChatDetailsResponse? chatDetailsResponse;

  @observable
  bool success = false;

  @observable
  bool isAccept = false;

  @observable
  int pageNumber = 1;

  @observable
  int pageSize = 10;

  @observable
  ObservableList<Messages> allEntities = ObservableList.of([]);

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getChatList(String id) async {
    final future = _repository.getConversationList( id);
    fetchPostsFuture = ObservableFuture(future);

    try {
      future.then((postList) {
        // print('########errrrrr ${postList.message}');
        success = true;
        this.chatDetailsResponse = postList;
        if (pageNumber == 1) {
          allEntities = ObservableList.of([]);
        }
        for (var element in chatDetailsResponse!.data!.messages!) {
          print("explore response entity-> $element");
          allEntities.add(element);
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
    allEntities = ObservableList.of([]);
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
    this.chatDetailsResponse = null;
    this.success = false;
    allEntities = ObservableList.of([]);
    pageNumber = 1;
    pageSize = 10;
  }
}
