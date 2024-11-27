class Race {
  String day;
  String month;
  String round;
  String title;
  String city;
  String imageUrl;
  String track;
  String duration;
  String distance;
  String laps;
  String turns;
  String speed;
  String elevation;
  String fp1;
  String fp2;
  String fp3;
  String quali;
  String race;
  String details;


  Race({
    required this.day,
    required this.month,
    required this.round,
    required this.title,
    required this.city,
    required this.imageUrl,
    required this.track,
    required this.duration,
    required this.distance,
    required this.laps,
    required this.turns,
    required this.speed,
    required this.elevation,
    required this.fp1,
    required this.fp2,
    required this.fp3,
    required this.quali,
    required this.race,
    required this.details,
  });

  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
      day: json['day'] ?? '',
      month: json['month'] ?? '',
      round: json['round'] ?? '',
      title: json['title'] ?? '',
      city: json['city'] ?? '',
      imageUrl: json['image_url'] ?? '',
      track: json['track'] ?? '',
      duration: json['duration'] ?? '',
      distance: json['distance'] ?? '',
      laps: json['laps'] ?? '',
      turns: json['turns'] ?? '',
      speed: json['speed'] ?? '',
      elevation: json['elevation'] ?? '',
      fp1: json['fp1'] ?? '',
      fp2: json['fp2'] ?? '',
      fp3: json['fp3'] ?? '',
      quali: json['quali'] ?? '',
      race: json['race'] ?? '',
      details: json['details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'month': month,
      'round': round,
      'title': title,
      'city': city,
      'imageUrl': imageUrl,
      'track': track,
      'duration': duration,
      'distance': distance,
      'laps': laps,
      'turns': turns,
      'speed': speed,
      'elevation': elevation,
      'fp1': fp1,
      'fp2': fp2,
      'fp3': fp3,
      'quali': quali,
      'race': race,
      'details': details,
    };
  }
}
