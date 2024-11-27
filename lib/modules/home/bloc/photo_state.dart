part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  PhotoLoaded(this.photos);

  final PhotoList photos;
}

class PhotoError extends PhotoState {
  PhotoError(this.message);

  final String message;
}