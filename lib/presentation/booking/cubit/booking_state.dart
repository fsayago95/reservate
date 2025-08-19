part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}

final class BookingAvailabilitySuccess extends BookingState {
  final List<Availability> availability;
  BookingAvailabilitySuccess({required this.availability});
}
