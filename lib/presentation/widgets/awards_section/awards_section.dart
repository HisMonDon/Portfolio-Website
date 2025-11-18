import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/awards_model.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class AwardsSection extends StatelessWidget {
  AwardsSection({super.key});

  final List<Award> awards = [
    Award(
      name: 'CaYPT',
      year: '2025',
      description: 'Silver Medalist in Canada',
    ),
    Award(
      name: 'AP Exams',
      year: '2025',
      description: '5 on AP Physics 1, AP Chemistry, and AP Computer Science A',
    ),
    Award(name: 'OAPT', year: '2025', description: 'Top 90%'),
    Award(name: 'CIMC', year: '2024', description: 'Honor Roll'),
    Award(name: 'CCC Junior', year: '2023', description: 'Distinction'),
    Award(name: 'National Lifeguard', year: 'Certified'),
    Award(name: 'Ski Instructor', year: 'Level 2 Certified'),
  ];
}
