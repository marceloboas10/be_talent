import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/data/http/http_client_employee_impl.dart';
import 'package:teste_be_talent/app/repositories/employee_repository_impl.dart';
import 'package:teste_be_talent/app/store/employee_store.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/widgets/header.dart';
import 'package:teste_be_talent/app/widgets/search_employees.dart';
import 'package:teste_be_talent/app/widgets/table_employees.dart';
import 'package:teste_be_talent/app/widgets/table_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeStore store = EmployeeStore(
      repository: EmployeeRepositoryImpl(client: HttpClientEmployeeImpl()));

  @override
  void initState() {
    super.initState();
    store.getEmployee();
  }

  void searchEmployee(String value) {
    setState(() {
      store.filterEmployess(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.instance.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              SearchEmployees(
                onChanged: (String? value) {
                  searchEmployee(value!);
                },
              ),
              const TableHeader(),
              TableEmployees(
                store: store,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
