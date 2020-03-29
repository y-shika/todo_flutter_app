// import 'package:flutter/material.dart';
// import 'package:todo_flutter_app/main/todo.dart';

// import 'todo.dart';

// /// TODO要素を表示するクラス
// class TodoElement extends StatelessWidget {
//   const TodoElement({this.todo});

//   final Todo todo;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print('Tapped!');
//       },
//       onLongPress: () {
//         print('Long Pressed!');
//       },
//       child: Card(
//         child: Padding(
//           child: Text(
//             todo.title,
//             style: TextStyle(
//               color: Colors.white,
//               decoration: todo.active
//                   ? TextDecoration.none
//                   : TextDecoration.lineThrough,
//             ),
//           ),
//           padding: const EdgeInsets.all(20),
//         ),
//         color: todo.active ? Colors.blue : Colors.black12,
//       ),
//     );
//   }
// }
