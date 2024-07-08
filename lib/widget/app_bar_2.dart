import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? widget;
  final bool centre;
  const CustomAppBar(
      {super.key, this.title, this.centre = true, this.widget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.5,
      shadowColor: const Color(0xffFF7610),
      backgroundColor: const Color(0xffFFF7F1),
      toolbarHeight: 90,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      title: widget ??
          (centre
              ? Row(
                  children: [
                    const SizedBox(width: 75),
                    const Icon(Icons.flight_takeoff_outlined,
                        color: Color(0xffFF7610)),
                    const SizedBox(width: 10),
                    Text(title!, style: const TextStyle(color: Colors.black)),
                  ],
                )
              : Text(title!, style: const TextStyle(color: Colors.black))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
