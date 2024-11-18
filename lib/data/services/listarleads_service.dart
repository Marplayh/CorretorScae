import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/lead.dart';

class LeadService {
  // Função para buscar os leads (simulando um GET)
 Future<List<Lead>> fetchLeadsFromAssets() async {
  final String response = await rootBundle.loadString('assets/api/leads.json');
  final List<dynamic> data = jsonDecode(response);
  return data.map((lead) => Lead.fromJson(lead)).toList();
}
}
