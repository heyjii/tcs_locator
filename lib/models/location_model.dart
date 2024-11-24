class Location {
  final String centerName;
  final String location;
  final String area;
  final String phone;
  final String email;
  final String address;
  final double latitude;
  final double longitude;
  final String officeType;

  Location({
    required this.centerName,
    required this.location,
    required this.area,
    required this.phone,
    required this.email,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.officeType,
  });

  // Convert Location to a Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'location': centerName,
      'geo': location,
      'area': area,
      'phone': phone,
      'email': email,
      'address': address,
      'geometry': {
        'lat' : latitude,
        'lng': longitude,
      },
      'officeType' : [officeType]
    };
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      centerName: json['location'] ?? "",
      location: json['geo'] ?? "",
      area: json['area'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'] ?? "",
      address: json['address'] ?? "",
      latitude: json['geometry']['lat'] ?? 0.0,
      longitude: json['geometry']['lng'] ?? 0.0,
      officeType: json['officeType'][0] ?? '',
    );
  }

  static List<Location> fromJsonList(Map<String, dynamic> json) {
    if (json['locations'] == null) {
      return [];
    }
    return (json['locations'] as List)
        .map((locationJson) => Location.fromJson(locationJson))
        .toList();
  }
}
