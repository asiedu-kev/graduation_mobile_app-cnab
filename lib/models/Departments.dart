class Departments {
  int? idDep;
  String? department;
  List<Communes>? communes;

  Departments({this.idDep, this.department, this.communes});

  Departments.fromJson(Map<String, dynamic> json) {
    idDep = json['id_dep'];
    department = json['department'];
    if (json['communes'] != null) {
      communes = <Communes>[];
      json['communes'].forEach((v) {
        communes?.add(new Communes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_dep'] = this.idDep;
    data['department'] = this.department;
    if (this.communes != null) {
      data['communes'] = this.communes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Communes {
  int? idCom;
  String? commune;
  List<Arrondissements>? arrondissements;

  Communes({this.idCom, this.commune, this.arrondissements});

  Communes.fromJson(Map<String, dynamic> json) {
    idCom = json['id_com'];
    commune = json['commune'];
    if (json['arrondissements'] != null) {
      arrondissements = <Arrondissements>[];
      json['arrondissements'].forEach((v) {
        arrondissements?.add(new Arrondissements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_com'] = this.idCom;
    data['commune'] = this.commune;
    if (this.arrondissements != null) {
      data['arrondissements'] =
          this.arrondissements?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Arrondissements {
  int? idArrond;
  String? arrondissement;
  List<Quartiers>? quartiers;

  Arrondissements({this.idArrond, this.arrondissement, this.quartiers});

  Arrondissements.fromJson(Map<String, dynamic> json) {
    idArrond = json['id_arrond'];
    arrondissement = json['arrondissement'];
    if (json['quartiers'] != null) {
      quartiers = <Quartiers>[];
      json['quartiers'].forEach((v) {
        quartiers?.add(new Quartiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_arrond'] = this.idArrond;
    data['arrondissement'] = this.arrondissement;
    if (this.quartiers != null) {
      data['quartiers'] = this.quartiers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quartiers {
  int? idQuart;
  String? quartier;

  Quartiers({this.idQuart, this.quartier});

  Quartiers.fromJson(Map<String, dynamic> json) {
    idQuart = json['id_quart'];
    quartier = json['quartier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_quart'] = this.idQuart;
    data['quartier'] = this.quartier;
    return data;
  }
}
