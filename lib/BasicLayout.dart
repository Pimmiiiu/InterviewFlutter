import 'dart:ffi';

import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle fontTheme = TextStyle(
        fontSize: 14,
        color: Colors.white
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Codium Test'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  color: Colors.green,
                  child: Text('LOGO',style: fontTheme),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(4),
                    color: Colors.red,
                    child: Text('TOP MENU',style: fontTheme),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(4),
                    color: Colors.blue[900],
                    child: Text('LEFT MENU',style: fontTheme),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          color: Colors.brown[900],
                          child: Text('HEADER',style: fontTheme),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(4),
                              color: Colors.blueGrey[400],
                              child: Text('CONTENT',style: fontTheme),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                color: Colors.grey,
                                child: Text('DETAIL',style: fontTheme),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
