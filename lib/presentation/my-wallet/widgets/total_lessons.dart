import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/presentation/my-wallet/bloc/wallet_bloc.dart';

class TotalLessons extends StatefulWidget {
  const TotalLessons({super.key});

  @override
  State<TotalLessons> createState() => _TotalLessonsState();
}

class _TotalLessonsState extends State<TotalLessons> {
  @override
  void initState() {
    context.read<WalletBloc>().add(const GetStatisticsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).splashColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(
                  0,
                  0,
                ),
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.totalLessons,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (state is WalletLoadingStatistics)
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 1,
                      ),
                    )
                  : state.errorStatistics != null
                      ? Text(state.errorStatistics!.response!.statusMessage!)
                      : state.statistics != null
                          ? Text(
                              '${state.statistics?.total}',
                              style: TextStyle(
                                fontSize: 40,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateFormat('y-M-d hh:mm').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
