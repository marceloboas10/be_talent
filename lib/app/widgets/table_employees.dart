import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/core/domain/formatter_string_value.dart';
import 'package:teste_be_talent/app/data/http/http_client_employee_impl.dart';
import 'package:teste_be_talent/app/repositories/employee_repository_impl.dart';
import 'package:teste_be_talent/app/store/employee_store.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';
import 'package:teste_be_talent/app/widgets/table_row_widget.dart';

class TableEmployees extends StatefulWidget {
  const TableEmployees({super.key});

  @override
  State<TableEmployees> createState() => _TableEmployeesState();
}

class _TableEmployeesState extends State<TableEmployees> {
  final EmployeeStore store = EmployeeStore(
      repository: EmployeeRepositoryImpl(client: HttpClientEmployeeImpl()));

  final FormatterStringValue formatterString = FormatterStringValue();

  @override
  void initState() {
    super.initState();
    store.getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([store.isLoading, store.error, store.state]),
      builder: (context, index) {
        if (store.isLoading.value) {
          return const Center(
              heightFactor: 5, child: CircularProgressIndicator());
        } else if (store.error.value.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              heightFactor: 5,
              child: Text(store.error.value),
            ),
          );
        } else if (store.state.value.isEmpty) {
          return const Center(
            heightFactor: 5,
            child: Text("nenhum item na lista!"),
          );
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: ColorsApp.instance.gray10)),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: store.state.value.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        collapsedIconColor: ColorsApp.instance.bluePrimary,
                        backgroundColor: ColorsApp.instance.white,
                        title: Text(
                          store.state.value[index].name,
                          style: TextStyles.instance.healding3,
                        ),
                        leading: ClipOval(
                          child: Image.network(
                            store.state.value[index].image,
                            height: 34,
                            width: 34,
                            fit: BoxFit.cover,
                          ),
                        ),
                        children: [
                          Column(
                            children: [
                              TableRowWidget(
                                  title: 'Cargo',
                                  value: store.state.value[index].role),
                              TableRowWidget(
                                  title: 'Data de admissão',
                                  value: formatterString.formatDate(
                                      store.state.value[index].admissionDate)),
                              TableRowWidget(
                                  title: 'Telefone',
                                  value: formatterString.formatPhoneNumber(
                                      store.state.value[index].phone)),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
