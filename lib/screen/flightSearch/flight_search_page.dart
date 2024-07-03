import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gembay/screen/flightSearch/select_departure.dart';
import 'package:gembay/widget/app_bar_2.dart';
import 'package:gembay/widget/calendar.dart';
import 'package:gembay/widget/custom_button.dart';
import 'package:gembay/widget/separator.dart';
import 'package:gembay/widget/travel_selector.dart';

class FlightBookingPage extends StatefulWidget {
  const FlightBookingPage({super.key});

  @override
  State<FlightBookingPage> createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool checkValue = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Flights"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffFF7610).withOpacity(0.1)),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                onTap: (value) => setState(() {}),
                tabs: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffFF7610)),
                        color: _tabController.index == 0
                            ? const Color(0xffFF7610)
                            : Colors.transparent),
                    child: Center(
                        child: Text(
                      "One Way",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: _tabController.index == 0
                              ? Colors.white
                              : Colors.black),
                    )),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffFF7610)),
                        color: _tabController.index == 1
                            ? const Color(0xffFF7610)
                            : Colors.transparent),
                    child: Center(
                        child: Text(
                      "Round Trip",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: _tabController.index == 1
                              ? Colors.white
                              : Colors.black),
                    )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildOneWayForm(),
                _buildRoundTripForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOneWayForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildLocationField('From', 'Delhi DEL', isTakeOff: true),
                const SizedBox(height: 16.0),
                _buildLocationField('To', 'Surat STV'),
                const SizedBox(height: 16.0),
                _buildDateField('Departure Date', '09 May Mon, 2023'),
                const SizedBox(height: 16.0),
                _buildTravelersField(
                    'Travelers & Cabin Class', '1 Adult Economy'),
                const SizedBox(height: 16.0),
                _buildNonStopCheckbox(),
                const SizedBox(height: 16.0),
                _buildSpecialFaresSection(),
                const SizedBox(height: 16.0),
                const CustomButton(text: 'Search'),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          Image.asset('assets/banner_flight.png', scale: 3.5),
          const SizedBox(height: 16.0),
          const Column(children: [
            FlightTicketCard(),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: OfferForYouContainer(),
            ),
          ])
        ],
      ),
    );
  }

  Widget _buildRoundTripForm() {
    // Implement round trip form if needed
    return const Center(child: Text('Round Trip Form'));
  }

  Widget _buildLocationField(String label, String value,
      {bool isTakeOff = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        TextFormField(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SelectDeparture())),
          readOnly: true,
          initialValue: value,
          decoration: InputDecoration(
            prefixIcon: Icon(
                isTakeOff
                    ? Icons.flight_takeoff_outlined
                    : Icons.flight_land_outlined,
                color: const Color(0xffFF7610)),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        TextFormField(
          onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              scrollControlDisabledMaxHeightRatio: 0.5,
              builder: (BuildContext context) => const CalendarBottomSheet()),
          readOnly: true,
          initialValue: value,
          decoration: const InputDecoration(
            prefixIcon:
                Icon(Icons.calendar_month_outlined, color: Color(0xffFF7610)),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildTravelersField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        TextFormField(
          onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              scrollControlDisabledMaxHeightRatio: 0.5,
              builder: (BuildContext context) => const TravelerClassSelector()),
          readOnly: true,
          initialValue: value,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xffFF7610)),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildNonStopCheckbox() {
    return Row(
      children: [
        Checkbox(
            value: checkValue,
            onChanged: (bool? value) {
              setState(() {
                checkValue = value!;
              });
            }),
        const Text('Non-Stop Flights Only',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSpecialFaresSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Special Fares',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            Text(
              '(Unselect if not applicable)',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryCard(
              image: "assets/defense_icon.png",
              title: 'Defense',
              subtitle: 'Id Required',
              color: Color(0xffFF7610),
            ),
            CategoryCard(
              image: "assets/student_icon.png",
              title: 'Student',
              subtitle: 'Id required',
              color: Color(0xffFF7610),
            ),
            CategoryCard(
              image: "assets/senior_icon.png",
              title: 'Senior Citizen',
              subtitle: 'Age above\n60 year',
              color: Color(0xff0277F7),
            ),
          ],
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color color;

  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 120,
          color: Colors.transparent,
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border.all(color: color),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.3),
              //     spreadRadius: 2,
              //     blurRadius: 5,
              //     offset: const Offset(0, 3),
              //   ),
              // ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -8,
          left: 20,
          child: Image.asset(image, scale: 3.5),
        ),
      ],
    );
  }
}

class FlightTicketCard extends StatelessWidget {
  const FlightTicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text("From/To"),
              SizedBox(width: 8),
              Text("Mumbai",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
              Icon(Icons.arrow_drop_down_outlined),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mumbai',
                            style: TextStyle(
                              color: Color(0xff808991),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Hyderabad',
                            style: TextStyle(
                              color: Color(0xff808991),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'BOM',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 12),
                          Image.asset('assets/rippler_icon.png', scale: 2.5),
                          Expanded(
                              child: CustomPaint(painter: DashedLinePainter())),
                          Image.asset('assets/card_flight.png', scale: 2.5),
                          Expanded(
                              child: CustomPaint(painter: DashedLinePainter())),
                          Image.asset('assets/rippler_icon.png', scale: 2.5),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'HYD',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(children: [
                          Expanded(
                              child: CustomPaint(painter: DashedLinePainter())),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/card_flight_2.png', scale: 2),
                              const SizedBox(width: 8),
                              const Text('Air India',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const Spacer(),
                          const Text('Apr 14, Sun',
                              style: TextStyle(
                                  color: Color(0xff808991),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 104,
              child: Image.asset('assets/flight_search_card_layer.png',
                  scale: 3.5),
            ),
          ],
        ),
      ],
    );
  }
}

class OfferForYouContainer extends StatelessWidget {
  const OfferForYouContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Offers For You",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Row(
              children: [
                Text("See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff0277F7))),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 12),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        CarouselSlider.builder(
            itemCount: 4,
            options: CarouselOptions(
              height: 160,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
            ),
            itemBuilder: (context, index, pageViewIndex) => const FlightCard()),
      ],
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/flight_container.png', scale: 8),
          ),
          const SizedBox(width: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flights',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF7610),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Get Flat 25% OFF on\nHotels & Homestays.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,
                          size: 16, color: Color(0xffFF7610)),
                      SizedBox(width: 4),
                      Text(
                        'Valid till 4th Apr’24',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(height: 16),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       '\$4580',
          //       style: TextStyle(
          //         color: Colors.grey,
          //         decoration: TextDecoration.lineThrough,
          //       ),
          //     ),
          //     Text(
          //       '\$2145',
          //       style: TextStyle(
          //         color: Colors.orange,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16,
          //       ),
          //     ),
          //     Text(
          //       'per night',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
