import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../services/todo_service.dart';
import '../widgets/todo_item.dart';
import '../widgets/add_todo_dialog.dart';
import '../l10n/app_localizations.dart';
import '../providers/language_provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoService _todoService = TodoService();
  List<Todo> _todos = [];
  bool _isLoading = true;
  String _filter = 'all'; // 'all', 'active', 'completed'

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final todos = await _todoService.getTodos();
      setState(() {
        _todos = todos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        final localizations = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(localizations.errorLoadingTodos(e.toString()))),
        );
      }
    }
  }

  List<Todo> get _filteredTodos {
    switch (_filter) {
      case 'active':
        return _todos.where((todo) => !todo.isCompleted).toList();
      case 'completed':
        return _todos.where((todo) => todo.isCompleted).toList();
      default:
        return _todos;
    }
  }

  Future<void> _addTodo(String title, String description) async {
    final todo = Todo(title: title, description: description);
    await _todoService.addTodo(todo);
    await _loadTodos();
  }

  Future<void> _toggleTodo(String id) async {
    await _todoService.toggleTodoCompletion(id);
    await _loadTodos();
  }

  Future<void> _deleteTodo(String id) async {
    await _todoService.deleteTodo(id);
    await _loadTodos();
  }

  Future<void> _editTodo(Todo todo) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => AddTodoDialog(
        initialTitle: todo.title,
        initialDescription: todo.description,
        isEditing: true,
      ),
    );

    if (result != null) {
      final updatedTodo = todo.copyWith(
        title: result['title'],
        description: result['description'],
      );
      await _todoService.updateTodo(updatedTodo);
      await _loadTodos();
    }
  }

  Future<void> _reorderTodos(int oldIndex, int newIndex) async {
    // Only allow reordering when showing all todos
    if (_filter != 'all') {
      return;
    }
    
    await _todoService.reorderTodos(oldIndex, newIndex);
    await _loadTodos();
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        onSubmit: _addTodo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(localizations.appTitle),
            if (_filter == 'all')
              const Text(
                'Long press to reorder',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false).toggleLanguage();
            },
            tooltip: localizations.toggleLanguage,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _filter = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'all',
                child: Text(localizations.allTodos),
              ),
              PopupMenuItem(
                value: 'active',
                child: Text(localizations.activeTodos),
              ),
              PopupMenuItem(
                value: 'completed',
                child: Text(localizations.completedTodos),
              ),
            ],
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _filteredTodos.isEmpty
              ? _buildEmptyState()
              : _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState() {
    final localizations = AppLocalizations.of(context)!;
    String message;
    IconData icon;

    switch (_filter) {
      case 'active':
        message = localizations.noActiveTodos;
        icon = Icons.check_circle_outline;
        break;
      case 'completed':
        message = localizations.noCompletedTodos;
        icon = Icons.radio_button_unchecked;
        break;
      default:
        message = localizations.welcomeMessage;
        icon = Icons.add_task;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList() {
    // Only enable reordering when showing all todos
    if (_filter == 'all') {
      return RefreshIndicator(
        onRefresh: _loadTodos,
        child: ReorderableListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _filteredTodos.length,
          onReorder: _reorderTodos,
          itemBuilder: (context, index) {
            final todo = _filteredTodos[index];
            return TodoItem(
              key: ValueKey(todo.id),
              todo: todo,
              onToggle: () => _toggleTodo(todo.id),
              onDelete: () => _deleteTodo(todo.id),
              onEdit: () => _editTodo(todo),
            );
          },
        ),
      );
    } else {
      // Use regular ListView when filtering is active
      return RefreshIndicator(
        onRefresh: _loadTodos,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _filteredTodos.length,
          itemBuilder: (context, index) {
            final todo = _filteredTodos[index];
            return TodoItem(
              key: ValueKey(todo.id),
              todo: todo,
              onToggle: () => _toggleTodo(todo.id),
              onDelete: () => _deleteTodo(todo.id),
              onEdit: () => _editTodo(todo),
            );
          },
        ),
      );
    }
  }
}
