
class User{
  int _id; //auto-generate
  String _username;
  String _email;
  String _password;
  User();
  User.factory(this._username,this._email,this._password){
    this._id = null;
  }
  get id => _id;
  get username => _username;
  get email => _email;
  get password => _password;

  set id(int id) => _id = id;
  set username(String username) => _username = username;
  set email(String email) => _email = email;
  set password(String password) => _password = password;

  String toString(){
    return "{id:'${_id}', username: '${_username}' ,email: '${email}', password: '${_password}' }";
  }
}