//
//  UIImage+Extension.swift

//
//  Created by KniGht ThanaKorn on 22/3/22.
//

import Foundation
import Kingfisher

extension UIImageView {

    func setImage(
        source: SourceImage,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo = [],
        showIndicator: Bool = false,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) {
        switch source {
        case let .network(url):
            setImage(
                source: url,
                placeholder: placeholder,
                options: options,
                showIndicator: showIndicator,
                completionHandler: completionHandler)

        case let .provider(image):
            self.image = image
        }
    }

    func setImage(
        source: URL,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo = [],
        showIndicator: Bool = false,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) {
        setImageProcess(
            sourceURL: source,
            placeholder: placeholder,
            options: options,
            showIndicator: showIndicator,
            completionHandler: completionHandler)
    }

    func setImage(
        source: String,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo = [],
        showIndicator: Bool = false,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) {
        setImageProcess(
            sourceString: source,
            placeholder: placeholder,
            options: options,
            showIndicator: showIndicator,
            completionHandler: completionHandler)
    }

    private func setImageProcess(
        sourceString: String? = nil,
        sourceURL: URL? = nil,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo = [],
        showIndicator: Bool = false,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) {
        let source: URL
        var defaultOptions: KingfisherOptionsInfo = [
            .alsoPrefetchToMemory,
            .progressiveJPEG(.default),
            .transition(.fade(0.33))
        ]

        if options.isEmpty.not {
            defaultOptions.append(contentsOf: options)
        }

        if let resource = sourceString?.trimmed.url {
            self.image = placeholder
            source = resource
        } else if let resource = sourceURL {
            source = resource
        } else {
            self.image = placeholder
            return
        }

        self.kf.indicatorType = showIndicator ? .activity : .none
        self.kf.setImage(
            with: source,
            placeholder: placeholder,
            options: defaultOptions,
            progressBlock: { _, _ in
                //                let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
                //                print("downloading progress: \(percentage)%")
            }, completionHandler: completionHandler)
    }

    func setTintColor(_ color: UIColor) {
        guard let image = self.image else {
            return
        }

        self.image = image.template
        self.tintColor = color
    }
}
