import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                    'images/logo.png',
                    width: 325,
                    height: 250
                ),
                Text(
                    'Spotify',
                    style: Theme.of(context).textTheme.headline1
                ),
                Text(
                    'Play your music',
                    style: Theme.of(context).textTheme.headline2
                )
              ],
            ),
            MaterialButton(
              elevation: 10.0,
              minWidth: 310.0,
              height: 65.0,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: const Text(
                'Reproducir',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              ),
              onPressed: () { },
            )
          ],
        ),
      ),
    );
  }
}