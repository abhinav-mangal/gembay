import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String text;
  const CustomSearchBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: text,
      hintStyle: const MaterialStatePropertyAll(
          TextStyle(color: Color(0xff686868), fontWeight: FontWeight.w400)),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Image.asset('assets/search.png', scale: 3.5),
      ),
      elevation: const MaterialStatePropertyAll(2.5),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
