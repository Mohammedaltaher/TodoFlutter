import '../models/todo.dart';

class TodoService {
  static final List<Todo> _todos = [];
  static bool _isInitialized = false;

  // Initialize with sample todos
  void _initializeSampleTodos() {
    if (_isInitialized) return;
    
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    
    final sampleTodos = [
      Todo(title: "Buy groceries", description: "Milk, bread, eggs, and fresh vegetables", order: 0),
      Todo(title: "Complete Flutter project", description: "Finish the todo app with drag and drop functionality", order: 1),
      Todo(title: "Call dentist", description: "Schedule appointment for teeth cleaning", order: 2),
      Todo(title: "Exercise", description: "30 minutes of cardio at the gym", order: 3),
      Todo(title: "Read a book", description: "Continue reading 'Clean Code' by Robert Martin", order: 4),
      Todo(title: "Plan weekend trip", description: "Research destinations and book accommodations", order: 5),
      Todo(title: "Update resume", description: "Add recent projects and skills", order: 6),
      Todo(title: "Learn new recipe", description: "Try making homemade pasta with marinara sauce", order: 7),
      Todo(title: "Organize home office", description: "Clean desk, organize cables, and file documents", order: 8),
      Todo(
        title: "Water plants", 
        description: "Check all indoor plants and water as needed", 
        order: 9, 
        isCompleted: true,
        completedAt: yesterday,
      ),
      Todo(
        title: "Pay bills", 
        description: "Electricity, water, and internet bills", 
        order: 10, 
        isCompleted: true,
        completedAt: yesterday,
      ),
      Todo(title: "Backup computer files", description: "Create backup of important documents and photos", order: 11),
    ];
    
    _todos.addAll(sampleTodos);
    _isInitialized = true;
  }

  // Get all todos from memory
  Future<List<Todo>> getTodos() async {
    _initializeSampleTodos(); // Initialize sample data on first call
    // Sort todos by order before returning
    _todos.sort((a, b) => a.order.compareTo(b.order));
    return List.from(_todos);
  }

  // Add a new todo
  Future<void> addTodo(Todo todo) async {
    // Set the order to be the highest + 1
    final maxOrder = _todos.isEmpty ? 0 : _todos.map((t) => t.order).reduce((a, b) => a > b ? a : b);
    final newTodo = todo.copyWith(order: maxOrder + 1);
    _todos.add(newTodo);
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

  // Reorder todos
  Future<void> reorderTodos(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    
    // Get the sorted list to work with correct indices
    final sortedTodos = List<Todo>.from(_todos);
    sortedTodos.sort((a, b) => a.order.compareTo(b.order));
    
    // Move the item
    final item = sortedTodos.removeAt(oldIndex);
    sortedTodos.insert(newIndex, item);
    
    // Update the order values
    for (int i = 0; i < sortedTodos.length; i++) {
      final todoIndex = _todos.indexWhere((t) => t.id == sortedTodos[i].id);
      if (todoIndex != -1) {
        _todos[todoIndex] = _todos[todoIndex].copyWith(order: i);
      }
    }
  }
}
