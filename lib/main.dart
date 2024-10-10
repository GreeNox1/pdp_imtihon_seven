import 'package:flutter/material.dart';
import 'package:pdp_imtihon_modul_seven/src/common/widgets/app_scope.dart';
import 'package:pdp_imtihon_modul_seven/src/common/widgets/initialize_app.dart';
import 'package:pdp_imtihon_modul_seven/src/common/widgets/my_app.dart';

void main() async {
  final dependencies = await (const InitializeApp()).initialize();

  runApp(
    AppScope(
      dependencies: dependencies,
      child: const MyApp(),
    ),
  );
}
