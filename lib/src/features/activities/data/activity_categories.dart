import 'package:flutter/material.dart';
import 'package:ustawi/src/features/activities/model/activity.dart';

final kActivityCategories = [
  ActivityCategory(
    categoryName: "Social",
    activityList: [
      Activity(
          activityName: "with family", iconCode: Icons.diversity_3.codePoint),
      Activity(activityName: "with friends", iconCode: Icons.groups.codePoint),
      Activity(activityName: "on a date", iconCode: Icons.favorite.codePoint),
      Activity(activityName: "partying", iconCode: Icons.nightlife.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Hobbies",
    activityList: [
      Activity(
          activityName: "music", iconCode: Icons.music_note_outlined.codePoint),
      Activity(activityName: "movies & tv", iconCode: Icons.live_tv.codePoint),
      Activity(activityName: "reading", iconCode: Icons.book.codePoint),
      Activity(
          activityName: "gaming", iconCode: Icons.gamepad_outlined.codePoint),
      Activity(activityName: "relaxing", iconCode: Icons.weekend.codePoint),
      Activity(
          activityName: "traveling",
          iconCode: Icons.flight_class_outlined.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Sleep",
    activityList: [
      Activity(
          activityName: "enough sleep", iconCode: Icons.alarm_on.codePoint),
      Activity(activityName: "good sleep", iconCode: Icons.bedtime.codePoint),
      Activity(
          activityName: "medium sleep",
          iconCode: Icons.bedtime_outlined.codePoint),
      Activity(
          activityName: "bad sleep",
          iconCode: Icons.bedtime_off_outlined.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Health",
    activityList: [
      Activity(
          activityName: "excercising",
          iconCode: Icons.fitness_center.codePoint),
      Activity(
          activityName: "hydrating", iconCode: Icons.local_drink.codePoint),
      Activity(
          activityName: "walking", iconCode: Icons.directions_walk.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Better Me",
    activityList: [
      Activity(
          activityName: "meditating",
          iconCode: Icons.self_improvement_outlined.codePoint),
      Activity(
          activityName: "fasting", iconCode: Icons.no_meals_outlined.codePoint),
      Activity(activityName: "listening", iconCode: Icons.hearing.codePoint),
      Activity(activityName: "donating", iconCode: Icons.toll.codePoint),
      Activity(
          activityName: "assisting",
          iconCode: Icons.volunteer_activism_outlined.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Chores",
    activityList: [
      Activity(
          activityName: "shopping",
          iconCode: Icons.shopping_bag_outlined.codePoint),
      Activity(
          activityName: "cleaning",
          iconCode: Icons.cleaning_services.codePoint),
      Activity(
          activityName: "cooking", iconCode: Icons.restaurant_menu.codePoint),
      Activity(
          activityName: "laundry",
          iconCode: Icons.local_laundry_service_outlined.codePoint),
    ],
  ),
];
