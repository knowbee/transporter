import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/cubits/complaints/complain_cubit.dart';
import 'package:transporter/data/cubits/complaints/complain_state.dart';
import 'package:transporter/data/enums/complaints_topics.dart';
import 'package:transporter/data/models/complaint.dart';
import 'package:transporter/data/repositories/complain_repository.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/assets/complain_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/custom_button.dart';
import 'package:transporter/widgets/common/input/custom_form_field.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';
import 'package:transporter/widgets/complaints/modals/success_modal.dart';

class ComplainScreen extends StatelessWidget {
  const ComplainScreen({super.key});
  static const routeName = '/home/complain';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthCubit(userRepository: context.read<UserRepository>())
                ..checkAuthState(),
        ),
        BlocProvider(
          create: (context) => ComplaintCubit(
            complaintRepository: context.read<ComplaintRepository>(),
            userRepository: context.read<UserRepository>(),
          )..loadComplaints(),
        ),
      ],
      child: const ComplainView(),
    );
  }
}

class ComplainView extends StatelessWidget {
  const ComplainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
          hasTitle: true,
          title: Strings.of(context).menu_complain_label,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: Dimensions.marginDefault,
        ),
        child: ComplainContent(),
      ),
    );
  }
}

class ComplainContent extends StatefulWidget {
  const ComplainContent({super.key});

  @override
  _ComplainContentState createState() => _ComplainContentState();
}

class _ComplainContentState extends State<ComplainContent> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedTopic = ComplaintsTopics.values.first.label;
  final _complaintController = TextEditingController();
  bool _isEditing = false;
  int _selectedComplaintIndex = -1;
  Complaint? _selectedComplaint;

  @override
  void initState() {
    super.initState();
    checkAuthState();
    loadComplaints();
  }

  Future<void> loadComplaints() async {
    final complaintCubit = context.read<ComplaintCubit>();
    await complaintCubit.loadComplaints();
  }

  Future<void> checkAuthState() async {
    final authCubit = context.read<AuthCubit>();
    await authCubit.checkAuthState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildDropdown(),
          const SizedBox(height: Dimensions.marginDefault),
          _buildComplaintField(),
          const SizedBox(height: Dimensions.marginDefault),
          _buildSubmitButton(),
          const SizedBox(height: 48),
          Text(
            Strings.of(context).complain_recent_reviews_heading,
            style: Styles.mediumBlackText,
          ),
          const SizedBox(height: Dimensions.marginDefault),
          Expanded(
            child: BlocBuilder<ComplaintCubit, ComplaintState>(
              builder: (context, state) {
                if (state is ComplaintLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.tGreen,
                    ),
                  );
                } else if (state is ComplaintLoaded) {
                  if (state.complaints.isEmpty) {
                    return Center(
                      child: Text(
                        Strings.of(context).complaints_not_found_message,
                        style: Styles.smallBlackTitle,
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.complaints.length,
                    itemBuilder: (context, index) => _buildReviewItem(
                      complaint: state.complaints[index],
                      index: index,
                    ),
                  );
                } else if (state is ComplaintFailure) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                return Center(
                  child: Text(Strings.of(context).complaints_not_found_message),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      value: _selectedTopic,
      icon: SvgPicture.asset(
        ComplainAssets.dropdownIcon,
      ),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGreen),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
      ),
      items: [
        ...ComplaintsTopics.values.map(
          (topic) => DropdownMenuItem(
            value: topic.label,
            child: Text(topic.label),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _selectedTopic = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).complain_topic_validation_error;
        }
        return null;
      },
    );
  }

  Widget _buildComplaintField() {
    return TFormField(
      fieldType: FieldType.textArea,
      labelText: Strings.of(context).complain_text_area_placeholder,
      labelStyle: Styles.regularGreyParagraph,
      validator: (value) {
        if (value == null || value.length < 10) {
          return Strings.of(context)
              .complain_text_area_placeholder_validation_error;
        }
        return null;
      },
      controller: _complaintController,
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            final complaintCubit = context.read<ComplaintCubit>();
            final authState = context.read<AuthCubit>().state;
            final complainState = context.read<ComplaintCubit>().state;
            if (authState is Authenticated) {
              final userEmail = authState.user.email;

              final topic = _selectedTopic!;
              final text = _complaintController.text;

              if (_isEditing) {
                final complaint = _selectedComplaint;
                complaint!.topic = topic;
                complaint.text = text;
                await complaintCubit.updateComplaint(
                  _selectedComplaintIndex,
                  complaint,
                );
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SuccessDialog(
                      message:
                          Strings.of(context).complain_updated_success_message,
                    );
                  },
                );
              } else {
                await complaintCubit.addComplaint(topic, text, userEmail);
                if (complainState is ComplaintLoaded) {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const SuccessDialog();
                    },
                  );
                }
              }

              _formKey.currentState?.reset();
              setState(() {
                _selectedTopic = ComplaintsTopics.values.first.label;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    Strings.of(context).auth_user_is_not_authenticated,
                  ),
                ),
              );
            }
          }
        },
        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
        title: Strings.current.submit_button_label,
      ),
    );
  }

  Widget _buildReviewItem({required Complaint complaint, required int index}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.marginDefault),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.marginSmall),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(Dimensions.marginSmall),
          title: Text(
            complaint.topic,
            style: Styles.smallBlackTitle,
          ),
          subtitle: Text(
            complaint.text,
            style: Styles.smallParagraphBlack,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      _complaintController.text = complaint.text;
                      _selectedTopic = complaint.topic;
                      setState(() {
                        _isEditing = true;
                        _selectedComplaintIndex = index;
                        _selectedComplaint = complaint;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.marginSmall),
                      child: SvgPicture.asset(
                        ComplainAssets.editIcon,
                      ),
                    ),
                  ),
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () async {
                      await context.read<ComplaintCubit>().deleteComplaint(
                            index,
                          );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.marginSmall),
                      child: SvgPicture.asset(
                        ComplainAssets.deleteIcon,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.marginSmall,
                ),
                child: Text(
                  '${complaint.timestamp.hour}:${complaint.timestamp.minute}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
