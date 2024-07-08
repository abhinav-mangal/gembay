import 'package:flutter/material.dart';
import 'package:gembay/screen/flightListing/flight_listing.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const FlightListingPage())),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const StadiumBorder(),
      ),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )))),
        ],
      ),
    );
  }
}
