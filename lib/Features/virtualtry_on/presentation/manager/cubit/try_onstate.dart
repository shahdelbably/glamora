// 1. تعريف حالات الـ Cubit
abstract class TryOnState {}

class TryOnInitial extends TryOnState {}

class TryOnLoading extends TryOnState {}

class TryOnSuccess extends TryOnState {
  final String imageUrl;
  TryOnSuccess(this.imageUrl);
}

class TryOnFailure extends TryOnState {
  final String errorMessage;
  TryOnFailure(this.errorMessage);
}
