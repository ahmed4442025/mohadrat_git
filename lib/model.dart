class responseData {
  List<Adds>? adds;
  List<Subjects>? subjects;

  responseData({this.adds, this.subjects});

  responseData.fromJson(Map<String, dynamic> json) {
    if (json['adds'] != null) {
      adds = <Adds>[];
      json['adds'].forEach((v) {
        adds!.add(new Adds.fromJson(v));
      });
    }
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adds != null) {
      data['adds'] = this.adds!.map((v) => v.toJson()).toList();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Adds {
  String? title;
  String? img;

  Adds({this.title, this.img});

  Adds.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    return data;
  }
}

class Subjects {
  String? title;
  String? img;
  List<OneLecture>? lectures;

  Subjects({this.title, this.img, this.lectures});

  Subjects.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    if (json['lectures'] != null) {
      lectures = <OneLecture>[];
      json['lectures'].forEach((v) {
        lectures!.add(new OneLecture.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    if (this.lectures != null) {
      data['lectures'] = this.lectures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OneLecture {
  String? date;
  String? img;
  String? title;
  List<Images>? imgs;

  OneLecture({this.date, this.img, this.title, this.imgs});

  OneLecture.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    img = json['img'];
    title = json['title'];
    if (json['images'] != null) {
      imgs = <Images>[];
      json['images'].forEach((v) {
        imgs!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['img'] = this.img;
    data['title'] = this.title;
    if (this.imgs != null) {
      data['imgs'] = this.imgs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? title;
  String? img;

  Images({this.title,  this.img});

  Images.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['images'] = this.img;
    return data;
  }
}
