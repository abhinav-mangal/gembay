import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleRowCalendar extends StatefulWidget {
  final DateTime startDate;
  final Map<dynamic, double> prices;
  final Function(DateTime) onDateSelected;

  const SingleRowCalendar({
    super.key,
    required this.startDate,
    required this.prices,
    required this.onDateSelected,
  });

  @override
  State<SingleRowCalendar> createState() => _SingleRowCalendarState();
}

class _SingleRowCalendarState extends State<SingleRowCalendar> {
  late ScrollController _scrollController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _selectedDate = widget.startDate;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xffF4F9FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCalendarIcon(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 30, // Display up to 30 days
                itemBuilder: (context, index) =>
                    _buildDateCard(widget.startDate.add(Duration(days: index))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarIcon() {
    return Container(
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: const Icon(Icons.calendar_month, color: Colors.white, size: 30),
    );
  }

  Widget _buildDateCard(DateTime date) {
    final isSelected = _selectedDate != null && isSameDay(_selectedDate!, date);
    final isWeekend = date.weekday >= 6;
    final price = widget.prices[date] ?? 0.0;
    final priceColor = isWeekend ? Colors.orange : Colors.black;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = date;
        });
        widget.onDateSelected(date);
      },
      child: Container(
        width: 75,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day} ${DateFormat('E').format(date)}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '₹${price.toStringAsFixed(0)}',
              style: TextStyle(
                color: isSelected ? Colors.white : priceColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isWeekend && !isSelected)
              const Icon(Icons.arrow_upward, color: Colors.orange, size: 12),
          ],
        ),
      ),
    );
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
