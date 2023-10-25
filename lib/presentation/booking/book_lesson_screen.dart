import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:let_tutor/presentation/booking/widgets/time_table.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookLessonScreen extends StatefulWidget {
  static const String routeName = 'book-lesson';
  const BookLessonScreen({super.key});

  @override
  State<BookLessonScreen> createState() => _BookLessonScreenState();
}

class _BookLessonScreenState extends State<BookLessonScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  var calendarKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.bookLessons),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TableCalendar(
              key: calendarKey,
              currentDay: DateTime.now(),
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  // _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                // _focusedDay = focusedDay;
              },
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: TimeTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
