import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0;

  while (true) {
    await Future.delayed(Duration(seconds: 1));
    currentPrice += random.nextDouble() * 4 - 2;
    // throw 'Network exception: Internet is not working';
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
