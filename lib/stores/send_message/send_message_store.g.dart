// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SendMessageStore on _SendMessageStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SendMessageStore.loading'))
      .value;

  final _$fetchPostsFutureAtom =
      Atom(name: '_SendMessageStore.fetchPostsFuture');

  @override
  ObservableFuture<SendMessageResponse?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<SendMessageResponse?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$postListAtom = Atom(name: '_SendMessageStore.postList');

  @override
  SendMessageResponse? get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(SendMessageResponse? value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$successAtom = Atom(name: '_SendMessageStore.success');

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

  final _$isAcceptAtom = Atom(name: '_SendMessageStore.isAccept');

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

  final _$sendMessageAsyncAction = AsyncAction('_SendMessageStore.sendMessage');

  @override
  Future<dynamic> sendMessage(String params, String message, String id) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(params, message, id));
  }

  final _$_SendMessageStoreActionController =
      ActionController(name: '_SendMessageStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_SendMessageStoreActionController.startAction(
        name: '_SendMessageStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_SendMessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
postList: ${postList},
success: ${success},
isAccept: ${isAccept},
loading: ${loading}
    ''';
  }
}
