/*
    Created by: Bakhromjon Polat
    Created at: Oct 06 2022 17:40:25

    Github: https://github.com/BahromjonPolat
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: To print log on console

*/

import 'dart:developer' as dev;


extension Log on Object? {
  log({String name = '', Object? error}) {
    dev.log(
      toString(),
      name: name,
      error: error,
      time: DateTime.now(),
    );
  }

  printf([String name = '']) {
    String text =
        '\x1B[94m$date: \x1B[93m${name.toUpperCase()} => \x1B[96m${toString()}\x1B[0m';
    print(text);
  }

  error([String name = '']) {
    name = name.isNotEmpty ? '"$name => "' : '';
    String text =
        '\x1B[91m$date: \x1B[93m${name.toUpperCase()} \x1B[91m${toString()}\x1B[0m';
    print(text);
  }

  String get date {
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}:${now.second}';
  }
}
