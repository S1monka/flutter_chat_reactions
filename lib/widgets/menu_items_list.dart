import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_reactions/model/menu_item.dart';

typedef OnContextMenuTap = void Function(MenuItem menuItem);

class MenuItemsList extends StatefulWidget {
  final Alignment alignment;
  final double menuItemsWidth;

  final List<MenuItem> menuItems;

  final OnContextMenuTap onContextMenuTap;
  const MenuItemsList({
    super.key,
    required this.alignment,
    required this.menuItemsWidth,
    required this.menuItems,
    required this.onContextMenuTap,
  });

  @override
  State<MenuItemsList> createState() => _MenuItemsListState();
}

class _MenuItemsListState extends State<MenuItemsList> {
  int? clickedContextMenuIndex;

  @override
  Widget build(BuildContext context) {
    final menuItems = widget.menuItems;
    final alignment = widget.alignment;
    final menuItemsWidth = widget.menuItemsWidth;

    return Align(
      alignment: alignment,
      child: // contextMenu for reply, copy, delete
          Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * menuItemsWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < menuItems.length; i++)
                Column(
                  children: [
                    _MenuItemWidget(
                      onContextMenuTap: (menuItem) {
                        // set the clicked index for animation
                        setState(() {
                          clickedContextMenuIndex = i;
                        });

                        // delay for 200 milliseconds to allow the animation to complete
                        Future.delayed(const Duration(milliseconds: 500))
                            .whenComplete(() {
                          // pop the dialog
                          Navigator.of(context).pop();
                          widget.onContextMenuTap(menuItem);
                        });
                      },
                      item: menuItems[i],
                      animate: clickedContextMenuIndex == i,
                    ),
                    if (i == menuItems.length - 1)
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        height: 0,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItemWidget extends StatelessWidget {
  final OnContextMenuTap onContextMenuTap;
  final MenuItem item;

  final bool animate;
  const _MenuItemWidget({
    super.key,
    required this.onContextMenuTap,
    required this.item,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: InkWell(
        onTap: () {
          onContextMenuTap(item);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.label,
              style: TextStyle(
                color: item.isDestuctive
                    ? Colors.red
                    : Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            Pulse(
              infinite: false,
              duration: const Duration(milliseconds: 500),
              animate: animate,
              child: Icon(
                item.icon,
                color: item.isDestuctive
                    ? Colors.red
                    : Theme.of(context).textTheme.bodyMedium!.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
