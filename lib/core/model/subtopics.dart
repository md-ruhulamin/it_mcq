class SubTopic {
  String? id;
  String? topicId;
  String? name;
  String? description;
  List<String>? concepts;
  int? totalConcepts;
  String? createdAt;

  SubTopic(
      {this.id,
      this.topicId,
      this.name,
      this.description,
      this.concepts,
      this.totalConcepts,
      this.createdAt});

  SubTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topicId = json['topicId'];
    name = json['name'];
    description = json['description'];
    concepts = json['concepts'].cast<String>();
    totalConcepts = json['totalConcepts'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['topicId'] = this.topicId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['concepts'] = this.concepts;
    data['totalConcepts'] = this.totalConcepts;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
