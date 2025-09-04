import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> fetchProducts() async {
    print('fetching data...');
    try {
      final url = 'https://fakestoreapi.in/api/products';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final jsonData = jsonDecode(body);
      print('Fetched data DONE');
      return jsonData['products'];
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
