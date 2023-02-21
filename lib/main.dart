import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lucy/pages/auth/splash.dart';
import 'package:lucy/pages/main/components/main_scaffold.dart';
import 'package:lucy/pages/main/home/home.dart';
import 'package:lucy/pages/main/profile/add_pet/add_pet_stepper.dart';
import 'package:theme_manager/theme_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (BuildContext context) => Splash(),
    '/home': (BuildContext context) => const MainScaffold(),
    '/add-pet': (BuildContext context) => AddPetStepper()
  };

  Widget homePage = const MyHomePage(title: "Lucy");

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
        defaultBrightnessPreference: BrightnessPreference.system,
        data: (Brightness brightness) => ThemeData(
              primarySwatch: Colors.blue,
              brightness: brightness,
            ),
        loadBrightnessOnStart: true,
        themedWidgetBuilder: (context, data) {
          return MaterialApp(
              title: 'Lucy', theme: data, routes: routes, home: homePage);
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget returnObject = Splash();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        returnObject = const Home();
      }
    });

    return returnObject;
  }
}
