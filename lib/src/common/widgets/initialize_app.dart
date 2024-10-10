import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pdp_imtihon_modul_seven/src/common/constants/constants.dart';

import 'package:pdp_imtihon_modul_seven/src/common/dependency/app_dependencies.dart';
import 'package:pdp_imtihon_modul_seven/src/common/service/api_service.dart';

class InitializeApp {
  const InitializeApp();

  Future<AppDependencies> initialize() async {
    /// Initial Settings
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Api service
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    final apiService = ApiService(dio: dio);

    /// Dependencies
    return AppDependencies(
      dio: dio,
    );
  }
}