import 'package:flutter/material.dart';

class MySnackBar {
  MySnackBar({@required this.context, @required this.contentMessage});

  final BuildContext context;
  final String contentMessage;

  SnackBar get snackBar {
    return SnackBar(
      content: Text(contentMessage),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Scaffold.of(context).removeCurrentSnackBar();
        },
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
