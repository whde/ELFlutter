class CourseModel {
  int id;
  String name;
  String url;
  String progress;
  String avg;

  CourseModel({this.id, this.name, this.url, this.progress, this.avg});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    progress = json['progress'];
    avg = json['avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['progress'] = this.progress;
    data['avg'] = this.avg;
    return data;
  }
}