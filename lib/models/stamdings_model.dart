class Driver {
  String number;
  String name;
  String team;
  int points;
  int wins;
  int podiums;
  int poles;
  int dnfs;
  String drivercode;
  String firstentry;
  String firstwin;
  int wc;
  String dob;
  String country;
  String details;
  String imageUrl;

  Driver({
    required this.number,
    required this.name,
    required this.team,
    required this.points,
    required this.wins,
    required this.podiums,
    required this.poles,
    required this.dnfs,
    required this.drivercode,
    required this.firstentry,
    required this.firstwin,
    required this.wc,
    required this.dob,
    required this.country,
    required this.details,
    required this.imageUrl,
  });

  // From JSON
  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      number: json['number'] ?? '',
      name: json['name'] ?? '',
      team: json['team'] ?? '',
      points: json['points'] is int ? json['points'] : int.tryParse(json['points'].toString()) ?? 0,
      wins: json['wins'] is int ? json['wins'] : int.tryParse(json['wins'].toString()) ?? 0,
      podiums: json['podiums'] is int ? json['podiums'] : int.tryParse(json['podiums'].toString()) ?? 0,
      poles: json['poles'] is int ? json['poles'] : int.tryParse(json['poles'].toString()) ?? 0,
      dnfs: json['dnfs'] is int ? json['dnfs'] : int.tryParse(json['dnfs'].toString()) ?? 0,
      drivercode: json['drivercode'] ?? '',
      firstentry: json['firstentry'] ?? '',
      firstwin: json['firstwin'] ?? '',
      wc: json['wc'] is int ? json['wc'] : int.tryParse(json['wc'].toString()) ?? 0,
      dob: json['dob'] ?? '',
      country: json['country'] ?? '',
      details: json['details'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'team': team,
      'points': points,
      'wins': wins,
      'podiums': podiums,
      'poles': poles,
      'dnfs': dnfs,
      'drivercode': drivercode,
      'firstentry': firstentry,
      'firstwin': firstwin,
      'wc': wc,
      'dob': dob,
      'country': country,
      'details': details,
      'imageUrl': imageUrl,
    };
  }
}

class Team {
  final String position;
  final String name;
  final int points;
  final int wins;
  final String carName;
  final String gps;
  final String totalpts;
  final String totalWins;
  final String podiums;
  final String totalpodium;
  final String poles;
  final String totalpoles;
  final String dnfs;
  final String fastestLaps;
  final String driver1;
  final String driver2;
  final String powerUnit;
  final String teamP;
  final String firstentry;
  final String constchamp;
  final String driverchamp;
  final String base;
  final String details;
  final String imageUrl;

  Team({
    required this.position,
    required this.name,
    required this.points,
    required this.wins,
    required this.carName,
    required this.gps,
    required this.totalpts,
    required this.totalWins,
    required this.podiums,
    required this.totalpodium,
    required this.poles,
    required this.totalpoles,
    required this.dnfs,
    required this.fastestLaps,
    required this.driver1,
    required this.driver2,
    required this.powerUnit,
    required this.teamP,
    required this.firstentry,
    required this.constchamp,
    required this.driverchamp,
    required this.base,
    required this.details,
    required this.imageUrl,
  });

  // From JSON
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      position: json['position'] ?? '',
      name: json['name'] ?? '',
      points: json['points'] is int ? json['points'] : int.tryParse(json['points'].toString()) ?? 0,
      wins: json['wins'] is int ? json['wins'] : int.tryParse(json['wins'].toString()) ?? 0,
      carName: json['carName'] ?? '',
      gps: json['gps'] ?? '',
      totalpts: json['totalpts'] ?? '',
      totalWins: json['totalWins'] ?? '',
      podiums: json['podiums'] ?? '',
      totalpodium: json['totalpodium'] ?? '',
      poles: json['poles'] ?? '',
      totalpoles: json['totalpoles'] ?? '',
      dnfs: json['dnfs'] ?? '',
      fastestLaps: json['fastestLaps'] ?? '',
      driver1: json['driver1'] ?? '',
      driver2: json['driver2'] ?? '',
      powerUnit: json['powerUnit'] ?? '',
      teamP: json['teamP'] ?? '',
      firstentry: json['firstentry'] ?? '',
      constchamp: json['constchamp'] ?? '',
      driverchamp: json['driverchamp'] ?? '',
      base: json['base'] ?? '',
      details: json['details'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'name': name,
      'points': points,
      'wins': wins,
      'carName': carName,
      'gps': gps,
      'totalpts': totalpts,
      'totalWins': totalWins,
      'podiums': podiums,
      'totalpodium': totalpodium,
      'poles': poles,
      'totalpoles': totalpoles,
      'dnfs': dnfs,
      'fastestLaps': fastestLaps,
      'driver1': driver1,
      'driver2': driver2,
      'powerUnit': powerUnit,
      'teamP': teamP,
      'firstentry': firstentry,
      'constchamp': constchamp,
      'driverchamp': driverchamp,
      'base': base,
      'details': details,
      'imageUrl': imageUrl,
    };
  }
}
