import 'package:flutter/material.dart';

class TravelerClassSelector extends StatefulWidget {
  const TravelerClassSelector({super.key});

  @override
  State<TravelerClassSelector> createState() => _TravelerClassSelectorState();
}

class _TravelerClassSelectorState extends State<TravelerClassSelector> {
  int adults = 1;
  int children = 0;
  int infants = 0;
  String selectedClass = 'Economy';

  Widget _buildTravelerType(String label, String subLabel, int value,
      VoidCallback onDecrement, VoidCallback onIncrement) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(" $subLabel",
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFF7610)),
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ]),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _buildIconButton(onDecrement),
              const SizedBox(width: 16),
              Text('$value', style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 16),
              _buildIconButton(onIncrement, isIncrement: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(VoidCallback onPressed, {bool isIncrement = false}) {
    return InkWell(
      onTap: onPressed,
      child: isIncrement
          ? Image.asset('assets/plus_button.png', scale: 4)
          : const Text('-',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildClassOption(String className) {
    return RadioListTile<String>(
      title: Text(className),
      value: className,
      groupValue: selectedClass,
      onChanged: (String? value) {
        setState(() {
          selectedClass = value!;
        });
      },
      activeColor: const Color(0xFFFF7610),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Select Travelers & Class',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context)),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Travelers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildTravelerType(
                    'Adult',
                    '12+ year',
                    adults,
                    () => setState(() => adults = adults > 1 ? adults - 1 : 1),
                    () => setState(() => adults++)),
                const SizedBox(height: 8),
                _buildTravelerType(
                    'Children',
                    '2-12 year',
                    children,
                    () => setState(
                        () => children = children > 0 ? children - 1 : 0),
                    () => setState(() => children++)),
                const SizedBox(height: 8),
                _buildTravelerType(
                    'Infants',
                    '0-2 year',
                    infants,
                    () =>
                        setState(() => infants = infants > 0 ? infants - 1 : 0),
                    () => setState(() => infants++)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Class',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _buildClassOption('Economy'),
                _buildClassOption('Premium Economy'),
                _buildClassOption('Business'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7610),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}
