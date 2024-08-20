import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transporter/data/enums/complaints_topics.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/assets/complain_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';
import 'package:transporter/widgets/complaints/modals/success_modal.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key});

  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedTopic = ComplaintsTopics.values.first.label;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildDropdown(),
              const SizedBox(height: 16),
              _buildComplaintField(),
              const SizedBox(height: 16),
              _buildSubmitButton(),
              const SizedBox(height: 48),
              Text(
                Strings.of(context).complain_recent_reviews_heading,
                style: Styles.mediumBlackText,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Update this count as needed
                  itemBuilder: (context, index) => _buildReviewItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
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
    return TextFormField(
      decoration: InputDecoration(
        hintText: Strings.of(context).complain_text_area_placeholder,
        hintStyle: Styles.textAreaHintStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGreen),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
        ),
      ),
      maxLines: 5,
      minLines: 1,
      validator: (value) {
        if (value == null || value.length < 10) {
          return Strings.of(context)
              .complain_text_area_placeholder_validation_error;
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            //TODO: Submit the complaint

            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return const SuccessDialog();
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.marginDefault,
          ),
          backgroundColor: AppColors.tGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          ),
        ),
        child: Text(
          Strings.current.submit_button_label,
          style: Styles.mediumWhiteText,
        ),
      ),
    );
  }

  Widget _buildReviewItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: ListTile(
          title: const Text('Vehicle Arrived late'),
          subtitle: const Text(
            'The driver arrived late and I missed my trip',
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        ComplainAssets.editIcon,
                      ),
                    ),
                  ),
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        ComplainAssets.deleteIcon,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('09:24'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
