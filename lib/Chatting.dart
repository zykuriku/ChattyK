import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Chatting {
  String responseData = "";
  int chatIndex = 0;

  Chatting({required this.responseData, required this.chatIndex});

  factory Chatting.fromJson(Map<String, dynamic> json) => Chatting(
      responseData: json['responseData'], chatIndex: json['chatIndex']);
}
