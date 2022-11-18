class UserModel {
  String? id;
  String? token;
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;

  UserModel({
    this.id,
    this.token,
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
  });

  // Criando um Factory - Construtor nomeado
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['fullname'],
      cpf: map['cpf'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      token: map['token'],
    );
  }

  // Criando toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': name,
      'cpf': cpf,
      'email': email,
      'password': password,
      'phone': phone,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'name: $name | cpf: $cpf';
  }
}
