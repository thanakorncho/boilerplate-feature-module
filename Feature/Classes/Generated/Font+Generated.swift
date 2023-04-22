// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
public typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum FeatFont {
  public enum Kanit {
    public static let black = FontConvertible(name: "Kanit-Black", family: "Kanit", path: "Kanit-Black.ttf")
    public static let blackItalic = FontConvertible(name: "Kanit-BlackItalic", family: "Kanit", path: "Kanit-BlackItalic.ttf")
    public static let bold = FontConvertible(name: "Kanit-Bold", family: "Kanit", path: "Kanit-Bold.ttf")
    public static let boldItalic = FontConvertible(name: "Kanit-BoldItalic", family: "Kanit", path: "Kanit-BoldItalic.ttf")
    public static let extraBold = FontConvertible(name: "Kanit-ExtraBold", family: "Kanit", path: "Kanit-ExtraBold.ttf")
    public static let extraBoldItalic = FontConvertible(name: "Kanit-ExtraBoldItalic", family: "Kanit", path: "Kanit-ExtraBoldItalic.ttf")
    public static let extraLight = FontConvertible(name: "Kanit-ExtraLight", family: "Kanit", path: "Kanit-ExtraLight.ttf")
    public static let extraLightItalic = FontConvertible(name: "Kanit-ExtraLightItalic", family: "Kanit", path: "Kanit-ExtraLightItalic.ttf")
    public static let italic = FontConvertible(name: "Kanit-Italic", family: "Kanit", path: "Kanit-Italic.ttf")
    public static let light = FontConvertible(name: "Kanit-Light", family: "Kanit", path: "Kanit-Light.ttf")
    public static let lightItalic = FontConvertible(name: "Kanit-LightItalic", family: "Kanit", path: "Kanit-LightItalic.ttf")
    public static let medium = FontConvertible(name: "Kanit-Medium", family: "Kanit", path: "Kanit-Medium.ttf")
    public static let mediumItalic = FontConvertible(name: "Kanit-MediumItalic", family: "Kanit", path: "Kanit-MediumItalic.ttf")
    public static let regular = FontConvertible(name: "Kanit-Regular", family: "Kanit", path: "Kanit-Regular.ttf")
    public static let semiBold = FontConvertible(name: "Kanit-SemiBold", family: "Kanit", path: "Kanit-SemiBold.ttf")
    public static let semiBoldItalic = FontConvertible(name: "Kanit-SemiBoldItalic", family: "Kanit", path: "Kanit-SemiBoldItalic.ttf")
    public static let thin = FontConvertible(name: "Kanit-Thin", family: "Kanit", path: "Kanit-Thin.ttf")
    public static let thinItalic = FontConvertible(name: "Kanit-ThinItalic", family: "Kanit", path: "Kanit-ThinItalic.ttf")
    public static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  public static let allCustomFonts: [FontConvertible] = [Kanit.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(macOS)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  public func swiftUIFont(fixedSize: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, fixedSize: fixedSize)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  public func swiftUIFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size, relativeTo: textStyle)
  }
  #endif

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate func registerIfNeeded() {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: family).contains(name) {
      register()
    }
    #elseif os(macOS)
    if let url = url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      register()
    }
    #endif
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return FeatureBundlePod.resourcesBundle.url(forResource: path, withExtension: nil)
  }
}

public extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    font.registerIfNeeded()
    self.init(name: font.name, size: size)
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, size: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size)
  }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
public extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, fixedSize: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, fixedSize: fixedSize)
  }

  static func custom(
    _ font: FontConvertible,
    size: CGFloat,
    relativeTo textStyle: SwiftUI.Font.TextStyle
  ) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size, relativeTo: textStyle)
  }
}
#endif
