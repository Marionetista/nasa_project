import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_project/services/nasa_api_service.dart';

void main() {
  const apiKey = 'VtUQwsLeaTmWdZPFvQss6ZzjS2OA8aPAumShXWld';

  group('fetchData', () {
    const url = 'https://api.nasa.gov/planetary/apod?api_key=$apiKey';
    final service = NasaApiService(apiKey);

    test('fetchData returns valid data', () async {
      final data = await service.fetchData(url);

      expect(data, isA<Map<String, dynamic>>());
    });
  });

  group('fetchPicture', () {
    final service = NasaApiService(apiKey);

    test('fetchPicture returns a map', () async {
      final date = DateTime.now();
      final result = await service.fetchPicture(date);

      expect(result, isA<Map<String, dynamic>>());
    });

    test('fetchPicture returns valid data', () async {
      final date = DateTime.now();
      final result = await service.fetchPicture(date);

      expect(result.containsKey('url'), true);
      expect(result.containsKey('title'), true);
      expect(result.containsKey('explanation'), true);
    });

    test('fetchPicture throws an exception when API call fails', () async {
      const invalidApiKey = 'fakeKey';
      final invalidService = NasaApiService(invalidApiKey);
      final date = DateTime.now();

      expect(() => invalidService.fetchPicture(date), throwsException);
    });
  });

  group('searchAstronomyPictureByDate', () {
    final service = NasaApiService(apiKey);

    test('searchAstronomyPictureByDate returns a map', () async {
      final result =
          await service.searchAstronomyPictureByDate(date: '2022-01-01');
      expect(result, isA<Map<String, dynamic>>());
    });

    test('searchAstronomyPictureByDate returns the correct data', () async {
      final result =
          await service.searchAstronomyPictureByDate(date: '2022-01-01');

      expect(result['date'], '2022-01-01');
      expect(result['title'], isA<String>());
      expect(result['explanation'], isA<String>());
      expect(result['url'], isA<String>());
    });

    test('searchAstronomyPictureByDate throws an exception on failure',
        () async {
      expect(
        () => service.searchAstronomyPictureByDate(date: 'dateeee'),
        throwsException,
      );
    });
  });
}
