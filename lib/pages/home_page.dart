import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/home_page_cubit.dart';
import '../cubits/home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Astronomy Picture of the Day'),
        ),
        body: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage.isNotEmpty) {
              return Center(child: Text(state.errorMessage));
            } else if (state.data.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final astroPicture = state.data[index];

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
                            Text(
                              'Explanation: ${astroPicture.explanation}',
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.read<HomePageCubit>().fetchAstronomyPictureOfTheDay(),
          child: const Icon(Icons.refresh),
        ),
      );
}
