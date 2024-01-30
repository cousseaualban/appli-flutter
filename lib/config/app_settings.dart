import '../resource/app_strings.dart';
import '../resource/app_french_strings.dart';
import '../resource/app_english_strings.dart';

class AppSettings {

  static const String APP_TOKEN="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTJhZGJkNzZjMzI1MDEyOGRkNWFkMWEzNzc5OWI3NjZjODFjZDc3Njk1ODlmYzJhZDM4N2RmZjRhOWJlMGMyOTg1OWFmZDYyYmU2YzRjODYiLCJpYXQiOjE2NTAzNjYwNjcuMjA2NTA3LCJuYmYiOjE2NTAzNjYwNjcuMjA2NTA5LCJleHAiOjE2ODE5MDIwNjcuMjAzNjgxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.hOCVrDotxxUzDE0S5TwgVaBh4sL0f6BFSIpvbCmLh58CSSVo1Pqb_KPqN3Vuhy9fXx0bSHkOzy6mNXrR4xDbo_Lm0YnqE0CF_RcS1VIGP1eDOx0-lNIjPxMdrxwhxseGv4wKI4cwP6Zq3YrAebcwGZn_ZY7k-Wh_kW_vDfKLei-vh6vy6QqxR5zJoMtE11-lrsJEWJerdLcmGkrYXfmmXZG8XgMFQVLf2-jSWyLVA8in-muYZE4uQex7Q85AuQqA5xcNJQ-b5iizM_sLMjz-5osra_l8DkFNOSzy42dIdkyqb4ua4xBPpKM_EQVa79jXfa0Lo2LdMGFMU8nqagpDR8TacGnqyO-u_NxI6ZxCR3FwhsB2Z6MIlo5oJJeTPWMaKnyZeuhjTu8dC2GXrnaImkcA2J8ThmwmmQ59ixV4wYQ7tre4ceqGTaBUQd4vSU93IYRQXVEUwVIdlwxycigm42M7gg_TWTMkRRLwJbIhzfkR88XoirZzO4tJZRyo3otVdg9OHsnAuOEO8oTj3NLRSLX8hDCwiCdz3WHp-lecb_dzHk5ONiEALpJpo4usTcDVv9SSLvZ6KsHV9b6ox5jTt0uBtN9h_BZjy_NT50y7YkLFzqFWO9u6ze6lGE6zK3JxkIrXBB5Gqseh62bM59BX3TZujPo0yrCqZwh79gYLvNw";
  static const int SPLASHSCREEN_DURATION = 3;
  static const String APP_VERSION='v0_Beta';
  static const String APP_NAME='7check';

  static const String APP_PROFILE="Profil";

  static const String APP_DASHBOARD='Réservations';
  static const String APP_UPDATERESERVATION='Modifier une réservation';

  static const String APP_RESTITUEDCAR='Voitures à restituer';
  static const String APP_ADDRESTITUEDCAR='Ajouter une voiture à restituer';
  static const String APP_UPDATERESTITUEDCAR='Modifier une voiture à restituer';

  static const String APP_RETIREDCAR='Voitures à retirer';
  static const String APP_RETIREDCARFORM='Fiche de voiture à retirer';
  static const String APP_ADDRETIREDCAR='Ajouter une voiture à retirer';
  static const String APP_UPDATERETIREDCAR='Modifier une voiture à retirer';

  static const String APP_LOGO_URI='assets/images/7check.png';
  static const String APP_LANGUAGE="fr";

  static AppStrings get strings {
    switch (APP_LANGUAGE) {
      case 'fr':
        return AppFrenchStrings();
      default:
        return AppEnglishStrings();
    }
  }

}