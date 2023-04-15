import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base/define/storage/storage_gateway.dart';
import 'base/temp_dio/dio_client.dart';
import 'config/main_config.dart';
import 'di/di_module.dart';
import 'di/injection/injection.dart';
import 'firebase_options.dart';
import 'src/features/authentication/presentation/views/sign_in/sign_in_page.dart';
import 'src/features/authentication/presentation/views/verify_email.dart';
import 'src/features/home/presentation/views/home_view.dart';
import 'src/features/introduction/domain/repositories/app_intro_repository.dart';
import 'src/features/introduction/domain/usecases/get_status_app_intro_usecase.dart';
import 'src/features/introduction/presentation/views/app_intro_page.dart';
import 'src/features/splash/presentation/views/splash_screen.dart';

void main(List<String> args) async {
  await Injection.inject();
  await configureApp();
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

  await StorageGateway.init();

  HttpOverrides.global = MyHttpOverrides();
  // runApp(
  //   ModularApp(
  //     module: AppModule(),
  //     child: const MyApp(),
  //   ),
  // );
  var analytics = FirebaseAnalytics.instance;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      fontFamily: 'Dongle',
    ),
    home: const MyWidget(),
    navigatorObservers: kDebugMode
        ? []
        : [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

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
    _checkToShowAppIntro();
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
        return const HomeView();
      default:
        return const SplashScreen();
    }
  }
}
