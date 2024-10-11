class Driver {
  String number;
  String name;
  String team;
  String points;

  Driver({
    required this.number,
    required this.name,
    required this.team,
    required this.points,
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
