class UserModal {
  UserModal({
    int? status,
    String? message,
    Data? data,}){
    _status = status;
    _message = message;
    _data = data;
  }
  UserModal.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _status;
  String? _message;
  Data? _data;
  int? get status => _status;
  String? get message => _message;
  Data? get data => _data;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
class Data {
  Data({
    String? uId,
    String? username,
    String? email,
    String? password,
    String? stripid,
    String? type,
    String? clientid,
    String? clientname,
    String? clientimage,
    }){
    _uId = uId;
    _username = username;
    _email = email;
    _password = password;
    _stripid = stripid;
    _type = type;
    _clientid = clientid;
    _clientname = clientname;
    _clientimage = clientimage;
  }
  Data.fromJson(dynamic json) {
    _uId = json['u_id'];
    _username = json['username'];
    _email = json['email'];
    _password=json["password"];
    _stripid=json["stripe_cust_id"];
    _type=json["type"];
    _clientid=json["client_id"];
    _clientname=json["client_name"];
    _clientimage =json["profile_img"];
  }
  String? _uId;
  String? _username;
  String? _email;
  String? _password;
  String? _stripid;
  String? _type;
  String? _clientid;
  String? _clientname;
  String? _clientimage;
  String? get uId => _uId;
  String? get username => _username;
  String? get email => _email;
  String? get password => _password;
  String? get stripid => _stripid;
  String? get type => _type;
  String? get clientid => _clientid;
  String? get clientname => _clientname;
  String? get clientimage => _clientimage;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['u_id'] = _uId;
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    map['stripe_cust_id'] = _stripid;
    map['type'] = _type;
    map['client_id'] = _clientid;
    map["client_name"] = _clientname;
    map["profile_img"] = _clientimage ;
    return map;
  }
}