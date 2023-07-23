import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home/home_page_cubit.dart';
import '../../cubits/home/home_page_state.dart';
import 'widgets/images_list_widget.dart';
import 'widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _refreshData(BuildContext context) async {
    _searchController.text = '';

    await context.read<HomePageCubit>().fetchAstronomyPictureOfTheDay();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          title: const Text('Astronomy Picture of the Day'),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.errorMessage.isNotEmpty) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => _refreshData(context),
                      child: Text(
                        state.errorMessage,
                      ),
                    ),
                  );
                } else if (state.data.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return Column(
                    children: [
                      SearchBarWidget(
                        controller: _searchController,
                        onPressed: () {
                          final searchTerm = _searchController.text.trim();

                          if (searchTerm.isNotEmpty) {
                            const datePattern = r'^\d{4}-\d{2}-\d{2}$';

                            if (RegExp(datePattern).hasMatch(searchTerm)) {
                              context
                                  .read<HomePageCubit>()
                                  .searchAstronomyPicture(
                                    date: searchTerm,
                                  );
                            }
                          }
                        },
                      ),
                      ImagesListWidget(imagesList: state.data)
                    ],
                  );
                }
              },
            ),
          ),
        ),
      );
}
