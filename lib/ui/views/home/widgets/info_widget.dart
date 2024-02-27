import 'package:flutter/material.dart';
import 'package:nexaya/ui/common/ui_helpers.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String data;
  const InfoWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(
              context,
              fontSize: 34,
            ),
            fontWeight: FontWeight.w400,
            color: const Color(0xffECECEC),
          ),
        ),
        Text(
          data,
          style: TextStyle(
            fontSize: getResponsiveFontSize(
              context,
              fontSize: 36,
            ),
            fontWeight: FontWeight.w400,
            color: const Color(0xffB8A8B7),
          ),
        ),
      ],
    );
  }
}
