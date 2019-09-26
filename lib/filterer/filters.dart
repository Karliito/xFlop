import 'package:flop_edt_app/models/cours.dart';
import 'package:flop_edt_app/models/user_preferences.dart';

///Applique les filtres utilisateurs sur la liste de cours (évite de fetch à chaque changement)
List<Cours> filter(int index, Map<int, Map<int, List<Cours>>> courses,
    DateTime date, Preferences preferences) {
  List<Cours> filtered = courses[index][date.weekday]
      .where((cours) =>
          cours.nomPromo == preferences.promo &&
          (cours.nomGroupe == preferences.group.groupe ||
              cours.nomGroupe.toString() == preferences.group.parent ||
              cours.coursType.toString() == "CM" ||
              cours.coursType == 'DS' ||
              cours.coursType == 'CTRL' ||
              cours.coursType == 'CTRLP' ||
              cours.coursType == 'Exam'))
      .toList();
  filtered.sort((c1, c2) => c1.dateDebut.compareTo(c2.dateDebut));
  return filtered;
}

/*
///Applique les filtres utilisateurs sur la liste de cours (évite de fetch à chaque changement)
List<Cours> filteredRT(int index, Map<int, Map<int, List<Cours>>> courses,
    DateTime date, Preferences preferences) {
  List<Cours> filtered = courses[index][date.weekday]
      .where((cours) =>
          cours.nomPromo == preferences.promo &&
          (cours.nomGroupe.toString() == preferences.group.groupe ||
              cours.nomGroupe.toString() == preferences.group.parent ||
              cours.coursType == 'CM' || cours.coursType == 'Examen'))
      .toList();
  filtered.sort((c1, c2) => c1.startTime.compareTo(c2.startTime));
  filtered.forEach((cours) => print(cours.heure.toString()));
  return filtered;
}
*/
