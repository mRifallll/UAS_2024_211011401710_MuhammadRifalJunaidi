import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crypto.dart';

class ApiService {
  static const String apiUrl = 'https://api.coinlore.net/api/tickers/';

  Future<List<Crypto>> fetchCryptoData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
