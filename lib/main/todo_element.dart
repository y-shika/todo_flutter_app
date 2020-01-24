import 'package:flutter/material.dart';

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
        print("tapped!! (Stateful)");
        setState(() {
          widget.todo.active = !widget.todo.active;
        });
      },
      onLongPress: () {
        print("long press!!");
        // TODO: ここで「本当に削除しますか？」的なダイアログを挟む
        //       alertDialogが良さそう
        widget.onRemove(widget.index);
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
          padding: EdgeInsets.all(20.0),
        ),
        color: widget.todo.active ? Colors.blue : Colors.black12,
      ),
    );
  }
}
