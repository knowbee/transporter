import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/screens/home.dart';
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
          titleText: Strings.of(context).header_back_label,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: SignInForm(),
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
      child: ListView(
        children: [
          Text(
            Strings.of(context).signin_heading,
            style: const TextStyle(
              color: Color(0xFF414141),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
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
        border: const OutlineInputBorder(),
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
        border: const OutlineInputBorder(),
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
            style: const TextStyle(
              color: AppColors.tRed,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return ElevatedButton(
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
        style: Styles.normalWhiteTextStyle,
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
            style: const TextStyle(
              color: AppColors.tGreen,
              fontWeight: FontWeight.bold,
            ),
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
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Strings.of(context).or_separator,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
