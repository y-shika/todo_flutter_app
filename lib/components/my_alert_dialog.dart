import 'package:flutter/material.dart';

/// Dialogの戻り値として使う列挙型
enum DialogAnswer { YES, NO }

/// 警告ダイアログを表示するクラス
/// 汎用性を持たせるために文字列は呼び出し側から指定する
class AlertDialogShower {
  AlertDialogShower({@required this.title, @required this.contentMessage});

  final String title;
  final String contentMessage;

  Future openDialog(BuildContext context) {
    print("open dialog!!");

    return showDialog<DialogAnswer>(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog(title: title, contentMessage: contentMessage);
      },
    );
  }
}

/// ダイアログウィジェットのクラス
class MyAlertDialog extends StatelessWidget {
  MyAlertDialog({@required this.title, @required this.contentMessage});

  final String title;
  final String contentMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contentMessage),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(DialogAnswer.NO),
        ),
        FlatButton(
          child: Text("OK"),
          onPressed: () => Navigator.of(context).pop(DialogAnswer.YES),
        ),
      ],
    );
  }
}
