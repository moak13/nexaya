import 'package:flutter/material.dart';

class OverlayLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const OverlayLoader({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [child];

    if (isLoading) {
      children.add(const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ));
    }
    return Stack(
      children: children,
    );
  }
}
