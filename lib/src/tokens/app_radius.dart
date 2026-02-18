import 'package:flutter/material.dart';

abstract class AppRadius {
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double xxl = 24.0;
  static const double full = 999.0;

  static const Radius smRadius = Radius.circular(sm);
  static const Radius mdRadius = Radius.circular(md);
  static const Radius lgRadius = Radius.circular(lg);
  static const Radius xlRadius = Radius.circular(xl);
  static const Radius xxlRadius = Radius.circular(xxl);
  static const Radius fullRadius = Radius.circular(full);
}
