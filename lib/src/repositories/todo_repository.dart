import 'package:dio/dio.dart';
import 'package:list_todos/src/models/todo_model.dart';

class TodoRepository {
  final Dio dio = Dio();
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    final Response response = await dio.get(url);
    final List list = response.data as List;
    List<TodoModel> todos = [];

    for (var json in list) {
      final TodoModel todo = TodoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;
  }
}
