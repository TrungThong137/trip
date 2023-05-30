class DataModel{
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.description,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.location
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
      name: json['name'], 
      description: json['description'], 
      img: json['img'], 
      price: json['price'],
      people: json['people'], 
      stars: json['stars'], 
      location: json['location']
    );
  }
}