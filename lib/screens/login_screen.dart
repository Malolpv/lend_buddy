import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lend_buddy/main.dart';
import 'package:lend_buddy/screens/createaccount_screen.dart';
import 'package:lend_buddy/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  
  String? _email = '';
  String? _password = '';
  bool _isSecret = true;
  
  //TODO LA CONNEXION DOIT SET L ID USER
  final idUser = 1;

  @override
  Widget build(BuildContext context) {
    final password = _password;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lend Buddy'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text( 
                  'login'.toUpperCase()
                  ),
                const SizedBox( height: 10.0),
                const Text('Sign in to your Account'),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox( height: 20.0,),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) => value!.isEmpty || !emailRegex.hasMatch(value) ? 'Please enter a valid email' : null,
                        decoration: InputDecoration(
                          hintText: 'Ex: michel.renard@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder (
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          )
                        ),
                      ),
                      const SizedBox( height: 8.0,),
                      TextFormField(
                        onChanged: (value) => setState(() => _password = value),
                        validator: (value) => value != null && value.length < 6 ? 'Enter a password. 6 caracters min required.' : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(() => _isSecret = !_isSecret),
                            child: Icon(
                              !_isSecret ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder (
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          )
                        ),
                      ),
                      const SizedBox( height: 8.0,),
                      ElevatedButton(
                        onPressed: !emailRegex.hasMatch(_email!) || password != null && password.length < 6 ? null : () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(userId: idUser)));
                        },
                        child: 
                          const Text(
                            'Login'
                          )
                      ),
                    ],
                  )
                ),
                
                const SizedBox( height: 100.0),
                const Text("Don't have account ?"),
                const SizedBox( height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountScreen()));
                  },
                  child: 
                    const Text(
                      'Create Account'
                    )
                  ),
              ],
            ),
          ),
        ),
      )
    );
  }
}