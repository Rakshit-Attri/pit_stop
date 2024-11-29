class Race {
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
  int fp1;
  int fp2;
  int fp3;
  int quali;
  int race;
  String details;
  int startTime;

  Race({
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
    required this.startTime,
  });

  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
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
      fp1: json['fp1'] ?? 0,
      fp2: json['fp2'] ?? 0,
      fp3: json['fp3'] ?? 0,
      quali: json['quali'] ?? 0,
      race: json['race'] ?? 0,
      details: json['details'] ?? '',
      startTime: json['start_time'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'round': round,
      'title': title,
      'city': city,
      'image_url': imageUrl,
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
      'start_time': startTime,
    };
  }
}
