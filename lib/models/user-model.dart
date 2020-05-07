
/// [User] Object general utilisateur.
/// [NewUserJson] Object json pour creer un nouvelle utilisateur
/// [UserJson] Object json pour recuperer ou manipuler un utilisateur existant.

class User{
  int _id; //auto-generated
  String _username;
  String _email;
  String _password;
  User(){
    this._id = 0;
    this._username = null;
    this._email = null;
    this._password = null;
  }
  User.SansId(this._username,this._email,this._password){
    this._id = 0;
  }
  User.AvecId(this._id,this._username,this._email,this._password);
  get id => _id;
  get username => this._username;
  get email => this._email;
  get password => this._password;

  set id(int id) => _id = id;
  set username(String username) => _username = username;
  set email(String email) => _email = email;
  set password(String password) => _password = password;

  @override
  String toString(){
    String str = "";
    if(_id!=null){
      str = "{id:'${_id}'";
    }
    return str+="{id:'${_id}', username: '${_username}' ,email: '${email}', password: '${_password}' }";
  }
}

class NewUserJson {
  String username;
  String email;
  String password;

  NewUserJson.fromJson(Map<String, dynamic> json)
      : username = json['name'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'username': username,
        'email': email,
        'password': password
      };

  @override
  String toString() {
    return "{ username: '${username}' ,email: '${email}', password: '${password}' }";
  }
}

class UserJson{
  String id;
  String username;
  String email;
  String password;

  UserJson.fromJson(Map<String, dynamic> json) // ne devrais pas servir
      : username = json['name'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'username': username,
        'email': email,
        'password' : password
      };

  @override
  String toString(){
    return "{id:'${id}', username: '${username}' ,email: '${email}', password: '${password}' }";
  }

}