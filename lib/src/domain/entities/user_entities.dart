import 'package:equatable/equatable.dart';

class UserEntities implements Equatable {
  final bool? accountComplete;
  final bool? active;
  final String? uid;
  final int? typUser;//1: Usuario servidor; 2:Usuario cliente

  UserEntities({
    this.accountComplete,
    this.active,
    this.uid,
    this.typUser
  });

  @override
  List<Object?> get props => [
        accountComplete,
        active,
        uid,
        typUser,

      ];

  @override
  bool? get stringify => true;
}
