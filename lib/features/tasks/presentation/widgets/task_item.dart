import 'package:flutter/material.dart';
import '../../domain/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onToggle,
          child: AnimatedContainer
              (
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 4,
                  color: task.isDone ? colors.primary : Colors.transparent,
                ),
              ),
            ),
            child: Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: task.isDone
                      ? const Icon(Icons.check_circle, key: ValueKey('done'))
                      : const Icon(Icons.radio_button_unchecked,
                          key: ValueKey('todo')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                      color: task.isDone
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : null,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Toggle',
                  icon: const Icon(Icons.check),
                  onPressed: onToggle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
