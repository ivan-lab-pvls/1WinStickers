import 'package:dqed1/fdsgfdshgdf.dart';
import 'package:dqed1/news_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fdsxsa.dart';
import 'home.dart';
import 'onboarding_screen.dart';

late SharedPreferences sharedPreferences;
late bool? isFirstTime;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: Apx.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await Notifc().activate();
  // sharedPreferences.clear();
  isFirstTime = sharedPreferences.getBool('isFirstTime');
  isFirstTime = isFirstTime ?? true;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  Future<String?> checkNewStickers() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    final String j = remoteConfig.getString('carsStickers');
    if (!j.contains('noneNewStickers')) {
      String jumeiraPlus = j;
      return jumeiraPlus.isNotEmpty ? jumeiraPlus : null;
    }
    return null;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          listTileTheme: ListTileThemeData(
            iconColor: Colors.red,
          ),
          splashColor: Colors.transparent,
          appBarTheme: AppBarTheme(
              titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontFamily: 'Numberplate',
                  ),
              color: Colors.redAccent,
              iconTheme: const IconThemeData(color: Colors.white)),
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Numberplate',
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
        ),
        debugShowCheckedModeBanner: false,
       home: FutureBuilder<String?>(
          future: checkNewStickers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              String? newStikers = snapshot.data;
              return newStikers != null && newStikers.isNotEmpty
                  ? ShowNewStickers(data: newStikers)
                  : isFirstTime == true
                      ? const OnboardingScreen()
                      : const HomeScreen();
            } else {
              String? configurationData = snapshot.data;
              return configurationData != null && configurationData.isNotEmpty
                  ? ShowNewStickers(data: configurationData)
                  : isFirstTime == true
                      ? const OnboardingScreen()
                      : const HomeScreen();
            }
          }),
    );
  }
}
