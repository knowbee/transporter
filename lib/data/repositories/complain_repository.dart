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

  Future<List<Complaint>> getComplaints(String userEmail) async {
    return complaintBox.values
        .where((complaint) => complaint.userEmail == userEmail)
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<void> updateComplaint(int index, Complaint complaint) async {
    await complaintBox.putAt(index, complaint);
  }

  Future<void> deleteComplaint(int index) async {
    await complaintBox.deleteAt(index);
  }
}
