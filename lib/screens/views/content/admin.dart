import 'package:flutter/material.dart';
import 'package:mateop_admin/components/app_tile.dart';
import 'package:mateop_admin/constants/colors.dart';
import 'package:mateop_admin/constants/text_style.dart';

class AdminView extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<AdminView> {
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
                  title: 'Provincial',
                  subtitle: '16 Cursos',
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
