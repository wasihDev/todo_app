import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_models.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onToggle;
  final Function(DismissDirection) onDismissed;

  const TodoTile({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: onDismissed,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User ${todo.userId}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: todo.completed ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
          trailing: Checkbox(value: todo.completed, onChanged: onToggle),
        ),
      ),
    );
  }
}
