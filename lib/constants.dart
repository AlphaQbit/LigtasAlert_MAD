import 'package:flutter/material.dart';

const kPrimary = Color(0xFF10B981);
const kDanger = Color(0xFFEF4444);
const kBorder = Color(0xFFE5E7EB);
const kTextPrimary = Color(0xFF1F2937);
const kTextSecondary = Color(0xFF6B7280);
const kSurface = Color(0xFFFFFFFF);
const kBg = Color(0xFFF9FAFB);

const alertTypes = <({String type, IconData icon, String description})>[
  (type: 'Lockdown', icon: Icons.lock, description: 'Active threat'),
  (type: 'Fire', icon: Icons.local_fire_department, description: 'Evacuate now'),
  (type: 'Medical', icon: Icons.local_hospital, description: 'Medical emergency'),
  (type: 'Evacuation', icon: Icons.exit_to_app, description: 'Ordered evacuation'),
];

const facilities = <({String id, String label})>[
  (id: 'building-a', label: 'Building A'),
  (id: 'building-b', label: 'Building B'),
  (id: 'campus', label: 'Campus'),
];
