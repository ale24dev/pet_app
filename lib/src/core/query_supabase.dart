///This class contains all tables inside of supabase database
abstract class QuerySupabase {
  static String get user => "id, username, full_name, avatar_url, updated_at";

  static String get publication => "id, created_at, text, images, user($user)";

  static String get petStatus => "id, status, primary_status($primaryStatus)";

  static String get primaryStatus => "id, status";

  static String get petType => "id, name";

  static String get breed => "id, name";

  static String get pet =>
      "id, name, height, weight, age, birthday, description, color, gender, image, pet_type($petType), pet_status($petStatus), breed($breed), user($user)";

  static String get favorite => "id, user($user), pet($pet)";
}
