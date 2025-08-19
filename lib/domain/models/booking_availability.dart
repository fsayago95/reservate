class Availability {
  final String id;
  final String amenityId;
  final String amenityName;
  final DateTime date;
  final TimeSlot timeSlot;
  final AvailabilityStatus status;
  final int maxCapacity;
  final int currentBookings;
  final double? price;
  final String? reservedByUserId;
  final DateTime createdAt;

  const Availability({
    required this.id,
    required this.amenityId,
    required this.amenityName,
    required this.date,
    required this.timeSlot,
    required this.status,
    required this.maxCapacity,
    required this.currentBookings,
    this.price,
    this.reservedByUserId,
    required this.createdAt,
  });

  // Lógica de negocio pura
  bool get isAvailable => status == AvailabilityStatus.available;
  bool get isReserved => status == AvailabilityStatus.reserved;
  bool get isFull => currentBookings >= maxCapacity;
  bool get canBeBooked => isAvailable && !isFull;
  int get remainingSlots => maxCapacity - currentBookings;

  // Validaciones de negocio
  bool get isValidTimeSlot => timeSlot.isValid;
  bool get isInFuture => date.isAfter(DateTime.now());

  // Métodos de utilidad
  String get displayTime => timeSlot.displayTime;
  Duration get duration => timeSlot.duration;
}

class TimeSlot {
  final DateTime startTime;
  final DateTime endTime;

  const TimeSlot({
    required this.startTime,
    required this.endTime,
  });

  bool get isValid => endTime.isAfter(startTime);
  Duration get duration => endTime.difference(startTime);

  String get displayTime {
    final start =
        '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
    final end =
        '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';
    return '$start - $end';
  }

  bool overlaps(TimeSlot other) {
    return startTime.isBefore(other.endTime) &&
        endTime.isAfter(other.startTime);
  }
}

enum AvailabilityStatus { available, reserved, blocked, maintenance }
