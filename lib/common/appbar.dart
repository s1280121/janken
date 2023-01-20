import 'package:flutter/material.dart';
import 'package:janken/main.dart';


//共通のAppBar

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final Widget pop;
  final AppBar appBar;

  const CommonAppBar({Key? key, required this.title, required this.appBar, required this.pop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: pop,
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
