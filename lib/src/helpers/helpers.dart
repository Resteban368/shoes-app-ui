import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void cambiarStatusLight() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
}

void cambiarStatusDart() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
}
