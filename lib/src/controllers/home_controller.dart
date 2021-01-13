import 'package:list_todos/src/models/todo_model.dart';
import 'package:list_todos/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository repository = TodoRepository();

  Future start() async {
    todos = await repository.fetchTodos();
  }
}
