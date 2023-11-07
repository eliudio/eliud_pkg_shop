import 'package:eliud_core/model/pos_size_model.dart';

PosSizeModel halfScreen(String appId) {
  return PosSizeModel(
      widthPortrait: 1,
      widthTypePortrait: WidthTypePortrait.percentageWidth,
      heightPortrait: .5,
      heightTypePortrait: HeightTypePortrait.percentageHeight,
      fitPortrait: PortraitFitType.portraitFitWidth,
      alignTypePortrait: PortraitAlignType.portraitAlignCenter,
      widthLandscape: 1,
      widthTypeLandscape: WidthTypeLandscape.percentageWidth,
      heightLandscape: .5,
      heightTypeLandscape: HeightTypeLandscape.percentageHeight,
      fitLandscape: LandscapeFitType.landscapeFitHeight,
      alignTypeLandscape: LandscapeAlignType.landscapeAlignCenter,
      clip: ClipType.noClip);
}

PosSizeModel screen75(String appId) {
  return PosSizeModel(
      widthPortrait: .75,
      widthTypePortrait: WidthTypePortrait.percentageWidth,
      heightPortrait: .75,
      heightTypePortrait: HeightTypePortrait.percentageHeight,
      fitPortrait: PortraitFitType.portraitFitWidth,
      alignTypePortrait: PortraitAlignType.portraitAlignCenter,
      widthLandscape: .75,
      widthTypeLandscape: WidthTypeLandscape.percentageWidth,
      heightLandscape: .75,
      heightTypeLandscape: HeightTypeLandscape.percentageHeight,
      fitLandscape: LandscapeFitType.landscapeFitHeight,
      alignTypeLandscape: LandscapeAlignType.landscapeAlignCenter,
      clip: ClipType.noClip);
}

PosSizeModel fullScreen(String appId) {
  return PosSizeModel(
      fitLandscape: LandscapeFitType.landscapeCover,
      widthLandscape: 1,
      heightLandscape: 1,
      heightTypeLandscape: HeightTypeLandscape.percentageHeight,
      widthTypeLandscape: WidthTypeLandscape.percentageWidth,
      fitPortrait: PortraitFitType.portraitFitHeight,
      widthPortrait: 1,
      heightPortrait: 1,
      heightTypePortrait: HeightTypePortrait.percentageHeight,
      widthTypePortrait: WidthTypePortrait.percentageWidth,
      clip: ClipType.noClip);
}
