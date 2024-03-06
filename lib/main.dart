import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitability/Controller/Provider/dayAndTimePicker_provider.dart';
import 'package:suitability/Controller/Provider/home_screen_provider.dart';
import 'package:suitability/View/Screens/AppScreens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => HomeScreenProvider())),
        ChangeNotifierProvider(create: ((context) => SelectedDayAndTimeProvider())),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Task',
          routes: {
            '/home': (context) => HomeScreen(),
          },
          home: HomeScreen(),
        );
      }),
    );
  }
}
