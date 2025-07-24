import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_models.dart';
import 'package:todo_app/services/api_service.dart';

class TodoProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Todo> _todos = [];
  List<Todo> _deletedTodos = [];
  bool _isLoading = false;
  String? _error;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTodos() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final todos = await _apiService.fetchTodos();
      print('todos $todos');
      _todos = todos;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addTodo(String title) {
    final newTodo = Todo(
      userId: 1,
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      completed: false,
    );
    _todos.insert(0, newTodo);

    notifyListeners();
  }

  void toggleTodoStatus(int id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].toggleCompleted();
      notifyListeners();
    }
  }

  void deleteTodo(int id, BuildContext context) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final deletedTodo = _todos.removeAt(index);
      _deletedTodos.add(deletedTodo);
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Todo deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              _todos.insert(index, deletedTodo);
              _deletedTodos.remove(deletedTodo);
              notifyListeners();
            },
          ),
        ),
      );
    }
  }
}
