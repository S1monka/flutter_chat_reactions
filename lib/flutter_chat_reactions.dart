library flutter_chat_reactions;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat_reactions/model/menu_item.dart';
import 'package:flutter_chat_reactions/utilities/default_data.dart';
import 'package:flutter_chat_reactions/widgets/hero_message.dart';
import 'package:flutter_chat_reactions/widgets/menu_items_list.dart';
import 'package:flutter_chat_reactions/widgets/reactions_list.dart';

class ReactionsDialogWidget extends StatelessWidget {
  const ReactionsDialogWidget({
    super.key,
    required this.id,
    required this.messageWidget,
    required this.onReactionTap,
    required this.onContextMenuTap,
    this.menuItems = DefaultData.menuItems,
    this.reactions = DefaultData.reactions,
    this.widgetAlignment = Alignment.centerRight,
    this.menuItemsWidth = 0.45,
  });

  // Id for the hero widget
  final String id;

  // The message widget to be displayed in the dialog
  final Widget messageWidget;

  // The callback function to be called when a reaction is tapped
  final Function(String) onReactionTap;

  // The callback function to be called when a context menu item is tapped
  final Function(MenuItem) onContextMenuTap;

  // The list of menu items to be displayed in the context menu
  final List<MenuItem> menuItems;

  // The list of reactions to be displayed
  final List<String> reactions;

  // The alignment of the widget
  final Alignment widgetAlignment;

  // The width of the menu items
  final double menuItemsWidth;

  // state variables for activating the animation
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // reactions
            ReactionsList(
              alignment: widgetAlignment,
              reactions: reactions,
              onReactionTap: onReactionTap,
            ),
            const SizedBox(
              height: 10,
            ),
            // message
            HeroMessage(
              alignment: widgetAlignment,
              id: id,
              messageWidget: messageWidget,
            ),
            const SizedBox(
              height: 10,
            ),
            // context menu
            MenuItemsList(
              alignment: widgetAlignment,
              menuItemsWidth: menuItemsWidth,
              menuItems: menuItems,
              onContextMenuTap: onContextMenuTap,
            ),
          ],
        ),
      ),
    );
  }
}
