import 'package:flutter/material.dart';
import 'package:feme/models/estudiantes_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider extends ChangeNotifier {
  List<Students> _estudiantes = [];

  List<Students> get estudiantes => _estudiantes;

  Future<void> getStudents() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.example.com/estudiantes"));
      final data = json.decode(response.body);
      _estudiantes = List<Students>.from(data.map((e) => Students.fromJson(e)));
      notifyListeners();
    } catch (error) {
      throw Exception("Error al obtener los estudiantes: $error");
    }
  }
}
