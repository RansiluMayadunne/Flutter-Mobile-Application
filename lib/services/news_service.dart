import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsService {
  // final String _apiKey = "3c2d748d8f5d472289d5029681116b02";
  // final String _baseUrl =
  //     "https://newsapi.org/v2/top-headlines?country=us&category";
   final apiKey = '3c2d748d8f5d472289d5029681116b02'; // Replace with your NewsAPI key
   final category = "Sports" ;
  Future<List<Article>> fetchNews(String country) async {
    final response = await http.get(
      Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
