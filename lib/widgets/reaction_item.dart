import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'reactions_list.dart';

class ReactionItem extends StatelessWidget {
  final String reaction;

  final OnReactionTap onReactionTap;

  final bool animate;
  const ReactionItem({
    super.key,
    required this.reaction,
    required this.onReactionTap,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onReactionTap(reaction);
        },
        child: Pulse(
          infinite: false,
          duration: const Duration(milliseconds: 500),
          animate: animate,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2),
            child: Text(
              reaction,
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ));
  }
}
