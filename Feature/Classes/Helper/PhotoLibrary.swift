//
//  PhotoLibrary.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 27/9/2565 BE.
//

import Foundation
import Photos

/**
 *  A set of methods to create albums, save and retrieve images using the Photos Framework.
 */
public struct PhotoLibrary {

    // MARK: - Constants
    private static var defaultAlbumNamed: String = "Joylada"

    // MARK: - Interface
    static func saveImageHandler(
        _ image: UIImage,
        albumNamed: String? = nil,
        completion: ((Bool, NSError?) -> Void)? = nil
    ) {
        requestPhotoAuthorizationHandler(completion: { allowed in
            guard allowed else {
                return
            }

            saveImage(
                image: image,
                toAlbum: albumNamed ?? defaultAlbumNamed,
                completion: completion)
        })
    }

    static func requestPhotoAuthorizationHandler(completion: ((Bool) -> Void)? = nil) {
        func requestAuthorization() {
            let handler: (PHAuthorizationStatus) -> Void = { status in
                switch status {
                case .authorized:
                    completion?(true)

                case .limited:
                    completion?(true)

                default:
                    completion?(false)
                }
            }

            if #available(iOS 14, *) {
                PHPhotoLibrary.requestAuthorization(for: .addOnly, handler: handler)
            } else {
                PHPhotoLibrary.requestAuthorization(handler)
            }
        }

        let currentStatus: PHAuthorizationStatus
        if #available(iOS 14, *) {
            currentStatus = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        } else {
            currentStatus = PHPhotoLibrary.authorizationStatus()
        }

        switch currentStatus {
        case .notDetermined:
            requestAuthorization()

        case .authorized:
            completion?(true)

        case .limited:
            completion?(true)

        default:
            completion?(false)
        }
    }

    /**
     Create and return an album in the Photos app with a specified name. Won't overwrite if such an album already exist.
     
     - parameter named:      Name of the album.
     - parameter completion: Called in the background when an album was created.
     */
    static func createAlbum(
        named: String,
        completion: ((PHAssetCollection?) -> Void)? = nil
    ) {
        DispatchQueue.global(qos: .background).async {
            var placeholder: PHObjectPlaceholder?

            PHPhotoLibrary.shared().performChanges({
                let createAlbumRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(
                    withTitle: named)
                placeholder = createAlbumRequest.placeholderForCreatedAssetCollection
            }, completionHandler: { success, _ in
                if let localIdentifier = placeholder?.localIdentifier, success {
                    let collectionFetchResult = PHAssetCollection.fetchAssetCollections(
                        withLocalIdentifiers: [localIdentifier],
                        options: nil)

                    completion?(collectionFetchResult.firstObject)
                } else {
                    completion?(nil)
                }
            })
        }
    }

    /**
     Retrieve an album from the Photos app with a specified name. If no such album exists, creates and returns a new one.
     
     - parameter named:      Name of the album.
     - parameter completion: Called in the background when an album was retrieved.
     */
    static func getAlbum(
        named: String,
        completion: ((PHAssetCollection?) -> Void)? = nil
    ) {
        DispatchQueue.global(qos: .background).async {
            let fetchOptions = PHFetchOptions()
            fetchOptions.predicate = NSPredicate(format: "title = %@", named)
            let collections = PHAssetCollection.fetchAssetCollections(
                with: .album,
                subtype: .any,
                options: fetchOptions)

            if let album = collections.firstObject {
                completion?(album)
            } else {
                createAlbum(named: named, completion: { album in
                    completion?(album)
                })
            }
        }
    }

    /**
     Try to save an image to a Photos album with a specified name. If no such album exists, creates a new one.
     - Important: The `error` parameter is only forwarded from the framework, if the image fails to save due to other reasons, even if the error is `nil` look at the `success` parameter which will be set to `false`.
     
     - parameter image:      Image to save.
     - parameter named:      Name of the album.
     - parameter completion: Called in the background when the image was saved or in case of any error.
     */
    static func saveImage(
        image: UIImage,
        toAlbum named: String,
        completion: ((Bool, NSError?) -> Void)? = nil
    ) {
        getAlbum(named: named, completion: { album in
            guard let album = album else {
                completion?(false, nil)
                return
            }

            saveImage(
                image: image,
                to: album,
                completion: completion)
        })
    }

    /**
     Try to save an image to a Photos album.
     - Important: The `error` parameter is only forwarded from the framework, if the image fails to save due to other reasons, even if the error is `nil` look at the `success` parameter which will be set to `false`.
     
     - parameter image:      Image to save.
     - parameter completion: Called in the background when the image was saved or in case of any error.
     */
    static func saveImage(
        image: UIImage,
        to album: PHAssetCollection,
        completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil
    ) {
        DispatchQueue.global(qos: .background).async {
            PHPhotoLibrary.shared().performChanges({
                let assetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)

                guard
                    let placeholder = assetRequest.placeholderForCreatedAsset,
                    let assets = [placeholder] as? NSFastEnumeration
                else {
                    completion?(false, nil)
                    return
                }

                let albumChangeRequest = PHAssetCollectionChangeRequest(for: album)
                albumChangeRequest?.addAssets(assets)
            }, completionHandler: { success, error in
                completion?(success, error as? NSError)
            })
        }
    }
}
