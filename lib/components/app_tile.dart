import 'package:flutter/material.dart';
import 'package:mateop_admin/constants/text_style.dart';

class MOTile extends StatelessWidget {
  final String title, subtitle;
  final Function onTap, onLongPress;

  const MOTile({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff202020),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 3.00),
              color: Colors.black.withOpacity(0.16),
              blurRadius: 6,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            this.title,
            style: AppFonts.nunitoBold(
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            this.subtitle,
            style: AppFonts.nunitoRegular(
              fontSize: 16,
            ),
          ),
          onTap: this.onTap,
          onLongPress: this.onLongPress,
        ),
      ),
    );
  }
}
