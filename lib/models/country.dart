/* This is country list class */
class Country {
  String? name;
  String? code;
  String? flag;

  Country(this.name, this.code, this.flag);

  // Simple constructor
  Country.simple() {
    this.code = '';
    this.flag = '';
    this.name = '';
  }

  // Country from json
  Country.fromJson(Map<dynamic, dynamic> data) {
    this.name = data['text'];
    this.flag = data['map'];
    this.code = data['callingCodes'];
  }
}
