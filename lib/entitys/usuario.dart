class Usuario {
  final String nome;
  final String email;
  final String senha;
  final String cpf;

  Usuario(
      {required this.nome,
      required this.email,
      required this.senha,
      required this.cpf});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      cpf: json['cpf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'cpf': cpf,
    };
  }
}
