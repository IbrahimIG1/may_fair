import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: argument);
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
extension MapExtentions on Map? 
{
  bool isNullOrEmpty() => this == null || this == {};
}

extension ListExtentions on List? 
{
  bool isNullOrEmpty() => this == null || this == [];
}