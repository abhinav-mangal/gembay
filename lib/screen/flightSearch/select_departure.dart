import 'package:flutter/material.dart';
import 'package:gembay/widget/app_bar_2.dart';
import 'package:gembay/widget/search_bar.dart';

class SelectDeparture extends StatelessWidget {
  const SelectDeparture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Select Departure", centre: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchBar(text: 'Arrival city/Departure City'),
              const SizedBox(height: 20),
              const Text(
                'Popular Cities',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Mumbai",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff686868))),
                            Image.asset('assets/orange_arrow.png', scale: 3.5)
                          ]),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
