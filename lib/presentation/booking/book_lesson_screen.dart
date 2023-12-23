import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:let_tutor/domain/usecases/tutor_schedule/get_schedule_of_tutor.dart';
import 'package:let_tutor/presentation/booking/bloc/booking_bloc.dart';
import 'package:let_tutor/presentation/booking/widgets/time_table.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookLessonScreen extends StatefulWidget {
  static const String routeName = 'book-lesson';
  final String tutorId;
  const BookLessonScreen({super.key, required this.tutorId});

  @override
  State<BookLessonScreen> createState() => _BookLessonScreenState();
}

class _BookLessonScreenState extends State<BookLessonScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  var calendarKey = GlobalKey();
  @override
  void initState() {
    context.read<BookingBloc>().add(
          BookingScheduleFetched(
            GetScheduleOfTutorUsecaseParams(
              page: 0,
              tutorId: widget.tutorId,
            ),
          ),
        );
    super.initState();
  }

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
                  //print(
                  //  'difference in days: ${selectedDay.difference(DateTime.now()).inDays}');
                  context.read<BookingBloc>().add(
                        BookingScheduleFetched(
                          GetScheduleOfTutorUsecaseParams(
                              page: selectedDay
                                      .difference(DateTime.now())
                                      .inDays ~/
                                  7,
                              tutorId: widget.tutorId),
                        ),
                      );
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
            Expanded(
              child: SingleChildScrollView(
                child: TimeTable(selectedDate: _selectedDay),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
