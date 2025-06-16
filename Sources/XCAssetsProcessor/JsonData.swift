//
//  JsonData.swift
//  XCAssetsProcessor
//
import Foundation

public struct IconDataItem: Codable {
    public let size: String
    public let expected_size: String
    public let filename: String
    public let folder: String
    public let idiom: Idiom
    public let scale: String
    
    // watch
    public let subtype: String?
    public let role: String?
    
    public enum Idiom: String, Codable {
        case iphone
        case ipad
        case ios_marketing = "ios-marketing"
        case watch_marketing = "watch-marketing"
        case watch
        case mac
    }
    
    private enum CodingKeys: String, CodingKey {
        case size
        case expected_size = "expected-size"
        case filename
        case folder
        case idiom
        case scale
        case subtype
        case role
    }
    
    public init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<IconDataItem.CodingKeys> = try decoder.container(keyedBy: IconDataItem.CodingKeys.self)
        
        self.size = try container.decode(String.self, forKey: IconDataItem.CodingKeys.size)
        self.expected_size = try container.decode(String.self, forKey: IconDataItem.CodingKeys.expected_size)
        self.filename = try container.decode(String.self, forKey: IconDataItem.CodingKeys.filename)
        self.folder = try container.decode(String.self, forKey: IconDataItem.CodingKeys.folder)
        let idiom = try container.decode(IconDataItem.Idiom.self, forKey: IconDataItem.CodingKeys.idiom)
        self.idiom = idiom
        self.scale = try container.decode(String.self, forKey: IconDataItem.CodingKeys.scale)
        if idiom == .watch {
            self.subtype = try container.decodeIfPresent(String.self, forKey: IconDataItem.CodingKeys.subtype)
            self.role = try container.decode(String.self, forKey: IconDataItem.CodingKeys.role)
        } else {
            self.subtype = nil
            self.role = nil
        }
        
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container: KeyedEncodingContainer<IconDataItem.CodingKeys> = encoder.container(keyedBy: IconDataItem.CodingKeys.self)
        
        try container.encode(self.size, forKey: IconDataItem.CodingKeys.size)
        try container.encode(self.expected_size, forKey: IconDataItem.CodingKeys.expected_size)
        try container.encode(self.filename, forKey: IconDataItem.CodingKeys.filename)
        try container.encode(self.folder, forKey: IconDataItem.CodingKeys.folder)
        try container.encode(self.idiom, forKey: IconDataItem.CodingKeys.idiom)
        try container.encode(self.scale, forKey: IconDataItem.CodingKeys.scale)
        if idiom == .watch {
            try container.encodeIfPresent(self.subtype, forKey: IconDataItem.CodingKeys.subtype)
            try container.encodeIfPresent(self.role, forKey: IconDataItem.CodingKeys.role)
        }
    }
}

public extension Array where Element == IconDataItem {
    static var allIcons: Self {
        try! JSONDecoder().decode(Self.self, from: icons_data.data(using: .utf8)!)
    }
}

public struct ContentsJson: Codable {
    var images: [IconDataItem]
    
    public init(images: [IconDataItem]) {
        self.images = images
    }
}

