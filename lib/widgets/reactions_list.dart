import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'reaction_item.dart';

typedef OnReactionTap = void Function(String reaction);

class ReactionsList extends StatefulWidget {
  final Alignment alignment;

  final List<String> reactions;

  final OnReactionTap onReactionTap;
  const ReactionsList({
    super.key,
    required this.alignment,
    required this.reactions,
    required this.onReactionTap,
  });

  @override
  State<ReactionsList> createState() => _ReactionsListState();
}

class _ReactionsListState extends State<ReactionsList> {
  int? clickedReactionIndex;

  @override
  Widget build(BuildContext context) {
    final reactions = widget.reactions;
    final alignment = widget.alignment;

    return Align(
      alignment: alignment,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < reactions.length; i++)
                FadeInLeft(
                  from: // first index should be from 0, second from 20, third from 40 and so on
                      0 + (i * 20).toDouble(),
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 200),
                  child: ReactionItem(
                    reaction: reactions[i],
                    animate: clickedReactionIndex == i,
                    onReactionTap: (reaction) {
                      setState(() {
                        clickedReactionIndex = i;
                      });
                      // delay for 200 milliseconds to allow the animation to complete
                      Future.delayed(const Duration(milliseconds: 500))
                          .whenComplete(() {
                        // pop the dialog
                        Navigator.of(context).pop();
                        widget.onReactionTap(reaction);
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
