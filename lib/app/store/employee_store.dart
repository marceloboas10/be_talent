import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/data/exception/not_found_exceptions.dart';
import 'package:teste_be_talent/app/models/employee_model.dart';
import 'package:teste_be_talent/app/repositories/employee_repository.dart';

class EmployeeStore {
  EmployeeStore({required this.repository});

  final EmployeeRepository repository;

  final ValueNotifier<List<EmployeeModel>> state =
      ValueNotifier<List<EmployeeModel>>([]);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getEmployee() async {
    isLoading.value = true;

    try {
      final result = await repository.getEmployees();

      state.value = result;
    } on NotFoundExceptions catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
