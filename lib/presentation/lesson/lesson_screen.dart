import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:let_tutor/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/common/pdf-viewer/pdf_view_custom_builder.dart';
import 'package:pdfx/pdfx.dart';
import 'package:universal_platform/universal_platform.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _selectedIndex = 0;
  List<String> topics = [
    'The Internet',
    'Artificial Intelligence (AI)',
    'Social Media',
    'Internet Privacy',
    'Live Streaming',
    'Coding',
    'Technology Transforming Healthcare',
    'Smart Home Technology',
    'Remote Work - A Dream Job?',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openData(
      InternetFile.get(
          'https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileThe%20Internet.pdf'),
    ),
  );

  final pdfController = PdfController(
    document: PdfDocument.openData(
      InternetFile.get(
          'https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileThe%20Internet.pdf'),
    ),
  );

  @override
  void dispose() {
    pdfController.dispose();
    pdfPinchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.lessonDetails),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    image: AssetImage("assets/images/course.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black26,
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Life in the Internet Age',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Let\'s discuss how technology is changing the way we live.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            for (int i = 0; i < topics.length; i++)
              ListTile(
                title: Text('${i + 1}. ${topics[i]}'),
                selected: _selectedIndex == i,
                selectedTileColor: Theme.of(context).primaryColor,
                selectedColor: Colors.white,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(i);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
      body: Stack(
        children: [
          UniversalPlatform.isWindows
              ? PdfView(
                  controller: pdfController,
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
            builder: (_, state, page, pagesCount) =>
                state == PdfLoadingState.success
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
                    : const SizedBox(),
          )
        ],
      ),
    );
  }
}
