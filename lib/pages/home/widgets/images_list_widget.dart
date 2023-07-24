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
                  child: Stack(
                    children: [
                      Image.network(astroPicture.url),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Text(
                            astroPicture.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Text(
                            astroPicture.date,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
