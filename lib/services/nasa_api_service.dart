import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApiService {
  NasaApiService(this.apiKey);

  final String apiKey;

  Future<Map<String, dynamic>> _fetchData(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  Future<Map<String, dynamic>> fetchPicture(
    DateTime date,
  ) async {
    final formattedDate = '${date.year}-${date.month}-${date.day}';
    final apiUrl =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$formattedDate';

    return _fetchData(apiUrl);
  }

  Future<List<Map<String, dynamic>>>
      fetchAstronomyPicturesOfLastFiveDays() async {
    final List<Map<String, dynamic>> pictures = [];

    for (int i = 0; i < 5; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final data = await fetchPicture(date);
      pictures.add(data);
    }

    return pictures;
  }

  Future<Map<String, dynamic>> searchAstronomyPictureByDate({
    String? date,
  }) async {
    final apiUrl =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date';

    return _fetchData(apiUrl);
  }
}
