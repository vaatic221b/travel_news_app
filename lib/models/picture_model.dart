class PictureModel{
  String picPath;
  String name;


  PictureModel({
  required this.picPath,
  required this.name
  });

  static List<PictureModel> getPictures(){
    List<PictureModel> pictures = [];

    pictures.add(
      PictureModel(
        picPath: 'assets/images/sangPic1.png', 
        name: 'Sang Dong-Min', 
        )
    );

    pictures.add(
      PictureModel(
        picPath: 'assets/images/sangPic2.png', 
        name: 'Sang Dong-Min', 
        )
    );


    pictures.add(
      PictureModel(
        picPath: 'assets/images/panPic1.png', 
        name: 'Pan Bong', 
        )
    );

    pictures.add(
      PictureModel(
        picPath: 'assets/images/panPic2.png', 
        name: 'Pan Bong', 
        )
    );

    pictures.add(
      PictureModel(
        picPath: 'assets/images/keanuPic1.png', 
        name: 'Keanu Carpent', 
        )
    );

    pictures.add(
      PictureModel(
        picPath: 'assets/images/keanuPic2.png', 
        name: 'Keanu Carpent', 
        )
    );



    pictures.add(
      PictureModel(
        picPath: 'assets/images/ellyPic1.png', 
        name: 'Elly Byers', 
        )
    );

    pictures.add(
      PictureModel(
        picPath: 'assets/images/ellyPic2.png', 
        name: 'Elly Byers', 
        )
    );

    return pictures;

  }

}

