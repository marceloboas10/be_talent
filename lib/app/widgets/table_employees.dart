import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/core/domain/formatter_string_value.dart';
import 'package:teste_be_talent/app/store/employee_store.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';
import 'package:teste_be_talent/app/widgets/table_row_widget.dart';

class TableEmployees extends StatefulWidget {
 const TableEmployees({super.key, required this.store});

  final EmployeeStore store;

  @override
  State<TableEmployees> createState() => _TableEmployeesState();
}

class _TableEmployeesState extends State<TableEmployees> {
  final FormatterStringValue formatterString = FormatterStringValue();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: Listenable.merge([
            widget.store.isLoading,
            widget.store.error,
            widget.store.listEmployees,
            widget.store.filteredEmployees
          ]),
          builder: (context, index) {
            if (widget.store.isLoading.value) {
              return const Center(
                  heightFactor: 5, child: CircularProgressIndicator());
            } else if (widget.store.error.value.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  heightFactor: 5,
                  child: Text(widget.store.error.value),
                ),
              );
            } else if (widget.store.listEmployees.value.isEmpty) {
              return const Center(
                heightFactor: 5,
                child: Text("nenhum item na lista!"),
              );
            } else if (widget.store.filteredEmployees.value.isNotEmpty) {
              return AnimatedBuilder(
                  animation: widget.store.filteredEmployees,
                  builder: (contex, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: ColorsApp.instance.gray10)),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: widget.store.filteredEmployees.value.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            collapsedIconColor: ColorsApp.instance.bluePrimary,
                            backgroundColor: ColorsApp.instance.white,
                            title: Text(
                              widget.store.filteredEmployees.value[index].name,
                              style: TextStyles.instance.healding3,
                            ),
                            leading: ClipOval(
                              child: Image.network(
                                widget
                                    .store.filteredEmployees.value[index].image,
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
                                      value: widget.store.filteredEmployees
                                          .value[index].role),
                                  TableRowWidget(
                                      title: 'Data de admissão',
                                      value: formatterString.formatDate(widget
                                          .store
                                          .filteredEmployees
                                          .value[index]
                                          .admissionDate)),
                                  TableRowWidget(
                                      title: 'Telefone',
                                      value: formatterString.formatPhoneNumber(
                                          widget.store.filteredEmployees
                                              .value[index].phone)),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  });
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
                        itemCount: widget.store.listEmployees.value.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            collapsedIconColor: ColorsApp.instance.bluePrimary,
                            backgroundColor: ColorsApp.instance.white,
                            title: Text(
                              widget.store.listEmployees.value[index].name,
                              style: TextStyles.instance.healding3,
                            ),
                            leading: ClipOval(
                              child: Image.network(
                                widget.store.listEmployees.value[index].image,
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
                                      value: widget.store.listEmployees
                                          .value[index].role),
                                  TableRowWidget(
                                      title: 'Data de admissão',
                                      value: formatterString.formatDate(widget
                                          .store
                                          .listEmployees
                                          .value[index]
                                          .admissionDate)),
                                  TableRowWidget(
                                      title: 'Telefone',
                                      value: formatterString.formatPhoneNumber(
                                          widget.store.listEmployees
                                              .value[index].phone)),
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
        ),
      ],
    );
  }
}
