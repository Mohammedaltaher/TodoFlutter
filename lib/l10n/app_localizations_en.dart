// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Todo List';

  @override
  String get addNewTodo => 'Add New Todo';

  @override
  String get editTodo => 'Edit Todo';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description (optional)';

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get pleaseEnterTitle => 'Please enter a title';

  @override
  String get allTodos => 'All';

  @override
  String get activeTodos => 'Active';

  @override
  String get completedTodos => 'Completed';

  @override
  String get noTodosFound => 'No todos found';

  @override
  String get noActiveTodos => 'No active todos!\nAll tasks are completed.';

  @override
  String get noCompletedTodos =>
      'No completed todos yet.\nStart completing some tasks!';

  @override
  String get welcomeMessage =>
      'Welcome to your Todo List!\nTap the + button to add your first todo!\n\nTip: Long press any item to reorder.';

  @override
  String get addYourFirstTodo => 'Add your first todo!';

  @override
  String errorLoadingTodos(String error) {
    return 'Error loading todos: $error';
  }

  @override
  String errorAddingTodo(String error) {
    return 'Error adding todo: $error';
  }

  @override
  String errorUpdatingTodo(String error) {
    return 'Error updating todo: $error';
  }

  @override
  String errorDeletingTodo(String error) {
    return 'Error deleting todo: $error';
  }

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get confirmDelete => 'Are you sure you want to delete this todo?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get toggleLanguage => 'Toggle Language';
}
