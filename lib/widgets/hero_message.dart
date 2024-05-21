import 'package:flutter/material.dart';

class HeroMessage extends StatelessWidget {
  final Alignment alignment;
  final String id;
  final Widget messageWidget;
  const HeroMessage({
    super.key,
    required this.alignment,
    required this.id,
    required this.messageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Hero(
        tag: id,
        child: messageWidget,
      ),
    );
  }
}
