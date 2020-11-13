import 'package:flutter/material.dart';
import 'package:mateop_admin/components/app_tile.dart';
import 'package:mateop_admin/components/statistic.dart';
import 'package:mateop_admin/constants/colors.dart';
import 'package:mateop_admin/constants/text_style.dart';

class InstitutionView extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<InstitutionView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "Nombre de la institución",
                style: AppFonts.nunitoBold(
                  fontSize: 20,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.person_outline),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Statistic(title: 'Q1:', value: '#%'),
              Statistic(title: 'Q2:', value: '#%'),
              Statistic(title: 'Q3:', value: '#%'),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Statistic(title: 'Promedio:', value: '#%'),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Cursos",
                  style: AppFonts.nunitoBold(
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                ),
                onPressed: () {},
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                MOTile(
                  title: 'Cuarto A',
                  subtitle: '32 Estudiantes',
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
