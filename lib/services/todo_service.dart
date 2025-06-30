import '../models/todo.dart';

class TodoService {
  static final List<Todo> _todos = [];

  // Get all todos from memory
  Future<List<Todo>> getTodos() async {
    // Return immediately for better performance and test compatibility
    return List.from(_todos);
  }

  // Add a new todo
  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  // Update an existing todo
  Future<void> updateTodo(Todo updatedTodo) async {
    final index = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
    
    if (index != -1) {
      _todos[index] = updatedTodo;
    }
  }

  // Delete a todo
  Future<void> deleteTodo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
  }

  // Toggle todo completion status
  Future<void> toggleTodoCompletion(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    
    if (index != -1) {
      final todo = _todos[index];
      final now = DateTime.now();
      _todos[index] = todo.copyWith(
        isCompleted: !todo.isCompleted,
        completedAt: !todo.isCompleted ? now : null,
      );
    }
  }
}
