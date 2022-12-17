import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials{
  static const String APIURL = "https://zokoamqpobyizyciayez.supabase.co";
  static const String APIKEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpva29hbXFwb2J5aXp5Y2lheWV6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTEyMjQ5MjcsImV4cCI6MTk2NjgwMDkyN30.cqs_rj2ZqVfe6HALo0mC3ZX_el8N_dN_VEJQwsYZVkk";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}