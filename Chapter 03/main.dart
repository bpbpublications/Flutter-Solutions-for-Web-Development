import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Todo List ",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Hello, World!",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: const Scaffold(
//         body: Center(
//           child: Text(
//             'Hello, World!',
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "My Todo List",
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//       ),
//       home: const MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             "My Todo List",
//             style: TextStyle(fontSize: 36),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           const Progress(),
//           const TaskList(),
//           const Spacer(),
//           FloatingActionButton.extended(
//             onPressed: () {
//               print("Add Task button clicked");
//             },
//             icon: const Icon(Icons.add),
//             label: const Text("Add Task"),
//             foregroundColor: Colors.white,
//             backgroundColor: Colors.deepPurple,
//             splashColor: Colors.deepPurpleAccent,
//           ),
//           const SizedBox(
//             height: 16,
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class Progress extends StatelessWidget {
//   const Progress({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         Text(
//           "Completion Progress (75%)",
//           style: TextStyle(fontSize: 16),
//         ),
//         LinearProgressIndicator(
//           value: 0.75,
//         )
//       ],
//     );
//   }
// }
//
// class TaskList extends StatelessWidget {
//   const TaskList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         TaskItem(label: "Buy groceries 🛒", status: true),
//         TaskItem(label: "Pay bills 💴", status: true),
//         TaskItem(label: "Call mom 📞", status: true),
//         TaskItem(label: "Read a book 📖"),
//       ],
//     );
//   }
// }
//
// class TaskItem extends StatelessWidget {
//   final String label;
//   final bool status;
//
//   const TaskItem({
//     super.key,
//     required this.label,
//     this.status = false, // default value
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print("Task item clicked: $label");
//       },
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           children: [
//             // display checkmark if status is true
//             if (status) ...[
//               const CircleAvatar(
//                 backgroundColor: Colors.lightGreen,
//                 child: Icon(Icons.check),
//               ),
//             ] else ...[
//               const CircleAvatar(
//                 backgroundColor: Colors.redAccent,
//                 child: Icon(Icons.close),
//               ),
//             ],
//             const SizedBox(width: 16),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.deepPurple,
//                 fontWeight: FontWeight.w100,
//               ),
//             ),
//             const Spacer(),
//             Checkbox(
//               value: status,
//               onChanged: (value) {
//                 print("Checkbox clicked: $value");
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
