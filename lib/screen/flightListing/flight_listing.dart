import 'package:flutter/material.dart';
import 'package:gembay/widget/app_bar_2.dart';
import 'package:gembay/widget/bottom_filters.dart';
import 'package:gembay/widget/separator.dart';
import 'package:gembay/widget/single_row_calendar.dart';

class FlightListingPage extends StatefulWidget {
  const FlightListingPage({super.key});

  @override
  State<FlightListingPage> createState() => _FlightListingPageState();
}

class _FlightListingPageState extends State<FlightListingPage> {
  @override
  Widget build(BuildContext context) {
    final startDate = DateTime(2024, 7, 5);
    final prices = {
      for (var item
          in List.generate(30, (index) => startDate.add(Duration(days: index))))
        item: item.weekday >= 6 ? 6000.0 : 4500.0 + (item.day % 2) * 500
    };
    return Scaffold(
      appBar: CustomAppBar(
        widget: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Mumbai',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                              child: CustomPaint(painter: DashedLinePainter())),
                          Image.asset('assets/card_flight.png', scale: 2.5),
                          Expanded(
                              child: CustomPaint(painter: DashedLinePainter())),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Delhi',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "16 Apr 2024, tue | 1Adult",
                      style: TextStyle(
                        color: Color(0xff6C6C6C),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/edit_icon.png', scale: 3.5),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleRowFilter(
          startDate: startDate,
          prices: prices,
          onDateSelected: (date) {
            debugPrint('Selected date: ${date.toString()}');
          }),
      body: Column(children: [
        const SizedBox(height: 20),
        SingleRowCalendar(
            startDate: startDate,
            prices: prices,
            onDateSelected: (date) {
              debugPrint('Selected date: ${date.toString()}');
            }),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const FlightListingCard();
            },
          ),
        ),
      ]),
    );
  }
}

class FlightListingCard extends StatefulWidget {
  const FlightListingCard({super.key});

  @override
  State<FlightListingCard> createState() => _FlightListingCardState();
}

class _FlightListingCardState extends State<FlightListingCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: AnimatedContainer(
        duration: Durations.medium1,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isExpanded
              ? LinearGradient(
                  colors: [
                    const Color(0xffFF7610).withOpacity(0.2),
                    const Color(0xffFF7610).withOpacity(0.1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
        ),
        child: AnimatedSize(
          clipBehavior: Clip.hardEdge,
          curve: Curves.easeInOut,
          duration: Durations.medium1,
          child: Column(
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/card_flight_2.png', scale: 3.5),
                      const SizedBox(width: 8),
                      const Text('Air India',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  const Text('Upto ₹300 OFF',
                      style: TextStyle(
                          color: Color(0xff00C57E),
                          fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 4),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            '04h 20m',
                            style: TextStyle(
                              color: Color(0xff808991),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '07:00',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'BOM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff808991),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Image.asset('assets/rippler_icon.png',
                                  scale: 3.5),
                              SizedBox(
                                  width: 15,
                                  child: CustomPaint(
                                      painter: DashedLinePainter())),
                              Image.asset('assets/card_flight.png', scale: 3.5),
                              SizedBox(
                                  width: 15,
                                  child: CustomPaint(
                                      painter: DashedLinePainter())),
                              Image.asset('assets/rippler_icon.png',
                                  scale: 3.5),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '09:15',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'DEL',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff808991),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            'Non-Stop',
                            style: TextStyle(
                              color: Color(0xffFF7610),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: isExpanded
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("₹5,300",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xff808991))),
                          const SizedBox(height: 4),
                          const Text("₹5,000",
                              style: TextStyle(
                                  color: Color(0xffFF7610),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          isExpanded
                              ? const SizedBox()
                              : ElevatedButton(
                                  onPressed: () =>
                                      setState(() => isExpanded = !isExpanded),
                                  style: ElevatedButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: const Color(0xff0277F7),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    minimumSize: const Size(100, 30),
                                  ),
                                  child: const Text(
                                    'More Details ↆ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              isExpanded
                  ? Column(
                      children: [
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child:
                                    CustomPaint(painter: DashedLinePainter())),
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chhatrapati Shivaji Maharaj International Airport',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff808991),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Mumbai(BOM)',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    'Economy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808991),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/rippler_icon.png',
                                          scale: 3.5),
                                      SizedBox(
                                          width: 30,
                                          child: CustomPaint(
                                              painter: DashedLinePainter())),
                                      SizedBox(
                                          width: 30,
                                          child: CustomPaint(
                                              painter: DashedLinePainter())),
                                      Image.asset('assets/rippler_icon.png',
                                          scale: 3.5),
                                    ],
                                  ),
                                  const Text(
                                    'Airbus : A321',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808991),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Indira Gandhi Airport',
                                    maxLines: 2,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff808991),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'New Delhi(DEL)',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Flight No: 2518 ',
                              style: TextStyle(
                                color: Color(0xff808991),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => isExpanded = !isExpanded),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFF7610),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
