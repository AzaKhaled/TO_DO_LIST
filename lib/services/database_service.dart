import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/model/todo_model.dart';

class DatabaseService {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("todos");
  User? user = FirebaseAuth.instance.currentUser;
// add task
  Future<DocumentReference> addTodoItem(String title) async {
    return await todoCollection.add({
      'uid': user!.uid,
      'title': title,
      'completed': false,
    });
  }

  //update todo tasks
  Future<void> updatetodo(String id, String title) async {
    final updatetoCollection =
        FirebaseFirestore.instance.collection("todos").doc(id);
    return await updatetoCollection.update({
      'title': title,
    });
  }

  Future<void> updatestatustodo(String id, bool completed) async {
    final updatetoCollection =
        FirebaseFirestore.instance.collection("todos").doc(id);
    return await updatetoCollection.update({
      'completed': completed,
    });
  }

  // delet todo
  Future<void> delettodotask(
    String id,
  ) async {
    final updatetoCollection =
        FirebaseFirestore.instance.collection("todos").doc(id).delete();
  }

//get pending tasks
  Stream<List<Todo>> get todos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(todoListFromSnapshot);
  }

//get completed tasks
  Stream<List<Todo>> get completedtodos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(todoListFromSnapshot);
  }

  List<Todo> todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
          completed: doc['completed'] ?? false,
          id: doc.id,
          title: doc['title'] ?? '');
    }).toList();
  }
}
