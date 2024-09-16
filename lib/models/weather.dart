class Weather {
  Location? location;
  Current? current;

  Weather({this.location, this.current});

  Weather.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ?  Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

 Location.fromJson(Map<String, dynamic> json) {
  name = json['name'];
  region = json['region'];
  country = json['country'];
  lat = json['lat']?.toDouble();
  lon = json['lon']?.toDouble();
  tzId = json['tz_id'];
  localtimeEpoch = json['localtime_epoch']?.toInt(); // Ensure it's an int
  localtime = json['localtime'];
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['tz_id'] = this.tzId;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

 Current.fromJson(Map<String, dynamic> json) {
  lastUpdatedEpoch = json['last_updated_epoch']?.toInt(); // Ensure it's an int
  lastUpdated = json['last_updated'];
  tempC = json['temp_c']?.toDouble();
  tempF = json['temp_f']?.toDouble();
  isDay = json['is_day']?.toInt(); // Ensure it's an int
  condition = json['condition'] != null
      ? Condition.fromJson(json['condition'])
      : null;
  windMph = json['wind_mph']?.toDouble();
  windKph = json['wind_kph']?.toDouble();
  windDegree = json['wind_degree']?.toInt(); // Ensure it's an int
  windDir = json['wind_dir'];
  pressureMb = json['pressure_mb']?.toDouble(); // Ensure it's an int
  pressureIn = json['pressure_in']?.toDouble();
  precipMm = json['precip_mm']?.toDouble(); // Ensure it's an int
  precipIn = json['precip_in']?.toDouble();
  humidity = json['humidity']?.toInt(); // Ensure it's an int
  cloud = json['cloud']?.toInt(); // Ensure it's an int
  feelslikeC = json['feelslike_c']?.toDouble();
  feelslikeF = json['feelslike_f']?.toDouble();
  windchillC = json['windchill_c']?.toDouble();
  windchillF = json['windchill_f']?.toDouble();
  heatindexC = json['heatindex_c']?.toDouble();
  heatindexF = json['heatindex_f']?.toDouble();
  dewpointC = json['dewpoint_c']?.toDouble();
  dewpointF = json['dewpoint_f']?.toDouble();
  visKm = json['vis_km']?.toDouble(); // Ensure it's an int
  visMiles = json['vis_miles']?.toDouble(); // Ensure it's an int
  uv = json['uv']?.toDouble(); // Ensure it's an int
  gustMph = json['gust_mph']?.toDouble();
  gustKph = json['gust_kph']?.toDouble();
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_updated_epoch'] = this.lastUpdatedEpoch;
    data['last_updated'] = this.lastUpdated;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['windchill_c'] = this.windchillC;
    data['windchill_f'] = this.windchillF;
    data['heatindex_c'] = this.heatindexC;
    data['heatindex_f'] = this.heatindexF;
    data['dewpoint_c'] = this.dewpointC;
    data['dewpoint_f'] = this.dewpointF;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['uv'] = this.uv;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}
