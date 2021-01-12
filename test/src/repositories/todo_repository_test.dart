import 'package:flutter_test/flutter_test.dart';
import 'package:list_todos/src/models/todo_model.dart';
import 'package:list_todos/src/repositories/todo_repository.dart';

final TodoRepository repository = TodoRepository();

void main() {
  test('deve trazer uma lista do TodoModel', () async {
    final List<TodoModel> list = await repository.fetchTodos();
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}
