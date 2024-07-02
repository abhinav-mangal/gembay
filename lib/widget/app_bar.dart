import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.5,
      shadowColor: const Color(0xffFF7610),
      backgroundColor: const Color(0xffFFF7F1),
      toolbarHeight: 90,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      title: const Row(
        children: [
          CircleAvatar(radius: 24),
          SizedBox(width: 10),
          Column(
            children: [
              Text("Welcome Back",
                  style: TextStyle(fontSize: 14, color: Color(0xff6C6C6C))),
              Text("Arfi Ganteng",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffFF7610).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/trophy.png', scale: 3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffFF7610).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/notification.png', scale: 3),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
