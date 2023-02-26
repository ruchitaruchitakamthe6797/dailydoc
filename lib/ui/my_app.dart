import 'package:dailydoc/constants/strings.dart';
import 'package:dailydoc/data/repository.dart';
import 'package:dailydoc/di/components/service_locator.dart';
import 'package:dailydoc/stores/chat_list/chat_list.dart';
import 'package:dailydoc/stores/conversation_list/conversation_list.dart';
import 'package:dailydoc/stores/language/language_store.dart';
import 'package:dailydoc/stores/send_message/send_message_store.dart';
import 'package:dailydoc/stores/theme/theme_store.dart';
import 'package:dailydoc/ui/bottom_bar/bottom_bar.dart';
import 'package:dailydoc/utils/locale/app_localization.dart';
import 'package:dailydoc/utils/routes/routes.dart';
import 'package:dailydoc/di/components/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final ChatListStore _chatListStore = ChatListStore(getIt<Repository>());
  final ConversationListStore _conversationListStore =
      ConversationListStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final SendMessageStore _sendMessageStore =
      SendMessageStore(getIt<Repository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<ChatListStore>(create: (_) => _chatListStore),
        Provider<ConversationListStore>(create: (_) => _conversationListStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<SendMessageStore>(create: (_) => _sendMessageStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return ScreenUtilInit(
              designSize: const Size(392.7, 803.6),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: Strings.appName,
                  color: Colors.indigo.shade500,
                  routes: Routes.routes,
                  locale: Locale(_languageStore.locale),
                  supportedLocales: _languageStore.supportedLanguages
                      .map(
                          (language) => Locale(language.locale!, language.code))
                      .toList(),
                  localizationsDelegates: [
                    // A class which loads the translations from JSON files
                    AppLocalizations.delegate,
                    // Built-in localization of basic text for Material widgets
                    GlobalMaterialLocalizations.delegate,
                    // Built-in localization for text direction LTR/RTL
                    GlobalWidgetsLocalizations.delegate,
                    // Built-in localization of basic text for Cupertino widgets
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: MyNavigationBar(),
                );
              });
        },
      ),
    );
  }
}
