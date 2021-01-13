import 'package:dio/dio.dart';
import 'package:list_todos/src/models/todo_model.dart';

class TodoRepository {
  Dio dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio client]) : dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final Response response = await dio.get(url);
    final List list = response.data as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
