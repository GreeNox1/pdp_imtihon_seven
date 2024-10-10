import 'package:flutter/material.dart';
import 'package:pdp_imtihon_modul_seven/src/common/widgets/app_scope.dart';
import '../dependency/app_dependencies.dart';

extension ContextExtension on BuildContext {

  AppDependencies get dependencies =>
      findAncestorStateOfType<AppScopeState>()?.dependencies ??
          (throw ArgumentError(
            'Not found AppScopeState',
          ));
}