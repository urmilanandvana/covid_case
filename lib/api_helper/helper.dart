import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();
  // String url = " https://disease.sh/v3/covid-19/all";
  String url =
      "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true";

  Future fetchCOVIDDataAPI() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);

      List<CovidModel> covidModel = decodedData.map(
        (e) {
          return CovidModel.fromJSON(json: e);
        },
      ).toList();
      return covidModel;
    }
    return null;
  }
}
