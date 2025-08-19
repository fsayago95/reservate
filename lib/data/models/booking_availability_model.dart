import 'package:reservate/domain/models/booking_availability.dart';

// Modelo de datos para serialización/deserialización
class AvailabilityModel extends Availability {
  const AvailabilityModel({
    required String id,
    required String amenityId,
    required String amenityName,
    required DateTime date,
    required TimeSlot timeSlot,
    required AvailabilityStatus status,
    required int maxCapacity,
    required int currentBookings,
    double? price,
    String? reservedByUserId,
    required DateTime createdAt,
  }) : super(
          id: id,
          amenityId: amenityId,
          amenityName: amenityName,
          date: date,
          timeSlot: timeSlot,
          status: status,
          maxCapacity: maxCapacity,
          currentBookings: currentBookings,
          price: price,
          reservedByUserId: reservedByUserId,
          createdAt: createdAt,
        );

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      id: json['id'] as String,
      amenityId: json['amenity_id'] as String,
      amenityName: json['amenity_name'] as String,
      date: DateTime.parse(json['date'] as String),
      timeSlot:
          TimeSlotModel.fromJson(json['time_slot'] as Map<String, dynamic>),
      status: AvailabilityStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => AvailabilityStatus.available,
      ),
      maxCapacity: json['max_capacity'] as int,
      currentBookings: json['current_bookings'] as int,
      price: json['price']?.toDouble(),
      reservedByUserId: json['reserved_by_user_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amenity_id': amenityId,
      'amenity_name': amenityName,
      'date': date.toIso8601String(),
      'time_slot': (timeSlot as TimeSlotModel).toJson(),
      'status': status.name,
      'max_capacity': maxCapacity,
      'current_bookings': currentBookings,
      'price': price,
      'reserved_by_user_id': reservedByUserId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Método para crear una copia con cambios
  AvailabilityModel copyWith({
    String? id,
    String? amenityId,
    String? amenityName,
    DateTime? date,
    TimeSlot? timeSlot,
    AvailabilityStatus? status,
    int? maxCapacity,
    int? currentBookings,
    double? price,
    String? reservedByUserId,
    DateTime? createdAt,
  }) {
    return AvailabilityModel(
      id: id ?? this.id,
      amenityId: amenityId ?? this.amenityId,
      amenityName: amenityName ?? this.amenityName,
      date: date ?? this.date,
      timeSlot: timeSlot ?? this.timeSlot,
      status: status ?? this.status,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      currentBookings: currentBookings ?? this.currentBookings,
      price: price ?? this.price,
      reservedByUserId: reservedByUserId ?? this.reservedByUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TimeSlotModel extends TimeSlot {
  const TimeSlotModel({
    required DateTime startTime,
    required DateTime endTime,
  }) : super(startTime: startTime, endTime: endTime);

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) {
    return TimeSlotModel(
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
    };
  }
}
