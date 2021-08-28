import 'package:flutter/material.dart';

class CodiumLoginPage extends StatelessWidget {
  const CodiumLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyleError = TextStyle(fontSize: 14, color: Colors.red);
    TextStyle textStyle = TextStyle(fontSize: 14, color: Colors.blueGrey[800]);
    TextStyle hintTextStyle =
        TextStyle(fontSize: 14, color: Colors.blueGrey[200]);

    String username = 'CODIUM';
    String password = 'CODIUM';

    String textError = '';

    String usernameInput = '';
    String passwordInput = '';

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/codiumlogo.png'),
              TextField(
                onChanged: (text) {
                  if (text.isNotEmpty || text != '') {
                    usernameInput = text;
                  }
                },
                keyboardType: TextInputType.text,
                cursorColor: Colors.blueGrey,
                style: textStyle,
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  isCollapsed: true,
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: textStyleError,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  labelStyle: textStyle,
                  hintStyle: hintTextStyle,
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (text) {
                  if (text.isNotEmpty || text != '') {
                    passwordInput = text;
                  }
                },
                keyboardType: TextInputType.text,
                cursorColor: Colors.blueGrey,
                style: textStyle,
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                obscuringCharacter: "*",
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  isCollapsed: true,
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: textStyleError,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  labelStyle: textStyle,
                  hintStyle: hintTextStyle,
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                      elevation: MaterialStateProperty.all(0.0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xff7D86A2),
                            width: 1,
                          ),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (usernameInput == username && passwordInput == password) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BlankPage()));
                      } else {
                        if (usernameInput != username) {
                          textError = 'Username not correct';
                        }
                        if (passwordInput != password) {
                          textError = 'Password not correct';
                        }
                        if (usernameInput != username &&
                            passwordInput != password) {
                          textError = 'Username and Password not correct';
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              elevation: 0,
                              title: Text('error'),
                              content: Text('$textError'),
                            );
                          },
                        );
                      }
                    },
                    child: Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('successfully'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
          )),
    );
  }
}
