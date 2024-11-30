import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/core/exception/not_found_exceptions.dart';
import 'package:teste_be_talent/app/models/employee_model.dart';
import 'package:teste_be_talent/app/repositories/employee_repository.dart';

class EmployeeStore {
  EmployeeStore({required this.repository});

  final EmployeeRepository repository;

  final ValueNotifier<List<EmployeeModel>> listEmployees =
      ValueNotifier<List<EmployeeModel>>([]);

  final ValueNotifier<List<EmployeeModel>> filteredEmployees =
      ValueNotifier<List<EmployeeModel>>([]);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Timer? _timer;

  Future getEmployee() async {
    isLoading.value = true;
    listEmployees.value.clear();

    try {
      final result = await repository.getEmployees();

      listEmployees.value = result;
    } on NotFoundExceptions catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }

  void filterEmployess(String data) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () async {
      String dataLowerCase = data.toLowerCase();
      filteredEmployees.value = listEmployees.value.where((element) {
        String lowerCaseName = element.name.toLowerCase();
        String lowerCaseJob = element.role.toLowerCase();
        return lowerCaseName.contains(dataLowerCase) ||
            lowerCaseJob.contains(dataLowerCase) ||
            element.phone.contains(dataLowerCase);
      }).toList();
    });
  }
}
