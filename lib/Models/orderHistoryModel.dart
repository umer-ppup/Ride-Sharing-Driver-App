class completeRideModel {
  final String userId;
  final String totalFear;
  final String to;
  final String from;
  final String totalKm;

  completeRideModel({this.userId,this.totalFear, this.to,this.from,this.totalKm});

  factory completeRideModel.fromJson(Map json) {
    return completeRideModel(
      userId: json['userId'],
      totalFear: json['totalFear'],
      to: json['to'],
      from: json['from'],
      totalKm: json['totalKm'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["userId"] = userId;
    map["totalFear"] = totalFear;
    map["to"] = to;
    map["from"] = from;
    map["totalKm"] = totalKm;

    return map;
  }
}