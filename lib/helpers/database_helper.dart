import 'dart:async';
import 'dart:io';
import 'package:le_musicas/models/acervo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

static DatabaseHelper _databaseHelper;
static Database _database;

String acervoTable = 'acervo';
String colId = 'id';
String colNome = 'nome';
String colBanda = 'banda';
String colLetra = 'letra';
String colTraducao = 'traducao';

DatabaseHelper._createInstance();

  factory DatabaseHelper(){

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'acervo.db';
    var acervoDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return acervoDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $acervoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,''$colNome TEXT,''$colBanda TEXT,''$colLetra TEXT,''$colTraducao TEXT)');
  }

  //incluir
  Future<int> insertAcervo(Acervo acervo) async{
    Database db = await this.database;
    var resultado = await db.insert(acervoTable, acervo.toMap());
    return resultado;
  }
  //buscar por nome
  Future<int> getAcervo(Acervo acervo) async{
    var db= await this.database;

    var resultado = 
      await db.update(acervoTable, acervo.toMap(),
      where: '$colNome = ?',
      whereArgs: [acervo.nome]);
      return resultado;
  } 

  //deletar
  Future<int> deleteAcervo(int id) async {
    var db = await this.database;
    int resultado = await db.delete(acervoTable,
    where: '$colId = ?',
    whereArgs: [id]);
    return resultado;
  }
  
  Future close() async {
    Database db = await this.database;
    db.close();
  }
}