import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/ebook/widgets/ebook_card.dart';

class AllEbooks extends StatelessWidget {
  static const String routeName = 'allEbooks';
  const AllEbooks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: EbookCard(
                  isExpanded: true,
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: EbookCard(
                  isExpanded: true,
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: EbookCard(
                  isExpanded: true,
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: EbookCard(
                  isExpanded: true,
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: EbookCard(
                  isExpanded: true,
                  url:
                      'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7'),
            ),
          ],
        ),
      ),
    );
  }
}
