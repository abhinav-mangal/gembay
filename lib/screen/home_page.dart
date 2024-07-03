import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gembay/screen/flightSearch/flight_search_page.dart';
import 'package:gembay/widget/app_bar.dart';
import 'package:gembay/widget/custom_button.dart';
import 'package:gembay/widget/search_bar.dart';
import 'package:gembay/widget/separator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomSearchBar(text: 'Search'),
              const SizedBox(height: 20),
              CategoryRow(),
              const SizedBox(height: 20),
              Image.asset('assets/banner_1.png'),
              const SizedBox(height: 20),
              Image.asset('assets/banner_2.png'),
              const SizedBox(height: 20),
              const RecentContainer(),
              const CustomButton(text: 'Book Now'),
              const SizedBox(height: 20),
              const HotelsInLocationContainer(),
              const SizedBox(height: 20),
              const OfferForYouContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class RecentContainer extends StatelessWidget {
  const RecentContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recent Search",
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
        CarouselSlider(
          items: const [
            BusTicketCard(),
            CabTicketCard(),
            FlightTicketCard(),
          ],
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            aspectRatio: 1.4,
          ),
        ),
      ],
    );
  }
}

class HotelsInLocationContainer extends StatelessWidget {
  const HotelsInLocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hotels in Delhi",
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
        CarouselSlider.builder(
            itemCount: 4,
            options: CarouselOptions(
              height: 375,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
            ),
            itemBuilder: (context, index, pageViewIndex) => const HotelCard()),
      ],
    );
  }
}

class OfferForYouContainer extends StatefulWidget {
  const OfferForYouContainer({super.key});

  @override
  State<OfferForYouContainer> createState() => _OfferForYouContainerState();
}

class _OfferForYouContainerState extends State<OfferForYouContainer> {
  List textButtonList = ['Flights', 'Hotels', 'Cab', 'Bus'];
  int isSelectedIndex = 0;

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffFF7610).withOpacity(0.1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => textButton(
                      index,
                      textButtonList[index],
                    )),
          ),
        ),
        CarouselSlider.builder(
            itemCount: 4,
            options: CarouselOptions(
              height: 385,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
            ),
            itemBuilder: (context, index, pageViewIndex) => const FlightCard()),
      ],
    );
  }

  textButton(index, text) {
    return Expanded(
      child: Padding(
        padding: index == 3
            ? EdgeInsets.zero
            : EdgeInsets.only(right: index == 4 ? 0 : 8),
        child: InkWell(
          onTap: () {
            setState(() {
              isSelectedIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffFF7610)),
              color: isSelectedIndex == index
                  ? const Color(0xffFF7610)
                  : Colors.transparent,
            ),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                color: isSelectedIndex == index ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/hotel_image.png'),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF7610),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: const Text(
                    '15% off',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lavanya Hotel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Delhi',
                        style: TextStyle(
                          color: Color(0xff6C6C6C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star_outline_outlined, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '5.0',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '(32 Reviews)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$4580',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$2145',
                    style: TextStyle(
                      color: Color(0xffFF7610),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'per night',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              )
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/flight_container.png'),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hotels',
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
                      Icon(Icons.calendar_month, size: 16),
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

class BusTicketCard extends StatelessWidget {
  const BusTicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            '2h 15m',
                            style: TextStyle(
                              color: Color(0xff808991),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '20 Stops',
                            style: TextStyle(
                              color: Color(0xffFF7610),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff00C57E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Extra ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '₹100 OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ac Sleeper Multiaxie volvo AC',
                    style: TextStyle(
                      color: Color(0xff0277F7),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delhi',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('07:00PM',
                              style: TextStyle(color: Color(0xff808991))),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Image.asset('assets/rippler_icon.png', scale: 2.5),
                      Expanded(
                          child: CustomPaint(painter: DashedLinePainter())),
                      Image.asset('assets/bus_2.png', scale: 2.5),
                      Expanded(
                          child: CustomPaint(painter: DashedLinePainter())),
                      Image.asset('assets/rippler_icon.png', scale: 2.5),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Surat',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('09:15PM',
                              style: TextStyle(color: Color(0xff808991))),
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
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/card_bus.png', scale: 2),
                          const SizedBox(width: 8),
                          const Text('Shrinath Travel Agency',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹1245',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(' per traveller',
                              style: TextStyle(
                                  color: Color(0xff808991),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 28,
          child: Image.asset('assets/floating_card_label.png', scale: 3.5),
        ),
      ],
    );
  }
}

class CabTicketCard extends StatelessWidget {
  const CabTicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            '2h 15m',
                            style: TextStyle(
                              color: Color(0xff808991),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Non-Stop',
                            style: TextStyle(
                              color: Color(0xffFF7610),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff00C57E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Extra ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '₹100 OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '4 Seats : AC',
                    style: TextStyle(
                      color: Color(0xff0277F7),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delhi',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('07:00PM',
                              style: TextStyle(color: Color(0xff808991))),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Image.asset('assets/rippler_icon.png', scale: 2.5),
                      Expanded(
                          child: CustomPaint(painter: DashedLinePainter())),
                      Image.asset('assets/card_cab.png', scale: 2.5),
                      Expanded(
                          child: CustomPaint(painter: DashedLinePainter())),
                      Image.asset('assets/rippler_icon.png', scale: 2.5),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Surat',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('09:15PM',
                              style: TextStyle(color: Color(0xff808991))),
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
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/card_cab_2.png', scale: 2),
                          const SizedBox(width: 8),
                          const Text('Sedan \nSimilar Model',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹1145',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text('+320(Other Charges)',
                              style: TextStyle(
                                  color: Color(0xff808991),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 28,
          child: Image.asset('assets/floating_card_label_2.png', scale: 3.5),
        ),
      ],
    );
  }
}

class FlightTicketCard extends StatelessWidget {
  const FlightTicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            '2h 15m',
                            style: TextStyle(
                              color: Color(0xff808991),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Non-Stop',
                            style: TextStyle(
                              color: Color(0xffFF7610),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff00C57E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Upto ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '₹500 OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New York',
                        style: TextStyle(
                          color: Color(0xff808991),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Da Nang',
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delhi',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('07:00PM',
                              style: TextStyle(color: Color(0xff808991))),
                        ],
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
                            'Surat',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('09:15PM',
                              style: TextStyle(color: Color(0xff808991))),
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
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/card_flight_2.png', scale: 2),
                          const SizedBox(width: 8),
                          const Text('Air India',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹1245',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text('per traveler',
                              style: TextStyle(
                                  color: Color(0xff808991),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 28,
          child: Image.asset('assets/floating_card_label_3.png', scale: 3.5),
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  CategoryRow({super.key});

  final List assetList = [
    'assets/flight.png',
    'assets/hotels.png',
    'assets/car.png',
    'assets/bus.png',
  ];

  final List nameList = ['Flight', 'Hotels', 'Car', 'Bus'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        4,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FlightBookingPage(),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFFF7F1),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffFF7610).withOpacity(0.15),
                        blurRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ]),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                        height: 60,
                        child: Image.asset(assetList[index], scale: 4)),
                    const SizedBox(height: 20),
                    Text(nameList[index],
                        style: const TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
