import 'package:flutter/material.dart';

import '../dependency/app_dependencies.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    required this.child,
    required this.dependencies,
    super.key,
  });

  final Widget child;
  final AppDependencies dependencies;

  @override
  State<AppScope> createState() => AppScopeState();
}

class AppScopeState extends State<AppScope> {
  late final AppDependencies dependencies;

  @override
  void initState() {
    super.initState();
    dependencies = widget.dependencies;
  }

  @override
  Widget build(BuildContext context) => widget.child;
}