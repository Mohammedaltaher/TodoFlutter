import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/main.dart';
import 'package:todo_flutter/providers/language_provider.dart';
import 'package:todo_flutter/providers/theme_provider.dart';

void main() {
  testWidgets('Todo app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LanguageProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: const TodoApp(),
      ),
    );

    // Verify that our app starts with the correct title.
    expect(find.text('Todo List'), findsOneWidget);

    // Verify that the add button is present.
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the add button and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the add todo dialog appears.
    expect(find.text('Add New Todo'), findsOneWidget);
  });
}
