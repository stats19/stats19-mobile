class Menu{
  String _name;
  bool _isOpen;
  bool _hasSousMenus;
  List<Menu> _sousMenus;
  bool hasIcon;
  Menu();
  Menu.sansSousMenu(this._name){
    this._isOpen = false;
    this._hasSousMenus = false;
    _sousMenus = null;
    hasIcon = false;
  }
  Menu.avecSousMenu({String name,List<Menu> listSousMenus}){
    this._name = name;
    this._isOpen = false;
    this._hasSousMenus = true;
    this._sousMenus = new List<Menu>.from(listSousMenus);
    hasIcon = false;
  }
  bool open() => _isOpen;
  void set_open(bool open){
    _isOpen = open;
  }
  bool hasSousMenus() => this._hasSousMenus;
  List<Menu> listSousMenus() => this._sousMenus;
  get name => this._name;
  set name(String name) => this._name = name;
}