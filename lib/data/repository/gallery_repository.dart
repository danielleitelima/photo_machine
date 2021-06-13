import 'package:photo_machine/data/api/general_api.dart';
import 'package:photo_machine/data/api/unsplash_api.dart';
import 'package:photo_machine/data/dto/photo_dto.dart';
import 'package:photo_machine/data/model/photo.dart';
import 'package:photo_machine/data/model/photographer.dart';

class GalleryRepository {
  final UnsplashAPI unsplashAPI;
  final GeneralAPI generalAPI;

  GalleryRepository(this.unsplashAPI, this.generalAPI);

  Future<List<Photo>> getRandomPhotoList(int count) async {
    final photoDTOlist = await unsplashAPI.getRandomPhotoList(count);

    List<Photo> photoList = [];

    for (final photoDTO in photoDTOlist){
      final photo = await _convertFromPhotoDTO(photoDTO);
      photoList.add(photo);
    }

    return photoList;
  }

  Future<Photo> _convertFromPhotoDTO(PhotoDTO photoDTO) async => Photo(
        title: photoDTO.description,
        description: photoDTO.altDescription,
        likeCount: photoDTO.likes,
        viewCount: photoDTO.views,
        downloadCount: photoDTO.downloads,
        content: await generalAPI.getImage(photoDTO.urls.small),
        photographer: Photographer(
          name: photoDTO.user.name,
          // profileImage: await generalAPI.getImage(photoDTO.user.profileImage.small)
        )
    );

}
