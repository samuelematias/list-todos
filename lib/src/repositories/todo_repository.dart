import 'package:dio/dio.dart';
import 'package:list_todos/src/models/todo_model.dart';

class TodoRepository {
  Dio dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

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
