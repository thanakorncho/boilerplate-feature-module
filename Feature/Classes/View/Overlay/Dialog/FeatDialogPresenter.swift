//
//  FeatDialogPresenter.swift
//
//  Created by KniGht ThanaKorn on 4/11/22.
//

import Foundation
import SwiftEntryKit

public class FeatDialogPresenter {
    public struct Content {
        let image: SourceImage
        let text: String

        public init(
            image: SourceImage,
            text: String
        ) {
            self.image = image
            self.text = text
        }
    }

    public struct Message {
        let message: String
        var duration: Double?

        public init(
            message: String,
            duration: Double? = nil
        ) {
            self.message = message
            self.duration = duration
        }
    }

//    @discardableResult
//    public static func create(
//        _ contents: [Content],
//        completionHandler: ((Int) -> Void)? = nil,
//        dismissCompletionHandler: (() -> Void)? = nil
//    ) -> FeatDialogPresenter {
//        let dialog = FeatDialogPresenter()
//        guard contents.isNotEmpty else { return dialog }
//
//        var attributes: EKAttributes = .centerFloatDialog
//        let width: EKAttributes.PositionConstraints.Edge
//        var isLandscape: Bool = false
//        if #available(iOS 13.0, *) {
//            let windowScene = UIApplication.currentlyWindow?.windowScene
//            isLandscape = windowScene?.interfaceOrientation.isLandscape ?? false
//        } else {
//            isLandscape = UIApplication.shared.statusBarOrientation.isLandscape
//        }
//
//        if isLandscape {
//            width = .ratio(value: 0.3)
//        } else {
//            width = .ratio(value: 0.7)
//        }
//        attributes.positionConstraints.size = .init(
//            width: width,
//            height: .intrinsic)
//        attributes.shadow = .none
//        attributes.roundCorners = .all(radius: 8)
//        attributes.screenInteraction = .init(
//            defaultAction: .dismissEntry,
//            customTapActions: [ { dismissCompletionHandler?() }
//            ])
//        let listView = dialog.createListDialog(
//            contents: contents,
//            completionHandler: completionHandler)
//        SwiftEntryKit.display(entry: listView, using: attributes)
//        return dialog
//    }

    @discardableResult
    public static func create(_ image: SourceImage) -> FeatDialogPresenter {
        let backgroundColor = ThemeColor.background.withAlphaComponent(0.5)
        let dialog = FeatDialogPresenter()
        var attributes: EKAttributes = .centerFloatDialog
        attributes.positionConstraints.maxSize = .init(
            width: .ratio(value: 0.75),
            height: .ratio(value: 0.7))
        attributes.entryInteraction = .dismiss
        attributes.screenInteraction = .dismiss
        attributes.shadow = .none
        attributes.roundCorners = .all(radius: 4)
        attributes.screenBackground = .color(color: .init(backgroundColor))
        let imageView = dialog.createImageDialog(image) { image in
            if image.size.width > image.size.height {
                attributes.positionConstraints.size = .init(
                    width: .fill,
                    height: .intrinsic)
            } else {
                attributes.positionConstraints.size = .init(
                    width: .intrinsic,
                    height: .fill)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.33, execute: {
            SwiftEntryKit.display(entry: imageView, using: attributes)
        })
        return dialog
    }

    private func createImageDialog(
        _ image: SourceImage,
        completionHandler: ((UIImage) -> Void)? = nil
    ) -> FeatImageView {
        let imageView = makeImageView(image: image)
        imageView.setImage(
            source: image,
            options: [.forceTransition, .cacheMemoryOnly],
            showIndicator: true,
            completionHandler: { result in
                switch result {
                case let .success(response):
                    let size = response.image.size
                    imageView.snp.makeConstraints({ make in
                        if size.width > size.height {
                            make.width.aspectRatioToSelf(
                                imageView.snp.height,
                                size.width / size.height)
                        } else {
                            make.height.aspectRatioToSelf(
                                imageView.snp.width,
                                size.height / size.width)
                        }
                    })
                    completionHandler?(response.image)

                case .failure:
                    break
                }
            })
        return imageView
    }

    public static func createMessageTopFloatDialog(_ content: Message) {
        var attributes = EKAttributes.simpleTopFloat
        attributes.displayDuration = content.duration ?? 5
        attributes.entryInteraction = .dismiss
        attributes.screenInteraction = .dismiss
        attributes.scroll = .disabled
        let inset: UIEdgeInsets = .init(
            horizontal: Constants.spacer(.s16),
            vertical: Constants.spacer(.s32))
        let textView = TextDescriptionView()
        let styles: [CommonView.Style.Label] = [
            .insets(inset),
            .font(.boldSystemFont(.small)),
            .alignment(.center),
            .textColor(ThemeColor.text)
        ]
        let label = TextDescriptionView.Label(
            text: content.message,
            styles: styles)
        textView.setupDisplayed(.init(title: label))
        SwiftEntryKit.display(entry: textView, using: attributes)
    }

//    private func createListDialog(
//        contents: [Content],
//        completionHandler: ((Int) -> Void)? = nil
//    ) -> ActionableListView {
//        let listView = makeListView(contents)
//        listView.event.onTap
//            .subscribe(onNext: { index in
//                completionHandler?(index)
//            })
//            .disposed(by: listView.disposeBag)
//        return listView
//    }
}

extension FeatDialogPresenter {
    private func makeImageView(image: SourceImage) -> FeatImageView {
        return .init().also { imageView in
            imageView.radius = 4
            imageView.rounded = true
            imageView.contentMode = .scaleAspectFit
        }
    }

//    private func makeListView(_ contents: [Content]) -> ActionableListView {
//        return .init().also { listView in
//            listView.setupDisplayed(contents.toDisplayed())
//        }
//    }
}

// fileprivate extension Array where Element == FeatDialogPresenter.Content {
//    func toDisplayed() -> ActionableListView.Displayed {
//        return .init(details: self.toDetails())
//    }
//
//    func toDetails() -> [ActionableListView.Detail] {
//        return self.compactMap { value in
//            return .init(
//                image: value.image,
//                text: value.text)
//        }
//    }
// }
