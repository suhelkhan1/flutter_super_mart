import 'package:http/http.dart';
import 'dart:convert';


Future<List> getFromApi(url) async {
  Response response = await get('https://fakestoreapi.com/' + url);
  return jsonDecode(response.body);
}