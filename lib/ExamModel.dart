class ExamModel {
  int id;
  String name;
  String score;
  bool done;

  ExamModel({this.id, this.name, this.score, this.done});

  ExamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    data['done'] = this.done;
    return data;
  }
}