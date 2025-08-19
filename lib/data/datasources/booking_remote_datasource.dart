abstract class BookingRemoteDatasource {
  Future<String> getAvailability();
}

class BookingRemoteDatasourceImpl implements BookingRemoteDatasource {
  @override
  Future<String> getAvailability() {
    throw UnimplementedError();
  }
}
