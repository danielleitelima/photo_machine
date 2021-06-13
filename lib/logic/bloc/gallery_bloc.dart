import 'package:bloc/bloc.dart';
import 'package:photo_machine/data/repository/gallery_repository.dart';

import 'gallery_state.dart';

enum GalleryEvent { refresh, loadMore }

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository galleryRepository;

  GalleryBloc(GalleryState initialState, this.galleryRepository) : super(initialState);

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    switch (event) {
      case GalleryEvent.refresh:
        yield GalleryStateLoading();
        var photoList = await galleryRepository.getRandomPhotoList(4);

        if (photoList.isNotEmpty) {
          yield GalleryStateLoaded(photoList: photoList);
        } else {
          yield GalleryStateEmpty();
        }
        break;
      case GalleryEvent.loadMore:
        if (!(state is GalleryStateLoaded)) yield GalleryStateError("Error Loading More Photos");
        var loadedState = state as GalleryStateLoaded;
        var photoList = await galleryRepository.getRandomPhotoList(4);
        if (photoList.isEmpty) {
          yield GalleryStateError("Error Loading More Photos");
        }
        yield GalleryStateLoaded(photoList: loadedState.photoList..addAll(photoList));
        break;
      default:
    }
  }

}
