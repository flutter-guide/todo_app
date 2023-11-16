class Todo {
  final String id;
  final String title;
  final bool done;

  Todo({
    required this.id,
    required this.title,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "done": done,
    };
  }

  static Todo fromMap(String todoId, Map<String, dynamic> map) {
    return Todo(
      id: todoId,
      title: map["title"],
      done: map["done"],
    );
  }
}
