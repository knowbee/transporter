import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});
  static const routeName = '/authentication/set-new-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          titleText: Strings.of(context).header_back_label,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: SizedBox.expand(
          child: Column(
            children: [
              Text(
                Strings.of(context).set_new_password_heading,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                Strings.of(context).set_new_password_subheading,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              const NewPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  _NewPasswordFormState createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final formHeight = MediaQuery.of(context).size.height * 0.6;
    return SizedBox(
      height: formHeight,
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            _buildNewPasswordField(),
            const SizedBox(height: 16),
            _buildConfirmPasswordField(),
            _buildPasswordRuleLabel(),
            const SizedBox(height: 24),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.of(context).new_password_label,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            color: AppColors.greyIconColor,
            _isNewPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _isNewPasswordObscured = !_isNewPasswordObscured;
            });
          },
        ),
      ),
      obscureText: _isNewPasswordObscured,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).new_password_validation;
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.of(context).confirm_password_label,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            color: AppColors.greyIconColor,
            _isConfirmPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
            });
          },
        ),
      ),
      obscureText: _isConfirmPasswordObscured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).confirm_password_validation;
        }
        return null;
      },
    );
  }

  Widget _buildPasswordRuleLabel() {
    return Text(
      Strings.of(context).confirm_password_rule_validation,
      style: const TextStyle(
        color: Color(0xFFA5A5A5),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.push(
            context,
            MaterialPageRoute<Material>(
              builder: (context) => const SignInScreen(),
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
        Strings.of(context).save_button_label,
        style: Styles.normalWhiteTextStyle,
      ),
    );
  }
}
