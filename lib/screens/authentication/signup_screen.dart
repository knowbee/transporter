import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/screens/authentication/verify_otp_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/assets/authentication_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = '/authentication/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
        ),
      ),
      body: const ResponsiveLayout(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SignUpForm(),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  Country _selectedCountry = Country(
    phoneCode: '880',
    countryCode: 'BD',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Bangladesh',
    example: 'Bangladesh',
    displayName: 'Bangladesh',
    displayNameNoCountryCode: 'BD',
    e164Key: '',
  );
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            Strings.of(context).signup_heading,
            style: Styles.mediumBlackTitle,
          ),
          const SizedBox(height: 30),
          _buildNameField(),
          const SizedBox(height: 16),
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPhoneField(),
          const SizedBox(height: 16),
          _buildGenderField(),
          const SizedBox(height: 16),
          _buildTermsAndConditions(),
          const SizedBox(height: 16),
          _buildSignUpButton(),
          const SizedBox(height: 24),
          _buildOrDivider(),
          const SizedBox(height: 50),
          _buildSignInPrompt(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.of(context).signup_name_field_label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tLightGrey),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).signup_name_validation_label;
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.of(context).signup_email_field_label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).signup_email_validation_label;
        }
        return null;
      },
    );
  }

  Widget _buildPhoneField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.tGrey),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(_selectedCountry.flagEmoji),
                  SvgPicture.asset(
                    AuthenticationAssets.downArrow,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '+${_selectedCountry.phoneCode}',
              style: Styles.countryCodeTextStyle,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: Strings.of(context).signup_phone_field_label,
                hintStyle: Styles.inputLabelStyle,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: Strings.of(context).signup_gender_field_label,
        border: const OutlineInputBorder(),
      ),
      items: ['Male', 'Female', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {},
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AuthenticationAssets.checkBox,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: Strings.of(context).signup_terms_conditions_1,
              style: Styles.smallParagraphBlack,
              children: [
                TextSpan(
                  text: Strings.of(context).signup_terms_conditions_2,
                  style: Styles.smallParagraphLightGreen,
                ),
                TextSpan(
                  text: Strings.of(context).signup_terms_conditions_3,
                  style: Styles.smallParagraphBlack,
                ),
                TextSpan(
                  text: Strings.of(context).signup_terms_conditions_4,
                  style: Styles.smallParagraphLightGreen,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        key: const Key('signup_button'),
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const VerificationScreen(),
              ),
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
          Strings.of(context).signup_button_label,
          style: Styles.mediumWhiteText,
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.greyIconColor,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Strings.of(context).or_separator,
              style: Styles.orSeparatorTextStyle,
            ),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.greyIconColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.of(context).signup_already_have_account_label,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: Text(
            Strings.of(context).signin_label,
            style: Styles.normalGreenTextStyle,
          ),
        ),
      ],
    );
  }
}
