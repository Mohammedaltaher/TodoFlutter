import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String title, String description)? onSubmit;
  final String? initialTitle;
  final String? initialDescription;
  final bool isEditing;

  const AddTodoDialog({
    super.key,
    this.onSubmit,
    this.initialTitle,
    this.initialDescription,
    this.isEditing = false,
  });

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle ?? '');
    _descriptionController = TextEditingController(text: widget.initialDescription ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim();
      
      if (widget.isEditing) {
        Navigator.of(context).pop({
          'title': title,
          'description': description,
        });
      } else {
        widget.onSubmit?.call(title, description);
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return AlertDialog(
      title: Text(widget.isEditing ? localizations.editTodo : localizations.addNewTodo),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: localizations.title,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localizations.pleaseEnterTitle;
                }
                return null;
              },
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: localizations.description,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(localizations.cancel),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(widget.isEditing ? localizations.update : localizations.add),
        ),
      ],
    );
  }
}
