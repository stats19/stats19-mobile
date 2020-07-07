import 'package:flutter/material.dart';

LinearGradient notyetLinearGradient() {
  return LinearGradient(
    colors: [Colors.black, Colors.white, Colors.black],
    begin: Alignment.centerLeft,
    stops: [
      0.49,
      0.50,
      0.51
    ],
    end: Alignment.centerRight,
  );
}

LinearGradient drawLinearGradient() {
  return LinearGradient(
    colors: [Colors.grey, Colors.white, Colors.grey],
    begin: Alignment.centerLeft,
    stops: [
      0.49,
      0.50,
      0.51
    ],
    end: Alignment.centerRight,
  );
}

LinearGradient loseLinearGradient() {
  return LinearGradient(
    colors: [Colors.redAccent, Colors.white, Colors.green],
    begin: Alignment.centerLeft,
    stops: [
      0.49,
      0.50,
      0.51
    ],
    end: Alignment.centerRight,
  );
}

LinearGradient winLinearGradient() {
  return LinearGradient(
    colors: [Colors.green, Colors.white, Colors.redAccent],
    begin: Alignment.centerLeft,
    stops: [
      0.49,
      0.50,
      0.51
    ],
    end: Alignment.centerRight,
  );
}