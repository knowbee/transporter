import 'package:bloc/bloc.dart';
import 'package:transporter/data/cubits/complaints/complain_state.dart';
import 'package:transporter/data/models/complaint.dart';
import 'package:transporter/data/repositories/complain_repository.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit({
    required this.complaintRepository,
    required this.userRepository,
  }) : super(ComplaintInitial());
  final ComplaintRepository complaintRepository;
  final UserRepository userRepository;

  Future<void> loadComplaints() async {
    emit(ComplaintLoading());
    try {
      final user = await userRepository.getCurrentUser();
      final complaints =
          await complaintRepository.getComplaints(user?.email ?? '');
      emit(ComplaintLoaded(complaints));
    } catch (e) {
      emit(ComplaintFailure(Strings.current.complaints_failed_to_load));
    }
  }

  Future<void> addComplaint(String topic, String text, String userEmail) async {
    emit(ComplaintLoading());
    try {
      final complaint = Complaint(
        topic: topic,
        text: text,
        timestamp: DateTime.now(),
        userEmail: userEmail,
      );
      await complaintRepository.addComplaint(complaint);
      await loadComplaints();
    } catch (e) {
      emit(ComplaintFailure(Strings.current.complaints_failed_to_add));
    }
  }

  Future<void> updateComplaint(int index, Complaint complaint) async {
    emit(ComplaintLoading());
    try {
      await complaintRepository.updateComplaint(index, complaint);
      await loadComplaints();
    } catch (e) {
      emit(ComplaintFailure(Strings.current.complaints_failed_to_update));
    }
  }

  Future<void> deleteComplaint(int index) async {
    emit(ComplaintLoading());
    try {
      await complaintRepository.deleteComplaint(index);
      await loadComplaints();
    } catch (e) {
      emit(ComplaintFailure(Strings.current.complaints_failed_to_delete));
    }
  }
}
