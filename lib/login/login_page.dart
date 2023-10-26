import 'package:first_flutter_project/login/register_page.dart';
import 'package:first_flutter_project/task_cards/task_cards_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusNodePassword = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return _createLoginPage(context);
  }

  Scaffold _createLoginPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 60),
              _usernameField(),
              const SizedBox(
                height: 10,
              ),
              _passwordField(),
              const SizedBox(height: 60),
              Column(
                children: [
                  _loginButton(context),
                  _sigupRow(context),
                ],
              ),
            ],
          ),
        ),
      ),
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
        onEditingComplete: () => _focusNodePassword.requestFocus(),
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

  TextFormField _passwordField() {
    return TextFormField(
      controller: _passwordController,
      focusNode: _focusNodePassword,
      obscureText: _hidePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(Icons.password_outlined),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            icon: _hidePassword
                ? const Icon(Icons.visibility_outlined)
                : const Icon(Icons.visibility_off_outlined)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Enter the password';
        }
        //TODO: Adicionar lógica de validação com o dado na base de dados
        else {
          return null;
        }
      },
    );
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (newContext) {
                return const TaskCardsPage();
              },
            ),
          );
        }
      },
      child: const Text("Login"),
    );
  }

  Row _sigupRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            _formKey.currentState?.reset();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (newContext) {
                  return const RegisterPage();
                },
              ),
            );
          },
          child: const Text("Signup"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
