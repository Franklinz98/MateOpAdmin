import 'package:flutter/material.dart';
import 'package:mateop_admin/components/app_tile.dart';
import 'package:mateop_admin/constants/colors.dart';
import 'package:mateop_admin/constants/enums.dart';
import 'package:mateop_admin/constants/text_style.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:provider/provider.dart';

class AdminView extends StatefulWidget {
  final List institutions;

  const AdminView({Key key, @required this.institutions}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<AdminView> {
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
                "Admin",
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
            children: [
              Expanded(
                child: Text(
                  "Instituciones",
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
                Map institution = widget.institutions[index];
                return MOTile(
                  title: institution['name'],
                  subtitle: '${institution['courses']} Cursos',
                  onTap: () {
                    _provider.setInstitution(institution);
                    _provider.updateScreen(MainRouteContent.deputy);
                  },
                );
              },
              itemCount: widget.institutions.length,
            ),
          ),
        ],
      ),
    );
  }
}
