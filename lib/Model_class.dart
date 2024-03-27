class Model_class{
  String Name,Address,id,Email,Pass,age,imageUrl;
  Model_class(this.Name,this.Address,this.id,this.age,this.Email,this.Pass,this.imageUrl);
  Map<String, dynamic> toMap(){
    return {
      "Id":id,
      "Name":Name,
      "Age":age,
      "Address": Address,
      "Email":Email,
      "Pass":Pass,
      "ImageUrl":imageUrl,


    };
  }
}