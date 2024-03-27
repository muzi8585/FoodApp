class Cartitem_class{
  String Name,Descr, Image,Quantity,id;
  Cartitem_class(this.Name,this.Quantity,this.id,this.Image,this.Descr);
  Map<String, dynamic> toCart(){
    return {
      'Id':id,
      'Name':Name,
      'Descr': Descr,
      'Image': Image,
      'Quantity':Quantity,


    };
  }
}