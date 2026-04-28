import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/todo_service.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoService _services = TodoService();
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _rechargeListe();
  }

  Future<void> _rechargeListe() async {
    setState(() => _isLoading = true);
    try {
      final tod = await _services.fetchTodos();
      setState(() {
        _todos = tod;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur de base de données : $e")),
      );
    }
  }

  Future<void> _ajouter() async {
    if (_controller.text.isNotEmpty) {
      await _services.addTaches(_controller.text);
      _controller.clear();
      _rechargeListe();
    }
  }

  Future<void> _toggleDone(Todo todo) async {
    await _services.updateTodo(todo);
    _rechargeListe();
  }

  Future<void> _delete(int id) async {
    await _services.deleteTodo(id);
    _rechargeListe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes Tâches")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Champ d'ajout
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Nouvelle tâche",
                      hintText: "Ex: Acheter du pain",
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Nouvelle tâche",
                      hintText: "Ex: Acheter du pain",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.purpleAccent, size: 30),
                  onPressed: _ajouter,
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Liste des tâches
            Expanded(
              child: _isLoading 
                ? const Center(child: CircularProgressIndicator())
                : _todos.isEmpty 
                  ? const Center(child: Text("Aucune tâche pour le moment"))
                  : ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        final todo = _todos[index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Checkbox(
                              value: todo.isDone,
                              onChanged: (_) => _toggleDone(todo),
                            ),
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                decoration: todo.isDone ? TextDecoration.lineThrough : null,
                                color: todo.isDone ? Colors.grey : Colors.black87,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () => _delete(todo.id!),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
