class AddressModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String country;
  final String city;
  final String state;
  final String streetAddress;
  final String zipCode;
  final String user;
  final String createdAt;
  final String updatedAt;

  AddressModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.country,
    required this.city,
    required this.state,
    required this.streetAddress,
    required this.zipCode,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      country: json['country'],
      city: json['city'],
      state: json['state'],
      streetAddress: json['streetAddress'],
      zipCode: json['zipCode'],
      user: json['user'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class PostAddressResponse {
  final String status;
  final AddressModel address;

  PostAddressResponse({required this.status, required this.address});

  factory PostAddressResponse.fromJson(Map<String, dynamic> json) {
    return PostAddressResponse(
      status: json['status'],
      address: AddressModel.fromJson(json['data']['address']),
    );
  }
}

class GetAddressesResponse {
  final String status;
  final List<AddressModel> addresses;

  GetAddressesResponse({required this.status, required this.addresses});

  factory GetAddressesResponse.fromJson(Map<String, dynamic> json) {
    return GetAddressesResponse(
      status: json['status'],
      addresses: List<AddressModel>.from(
        json['data']['addresses'].map((e) => AddressModel.fromJson(e)),
      ),
    );
  }
}
