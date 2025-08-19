import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservate/data/repository/booking_repository_impl.dart';
import 'package:reservate/domain/models/booking_availability.dart';
import 'package:reservate/domain/repository/booking_repository.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository _bookingRepository = BookingRepositoryImpl();

  BookingCubit() : super(BookingInitial());

  Future<void> getAvailability() async {
    try {
      emit(BookingLoading());
      final availability = await _bookingRepository.getAvailability();
      emit(BookingAvailabilitySuccess(availability: List.empty()));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}
