import '../models/todo.dart';
import '../helpers/db_helper.dart';

class TodoService {
  // Récupérer la liste des tâches
  Future<List<Todo>> fetchTodos() async {
    try {
      return await DbHelper.getAll();
    } catch (e) {
      print("Erreur lors de la récupération : $e");
      return [];
    }
  }

  // Ajout d'une nouvelle tâche
  Future<void> addTaches(String title) async {
    if (title.trim().isEmpty) return;
    final todo = Todo(title: title);
    await DbHelper.insert(todo);
  }

  // Mise à jour
  Future<void> updateTodo(Todo todoUpdate) async {
    // On inverse l'état isDone
    final updated = Todo(
      id: todoUpdate.id,
      title: todoUpdate.title,
      description: todoUpdate.description,
      prioritaire: todoUpdate.prioritaire, 
      isDone: !todoUpdate.isDone,
    );
    await DbHelper.update(updated);
  }

  // Suppression
  Future<void> deleteTodo(int id) async {
    await DbHelper.delete(id);
  }
}
