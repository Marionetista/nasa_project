import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/astro_picture.dart';
import '../../services/nasa_api_service.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({
    required this.apiKey,
  })  : apiService = NasaApiService(apiKey),
        super(HomePageState.initial());

  final String apiKey;
  final NasaApiService apiService;

  Future<void> fetchAstronomyPictureOfTheDay() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      final pictures = await apiService.fetchAstronomyPicturesOfLastDays();

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
    } on SocketException {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'No internet connection. Please check your network settings and tap to try again.',
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Failed to connect to the server. Please try again later.',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'An unexpected error occurred, tap to try again.',
        ),
      );
    }
  }

  Future<void> searchAstronomyPicture({String? date}) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      List<Map<String, dynamic>> picturesData;

      if (date != null) {
        picturesData = [
          await apiService.searchAstronomyPictureByDate(date: date)
        ];
      } else {
        throw Exception('Invalid search parameters');
      }

      if (picturesData.isNotEmpty) {
        final astronomyPictures =
            picturesData.map((data) => AstroPicture.fromJson(data)).toList();

        emit(state.copyWith(isLoading: false, data: astronomyPictures));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'No matching data found',
          ),
        );
      }
    } on SocketException {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'No internet connection. Please check your network settings and tap to try again.',
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Failed to connect to the server. Please try again later.',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'An unexpected error occurred, tap to try again.',
        ),
      );
    }
  }
}
