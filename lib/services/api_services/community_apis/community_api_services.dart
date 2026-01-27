// localhost:3001/api/social-media/homepage?userId=693aa18a7b467ee24534fbb9

import 'dart:convert';

import 'package:artsays_app/constants/credentials/api_base_url.dart';
import 'package:artsays_app/model/community_models/home_page_model.dart';
import 'package:http/http.dart' as http;

Future<HomePageModel> getCommunityHomePageData(
  String userId,
  String token,
) async {
  String apiUrl = '$apiBaseUrl/api/social-media/homepage?userId=$userId';

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Authorization': 'Bearer $token'},
  );

  return HomePageModel.fromJson(jsonDecode(response.body));
}
