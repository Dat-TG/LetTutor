import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime dateTime;

  const CountdownTimer({super.key, required this.dateTime});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late StreamController<int> _controller;

  @override
  void initState() {
    super.initState();

    _controller = StreamController<int>();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  void _updateTimer(Timer timer) {
    final remainingTime = widget.dateTime.difference(DateTime.now()).inSeconds;

    if (remainingTime <= 0) {
      _controller.close();
      _timer.cancel();
    } else {
      _controller.sink.add(remainingTime);
    }
  }

  @override
  void dispose() {
    _controller.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final remainingSeconds = snapshot.data!;
            final hours = remainingSeconds ~/ 3600;
            final minutes = (remainingSeconds % 3600) ~/ 60;
            final seconds = (remainingSeconds % 3600) % 60;

            return Text(
              '${AppLocalizations.of(context)!.startsIn} ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.yellow,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            );
          } else {
            return const Text(
              '...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.yellow,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            );
          }
        },
      ),
    );
  }
}
