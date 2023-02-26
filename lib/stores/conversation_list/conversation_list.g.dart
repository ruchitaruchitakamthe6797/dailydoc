// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConversationListStore on _ConversationListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_ConversationListStore.loading'))
      .value;

  final _$fetchPostsFutureAtom =
      Atom(name: '_ConversationListStore.fetchPostsFuture');

  @override
  ObservableFuture<ChatDetailsResponse?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<ChatDetailsResponse?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$chatDetailsResponseAtom =
      Atom(name: '_ConversationListStore.chatDetailsResponse');

  @override
  ChatDetailsResponse? get chatDetailsResponse {
    _$chatDetailsResponseAtom.reportRead();
    return super.chatDetailsResponse;
  }

  @override
  set chatDetailsResponse(ChatDetailsResponse? value) {
    _$chatDetailsResponseAtom.reportWrite(value, super.chatDetailsResponse, () {
      super.chatDetailsResponse = value;
    });
  }

  final _$successAtom = Atom(name: '_ConversationListStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$isAcceptAtom = Atom(name: '_ConversationListStore.isAccept');

  @override
  bool get isAccept {
    _$isAcceptAtom.reportRead();
    return super.isAccept;
  }

  @override
  set isAccept(bool value) {
    _$isAcceptAtom.reportWrite(value, super.isAccept, () {
      super.isAccept = value;
    });
  }

  final _$pageNumberAtom = Atom(name: '_ConversationListStore.pageNumber');

  @override
  int get pageNumber {
    _$pageNumberAtom.reportRead();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.reportWrite(value, super.pageNumber, () {
      super.pageNumber = value;
    });
  }

  final _$pageSizeAtom = Atom(name: '_ConversationListStore.pageSize');

  @override
  int get pageSize {
    _$pageSizeAtom.reportRead();
    return super.pageSize;
  }

  @override
  set pageSize(int value) {
    _$pageSizeAtom.reportWrite(value, super.pageSize, () {
      super.pageSize = value;
    });
  }

  final _$allEntitiesAtom = Atom(name: '_ConversationListStore.allEntities');

  @override
  ObservableList<Messages> get allEntities {
    _$allEntitiesAtom.reportRead();
    return super.allEntities;
  }

  @override
  set allEntities(ObservableList<Messages> value) {
    _$allEntitiesAtom.reportWrite(value, super.allEntities, () {
      super.allEntities = value;
    });
  }

  final _$getChatListAsyncAction =
      AsyncAction('_ConversationListStore.getChatList');

  @override
  Future<dynamic> getChatList(String id) {
    return _$getChatListAsyncAction.run(() => super.getChatList(id));
  }

  final _$_ConversationListStoreActionController =
      ActionController(name: '_ConversationListStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_ConversationListStoreActionController.startAction(
        name: '_ConversationListStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_ConversationListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChatListEmpty() {
    final _$actionInfo = _$_ConversationListStoreActionController.startAction(
        name: '_ConversationListStore.setChatListEmpty');
    try {
      return super.setChatListEmpty();
    } finally {
      _$_ConversationListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageNumber(int pageNumber) {
    final _$actionInfo = _$_ConversationListStoreActionController.startAction(
        name: '_ConversationListStore.setPageNumber');
    try {
      return super.setPageNumber(pageNumber);
    } finally {
      _$_ConversationListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increasePageNumber() {
    final _$actionInfo = _$_ConversationListStoreActionController.startAction(
        name: '_ConversationListStore.increasePageNumber');
    try {
      return super.increasePageNumber();
    } finally {
      _$_ConversationListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
chatDetailsResponse: ${chatDetailsResponse},
success: ${success},
isAccept: ${isAccept},
pageNumber: ${pageNumber},
pageSize: ${pageSize},
allEntities: ${allEntities},
loading: ${loading}
    ''';
  }
}