let icons_data = """
[
        {
            "size": "60x60",
            "expected-size": "180",
            "filename": "180.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "3x"
        },
        {
            "size": "40x40",
            "expected-size": "80",
            "filename": "80.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "2x"
        },
        {
            "size": "40x40",
            "expected-size": "120",
            "filename": "120.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "3x"
        },
        {
            "size": "60x60",
            "expected-size": "120",
            "filename": "120.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "2x"
        },
        {
            "size": "57x57",
            "expected-size": "57",
            "filename": "57.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "1x"
        },
        {
            "size": "29x29",
            "expected-size": "58",
            "filename": "58.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "2x"
        },
        {
            "size": "29x29",
            "expected-size": "29",
            "filename": "29.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "1x"
        },
        {
            "size": "29x29",
            "expected-size": "87",
            "filename": "87.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "3x"
        },
        {
            "size": "57x57",
            "expected-size": "114",
            "filename": "114.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "2x"
        },
        {
            "size": "20x20",
            "expected-size": "40",
            "filename": "40.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "2x"
        },
        {
            "size": "20x20",
            "expected-size": "60",
            "filename": "60.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "iphone",
            "scale": "3x"
        },
        {
            "size": "1024x1024",
            "filename": "1024.png",
            "expected-size": "1024",
            "idiom": "ios-marketing",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "scale": "1x"
        },
        {
            "size": "40x40",
            "expected-size": "80",
            "filename": "80.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "size": "72x72",
            "expected-size": "72",
            "filename": "72.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "1x"
        },
        {
            "size": "76x76",
            "expected-size": "152",
            "filename": "152.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "size": "50x50",
            "expected-size": "100",
            "filename": "100.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "size": "29x29",
            "expected-size": "58",
            "filename": "58.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "size": "76x76",
            "expected-size": "76",
            "filename": "76.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "1x"
        },
        {
            "size": "29x29",
            "expected-size": "29",
            "filename": "29.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "1x"
        },
        {
            "size": "50x50",
            "expected-size": "50",
            "filename": "50.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "1x"
        },
        {
            "size": "72x72",
            "expected-size": "144",
            "filename": "144.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "size": "40x40",
            "expected-size": "40",
            "filename": "40.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "1x"
        },
        {
            "size": "83.5x83.5",
            "expected-size": "167",
            "filename": "167.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "size": "20x20",
            "expected-size": "20",
            "filename": "20.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "1x"
        },
        {
            "size": "20x20",
            "expected-size": "40",
            "filename": "40.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "ipad",
            "scale": "2x"
        },
        {
            "idiom": "watch",
            "filename": "172.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "38mm",
            "scale": "2x",
            "size": "86x86",
            "expected-size": "172",
            "role": "quickLook"
        },
        {
            "idiom": "watch",
            "filename": "80.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "38mm",
            "scale": "2x",
            "size": "40x40",
            "expected-size": "80",
            "role": "appLauncher"
        },
        {
            "idiom": "watch",
            "filename": "88.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "40mm",
            "scale": "2x",
            "size": "44x44",
            "expected-size": "88",
            "role": "appLauncher"
        },
        {
            "idiom": "watch",
            "filename": "102.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "45mm",
            "scale": "2x",
            "size": "51x51",
            "expected-size": "102",
            "role": "appLauncher"
        },
        {
            "idiom": "watch",
            "filename": "108.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "49mm",
            "scale": "2x",
            "size": "54x54",
            "expected-size": "108",
            "role": "appLauncher"
        },
        {
            "idiom": "watch",
            "filename": "92.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "41mm",
            "scale": "2x",
            "size": "46x46",
            "expected-size": "92",
            "role": "appLauncher"
        },
        {
            "idiom": "watch",
            "filename": "100.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "44mm",
            "scale": "2x",
            "size": "50x50",
            "expected-size": "100",
            "role": "appLauncher"
        },
        {
            "idiom": "watch",
            "filename": "196.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "42mm",
            "scale": "2x",
            "size": "98x98",
            "expected-size": "196",
            "role": "quickLook"
        },
        {
            "idiom": "watch",
            "filename": "216.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "44mm",
            "scale": "2x",
            "size": "108x108",
            "expected-size": "216",
            "role": "quickLook"
        },
        {
            "idiom": "watch",
            "filename": "234.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "45mm",
            "scale": "2x",
            "size": "117x117",
            "expected-size": "234",
            "role": "quickLook"
        },
        {
            "idiom": "watch",
            "filename": "258.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "49mm",
            "scale": "2x",
            "size": "129x129",
            "expected-size": "258",
            "role": "quickLook"
        },
        {
            "idiom": "watch",
            "filename": "48.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "38mm",
            "scale": "2x",
            "size": "24x24",
            "expected-size": "48",
            "role": "notificationCenter"
        },
        {
            "idiom": "watch",
            "filename": "55.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "42mm",
            "scale": "2x",
            "size": "27.5x27.5",
            "expected-size": "55",
            "role": "notificationCenter"
        },
        {
            "idiom": "watch",
            "filename": "66.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "subtype": "45mm",
            "scale": "2x",
            "size": "33x33",
            "expected-size": "66",
            "role": "notificationCenter"
        },
        {
            "size": "29x29",
            "expected-size": "87",
            "filename": "87.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "watch",
            "role": "companionSettings",
            "scale": "3x"
        },
        {
            "size": "29x29",
            "expected-size": "58",
            "filename": "58.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "watch",
            "role": "companionSettings",
            "scale": "2x"
        },
        {
            "size": "1024x1024",
            "expected-size": "1024",
            "filename": "1024.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "watch-marketing",
            "scale": "1x"
        },
        {
            "size": "128x128",
            "expected-size": "128",
            "filename": "128.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "1x"
        },
        {
            "size": "256x256",
            "expected-size": "256",
            "filename": "256.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "1x"
        },
        {
            "size": "128x128",
            "expected-size": "256",
            "filename": "256.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "2x"
        },
        {
            "size": "256x256",
            "expected-size": "512",
            "filename": "512.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "2x"
        },
        {
            "size": "32x32",
            "expected-size": "32",
            "filename": "32.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "1x"
        },
        {
            "size": "512x512",
            "expected-size": "512",
            "filename": "512.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "1x"
        },
        {
            "size": "16x16",
            "expected-size": "16",
            "filename": "16.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "1x"
        },
        {
            "size": "16x16",
            "expected-size": "32",
            "filename": "32.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "2x"
        },
        {
            "size": "32x32",
            "expected-size": "64",
            "filename": "64.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "2x"
        },
        {
            "size": "512x512",
            "expected-size": "1024",
            "filename": "1024.png",
            "folder": "Images.xcassets/AppIcon.appiconset/",
            "idiom": "mac",
            "scale": "2x"
        }
]
"""
