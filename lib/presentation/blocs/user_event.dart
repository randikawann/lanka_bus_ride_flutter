import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUser extends UserEvent {}
