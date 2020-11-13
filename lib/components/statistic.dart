import 'package:flutter/material.dart';
import 'package:mateop_admin/constants/text_style.dart';

class Statistic extends StatelessWidget {
  final String title, value;

  const Statistic({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          this.title,
          textAlign: TextAlign.center,
          style: AppFonts.nunitoSemibold(
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          this.value,
          textAlign: TextAlign.center,
          style: AppFonts.nunitoRegular(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
