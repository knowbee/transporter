import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/Tbutton.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});
  static const routeName = '/authentication/set-new-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(userRepository: context.read<UserRepository>())
        ..checkAuthState(),
      child: const SetNewPasswordView(),
    );
  }
}

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

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
        child: SetNewPasswordForm(),
      ),
    );
  }
}

class SetNewPasswordForm extends StatelessWidget {
  const SetNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: SizedBox.expand(
        child: Column(
          children: [
            Text(
              Strings.of(context).set_new_password_heading,
              style: Styles.mediumBlackTitle,
            ),
            const SizedBox(height: 8),
            Text(
              Strings.of(context).set_new_password_subheading,
              style: Styles.regularGreyParagraph,
            ),
            const SizedBox(height: 24),
            const NewPasswordForm(),
          ],
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
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formHeight = MediaQuery.of(context).size.height * 0.6;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {},
      child: SizedBox(
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
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return TextFormField(
      controller: _newPasswordController,
      decoration: InputDecoration(
        labelText: Strings.of(context).new_password_label,
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
      controller: _confirmPasswordController,
      decoration: InputDecoration(
        labelText: Strings.of(context).confirm_password_label,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        Strings.of(context).confirm_password_rule_validation,
        style: Styles.mediumHintText,
      ),
    );
  }

  Widget _buildSaveButton() {
    return TButton(
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
          await context.read<AuthCubit>().setNewPassword(
                _newPasswordController.text,
              );
          if (context.read<AuthCubit>().state is AuthenticationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  Strings.of(context).invalid_password_message,
                  style: Styles.mediumWhiteText,
                ),
                backgroundColor: AppColors.tRed,
              ),
            );
          } else {
            await Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SignInScreen(),
              ),
            );
          }
        }
      },
      title: Strings.of(context).save_button_label,
    );
  }
}
