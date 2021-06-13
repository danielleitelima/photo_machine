
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_machine/core/constant/static_text.dart';
import 'package:photo_machine/data/api/general_api.dart';
import 'package:photo_machine/data/api/unsplash_api.dart';
import 'package:photo_machine/data/repository/gallery_repository.dart';
import 'package:photo_machine/logic/bloc/gallery_bloc.dart';

import 'core/theme/app_theme.dart';
import 'logic/bloc/gallery_state.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/main_router.dart';

void main() async {
  final unsplashAPI = UnsplashAPI();
  final generalAPI = GeneralAPI();
  final galleryRepository = GalleryRepository(unsplashAPI, generalAPI);

  Bloc.observer = AppBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => App(galleryRepository: galleryRepository,),
    ),
  );
}

class App extends StatelessWidget {

  final GalleryRepository galleryRepository;

  const App({Key key, this.galleryRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GalleryBloc>(
          create: (context) => GalleryBloc(GalleryStateEmpty(), galleryRepository)..add(GalleryEvent.refresh),
        )
      ],
      child: MaterialApp(
        title: StaticText.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.main,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
