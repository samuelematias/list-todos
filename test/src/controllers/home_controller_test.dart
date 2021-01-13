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
    expect(controller.state.value, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });

  test('deve modificar o estado para error se a requisição falha', () async {
    when(repository.fetchTodos()).thenThrow(Exception());
    await controller.start();
    expect(controller.state.value, HomeState.error);
  });
}
