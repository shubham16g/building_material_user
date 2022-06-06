import 'package:flutter/material.dart';

class M3AppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions = List.empty(growable: true);

  @override
  final Size preferredSize = const Size.fromHeight(55);

  M3AppBar({
    Key? key,
    required this.title,
    List<Widget>? actions,
    double actionGap = 0,
  }) : super(key: key) {
    if (actions != null) {
      for (int i = 0; i < actions.length; i++) {
        final action = actions[i];
        if (i != 0) {
          this.actions.add(SizedBox(width: actionGap));
        }
        this.actions.add(action);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: title,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  height: 1,
                )),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: actions ?? [],
              ),
            ),
          ),
        ],
      );
}
