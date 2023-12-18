import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String name;
  final String address;

  Users(this.name, this.address);
  @override
  List<Object?> get props {
    return [name, address];
  }
}
