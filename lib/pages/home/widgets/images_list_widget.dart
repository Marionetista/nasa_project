import 'package:flutter/material.dart';

import '../../../models/astro_picture.dart';

class ImagesListWidget extends StatelessWidget {
  const ImagesListWidget({
    required this.imagesList,
    super.key,
  });

  final List<AstroPicture> imagesList;

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.builder(
          itemCount: imagesList.length,
          itemBuilder: (context, index) {
            final astroPicture = imagesList[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(astroPicture.url),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${astroPicture.date}'),
                      Text('Title: ${astroPicture.title}'),
                      Text('Explanation: ${astroPicture.explanation}'),
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
}
