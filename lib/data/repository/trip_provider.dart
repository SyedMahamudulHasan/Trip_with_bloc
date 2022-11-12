import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo/data/model/trip_model.dart';

class TripProvider {
  String baseUrl = "https://uc-backend.unitedchauffeur.co.uk/api/v1/all-trips/";

  Future<List<TripModel>> getTrips() async {
    Response response = await get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TripModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
