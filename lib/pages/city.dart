class City {
  final String placeName;
  final String imagePath;
  final String city;
  final String description;
  final double latitude;
  final double longitude;

  City({
    required this.placeName,
    required this.imagePath,
    required this.city,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is City &&
        other.placeName == placeName &&
        other.city == city;
  }

  @override
  int get hashCode => placeName.hashCode ^ city.hashCode;
}
