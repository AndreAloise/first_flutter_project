import 'package:first_flutter_project/login/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();

  bool _hidePassword = true;
  bool _hideConfirmationPassword = true;

  @override
  Widget build(BuildContext context) {
    return _createRegisterPage(context);
  }

  Scaffold _createRegisterPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create your account',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 35,
                ),
                _usernameField(),
                const SizedBox(
                  height: 10,
                ),
                _emailField(),
                const SizedBox(
                  height: 10,
                ),
                _passwordField(),
                const SizedBox(
                  height: 10,
                ),
                _confirmPasswordField(),
                const SizedBox(
                  height: 50,
                ),
                _buttonToLogin(),
              ],
            ),
          )),
    );
  }

  TextFormField _usernameField() {
    return TextFormField(
        controller: _usernameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Username',
          prefixIcon: const Icon(Icons.person_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onEditingComplete: () => _focusNodeEmail.requestFocus(),
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Enter a valid username';
          }
          //TODO: Adicionar lógica de validação com o dado na base de dados
          else {
            return null;
          }
        });
  }

  TextFormField _emailField() {
    return TextFormField(
        controller: _emailController,
        focusNode: _focusNodeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'E-mail',
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onEditingComplete: () => _focusNodePassword.requestFocus(),
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Enter a valid e-mail';
          }
          //TODO: Adicionar lógica de validação com o dado na base de dados
          else {
            return null;
          }
        });
  }

  TextFormField _passwordField() {
    return TextFormField(
        controller: _passwordController,
        focusNode: _focusNodePassword,
        obscureText: _hidePassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: const Icon(Icons.password_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
              icon: _hidePassword
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined)),
        ),
        onEditingComplete: () => _focusNodeConfirmPassword.requestFocus(),
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Enter a valid password';
          } else {
            if (value.length < 8) {
              return 'The password must contain at least 8 characters';
            }
            return null;
          }
        });
  }

  TextFormField _confirmPasswordField() {
    return TextFormField(
        controller: _confirmPasswordController,
        focusNode: _focusNodeConfirmPassword,
        obscureText: _hideConfirmationPassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: const Icon(Icons.password_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hideConfirmationPassword = !_hideConfirmationPassword;
                });
              },
              icon: _hideConfirmationPassword
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined)),
        ),
        onEditingComplete: () => _focusNodeConfirmPassword.requestFocus(),
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Enter a valid password';
          } else {
            if (value != _passwordController.text) {
              return 'Password doesn\'t match.';
            }
            return null;
          }
        });
  }

  Column _buttonToLogin() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              //TODO: Adicionar lógica de validação com o dado na base de dados

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  width: 200,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  behavior: SnackBarBehavior.floating,
                  content: const Text("Registered Successfully"),
                ),
              );

              _formKey.currentState?.reset();

              Navigator.pop(context);
            }
          },
          child: const Text("Register"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            TextButton(
              onPressed: () {
                _formKey.currentState?.reset();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (newContext) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ],
    );
  }
}
