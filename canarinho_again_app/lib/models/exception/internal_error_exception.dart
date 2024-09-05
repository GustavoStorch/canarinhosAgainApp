import 'dart:io';

class InternalErrorException implements IOException {
  final dynamic error;

  InternalErrorException({this.error});
}
