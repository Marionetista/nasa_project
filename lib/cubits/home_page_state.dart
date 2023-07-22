import 'package:equatable/equatable.dart';
import '../models/astro_picture.dart';

class HomePageState extends Equatable {
  factory HomePageState.initial() => const HomePageState(
        isLoading: true,
        data: [],
        errorMessage: '',
      );

  const HomePageState({
    required this.isLoading,
    required this.data,
    required this.errorMessage,
  });

  final bool isLoading;
  final List<AstroPicture> data;
  final String errorMessage;

  HomePageState copyWith({
    bool? isLoading,
    List<AstroPicture>? data,
    String? errorMessage,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        isLoading,
        data,
        errorMessage,
      ];
}
