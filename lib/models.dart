class CovidModel {
  final String country;
  final dynamic tested;
  final dynamic deceased;
  final dynamic infected;
  final dynamic latestRecovered;

  CovidModel({
    required this.country,
    required this.tested,
    required this.deceased,
    required this.infected,
    required this.latestRecovered,
  });

  factory CovidModel.fromJSON({required Map json}) {
    return CovidModel(
      country: json["country"],
      tested: json["tested"],
      deceased: json["deceased"],
      infected: json["infected"],
      latestRecovered: json["recovered"],
    );
  }
}
