import 'package:flutter/material.dart';

import '../../../models/astro_picture.dart';
import '../../detail/detail_page.dart';

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
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            BookDetailPage(picture: astroPicture),
                      ),
                    );
                  },
                  child: Image.network(
                    astroPicture.url,
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
}
