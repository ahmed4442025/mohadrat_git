class responseData {
  List<Adds>? adds;
  List<Lectures>? lectures;

  responseData({this.adds, this.lectures});

  responseData.fromJson(Map<String, dynamic> json) {
    if (json['adds'] != null) {
      adds = <Adds>[];
      json['adds'].forEach((v) {
        adds!.add(new Adds.fromJson(v));
      });
    }
    if (json['lectures'] != null) {
      lectures = <Lectures>[];
      json['lectures'].forEach((v) {
        lectures!.add(new Lectures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adds != null) {
      data['adds'] = this.adds!.map((v) => v.toJson()).toList();
    }
    if (this.lectures != null) {
      data['lectures'] = this.lectures!.map((v) => v.toJson()).toList();
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

class Lectures {
  String? title;
  String? img;
  List<OneLecture>? data;

  Lectures({this.title, this.img, this.data});

  Lectures.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    if (json['data'] != null) {
      data = <OneLecture>[];
      json['data'].forEach((v) {
        data!.add(new OneLecture.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
    if (json['imgs'] != null) {
      imgs = <Images>[];
      json['imgs'].forEach((v) {
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
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    return data;
  }
}
