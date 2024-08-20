import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/screens/home.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = '/authentication/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
        ),
      ),
      body: const ResponsiveLayout(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SignInForm(),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            Strings.of(context).signin_heading,
            style: Styles.mediumBlackTitle,
          ),
          const SizedBox(height: 30),
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          _buildForgotPasswordButton(),
          const SizedBox(height: 24),
          _buildSignInButton(),
          const SizedBox(height: 24),
          _buildOrDivider(),
          const SizedBox(height: 50),
          _buildSignUpPrompt(),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.of(context).signin_password_label,
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
        suffixIcon: IconButton(
          icon: Icon(
            color: AppColors.greyIconColor,
            _isObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
      obscureText: _isObscured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).signin_password_validation_label;
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.of(context).signin_email_or_phone,
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
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).signin_validation_email_or_phone;
        }
        return null;
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SetNewPasswordScreen(),
              ),
            );
          },
          child: Text(
            Strings.of(context).signin_forgot_password_label,
            style: Styles.mediumRedHintText,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const HomePage(),
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
          Strings.of(context).signin_label,
          style: Styles.mediumWhiteText,
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.of(context).signin_dont_have_account_label),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            Strings.of(context).signup_button_label,
            style: Styles.normalGreenTextStyle,
          ),
        ),
      ],
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
}
