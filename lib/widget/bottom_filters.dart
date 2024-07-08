import 'package:flutter/material.dart';

class SingleRowFilter extends StatefulWidget {
  final DateTime startDate;
  final Map<dynamic, double> prices;
  final Function(DateTime) onDateSelected;

  const SingleRowFilter({
    super.key,
    required this.startDate,
    required this.prices,
    required this.onDateSelected,
  });

  @override
  State<SingleRowFilter> createState() => _SingleRowFilterState();
}

class _SingleRowFilterState extends State<SingleRowFilter> {
  int selectedDate = 0;

  List filters = [
    'Non\nStop',
    '6 AM\nto\n11 AM',
    '12 PM\nto\n5 PM',
    '9 PM\nto\n12 AM',
    '9 PM\nto\n12 AM'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                scrollControlDisabledMaxHeightRatio: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Sort By',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close),
                          ),
                        ],
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 4),
                                ],
                                color: Colors.white,
                              ),
                              child: const Text(
                                  "Best - Convenient and Affordable",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff686868))),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              child: Image.asset('assets/sort_icon.png', scale: 3.5),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7610),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 4),
                    itemBuilder: (context, index) =>
                        _buildFilterCard(filters[index], index),
                  ),
                ),
              ),
            ),
            Image.asset('assets/filter_icon.png', scale: 3.5),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterCard(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: selectedDate == index
              ? const Color(0xff666666)
              : const Color(0xFFFFF7F1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selectedDate == index
                  ? Colors.white
                  : const Color(0xFF808991),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
