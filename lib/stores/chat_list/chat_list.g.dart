// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatListStore on _ChatListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ChatListStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_ChatListStore.fetchPostsFuture');

  @override
  ObservableFuture<ChatListResponse?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<ChatListResponse?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$chatListResponseAtom = Atom(name: '_ChatListStore.chatListResponse');

  @override
  ChatListResponse? get chatListResponse {
    _$chatListResponseAtom.reportRead();
    return super.chatListResponse;
  }

  @override
  set chatListResponse(ChatListResponse? value) {
    _$chatListResponseAtom.reportWrite(value, super.chatListResponse, () {
      super.chatListResponse = value;
    });
  }

  final _$successAtom = Atom(name: '_ChatListStore.success');

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

  final _$isAcceptAtom = Atom(name: '_ChatListStore.isAccept');

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

  final _$pageNumberAtom = Atom(name: '_ChatListStore.pageNumber');

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

  final _$pageSizeAtom = Atom(name: '_ChatListStore.pageSize');

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

  final _$seeAllEntitiesAtom = Atom(name: '_ChatListStore.seeAllEntities');

  @override
  ObservableList<ChatListData> get seeAllEntities {
    _$seeAllEntitiesAtom.reportRead();
    return super.seeAllEntities;
  }

  @override
  set seeAllEntities(ObservableList<ChatListData> value) {
    _$seeAllEntitiesAtom.reportWrite(value, super.seeAllEntities, () {
      super.seeAllEntities = value;
    });
  }

  final _$getChatListAsyncAction = AsyncAction('_ChatListStore.getChatList');

  @override
  Future<dynamic> getChatList() {
    return _$getChatListAsyncAction.run(() => super.getChatList());
  }

  final _$_ChatListStoreActionController =
      ActionController(name: '_ChatListStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_ChatListStoreActionController.startAction(
        name: '_ChatListStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_ChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChatListEmpty() {
    final _$actionInfo = _$_ChatListStoreActionController.startAction(
        name: '_ChatListStore.setChatListEmpty');
    try {
      return super.setChatListEmpty();
    } finally {
      _$_ChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageNumber(int pageNumber) {
    final _$actionInfo = _$_ChatListStoreActionController.startAction(
        name: '_ChatListStore.setPageNumber');
    try {
      return super.setPageNumber(pageNumber);
    } finally {
      _$_ChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increasePageNumber() {
    final _$actionInfo = _$_ChatListStoreActionController.startAction(
        name: '_ChatListStore.increasePageNumber');
    try {
      return super.increasePageNumber();
    } finally {
      _$_ChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
chatListResponse: ${chatListResponse},
success: ${success},
isAccept: ${isAccept},
pageNumber: ${pageNumber},
pageSize: ${pageSize},
seeAllEntities: ${seeAllEntities},
loading: ${loading}
    ''';
  }
}
