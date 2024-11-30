import 'dart:convert';
import 'package:teste_be_talent/app/core/exception/not_found_exceptions.dart';
import 'package:teste_be_talent/app/data/http/http_client_employee.dart';
import 'package:teste_be_talent/app/models/employee_model.dart';
import 'package:teste_be_talent/app/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final HttpClientEmployee client;

  EmployeeRepositoryImpl({required this.client});

  @override
  Future<List<EmployeeModel>> getEmployees() async {
    final response = await client.get(url: 'http://192.168.3.9:3000/employees');

    if (response.statusCode == 200) {
      final List<EmployeeModel> employees = [];
      final body = jsonDecode(response.body);
      print(response.body);

      body.map((item) {
        final EmployeeModel employee = EmployeeModel.fromMap(item);
        employees.add(employee);
      }).toList();

      return employees;
    } else if (response.statusCode == 400) {
      throw NotFoundExceptions('A URL não foi encontrada');
    } else {
      throw NotFoundExceptions('Não foi possível carregar os dados');
    }
  }
}
