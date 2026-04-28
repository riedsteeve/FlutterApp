class Todo {
  final int? id; 
  final String title;
  final String description;
  final bool prioritaire;
  final bool isDone;

  Todo({
    this.id,
    required this.title,
    this.description = '',
    this.prioritaire = false,
    this.isDone = false,
  });

  // Conversion en Map pour l'insertion SQLite
  // isDone et prioritaire sont stockés en INTEGER (0/1) car SQLite n'a pas de type booléen
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'prioritaire': prioritaire ? 1 : 0,
      'isDone': isDone ? 1 : 0,
    };
  }

  // Reconstruction d'un Todo depuis une ligne SQLite
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'] ?? '',
      prioritaire: map['prioritaire'] == 1,
      isDone: map['isDone'] == 1,
    );
  }
}