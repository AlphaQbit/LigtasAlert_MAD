import 'package:flutter/material.dart';

const kPrimary = Color(0xFFEF4444);
const kBorder = Color(0xFFE5E7EB);
const kTextPrimary = Color(0xFF1F2937);
const kTextSecondary = Color(0xFF6B7280);
const kSurface = Color(0xFFFFFFFF);
const kBg = Color(0xFFF9FAFB);
const kOkBg = Color(0xFFDCFCE7);
const kOkDot = Color(0xFF16A34A);
const kOkText = Color(0xFF15803D);

OutlineInputBorder outlineBorder(double radius, {Color color = kBorder, double width = 1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );

const alertTypes = <({String type, IconData icon})>[
  (type: 'Lockdown', icon: Icons.lock),
  (type: 'Fire', icon: Icons.local_fire_department),
  (type: 'Medical', icon: Icons.local_hospital),
  (type: 'Evacuation', icon: Icons.exit_to_app),
];

const facilities = <({String id, String label})>[
  (id: 'building-a', label: 'MCC MAIN'),
  (id: 'building-b', label: 'MCC MADAPDAP'),
  (id: 'campus', label: 'Campus'),
];
