part of 'address_cubit.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final AddressModel address;
  AddressSuccess(this.address);
}

class GetAddressesSuccess extends AddressState {
  final List<AddressModel> addresses;
  GetAddressesSuccess(this.addresses);
}

class AddressFailure extends AddressState {
  final String error;
  AddressFailure(this.error);
}
