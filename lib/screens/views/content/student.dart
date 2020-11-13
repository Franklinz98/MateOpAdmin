import 'package:flutter/material.dart';
import 'package:mateop_admin/constants/text_style.dart';

class StudentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Detalles de Estudiante",
            textAlign: TextAlign.center,
            style: AppFonts.nunitoBold(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Nombre del Estudiante",
            textAlign: TextAlign.center,
            style: AppFonts.nunitoRegular(
              fontSize: 17,
            ),
          ),
          Text(
            "Nombre",
            textAlign: TextAlign.center,
            style: AppFonts.nunitoBold(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "user@example.com",
            textAlign: TextAlign.center,
            style: AppFonts.nunitoRegular(
              fontSize: 17,
            ),
          ),
          Text(
            "Correo electrónico",
            textAlign: TextAlign.center,
            style: AppFonts.nunitoBold(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "8 Años",
                      style: AppFonts.nunitoRegular(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Edad",
                      style: AppFonts.nunitoBold(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Cuarto A",
                      style: AppFonts.nunitoRegular(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Curso",
                      style: AppFonts.nunitoBold(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: DataTable(
              sortAscending: true,
              sortColumnIndex: 0,
              columnSpacing: 16,
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    '#',
                    style: AppFonts.nunitoBold(
                      fontSize: 18,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'O.A.',
                    style: AppFonts.nunitoBold(
                      fontSize: 18,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Dificultad',
                    style: AppFonts.nunitoBold(
                      fontSize: 18,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Tiempo',
                    style: AppFonts.nunitoBold(
                      fontSize: 18,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Resultado',
                    style: AppFonts.nunitoBold(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text(
                        '1',
                        style: AppFonts.nunitoRegular(
                          fontSize: 16,
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        '0',
                        style: AppFonts.nunitoRegular(
                          fontSize: 16,
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        'Fácil',
                        style: AppFonts.nunitoRegular(
                          fontSize: 16,
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        '16',
                        style: AppFonts.nunitoRegular(
                          fontSize: 16,
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        'Correcto',
                        style: AppFonts.nunitoRegular(
                          fontSize: 16,
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
