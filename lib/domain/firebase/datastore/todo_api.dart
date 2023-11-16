import 'package:cloud_firestore/cloud_firestore.dart';

class TodoApi {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTodos() {
    return FirebaseFirestore.instance.collection("tasks").snapshots();
  }

  Future<bool> toggleDone(String id) async {
    var documentReference =
        FirebaseFirestore.instance.collection("tasks").doc(id);
    final res = await documentReference.get().then<bool>((documentSnapshot) {
      if (documentSnapshot.exists) {
        bool currentValue = documentSnapshot.data()?['done'] ?? false;
        documentReference.update({'done': !currentValue});
        return !currentValue;
      }
      return false;
    });
    return res;
  }
}
