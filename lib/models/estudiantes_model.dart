// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

List<Students> studentsFromJson(String str) =>
    List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

String studentsToJson(List<Students> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Students {
  String idEstudiante;
  String nombres;
  String apellidos;
  int cedula;
  String telefono;
  String correoElectronico;
  DateTime createdAt;
  DateTime updatedAt;
  int modulo;
  int salon;

  Students({
    required this.idEstudiante,
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.telefono,
    required this.correoElectronico,
    required this.createdAt,
    required this.updatedAt,
    required this.modulo,
    required this.salon,
  });

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        idEstudiante: json["id_estudiante"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        cedula: json["cedula"],
        telefono: json["telefono"],
        correoElectronico: json["correo_electronico"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        modulo: json["modulo"],
        salon: json["salon"],
      );

  Map<String, dynamic> toJson() => {
        "id_estudiante": idEstudiante,
        "nombres": nombres,
        "apellidos": apellidos,
        "cedula": cedula,
        "telefono": telefono,
        "correo_electronico": correoElectronico,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "modulo": modulo,
        "salon": salon,
      };
}
