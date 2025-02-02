import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/helpers/form_fields_validator.dart';
import 'package:transporter/screens/authentication/signin_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/custom_button.dart';
import 'package:transporter/widgets/common/input/custom_form_field.dart';
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
              const SizedBox(height: 24),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return TFormField(
      fieldType: FieldType.password,
      labelText: Strings.of(context).new_password_label,
      labelStyle: Styles.regularGreyParagraph,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Dimensions.marginDefault,
        horizontal: Dimensions.marginDefault,
      ),
      isObscured: _isNewPasswordObscured,
      hasSuffixIcon: true,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).new_password_validation;
        }
        return null;
      },
      controller: _newPasswordController,
    );
  }

  Widget _buildConfirmPasswordField() {
    return TFormField(
      fieldType: FieldType.password,
      labelText: Strings.of(context).confirm_password_label,
      labelStyle: Styles.regularGreyParagraph,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Dimensions.marginDefault,
        horizontal: Dimensions.marginDefault,
      ),
      isObscured: _isConfirmPasswordObscured,
      hasSuffixIcon: true,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).confirm_password_validation;
        } else if (!isValidPassword(value)) {
          return Strings.of(context).confirm_password_rule_validation;
        }
        return null;
      },
      controller: _confirmPasswordController,
    );
  }

  Widget _buildSaveButton() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return TButton(
          key: const Key('new-password-save-button'),
          isLoading: state is Loading,
          onPressed: () async {
            if (_formKey.currentState?.validate() ?? false) {
              if (_newPasswordController.text !=
                  _confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      Strings.of(context).password_mismatch_message,
                      style: Styles.mediumWhiteText,
                    ),
                    backgroundColor: AppColors.tRed,
                  ),
                );
                return;
              }
              await context.read<AuthCubit>().setNewPassword(
                    password: _newPasswordController.text,
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      Strings.of(context).password_set_success_message,
                      style: Styles.mediumWhiteText,
                    ),
                    backgroundColor: AppColors.tGreen,
                  ),
                );
                await Future<void>.delayed(
                  const Duration(milliseconds: 200),
                );

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
      },
    );
  }
}
