import 'dart:io';

class BadRequestException implements IOException {
  final dynamic error;

  BadRequestException({this.error});
}
