import 'package:flutter/material.dart';
import 'package:nexaya/ui/common/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  const PrimaryButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 166,
      decoration: BoxDecoration(
        color: const Color(0xffE71FA3),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              'sign in',
              style: TextStyle(
                fontSize: getResponsiveFontSize(
                  context,
                  fontSize: 24,
                ),
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
