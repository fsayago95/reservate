import 'package:reservate/domain/models/booking.dart';

// Modelo de datos para serialización/deserialización
class BookingModel extends Booking {
  const BookingModel({
    required String id,
    required String userId,
    required String amenityId,
    required String amenityName,
    required DateTime bookingDate,
    required TimeSlot timeSlot,
    required BookingStatus status,
    required int quantity,
    required String comments,
    double? totalPrice,
    required DateTime createdAt,
    DateTime? confirmedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
  }) : super(
          id: id,
          userId: userId,
          amenityId: amenityId,
          amenityName: amenityName,
          bookingDate: bookingDate,
          timeSlot: timeSlot,
          status: status,
          quantity: quantity,
          comments: comments,
          totalPrice: totalPrice,
          createdAt: createdAt,
          confirmedAt: confirmedAt,
          cancelledAt: cancelledAt,
          cancellationReason: cancellationReason,
        );

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      amenityId: json['amenity_id'] as String,
      amenityName: json['amenity_name'] as String,
      bookingDate: DateTime.parse(json['booking_date'] as String),
      timeSlot:
          TimeSlotModel.fromJson(json['time_slot'] as Map<String, dynamic>),
      status: BookingStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => BookingStatus.pending,
      ),
      quantity: json['quantity'] as int,
      comments: json['comments'] as String,
      totalPrice: json['total_price']?.toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      confirmedAt: json['confirmed_at'] != null
          ? DateTime.parse(json['confirmed_at'] as String)
          : null,
      cancelledAt: json['cancelled_at'] != null
          ? DateTime.parse(json['cancelled_at'] as String)
          : null,
      cancellationReason: json['cancellation_reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'amenity_id': amenityId,
      'amenity_name': amenityName,
      'booking_date': bookingDate.toIso8601String(),
      'time_slot': (timeSlot as TimeSlotModel).toJson(),
      'status': status.name,
      'quantity': quantity,
      'comments': comments,
      'total_price': totalPrice,
      'created_at': createdAt.toIso8601String(),
      'confirmed_at': confirmedAt?.toIso8601String(),
      'cancelled_at': cancelledAt?.toIso8601String(),
      'cancellation_reason': cancellationReason,
    };
  }

  // Método para crear una copia con cambios
  BookingModel copyWith({
    String? id,
    String? userId,
    String? amenityId,
    String? amenityName,
    DateTime? bookingDate,
    TimeSlot? timeSlot,
    BookingStatus? status,
    int? quantity,
    String? comments,
    double? totalPrice,
    DateTime? createdAt,
    DateTime? confirmedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
  }) {
    return BookingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amenityId: amenityId ?? this.amenityId,
      amenityName: amenityName ?? this.amenityName,
      bookingDate: bookingDate ?? this.bookingDate,
      timeSlot: timeSlot ?? this.timeSlot,
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      comments: comments ?? this.comments,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
    );
  }
}

class TimeSlotModel extends TimeSlot {
  const TimeSlotModel({
    required super.startTime,
    required super.endTime,
  });

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
