import 'package:flutter/material.dart';

import '../components/my_alert_dialog.dart';
import '../components/my_snack_bar.dart';
import 'todo.dart';

/// TODO要素を表示するクラス
class TodoElement extends StatefulWidget {
  TodoElement(
      {@required this.index, @required this.todo, @required this.onRemove});

  final int index; // TODO要素を削除する際などに必要なリストにおけるindex
  final Todo todo;
  final Function onRemove;

  @override
  _TodoElementState createState() => _TodoElementState();
}

class _TodoElementState extends State<TodoElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tapped!! (Stateful)');
        setState(() {
          widget.todo.active = !widget.todo.active;
        });
      },
      onLongPress: () async {
        print('long press!!');

        final dynamic result =
            await AlertDialogShower(title: '削除', contentMessage: '本当に削除しますか？')
                .openDialog(context);

        print('dialog result: $result');

        if (result == DialogAnswer.yes) {
          widget.onRemove(widget.index);

          Scaffold.of(context).showSnackBar(MySnackBar(
                  context: context,
                  contentMessage: '${widget.todo.title}を削除しました')
              .snackBar);
        }
      },
      child: Card(
        child: Padding(
          child: Text(
            widget.todo.title,
            style: TextStyle(
              color: Colors.white,
              decoration: widget.todo.active
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
            ),
          ),
          padding: const EdgeInsets.all(20),
        ),
        color: widget.todo.active ? Colors.blue : Colors.black12,
      ),
    );
  }
}
