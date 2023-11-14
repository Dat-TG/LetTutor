import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/core/common/stars.dart';
import 'package:let_tutor/core/utils/helpers.dart';

class Review extends StatelessWidget {
  final String? name;
  final String? avatarUrl;
  final String? content;
  final double? rating;
  final DateTime? updatedAt;
  const Review({
    super.key,
    this.avatarUrl,
    this.content,
    this.name,
    this.rating,
    this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: avatarUrl ?? Helpers.avatarFromName(name),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 25,
            backgroundImage: imageProvider,
          ),
          placeholder: (context, url) => const CircleAvatar(
            radius: 25,
            child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          ),
          errorWidget: (context, url, error) => CachedNetworkImage(
            imageUrl: Helpers.avatarFromName(name),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 25,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) => const CircleAvatar(
              radius: 25,
              child: SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  Helpers.getTimeDifference(
                      context, updatedAt!, DateTime.now()),
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Stars(
              rating: 4,
              itemSize: 18,
            ),
            const SizedBox(
              height: 5,
            ),
            ExpandedParagraph(text: content ?? ''),
          ],
        ),
      ],
    );
  }
}
