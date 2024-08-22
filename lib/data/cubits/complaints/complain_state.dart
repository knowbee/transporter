import 'package:equatable/equatable.dart';
import 'package:transporter/data/models/complaint.dart';

abstract class ComplaintState extends Equatable {
  const ComplaintState();

  @override
  List<Object?> get props => [];
}

class ComplaintInitial extends ComplaintState {}

class ComplaintLoading extends ComplaintState {}

class ComplaintLoaded extends ComplaintState {
  const ComplaintLoaded(this.complaints);
  final List<Complaint> complaints;

  @override
  List<Object?> get props => [complaints];
}

class ComplaintFailure extends ComplaintState {
  const ComplaintFailure(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
