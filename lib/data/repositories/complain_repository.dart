import 'package:hive/hive.dart';
import 'package:transporter/data/models/complaint.dart';

class ComplaintRepository {
  ComplaintRepository({
    required this.complaintBox,
  });
  final Box<Complaint> complaintBox;

  Future<void> addComplaint(Complaint complaint) async {
    await complaintBox.add(complaint);
  }

  Future<List<Complaint>> getComplaints() async {
    return complaintBox.values.toList();
  }

  Future<void> updateComplaint(int index, Complaint complaint) async {
    await complaintBox.putAt(index, complaint);
  }

  Future<void> deleteComplaint(int index) async {
    await complaintBox.deleteAt(index);
  }
}
