import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/home/home_page_cubit.dart';
import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        title: 'Astronomy Picture of the Day',
        home: BlocProvider(
          create: (context) => HomePageCubit(
            apiKey: 'VtUQwsLeaTmWdZPFvQss6ZzjS2OA8aPAumShXWld',
          )..fetchAstronomyPictureOfTheDay(),
          child: const HomePage(),
        ),
      );
}
