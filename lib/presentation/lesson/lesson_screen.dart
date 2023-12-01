import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/pdf-viewer/pdf_view_custom_builder.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';
import 'package:let_tutor/presentation/lesson/widgets/drawer_lesson.dart';
import 'package:pdfx/pdfx.dart';
import 'package:universal_platform/universal_platform.dart';

class LessonScreen extends StatefulWidget {
  static const String routeName = 'lessonScreen';
  final CourseDetailsEntity courseDetails;
  final int initialIndex;
  const LessonScreen(
      {super.key, required this.courseDetails, this.initialIndex = 0});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      return;
    }
    setState(() {
      _selectedIndex = index;
      pdfPinchController.loadDocument(
        PdfDocument.openData(
          InternetFile.get(widget.courseDetails.topics?[index].nameFile ?? ""),
        ),
        initialPage: 1,
      );
      pdfController.loadDocument(
        PdfDocument.openData(
          InternetFile.get(widget.courseDetails.topics?[index].nameFile ?? ""),
        ),
        initialPage: 1,
      );
    });
  }

  late PdfControllerPinch pdfPinchController;

  late PdfController pdfController;

  openDrawer() async {
    await Future.delayed(Duration.zero);
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  void initState() {
    openDrawer();
    _selectedIndex = widget.initialIndex;
    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(
        InternetFile.get(
            widget.courseDetails.topics?[widget.initialIndex].nameFile ?? ""),
      ),
    );
    pdfController = PdfController(
      document: PdfDocument.openData(
        InternetFile.get(
            widget.courseDetails.topics?[widget.initialIndex].nameFile ?? ""),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    pdfController.dispose();
    pdfPinchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.lessonDetails),
      ),
      drawer: DrawerLesson(
        selectedIndex: _selectedIndex,
        setSelectedIndex: _onItemTapped,
        courseDetails: widget.courseDetails,
      ),
      body: Stack(
        children: [
          UniversalPlatform.isWindows
              ? PdfView(
                  controller: pdfController,
                  onDocumentLoaded: (document) => setState(() {
                    pdfController.jumpToPage(1);
                  }),
                  builders: PdfViewBuilders<DefaultBuilderOptions>(
                    options: const DefaultBuilderOptions(
                      loaderSwitchDuration: Duration(
                        milliseconds: 100,
                      ),
                      transitionBuilder: PDFViewCustomBuilder.transitionBuilder,
                    ),
                    documentLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    pageLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    errorBuilder: (_, error) =>
                        Center(child: Text(error.toString())),
                    // All from `PdfViewPinch` and:
                    pageBuilder: PDFViewCustomBuilder.pageBuilder,
                  ),
                )
              : PdfViewPinch(
                  controller: pdfPinchController,
                  onDocumentLoaded: (document) => setState(() {
                    pdfPinchController.jumpToPage(1);
                  }),
                  builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                    options: const DefaultBuilderOptions(
                      loaderSwitchDuration: Duration(
                        milliseconds: 100,
                      ),
                      transitionBuilder: PDFViewCustomBuilder.transitionBuilder,
                    ),
                    documentLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    pageLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    errorBuilder: (_, error) =>
                        Center(child: Text(error.toString())),
                    builder: PDFViewCustomBuilder.builder,
                  ),
                ),
          PdfPageNumber(
            controller: UniversalPlatform.isWindows
                ? pdfController
                : pdfPinchController,
            // When `loadingState != PdfLoadingState.success`  `pagesCount` equals null_
            builder: (_, state, page, pagesCount) {
              return state == PdfLoadingState.success
                  ? Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: '$page ',
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.ofPage,
                                ),
                                TextSpan(
                                  text: ' $pagesCount',
                                ),
                              ]),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
