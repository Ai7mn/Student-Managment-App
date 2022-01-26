import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String username,
    String name,
    String shopName,
    String phone,
    String address,
    bool agree,
    bool isLogin,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogIn = true;

  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  String _name = '';
  String _shopName = '';
  String _phone = '';
  String _address = '';
  bool _agree = false;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword, _userName, _name,
          _shopName, _phone, _address, _agree, _isLogIn);
      //Used to send auth request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: 100,
          child: Card(
            elevation: 5,
            child: Text(""),
            margin: EdgeInsets.only(top: 60, bottom: 30),
          ),
        ),
        Center(
            child: Container(
              color: Theme.of(context).backgroundColor,
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              key: ValueKey('email'),
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return ('Enter valid Email Address!');
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _userEmail = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "الايميل"  ,
                                  prefixIcon: Padding(
                                    child: IconTheme(
                                      data: IconThemeData(
                                          color: Theme.of(context).primaryColor),
                                      child: Icon(Icons.email),
                                    ),
                                    padding: EdgeInsets.all(5),
                                  )),
                            ),
                          ),
                        ),
                        if (!_isLogIn)
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                key: ValueKey('username'),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return ('Username must be at least 4 characters');
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userName = value;
                                },
                                decoration: InputDecoration(
                                    labelText: 'اسم الدخول حروف إنجليزية',
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Icon(Icons.perm_identity),
                                      ),
                                      padding: EdgeInsets.all(5),
                                    )),
                              ),
                            ),
                          ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              key: ValueKey('password'),
                              validator: (value) {
                                if (value.isEmpty || value.length < 7) {
                                  return ('Password must be  at least 7 characters');
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _userPassword = value;
                              },
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                  prefixIcon: Padding(
                                    child: IconTheme(
                                      data: IconThemeData(
                                          color:
                                          Theme.of(context).primaryColor),
                                      child: Icon(Icons.security),
                                    ),
                                    padding: EdgeInsets.all(5),
                                  )
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        if (!_isLogIn)
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                key: ValueKey('name'),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return ('Username must be at least 4 characters');
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _name = value;
                                },
                                decoration: InputDecoration(
                                    labelText: 'اسم العميل الثلاثي' ,
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                            color:
                                            Theme.of(context).primaryColor),
                                        child: Icon(Icons.person),
                                      ),
                                      padding: EdgeInsets.all(5),
                                    )
                                ),
                              ),
                            ),
                          ),
                        if (!_isLogIn)
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                key: ValueKey('shopName'),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return ('Username must be at least 4 characters');
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _shopName = value;
                                },
                                decoration:
                                    InputDecoration(labelText: 'اسم المحل' ,
                                        prefixIcon: Padding(
                                          child: IconTheme(
                                            data: IconThemeData(
                                                color:
                                                Theme.of(context).primaryColor),
                                            child: Icon(Icons.shop),
                                          ),
                                          padding: EdgeInsets.all(5),
                                        )
                                    ),
                              ),
                            ),
                          ),
                        if (!_isLogIn)
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                key: ValueKey('phoneNumber'),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return ('Username must be at least 4 characters');
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _phone = value;
                                },
                                decoration:
                                    InputDecoration(labelText: 'رقم الهاتف' ,
                                        prefixIcon: Padding(
                                          child: IconTheme(
                                            data: IconThemeData(
                                                color:
                                                Theme.of(context).primaryColor),
                                            child: Icon(Icons.phone),
                                          ),
                                          padding: EdgeInsets.all(5),
                                        )
                                    ),
                              ),
                            ),
                          ),
                        if (!_isLogIn)
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                key: ValueKey('address'),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return ('Username must be at least 4 characters');
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _address = value;
                                },
                                decoration: InputDecoration(labelText: 'العنوان' ,
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                            color:Theme.of(context).primaryColor),
                                        child: Icon(Icons.home),
                                      ),
                                      padding: EdgeInsets.all(5),
                                    )
                                ),
                              ),
                            ),
                          ),
                        if (!_isLogIn)
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Checkbox(
                                    checkColor: Theme.of(context).backgroundColor,
                                    activeColor: Theme.of(context).primaryColor,
                                    key: ValueKey('cbAgree'),
                                    value: _agree,
                                    onChanged: (val) {
                                      setState(() => _agree = val);
                                    },
                                  ),
                                ),
                                Text(
                                  'أنا اوافق على جميع الشروط وتعليمات إستخدام النظام',
                                  style: TextStyle(fontSize: 13.0 , color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 12,
                        ),
                        if (widget.isLoading) CircularProgressIndicator(),
                        if (!widget.isLoading)
                          RaisedButton(
                            child: Text(_isLogIn ? ' تسجيل الدخول' : 'التسجيل'),
                            onPressed: _trySubmit,
                          ),
                        if (!widget.isLoading)
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text(_isLogIn
                                ? 'تسجيل حساب جديد'
                                : ' أمتلك حساب الذهاب لتسحيل الدخول ' , style: TextStyle(color: Theme.of(context).primaryColor)),
                            onPressed: () {
                              setState(() {
                                _isLogIn = !_isLogIn;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
        ),
      ],
    );
  }
}
