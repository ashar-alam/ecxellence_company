import 'dart:convert';

import 'package:ecxellence_company/model/chart.dart';
import 'package:ecxellence_company/model/chart_data.dart';
import 'package:http/http.dart' as http;

class ChartService {
  Future<List<ChartData>> getChartdata() async {
    String chartAPIURL =
        "http://45.64.156.214:8000/customers/customer-josh-reason-today/?user_profile=480";
    final response = await http.get(Uri.parse(chartAPIURL),
        headers: {"Authorization": "c3fb04334a7c647338cdfd500e2997bb9898cf52"});

    var responseData = json.decode(response.body);
    return (responseData["moodalytics"] as List)
        .map((e) => Chart.fromJson(e))
        .map((e) => ChartData(
            e.created_at, e.emoji_point))
        .toList();

  }
}
