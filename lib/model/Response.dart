class Response {
  int page;
  int totalPage;
  String data;

  Response({this.page, this.totalPage, this.data});

  factory Response.createReponse(Map<String, dynamic> jsonObject) {
    return Response(
        page: jsonObject["page"],
        totalPage: jsonObject["total"],
        data: jsonObject["data"]);
  }
}
