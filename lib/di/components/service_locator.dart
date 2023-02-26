import 'package:dailydoc/data/local/datasources/post/post_datasource.dart';
import 'package:dailydoc/data/network/apis/posts/post_api.dart';
import 'package:dailydoc/data/network/dio_client.dart';
import 'package:dailydoc/data/network/rest_client.dart';
import 'package:dailydoc/data/repository.dart';
import 'package:dailydoc/data/sharedpref/shared_preference_helper.dart';
import 'package:dailydoc/di/module/local_module.dart';
import 'package:dailydoc/di/module/network_module.dart';
import 'package:dailydoc/stores/chat_list/chat_list.dart';
import 'package:dailydoc/stores/conversation_list/conversation_list.dart';
import 'package:dailydoc/stores/error/error_store.dart';
import 'package:dailydoc/stores/form/form_store.dart';
import 'package:dailydoc/stores/language/language_store.dart';
import 'package:dailydoc/stores/send_message/send_message_store.dart';
import 'package:dailydoc/stores/theme/theme_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));

  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<PostApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<PostDataSource>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(ChatListStore(getIt<Repository>()));
  getIt.registerSingleton(ConversationListStore(getIt<Repository>()));
  getIt.registerSingleton(SendMessageStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
}
