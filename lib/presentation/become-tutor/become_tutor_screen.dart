import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/approval.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/complete_profile_form.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/video_introduction.dart';

class BecomeTutorScreen extends StatefulWidget {
  static const String routeName = 'become-tutor';
  const BecomeTutorScreen({super.key});

  @override
  State<BecomeTutorScreen> createState() => _BecomeTutorScreenState();
}

class _BecomeTutorScreenState extends State<BecomeTutorScreen> {
  int currentStep = 0;
  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text(AppLocalizations.of(context)!.completeProfile),
        content: const CompleteProfileForm(),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text(AppLocalizations.of(context)!.videoIntroduction),
        content: const VideoIntroduction(),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text(AppLocalizations.of(context)!.approval),
        content: const Approval(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(
          title: AppLocalizations.of(context)!.becomeATutor,
        ),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: currentStep,
        controlsBuilder: (context, details) {
          return details.currentStep < 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        title: AppLocalizations.of(context)!.continuE,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        borderRadius: 10,
                        callback: () {
                          bool isLastStep =
                              (currentStep == getSteps().length - 1);
                          if (isLastStep) {
                            //Do something with this information
                          } else {
                            setState(() {
                              currentStep += 1;
                            });
                          }
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        title: AppLocalizations.of(context)!.cancel,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        borderRadius: 10,
                        backgroundColor: Colors.grey[600]!,
                        callback: () {
                          currentStep == 0
                              ? GoRouter.of(context).pop()
                              : setState(() {
                                  currentStep -= 1;
                                });
                        })
                  ],
                )
              : CustomButton(
                  title: AppLocalizations.of(context)!.home,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  borderRadius: 10,
                  callback: () {
                    GoRouter.of(context).pushNamed('home');
                  });
        },
        onStepTapped: (step) => setState(() {
          currentStep = step;
        }),
        steps: getSteps(),
      ),
    );
  }
}
