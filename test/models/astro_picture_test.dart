import 'package:nasa_project/models/astro_picture.dart';
import 'package:test/test.dart';

void main() {
  group('AstroPicture Model Test', () {
    test('fromJson() should correctly deserialize JSON data', () {
      final json = {
        'title': 'Title',
        'date': '2023-07-24',
        'explanation': 'blablabla',
        'url': 'https://example.com/sample.jpg',
      };

      final astroPicture = AstroPicture.fromJson(json);

      expect(astroPicture.title, equals('Title'));
      expect(astroPicture.date, equals('2023-07-24'));
      expect(astroPicture.explanation, equals('blablabla'));
      expect(astroPicture.url, equals('https://example.com/sample.jpg'));
    });

    test('toJson() should correctly serialize the object to JSON', () {
      final astroPicture = AstroPicture(
        title: 'Title',
        date: '2023-07-24',
        explanation: 'blablabla',
        url: 'https://example.com/sample.jpg',
      );

      final json = astroPicture.toJson();

      expect(
        json,
        equals({
          'title': 'Title',
          'date': '2023-07-24',
          'explanation': 'blablabla',
          'url': 'https://example.com/sample.jpg',
        }),
      );
    });
  });
}
