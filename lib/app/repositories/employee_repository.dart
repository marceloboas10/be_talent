import 'package:teste_be_talent/app/models/employee_model.dart';

abstract class EmployeeRepository {
Future<List<EmployeeModel>> getEmployees();
}