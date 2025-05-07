import 'package:flutter/material.dart';
import 'package:flutter_application_1/myapp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


const supabaseUrl = 'https://yywevvcjkkirhctwzinj.supabase.co';
const supabaseKey = String.fromEnvironment('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5d2V2dmNqa2tpcmhjdHd6aW5qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY2MDQ1MjMsImV4cCI6MjA2MjE4MDUyM30.ChjErQAzZWhSuJMBxEjb4qvlm80tLBmHrvfzzrho288');

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
}