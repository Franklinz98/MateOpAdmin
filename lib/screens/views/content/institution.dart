import 'package:flutter/material.dart';
import 'package:mateop_admin/components/app_tile.dart';
import 'package:mateop_admin/components/statistic.dart';
import 'package:mateop_admin/constants/colors.dart';
import 'package:mateop_admin/constants/enums.dart';
import 'package:mateop_admin/constants/text_style.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:provider/provider.dart';

class InstitutionView extends StatefulWidget {
  final List courses;

  const InstitutionView({Key key, @required this.courses}) : super(key: key);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<InstitutionView> {
  StaffProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<StaffProvider>(context, listen: false);
  }

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
                _provider.institution['name'],
                style: AppFonts.nunitoBold(
                  fontSize: 20,
                  color: Color(0xff3d85d7),
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
              Statistic(
                  title: 'Q1:',
                  value: '${(_provider.institution['q1'] * 100).round()}%'),
              Statistic(
                  title: 'Q2:',
                  value: '${(_provider.institution['q2'] * 100).round()}%'),
              Statistic(
                  title: 'Q3:',
                  value: '${(_provider.institution['q3'] * 100).round()}%'),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Statistic(
                  title: 'Promedio:',
                  value: '${(_provider.institution['mean'] * 100).round()}%'),
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
                    color: Color(0xff3d85d7),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Color(0xff3d85d7),
                ),
                onPressed: () {},
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Map course = widget.courses[index];
                return MOTile(
                  title: '${course['gradeText']} ${course['tag']}',
                  subtitle: '${course['grade']}-${course['tag']}',
                  onTap: () {
                    _provider.setCourse(course);
                    _provider.updateScreen(MainRouteContent.teacher);
                  },
                );
              },
              itemCount: widget.courses.length,
            ),
          ),
        ],
      ),
    );
  }
}
