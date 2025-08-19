enum BookingStatus {
  pending,
  confirmed,
  cancelled,
  completed,
  noShow,
}

class Booking {
  final String id;
  final String userId;
  final String amenityId;
  final String amenityName;
  final DateTime bookingDate;
  final TimeSlot timeSlot;
  final BookingStatus status;
  final int quantity;
  final String comments;
  final double? totalPrice;
  final DateTime createdAt;
  final DateTime? confirmedAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;

  const Booking({
    required this.id,
    required this.userId,
    required this.amenityId,
    required this.amenityName,
    required this.bookingDate,
    required this.timeSlot,
    required this.status,
    required this.quantity,
    required this.comments,
    this.totalPrice,
    required this.createdAt,
    this.confirmedAt,
    this.cancelledAt,
    this.cancellationReason,
  });

  // Lógica de negocio pura
  bool get isActive =>
      status == BookingStatus.confirmed || status == BookingStatus.pending;
  bool get canBeCancelled =>
      status == BookingStatus.pending || status == BookingStatus.confirmed;
  bool get isUpcoming => bookingDate.isAfter(DateTime.now()) && isActive;
  bool get isPast => bookingDate.isBefore(DateTime.now());

  Duration get duration => timeSlot.duration;

  String get statusDisplayName {
    switch (status) {
      case BookingStatus.pending:
        return 'Pendiente';
      case BookingStatus.confirmed:
        return 'Confirmada';
      case BookingStatus.cancelled:
        return 'Cancelada';
      case BookingStatus.completed:
        return 'Completada';
      case BookingStatus.noShow:
        return 'No se presentó';
    }
  }
}

class TimeSlot {
  final DateTime startTime;
  final DateTime endTime;

  const TimeSlot({
    required this.startTime,
    required this.endTime,
  });

  Duration get duration => endTime.difference(startTime);

  bool overlaps(TimeSlot other) {
    return startTime.isBefore(other.endTime) &&
        endTime.isAfter(other.startTime);
  }

  String get displayTime {
    final start =
        '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
    final end =
        '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';
    return '$start - $end';
  }
}
