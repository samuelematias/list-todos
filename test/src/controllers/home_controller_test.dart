import 'package:flutter_test/flutter_test.dart';
import 'package:list_todos/src/controllers/home_controller.dart';
import 'package:list_todos/src/models/todo_model.dart';
import 'package:list_todos/src/repositories/todo_repository.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final TodoRepositoryMock repository = TodoRepositoryMock();
  final HomeController controller = HomeController(repository);

  test('deve preencher a variável todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
