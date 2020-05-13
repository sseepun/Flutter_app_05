import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home.dart';
import '../utils/style.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;
  bool _remember = false;

  Widget _buildUsernameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username / Email',
          style: inputLabelStyle,
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your username or email';
              } else {
                _username = value;
              }
              return null;
            },
            keyboardType: TextInputType.text,
            style: inputTextStyle,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your username or email',
              hintStyle: inputHintStyle,
              contentPadding: EdgeInsets.fromLTRB(0, 17, 0, 17),
              border: inputBorderStyle,
              enabledBorder: inputEnabledBorderStyle,
              focusedBorder: inputFocusedBorderStyle,
              errorStyle: inputErrorStyle,
              errorBorder: inputErrorBorderStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: inputLabelStyle,
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              } else {
                _password = value;
              }
              return null;
            },
            obscureText: true,
            style: inputTextStyle,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your password',
              hintStyle: inputHintStyle,
              contentPadding: EdgeInsets.fromLTRB(0, 17, 0, 17),
              border: inputBorderStyle,
              enabledBorder: inputEnabledBorderStyle,
              focusedBorder: inputFocusedBorderStyle,
              errorStyle: inputErrorStyle,
              errorBorder: inputErrorBorderStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot password'), 
        child: Text(
          'Forgot password',
          style: inputLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      child: Row(
        children: <Widget>[

          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              value: _remember,
              checkColor: Colors.green,
              activeColor: Colors.white, 
              onChanged: (bool value) {
                setState(() {
                  _remember = value;
                });
              },
            ),
          ),

          Text(
            'Remember me',
            style: inputLabelStyle,
          ),

        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
            print(_username);
            print(_password);
            print(_remember);

            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              )
            );
          }
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Text(
          'SIGN IN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.65, 0.9],
          colors: [
            Color(0xFF3594DD),
            Color(0xFF4563DB),
            Color(0xFF5036D5),
            Color(0xFF5B16D0),
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 120,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text(
                    'Sign In',
                    style: titleStyle,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
                        _buildUsernameInput(),
                        SizedBox(height: 25,),
                        _buildPasswordInput(),

                        SizedBox(height: 5,),
                        _buildForgotPassword(),

                        _buildRememberMe(),

                        _buildSignInBtn(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
