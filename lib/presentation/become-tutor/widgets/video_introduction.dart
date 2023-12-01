import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/video/video_from_file.dart';
import 'package:let_tutor/presentation/become-tutor/bloc/become_tutor_bloc.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_attention.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_title.dart';
import 'package:let_tutor/core/utils/helpers.dart';

class VideoIntroduction extends StatefulWidget {
  const VideoIntroduction({super.key});

  @override
  State<VideoIntroduction> createState() => _VideoIntroductionState();
}

class _VideoIntroductionState extends State<VideoIntroduction> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.setUpYourTutorProfile,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/introvideo.jpg',
                ),
                radius: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.introVideoGuide,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BecomeTutorTitle(
            text: AppLocalizations.of(context)!.introductionVideo,
          ),
          const SizedBox(
            height: 20,
          ),
          BecomeTutorAttetion(
            text: AppLocalizations.of(context)!.introductionVideoTips,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<BecomeTutorBloc, BecomeTutorState>(
            builder: (context, state) {
              return Center(
                child: state.uploadVideo == null
                    ? GestureDetector(
                        onTap: () async {
                          var res = await Helpers.pickVideo();
                          // ignore: use_build_context_synchronously
                          context.read<BecomeTutorBloc>().add(UpdateState(
                                specialitiesErrorText:
                                    state.specialitiesErrorText,
                                uploadImage: state.uploadImage,
                                uploadVideo: res,
                              ));
                        },
                        child: DottedBorder(
                          strokeWidth: 1,
                          dashPattern: const [3, 3],
                          child: Container(
                            width: 250,
                            height: 250,
                            color: Colors.grey.withOpacity(0.3),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.uploadVideoHere,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.tapToUpload,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              maxHeight: 300,
                            ),
                            child: VideoFromFile(video: state.uploadVideo!),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              onPressed: () {
                                context.read<BecomeTutorBloc>().add(UpdateState(
                                      specialitiesErrorText:
                                          state.specialitiesErrorText,
                                      uploadImage: state.uploadImage,
                                      uploadVideo: null,
                                    ));
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                                size: 24,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
