import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/pos_size_model.dart';

PosSizeModel halfScreen(String appId) {
  return PosSizeModel(
/*
      documentID: 'halfScreen',
      appId: appId,
*/
      name: 'HalfScreen both orientations',
      widthPortrait: 1,
      widthTypePortrait: WidthTypePortrait.PercentageWidth,
      heightPortrait: .5,
      heightTypePortrait: HeightTypePortrait.PercentageHeight,
      fitPortrait: PortraitFitType.PortraitFitWidth,
      alignTypePortrait: PortraitAlignType.PortraitAlignCenter,
      widthLandscape: 1,
      widthTypeLandscape: WidthTypeLandscape.PercentageWidth,
      heightLandscape: .5,
      heightTypeLandscape: HeightTypeLandscape.PercentageHeight,
      fitLandscape: LandscapeFitType.LandscapeFitHeight,
      alignTypeLandscape: LandscapeAlignType.LandscapeAlignCenter,
      clip: ClipType.NoClip);
}

PosSizeModel screen75(String appId) {
  return PosSizeModel(
/*
      documentID: 'screen75',
      appId: appId,
*/
      name: '75 % both orientations',
      widthPortrait: .75,
      widthTypePortrait: WidthTypePortrait.PercentageWidth,
      heightPortrait: .75,
      heightTypePortrait: HeightTypePortrait.PercentageHeight,
      fitPortrait: PortraitFitType.PortraitFitWidth,
      alignTypePortrait: PortraitAlignType.PortraitAlignCenter,
      widthLandscape: .75,
      widthTypeLandscape: WidthTypeLandscape.PercentageWidth,
      heightLandscape: .75,
      heightTypeLandscape: HeightTypeLandscape.PercentageHeight,
      fitLandscape: LandscapeFitType.LandscapeFitHeight,
      alignTypeLandscape: LandscapeAlignType.LandscapeAlignCenter,
      clip: ClipType.NoClip);
}

PosSizeModel fullScreen(String appId) {
  return PosSizeModel(
/*
      documentID: 'fullScreen',
      appId: appId,
*/
      name: 'Fullscreen both orientations',
      fitLandscape: LandscapeFitType.LandscapeCover,
      widthLandscape: 1,
      heightLandscape: 1,
      heightTypeLandscape: HeightTypeLandscape.PercentageHeight,
      widthTypeLandscape: WidthTypeLandscape.PercentageWidth,
      fitPortrait: PortraitFitType.PortraitFitHeight,
      widthPortrait: 1,
      heightPortrait: 1,
      heightTypePortrait: HeightTypePortrait.PercentageHeight,
      widthTypePortrait: WidthTypePortrait.PercentageWidth,
      clip: ClipType.NoClip);
}

/*
Future<void> setupPosSizes(String appId) async {
  await AbstractRepositorySingleton.singleton
      .posSizeRepository(appId)!
      .add(halfScreen(appId));
  await AbstractRepositorySingleton.singleton
      .posSizeRepository(appId)!
      .add(fullScreen(appId));
  await AbstractRepositorySingleton.singleton
      .posSizeRepository(appId)!
      .add(screen75(appId));
}
*/
