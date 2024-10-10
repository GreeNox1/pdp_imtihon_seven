import 'package:flutter/material.dart';
import 'package:pdp_imtihon_modul_seven/src/common/router/app_router.dart';
import 'package:pdp_imtihon_modul_seven/src/features/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Imtihon 7',
      home: HomeScreen(),
    );
  }
}