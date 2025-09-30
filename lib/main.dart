import 'package:flutter/material.dart';
import "lab3.dart" as lab3;
import "lab4.dart" as lab4;
import "lab5.dart" as lab5;
import "lab6.dart" as lab6;
import "lab6_provider.dart" as lab6_provider;

void main() {
  // lab3.lab3Main();
  // lab4.lab4Main();
  // lab5.lab5Main();
  // lab6.lab6Main();
  // lab6_provider.lab6ProviderMain();

  // Switch between these to run different sections:

  // Lab 6 Sections 1-3 (Stateless, setState, Lifting State Up):
  // runApp(const lab6.Lab6CompleteApp());

  // Lab 6 Section 4 (Provider - Advanced State Management):
  lab6_provider.lab6ProviderMain();
}

