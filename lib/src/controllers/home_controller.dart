import 'package:list_todos/src/models/todo_model.dart';
import 'package:list_todos/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;

  HomeController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    todos = await _repository.fetchTodos();
  }
}
