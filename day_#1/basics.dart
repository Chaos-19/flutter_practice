void main(List<String> args) {
  int? number = 0;
  number = num.parse("20") as int;

  print(number);
  print(num.parse("20.5") is double);

  var todo = TodoApp()
    ..addTodo(
        Todo('Create Todo App with Dart', TodoStatusType.INPROGRESS.name));

  print(todo.todos);

  Symbol obj = new Symbol("name");

  print(obj);
  //runes type 
  String her_rune = '\u2665';

  print(her_rune);
}

enum TodoStatusType { INPROGRESS, COMPLETED }

class Todo {
  String? messg;
  String? todoStatus;

  Todo(this.messg, this.todoStatus);
}

class TodoApp {
  List<Todo> todos = [];

  void addTodo(Todo? todo) {
    print(todos.length);
    todos.add(todo!);
    print(todos.length);
  }

  Todo? removeTodo(int index) {
    return todos.removeAt(index);
  }
}
