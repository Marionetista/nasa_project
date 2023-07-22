import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/astro_picture.dart';
import '../../services/nasa_api_service.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.apiKey})
      : apiService = NasaApiService(apiKey),
        super(HomePageState.initial());

  final String apiKey;
  final NasaApiService apiService;

  Future<void> fetchAstronomyPictureOfTheDay() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      final pictures = await apiService.fetchAstronomyPicturesOfLastFiveDays();

      if (pictures.isNotEmpty) {
        final astronomyPictures =
            pictures.map((data) => AstroPicture.fromJson(data)).toList();

        emit(state.copyWith(isLoading: false, data: astronomyPictures));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to load Astronomy Picture of the Day',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'An unexpected error occurred, try again later.',
        ),
      );
    }
  }
}
