library globals;

import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/widgets/shared/star_model.dart';

double scrollStarPusher = 0;
List<Star> starsList = [];
int numberOfStars = 200;
bool isInitialized = false;

final aboutMeKey = new GlobalKey();
