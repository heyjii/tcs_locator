class Location {
  final String centerName;
  final String location;
  final String area;
  final String phone;
  final String email;
  final String address;
  final double latitude;
  final double longitude;

  Location({
    required this.centerName,
    required this.location,
    required this.area,
    required this.phone,
    required this.email,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      centerName: json['location'],
      location: json['geo'],
      area: json['area'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      latitude: json['geometry']['lat'],
      longitude: json['geometry']['lng'],
    );
  }
}
