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

  Team({
    required this.position,
    required this.name,
    required this.points,
    required this.wins,
  });
}
