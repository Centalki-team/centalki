import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/text_fields/text_field.dart';
import '../../../../../gen/assets.gen.dart';
import '../blocs/forgot_password_bloc/forgot_password_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoadingState) {
          LoadingManager.setLoading(true, context);
        } else {
          LoadingManager.setLoading(false, context);
          if (state is ForgotPasswordLoadDoneState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is ForgotPasswordLoadErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        }
      },
      listenWhen: (previous, current) => previous != current,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.asset(
                  Assets.illustration.resetPassword.path,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: spaceBetweenLine12,
              ),
              Text(
                'Your email used to sign in Centalki',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(
                height: spaceBetweenLine20,
              ),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppOutlinedTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        errorText: (state is ForgotPasswordValidateState &&
                                state.emailError.isNotEmpty)
                            ? state.emailError
                            : null,
                        onChanged: (value) => context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordValidateEvent(email: value)),
                      ),
                      const SizedBox(
                        height: spaceBetweenLine20,
                      ),
                      AppFilledButton(
                        text: 'Reset Password',
                        onPressed: (state is ForgotPasswordValidateState &&
                                !state.forceDisabled)
                            ? () => context.read<ForgotPasswordBloc>().add(
                                ForgotPasswordSendEvent(
                                    email: _emailController.text))
                            : null,
                        minimumSize: const Size.fromHeight(48),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: spaceBetweenLine12,
              ),
              AppOutlinedButton(
                onPressed: Navigator.of(context).pop,
                text: 'Return Sign In',
                minimumSize: const Size.fromHeight(48),
              ),
              const SizedBox(
                height: bigSpacing20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
