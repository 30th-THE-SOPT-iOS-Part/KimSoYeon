// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let instagramBlackLogo = ImageAsset(name: "Instagram_black_logo")
    internal static let avatar1 = ImageAsset(name: "avatar1")
    internal static let avatar2 = ImageAsset(name: "avatar2")
    internal static let avatar3 = ImageAsset(name: "avatar3")
    internal static let avatar4 = ImageAsset(name: "avatar4")
    internal static let avatar5 = ImageAsset(name: "avatar5")
    internal static let avatar6 = ImageAsset(name: "avatar6")
    internal static let icnAdd = ImageAsset(name: "icn_add")
    internal static let icnBack = ImageAsset(name: "icn_back")
    internal static let icnBookmark = ImageAsset(name: "icn_bookmark")
    internal static let icnComment = ImageAsset(name: "icn_comment")
    internal static let icnHome = ImageAsset(name: "icn_home")
    internal static let icnHomeSelected = ImageAsset(name: "icn_home_selected")
    internal static let icnLike = ImageAsset(name: "icn_like")
    internal static let icnMore = ImageAsset(name: "icn_more")
    internal static let icnProfile = ImageAsset(name: "icn_profile")
    internal static let icnProfileSelected = ImageAsset(name: "icn_profile_selected")
    internal static let icnReels = ImageAsset(name: "icn_reels")
    internal static let icnReelsSelected = ImageAsset(name: "icn_reels_selected")
    internal static let icnSearch = ImageAsset(name: "icn_search")
    internal static let icnSearchSelected = ImageAsset(name: "icn_search_selected")
    internal static let icnShare = ImageAsset(name: "icn_share")
    internal static let icnShop = ImageAsset(name: "icn_shop")
    internal static let icnShopSelected = ImageAsset(name: "icn_shop_selected")
    internal static let icnUnlike = ImageAsset(name: "icn_unlike")
    internal static let passwordHiddenEyeIcon = ImageAsset(name: "password_hidden_eyeIcon")
    internal static let passwordShownEyeIcon = ImageAsset(name: "password_shown_eyeIcon")
    internal static let postImage1 = ImageAsset(name: "postImage1")
    internal static let postImage2 = ImageAsset(name: "postImage2")
    internal static let postImage3 = ImageAsset(name: "postImage3")
    internal static let postImage4 = ImageAsset(name: "postImage4")
  }
  internal enum Colors {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
