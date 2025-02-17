import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

import '../models/student_model.dart';

class StudentProvider with ChangeNotifier {
  final LocalStorage storage;

  StudentProvider({required this.storage}) {
    _loadStudentFromStorage();
  }

  List<Student> _students = [];

  List<Student> get students => _students;

  void _loadStudentFromStorage() async {
    var data = storage.getItem('students');
    if (data != null) {
      _students = List<Student>.from(
        (jsonDecode(data) as List).map(
          (item) => Student.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  void deleteStudent(int id) {
    _students.removeWhere((student) => student.id == id);
    notifyListeners();
  }

  void updateStudent(Student updateStudent) {
    var index =
        _students.indexWhere((student) => student.id == updateStudent.id);
    if (index != -1) {
      _students[index] == updateStudent;
      notifyListeners();
    }
  }
}
