import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:feme/providers/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.getStudents();
  }

  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feme",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (apiProvider.estudiantes.isNotEmpty) {
            return StudentsList(apiProvider: apiProvider);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class StudentsList extends StatelessWidget {
  const StudentsList({super.key, required this.apiProvider});
  final ApiProvider apiProvider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: apiProvider.estudiantes.length,
      itemBuilder: (context, index) {
        final student = apiProvider.estudiantes[index];
        return GestureDetector(
          onTap: () {
            context.go('/profile');
          },
          child: Card(
            child: Text(student.idEstudiante),
          ),
        );
      },
    );
  }
}

extension Navigation on BuildContext {
  void go(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }
}
