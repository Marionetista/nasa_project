import 'package:flutter/material.dart';

import '../../models/astro_picture.dart';
import 'widgets/header_widget.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({
    required this.picture,
    super.key,
  });

  final AstroPicture picture;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  picture.url,
                  fit: BoxFit.fill,
                ),
              ),
              const HeaderWidget(),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                maxChildSize: 1.0,
                minChildSize: 0.6,
                builder: (context, scrollController) => Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              picture.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              picture.date,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(picture.explanation),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
