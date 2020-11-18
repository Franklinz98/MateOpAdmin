import 'package:flutter/material.dart';
import 'package:mateop_admin/components/app_tile.dart';
import 'package:mateop_admin/components/statistic.dart';
import 'package:mateop_admin/constants/colors.dart';
import 'package:mateop_admin/constants/enums.dart';
import 'package:mateop_admin/constants/text_style.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:provider/provider.dart';

class CourseView extends StatefulWidget {
  final List students;

  const CourseView({Key key, @required this.students}) : super(key: key);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<CourseView> {
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
                '${_provider.course['gradeText']} ${_provider.course['tag']}',
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
                  value: '${(_provider.course['q1'] * 100).round()}%'),
              Statistic(
                  title: 'Q2:',
                  value: '${(_provider.course['q2'] * 100).round()}%'),
              Statistic(
                  title: 'Q3:',
                  value: '${(_provider.course['q3'] * 100).round()}%'),
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
                  value: '${(_provider.course['mean'] * 100).round()}%'),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Estudiantes",
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
                Map student = widget.students[index];
                return MOTile(
                  title: '${student['name']}',
                  subtitle: '${student['age']} años',
                  onTap: () {
                    _provider.setCourse(student);
                    _provider.updateScreen(MainRouteContent.teacher);
                  },
                );
              },
              itemCount: widget.students.length,
            ),
          ),
        ],
      ),
    );
  }
}
