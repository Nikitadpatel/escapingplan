class ExtratravModal {
  int? status;
  Data? data;

  ExtratravModal({this.status, this.data});

  ExtratravModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Agent1? agent1;
  Agent1? agent2;

  Data({this.agent1, this.agent2});

  Data.fromJson(Map<String, dynamic> json) {
    agent1 =
        json['agent1'] != null ? new Agent1.fromJson(json['agent1']) : null;
    agent2 =
        json['agent2'] != null ? new Agent1.fromJson(json['agent2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agent1 != null) {
      data['agent1'] = this.agent1!.toJson();
    }
    if (this.agent2 != null) {
      data['agent2'] = this.agent2!.toJson();
    }
    return data;
  }
}

class Agent1 {
  String? email;
  String? dob;
  String? phone;

  Agent1({this.email, this.dob, this.phone});

  Agent1.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    dob = json['dob'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    return data;
  }
}
