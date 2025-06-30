# Todo Flutter App

A beautiful and modern Flutter todo list application with the following features:

## Features

- ✅ Add new todos with title and description
- ✅ Mark todos as completed/incomplete
- ✅ Edit existing todos
- ✅ Delete todos with confirmation
- ✅ Filter todos (All, Active, Completed)
- ✅ Beautiful material design UI
- ✅ Responsive design
- ✅ Pull to refresh

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd TodoFlutter
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── todo.dart            # Todo data model
├── services/
│   └── todo_service.dart    # Todo business logic
├── screens/
│   └── todo_list_screen.dart # Main todo list screen
└── widgets/
    ├── todo_item.dart       # Individual todo item widget
    └── add_todo_dialog.dart # Add/edit todo dialog
```

## Usage

1. **Add a Todo**: Tap the floating action button (+) to add a new todo
2. **Complete a Todo**: Tap the checkbox or tap on the todo item
3. **Edit a Todo**: Tap the edit icon on any todo item
4. **Delete a Todo**: Tap the delete icon and confirm deletion
5. **Filter Todos**: Use the filter menu in the app bar to show all, active, or completed todos
6. **Refresh**: Pull down on the todo list to refresh

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
