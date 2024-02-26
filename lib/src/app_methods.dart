import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

abstract final class AppMethods {

  static void showSnackBar(BuildContext context, String message,
      {AnimatedSnackBarType? snackBarType,
        DesktopSnackBarPosition? desktopPosition}) {
    desktopPosition ??= DesktopSnackBarPosition.topCenter;
    snackBarType ??= AnimatedSnackBarType.warning;
    AnimatedSnackBar.material(
      message,
      type: snackBarType,
      desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
    ).show(context);
  }

}