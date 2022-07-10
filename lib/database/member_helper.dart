import 'package:gestion_des_membres/database/database_helper.dart';
import 'package:gestion_des_membres/models/Member.dart';
import 'package:sqflite/sqflite.dart';

DbHelper _dbHelper = DbHelper();

class MemberHelper {
  Future<Database?> database = _dbHelper.database;

  Future<void> insertMember(Member member) async {
    final db = await database;

    db!.insert(
      'members',
      {
        "id": member.id,
        "first_name": member.firstName,
        "last_name": member.lastName,
        "gender": member.gender,
        "date_of_birth": member.dateOfBirth,
        "birthplace": member.birthplace,
        "nationality": member.nationality,
        "profession": member.profession,
        "category": member.category,
        "sub_category": member.subCategory,
        "language": member.language,
        "department": member.department,
        "municipality": member.municipality,
        "district": member.district,
        "locality": member.locality,
        "address": member.address,
        "longitude": member.longitude,
        "latitude": member.latitude,
        "phone": member.phone,
        "phone_whatsapp": member.phoneWhatsapp,
        "email": member.email,
        "website": member.website,
        "casual_employees": member.casualEmployees,
        "permanent_employees": member.permanentEmployees,
        "annual_sales": member.annualSales,
        "total_members": member.totalMembers,
        "denomination": member.denomination,
        "trade_name": member.tradeName,
        "acronym": member.acronym,
        "primary_sector": member.primarySector,
        "primary_activity": member.primarySector,
        "secondary_sector": member.secondarySector,
        "secondary_activity": member.secondaryActivity,
        "creation_date": member.creationDate,
        "registration": member.registration,
        "main_service": member.mainService,
        "secondary_service": member.secondaryService,
        "occasional_service": member.secondaryService,
        "need_help_1": member.needHelp1,
        "need_help_2": member.needHelp2,
        "need_help_3": member.needHelp3,
        "inscription_fee": member.inscriptionFee,
        "membership_fee": member.membershipFee,
        "date_added": member.dateAdded.toString()
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Member>> members() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db!.query('members');
    return List.generate(maps.length, (i) {
      return Member.fromJson({
        "id": maps[i]['id'],
        "first_name": maps[i]['first_name'],
        "last_name": maps[i]['last_name'],
        "gender": maps[i]['gender'],
        "date_of_birth": maps[i]['date_of_birth'],
        "birthplace": maps[i]['birthplace'],
        "nationality": maps[i]['nationality'],
        "profession": maps[i]["profession"],
        "category": maps[i]['category'],
        "sub_category": maps[i]['sub_category'],
        "language": maps[i]['language'],
        "department": maps[i]['department'],
        "municipality": maps[i]['municipality'],
        "district": maps[i]['district'],
        "locality": maps[i]['locality'],
        "address": maps[i]['address'],
        "longitude": maps[i]['longitude'],
        "latitude": maps[i]['latitude'],
        "phone": maps[i]['phone'],
        "phone_whatsapp": maps[i]['phone_whatsapp'],
        "email": maps[i]['email'],
        "website": maps[i]['website'],
        "casual_employees": maps[i]['casual_employees'],
        "permanent_employees": maps[i]['permanent_employees'],
        "annual_sales": maps[i]['annual_sales'],
        "total_members": maps[i]['total_members'],
        "denomination": maps[i]['denomination'],
        "trade_name": maps[i]['trade_name'],
        "acronym": maps[i]['acronym'],
        "primary_sector": maps[i]['primary_sector'],
        "primary_activity": maps[i]['primary_activity'],
        "secondary_sector": maps[i]['secondary_sector'],
        "secondary_activity": maps[i]['secondary_activity'],
        "creation_date": maps[i]['creation_date'],
        "registration": maps[i]['registration'],
        "main_service": maps[i]['main_service'],
        "secondary_service": maps[i]['secondary_service'],
        "occasional_service": maps[i]['occasional_service'],
        "need_help_1": maps[i]['need_help_1'],
        "need_help_2": maps[i]['need_help_2'],
        "need_help_3": maps[i]['need_help_3'],
        "inscription_fee": maps[i]['inscription_fee'],
        "membership_fee": maps[i]['membership_fee'],
        "date_added": maps[i]['date_added']
      });
    });
  }

  Future<List<Member>> membersByCategory(String category) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db!
        .query('members', where: 'category = ?', whereArgs: [category]);
    return List.generate(maps.length, (i) {
      return Member.fromJson({
        "id": maps[i]['id'],
        "first_name": maps[i]['first_name'],
        "last_name": maps[i]['last_name'],
        "gender": maps[i]['gender'],
        "date_of_birth": maps[i]['date_of_birth'],
        "birthplace": maps[i]['birthplace'],
        "nationality": maps[i]['nationality'],
        "profession": maps[i]["profession"],
        "category": maps[i]['category'],
        "sub_category": maps[i]['sub_category'],
        "language": maps[i]['language'],
        "department": maps[i]['department'],
        "municipality": maps[i]['municipality'],
        "district": maps[i]['district'],
        "locality": maps[i]['locality'],
        "address": maps[i]['address'],
        "longitude": maps[i]['longitude'],
        "latitude": maps[i]['latitude'],
        "phone": maps[i]['phone'],
        "phone_whatsapp": maps[i]['phone_whatsapp'],
        "email": maps[i]['email'],
        "website": maps[i]['website'],
        "casual_employees": maps[i]['casual_employees'],
        "permanent_employees": maps[i]['permanent_employees'],
        "annual_sales": maps[i]['annual_sales'],
        "total_members": maps[i]['total_members'],
        "denomination": maps[i]['denomination'],
        "trade_name": maps[i]['trade_name'],
        "acronym": maps[i]['acronym'],
        "primary_sector": maps[i]['primary_sector'],
        "primary_activity": maps[i]['primary_activity'],
        "secondary_sector": maps[i]['secondary_sector'],
        "secondary_activity": maps[i]['secondary_activity'],
        "creation_date": maps[i]['creation_date'],
        "registration": maps[i]['registration'],
        "main_service": maps[i]['main_service'],
        "secondary_service": maps[i]['secondary_service'],
        "occasional_service": maps[i]['occasional_service'],
        "need_help_1": maps[i]['need_help_1'],
        "need_help_2": maps[i]['need_help_2'],
        "need_help_3": maps[i]['need_help_3'],
        "inscription_fee": maps[i]['inscription_fee'],
        "membership_fee": maps[i]['membership_fee'],
        "date_added": maps[i]['date_added']
      });
    });
  }

  Future<void> deleteMember(int id) async {
    final db = await database;
    db!.delete(
      'members',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
