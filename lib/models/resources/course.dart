import 'dart:convert';

import 'package:flop_edt_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

///Classe [Cours] permettant de représenter en objet
///un cours retourné par l'API.
class Cours {
  final int id;
  final String enseignant;
  final String groupe;
  final String promo;
  final String module;
  final String type;
  final String salle;
  final Color backgroundColor;
  final Color textColor;
  final int startTimeFromMidnight;
  final int duration;
  final int indexInWeek;
  final DateTime dateEtHeureDebut;
  final DateTime dateEtHeureFin;

  @override
  String toString() {
    var formatted = DateFormat.yMd().add_jm().format(dateEtHeureDebut);
    return '<$type $module : $enseignant à $formatted>';
  }

  Cours(
      {this.id,
      this.enseignant,
      this.groupe,
      this.promo,
      this.module,
      this.type,
      this.salle,
      this.backgroundColor,
      this.textColor,
      this.startTimeFromMidnight,
      this.duration,
      this.indexInWeek,
      this.dateEtHeureDebut,
      this.dateEtHeureFin});

  factory Cours.fromJSON(Map<String, dynamic> json) => Cours(
        id: json['id'],
        enseignant: json['enseignant'],
        module: json['module'],
        groupe: json['group'],
        promo: json['promo'],
        type: json['type'],
        salle: json['salle'],
        backgroundColor: ColorUtils.fromHex(json['background']),
        textColor: ColorUtils.fromHex(json['text']),
        startTimeFromMidnight: int.parse(json['start']),
        duration: json['duration'],
        indexInWeek: json['index_in_week'],
        dateEtHeureDebut: DateTime.parse(json['date']),
        dateEtHeureFin: DateTime.parse(json['date'])
            .add(Duration(minutes: json['duration'])),
      );

  ///Crée une liste de [Cours] à partir de la réponse API.
  static List<Cours> createListFromResponse(Response response) {
    var courses = jsonDecode(response.body)['response'];
    var toReturn = <Cours>[];
    courses.forEach((dynamic json) => toReturn.add(Cours.fromJSON(json)));
    return toReturn;
  }

  ///Retourne vrai si le cours est un examen, faux sinon
  bool get isExam =>
      this.type == 'DS' ||
      this.type == 'Examen' ||
      this.type == 'Exam' ||
      this.type == 'CTRL' ||
      this.type == 'CTRLP';
}
