import 'package:flutter/material.dart';
import 'package:list_todos/src/controllers/home_controller.dart';
import 'package:list_todos/src/models/todo_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Todo\'s'), actions: [
        IconButton(
          icon: Icon(Icons.refresh_outlined),
          onPressed: () => _controller.start(),
        )
      ]),
      body: AnimatedBuilder(
        animation: _controller.state,
        builder: (_, __) => _HandleBody(controller: _controller),
      ),
    );
  }
}

class _HandleBody extends StatelessWidget {
  const _HandleBody({@required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isLoading = controller.state.value == HomeState.loading;
    final bool isError = controller.state.value == HomeState.error;
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (isError) {
      return Center(
          child: RaisedButton(
        child: Text('Tentar Novamente'),
        onPressed: () => controller.start(),
      ));
    }
    return _Body(controller: controller);
  }
}

class _Body extends StatelessWidget {
  const _Body({@required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final List<TodoModel> listTodo = controller.todos;

    return ListView.builder(
      itemCount: listTodo.length,
      itemBuilder: (BuildContext context, int index) {
        TodoModel todo = listTodo[index];
        return ListTile(
          title: Text(todo.title),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (bool value) {},
          ),
        );
      },
    );
  }
}
