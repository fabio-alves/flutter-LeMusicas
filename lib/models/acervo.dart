class Acervo{
  int id;
  String nome;
  String banda;
  String letra;
  String traducao;

  Acervo(this.id, this.nome, this.banda, this.letra, this.traducao);

  Map<String, dynamic> toMap(){

    var map = <String, dynamic>{
      'id':id,
      'nome':nome,
      'banda':banda,
      'letra':letra,
      'traducao':traducao
    };
    return map;
  }

  Acervo.fromMap(Map<String,dynamic>map){
    id=map['id'];
    nome= map['nome'];
    banda= map['banda'];
    letra= map['letra'];
    traducao= map['traducao'];
  }
}

