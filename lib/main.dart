import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'base/define/manager/locale_manager.dart';
import 'base/define/storage/storage_gateway.dart';
import 'base/define/theme.dart';
import 'base/temp_dio/dio_client.dart';
import 'config/app_config.dart';
import 'config/main_config.dart';
import 'di/di_module.dart';
import 'di/injection/injection.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'src/features/application/presentation/blocs/application_bloc/application_bloc.dart';
import 'src/features/authentication/presentation/views/sign_in/sign_in_page.dart';
import 'src/features/authentication/presentation/views/verify_email.dart';
import 'src/features/home/presentation/views/home_view.dart';
import 'src/features/introduction/domain/repositories/app_intro_repository.dart';
import 'src/features/introduction/domain/usecases/get_status_app_intro_usecase.dart';
import 'src/features/introduction/presentation/views/app_intro_page.dart';
import 'src/features/splash/presentation/views/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'Centalki',
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() {
      print("completedAppInitialize");
    });
  }

  AppLocaleManager.init();
  await StorageGateway.init();
  await Injection.inject();
  await configureApp();

  HttpOverrides.global = MyHttpOverrides();
  // runApp(
  //   ModularApp(
  //     module: AppModule(),
  //     child: const MyApp(),
  //   ),
  // );
  var analytics = FirebaseAnalytics.instance;

  runApp(
    MyApp(
      firebaseAnalytics: analytics,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.firebaseAnalytics,
  });

  final FirebaseAnalytics firebaseAnalytics;

  static void setLocale(BuildContext context, Locale newLocale) async {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLanguage(newLocale);
  }

  static void setTheme(BuildContext context, {bool isDark = false}) async {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeTheme(isDark: isDark);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ApplicationBloc _bloc;
  int? savedTabIndex;
  late String _locale;
  late bool _isDarkMode;
  late final AppLocalizationDelegate appLocalizationDelegate;

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale.languageCode;
      savedTabIndex = 3;
    });
  }

  changeTheme({bool isDark = false}) {
    setState(() {
      _isDarkMode = isDark;
      savedTabIndex = 3;
    });
  }

  @override
  void initState() {
    _locale = AppConfig.defaultLocale;
    _isDarkMode = false;
    _bloc = getIt.get<ApplicationBloc>();
    _bloc.add(ApplicationLoaded());
    appLocalizationDelegate = const AppLocalizationDelegate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _bloc,
          ),
        ],
        child: BlocListener<ApplicationBloc, ApplicationState>(
          listener: (context, state) {
            if (state.locale != _locale || state.isDarkMode != _isDarkMode) {
              setState(() {
                _locale = state.locale;
                _isDarkMode = state.isDarkMode;
              });
            }
          },
          child: BlocBuilder<ApplicationBloc, ApplicationState>(
              bloc: _bloc,
              builder: (context, state) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: getThemeData(
                      context,
                      isDarkTheme: _isDarkMode,
                    ),
                    localizationsDelegates: [
                      appLocalizationDelegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: appLocalizationDelegate.supportedLocales,
                    locale: Locale(_locale),
                    themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
                    // theme: AppThemes.lightTheme,
                    // darkTheme: AppThemes.darkTheme,
                    home: MyWidget(
                      key: UniqueKey(),
                      currentTabIndex: savedTabIndex,
                      uiStatus: state.status,
                    ),
                    navigatorObservers: kDebugMode
                        ? []
                        : [
                            FirebaseAnalyticsObserver(
                              analytics: widget.firebaseAnalytics,
                            ),
                          ],
                  )),
        ),
      );
}

class MyWidget extends StatefulWidget {
  const MyWidget({
    super.key,
    this.currentTabIndex,
    this.uiStatus,
  });

  final int? currentTabIndex;
  final UIStatus? uiStatus;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _status = 'loading';

  _checkToShowAppIntro() async {
    final check = await GetStatusAppIntroUseCase(
            appIntroRepository: getIt.get<AppIntroRepository>())
        .execute(null);
    if (!check) {
      if (mounted) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AppIntroPage()));
      }
    }
  }

  @override
  void initState() {
    if (widget.uiStatus == UIStatus.loadSuccess) {
      _checkToShowAppIntro();
    }
    // Right after the listener has been registered.
    // When a user is signed in.
    // When the current user is signed out.
    // When there is a change in the current user's token.
    super.initState();
    FirebaseAuth.instance.currentUser?.reload();
    FirebaseAuth.instance.idTokenChanges().listen((user) async {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          _status = "not_auth";
        });
      } else {
        print('User is signed in!');
        var idToken = await user.getIdToken();
        print(idToken);
        if (user.providerData[0].providerId.contains('password')) {
          if (!user.emailVerified) {
            user.sendEmailVerification();
            setState(() {
              _status = "not_email_verified";
            });
          } else {
            setState(() {
              _status = "success";
            });
          }
        } else {
          setState(() {
            _status = "success";
          });
        }
      }

      if (user?.uid != null) {
        FirebaseAnalytics.instance.setUserId(id: user?.uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_status);
    switch (_status) {
      case "loading":
        return const SplashScreen();
      case "not_auth":
        return const SignInPage();
      case "not_email_verified":
        return const VerifyEmailView();
      case "success":
        return HomeView(
          tabIndex: widget.currentTabIndex,
        );
      default:
        return const SplashScreen();
    }
  }
}
