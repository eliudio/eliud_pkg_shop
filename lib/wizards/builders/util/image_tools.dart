import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';
import 'package:eliud_core/tools/storage/platform_medium_helper.dart';
import 'package:eliud_core/tools/storage/public_medium_helper.dart';

class ImageTools {
  static Future<PublicMediumModel> uploadPublicPhoto(
      AppModel app, String memberId, String assetPath) async {
    var docID = newRandomKey();
    return await PublicMediumHelper(
      app,
      memberId,
    ).createThumbnailUploadPhotoAsset(
      docID,
      assetPath,
    );
  }

  static Future<PlatformMediumModel> uploadPlatformPhoto(
      AppModel app,
      String memberId,
      String assetPath,
      PrivilegeLevelRequiredSimple privilegeLevelRequiredSimple) async {
    var docID = newRandomKey();
    return await PlatformMediumHelper(
            app, memberId, privilegeLevelRequiredSimple)
        .createThumbnailUploadPhotoAsset(
      docID,
      assetPath,
    );
  }

  static Future<PlatformMediumModel> uploadPlatformVideo(
      AppModel app,
      String memberId,
      String assetPath,
      PrivilegeLevelRequiredSimple privilegeLevelRequiredSimple) async {
    var docID = newRandomKey();
    return await PlatformMediumHelper(
            app, memberId, privilegeLevelRequiredSimple)
        .createThumbnailUploadVideoAsset(
      docID,
      assetPath,
    );
  }

  static Future<PlatformMediumModel> uploadPlatformPdf(
      AppModel app,
      String memberId,
      String assetPath,
      String documentID,
      PrivilegeLevelRequiredSimple privilegeLevelRequiredSimple) async {
    var docID = newRandomKey();
    return await PlatformMediumHelper(
            app, memberId, privilegeLevelRequiredSimple)
        .createThumbnailUploadPdfAsset(docID, assetPath, documentID);
  }

  static Future<PublicMediumModel> uploadPublicPdf(AppModel app,
      String memberId, String assetPath, String documentID) async {
    var docID = newRandomKey();
    return await PublicMediumHelper(app, memberId)
        .createThumbnailUploadPdfAsset(docID, assetPath, documentID);
  }

  static Future<MemberMediumModel> createMemberMediumModelPhoto(
      AppModel app, String memberId, String assetPath) async {
    var docID = newRandomKey();
    var photo = await MemberMediumHelper(
            app, memberId, MemberMediumAccessibleByGroup.public)
        .createThumbnailUploadPhotoAsset(
      docID,
      assetPath,
    );
    return photo;
  }

  static Future<MemberMediumContainerModel> createPostMediumModelPhoto(
      AppModel app, String memberId, String assetPath) async {
    var photo = await createMemberMediumModelPhoto(app, memberId, assetPath);
    return MemberMediumContainerModel(
      documentID: newRandomKey(),
      memberMedium: photo,
    );
  }

  static Future<MemberMediumContainerModel> createPostMediumModelVideo(
      AppModel app, String memberId, String assetPath) async {
    var docID = newRandomKey();
    var video = await MemberMediumHelper(
            app, memberId, MemberMediumAccessibleByGroup.public)
        .createThumbnailUploadVideoAsset(
      docID,
      assetPath,
    );
    return MemberMediumContainerModel(
      documentID: newRandomKey(),
      memberMedium: video,
    );
  }
}
