/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "real man",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: CounterApp());
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0, incremetBy = 1;

  void increment() {
    setState(() {
      _count += incremetBy;
    });
  }

  void decrement() {
    setState(() {
      _count -= incremetBy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Container(
        child: Column(
          children: [
            Text('$_count'),
            Container(
              width: 80,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    incremetBy = num.tryParse(value) as int ?? incremetBy;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: increment, child: const Text("increment")),
                ElevatedButton(
                    onPressed: decrement, child: const Text("deincrement")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
          useMaterial3: true),
      home: TodoAppPage(),
    );
  }
}

class TodoAppPage extends StatefulWidget {
  const TodoAppPage({super.key});

  @override
  State<TodoAppPage> createState() => _TodoAppPageState();
}

class _TodoAppPageState extends State<TodoAppPage> {
  List<Todo> todos = [
    Todo(name: 'Create Todo App With Flutter', status: TodoStatus.COMPLETED),
    Todo(name: 'Watch videos tutorial'),
    Todo(name: 'prepare for exit exam', status: TodoStatus.COMPLETED),
    Todo(name: 'Get Good sleep !'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.red),
                  ),
                  height: 50,
                  color: Colors.amber[index],
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Entry ${todos[index].name}'),
                        Checkbox(
                            value: todos[index].status == TodoStatus.COMPLETED
                                ? true
                                : false,
                            onChanged: (value) {
                              setState(() {
                                todos[index].todo_status = value!
                                    ? TodoStatus.COMPLETED
                                    : TodoStatus.PENDING;
                              });
                            })
                      ]),
                );
              })),
    );
  }
}

enum TodoStatus {
  PENDING,
  COMPLETED,
}

class Todo {
  String? name;
  TodoStatus? status;

  Todo(
      {required String this.name, TodoStatus this.status = TodoStatus.PENDING});

  TodoStatus? get todo_statu {
    return status;
  }

  set todo_status(TodoStatus status) {
    this.status = status;
  }
}
