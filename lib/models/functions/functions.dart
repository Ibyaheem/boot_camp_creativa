import 'package:flutter/material.dart';

Color houseColor(String house) {
  switch (house) {
    case "Gryffindor":
      return Colors.redAccent;
    case "Slytherin":
      return Colors.green;
    case "Ravenclaw":
      return Colors.blueAccent;
    case "Hufflepuff":
      return Colors.amber;
    default:
      return Colors.black;
  }
}
