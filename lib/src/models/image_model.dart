class ImageModel {
  int id;
  String title;
  String url;

  ImageModel(this.id, this.title, this.url);

  ImageModel.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        title = jsonMap['title'],
        url = jsonMap['url'];
}
