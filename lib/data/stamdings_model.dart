class Driver {
  String number;
  String name;
  String team;
  String points;
  String wins;
  String podiums;
  String poles;
  String dnfs;
  String drivercode;
  String firstentry;
  String firstwin;
  String wc;
  String dob;
  String country;
  String details;

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
  });
}

// added team model 
class Team {
  final String position;
  final String name;
  final String points;
  final String wins;
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
  });
}
