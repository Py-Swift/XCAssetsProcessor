//
//  IconType.swift
//  XCAssetsProcessor
//

import CoreGraphics
import CoreImage

extension CGSize: Swift.ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(width: value, height: value)
    }
}

extension CGSize: Swift.ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(width: CGFloat(value), height: CGFloat(value))
    }
}
struct IconType: ExpressibleByIntegerLiteral {
    
    let name: String
    let size: CGSize
    var size_arg: String { "\(Int(size.width)) \(Int(size.height))" }
    init(integerLiteral value: Int) {
        name = "\(value).png"
        size = .init(integerLiteral: value)
    }
    
    func process(input: CIImage) -> CIImage {
        input.lanczosScale(scaledTo: .init(origin: .zero, size: size))
    }
}

extension IconType {
    static var icon87: Self { 87 }
    static var icon58: Self { 58 }
    static var icon29: Self { 29 }
    
    static var icon60: Self { 60 }
    static var icon120: Self { 120 }
    static var icon80: Self { 80 }
    
    static var icon114: Self { 114 }
    static var icon57: Self { 57 }
    
    static var icon180: Self { 180 }
    
    static var icon20: Self { 20 }
    static var icon40: Self { 40 }
    
    static var icon100: Self { 100 }
    static var icon50: Self { 50 }
    
    static var icon144: Self { 144 }
    static var icon72: Self { 72 }
    
    static var icon152: Self { 152 }
    static var icon76: Self { 76 }
    
    static var icon167: Self { 167 }
    
    static var icon48: Self { 48 }
    static var icon55: Self { 55 }
    static var icon66: Self { 66 }
    static var icon88: Self { 88 }
    static var icon92: Self { 92 }
    static var icon102: Self { 102 }
    static var icon108: Self { 108 }
    
    static var icon172: Self { 172 }
    static var icon196: Self { 196 }
    static var icon216: Self { 216 }
    static var icon234: Self { 234 }
    static var icon258: Self { 258 }
    
    static var icon1024: Self { 1024 }
    static var icon512: Self { 512 }
    static var icon256: Self { 256 }
    static var icon128: Self { 128 }
    static var icon64: Self { 64 }
    static var icon32: Self { 32 }
    static var icon16: Self { 16 }
    
    static let iphoneIcons: [Self] = [
        .icon87,
        .icon58,
        .icon29,
        .icon60,
        .icon120,
        .icon80,
        .icon114,
        .icon57,
        .icon180
    ]
    
    static let ipadIcons: [Self] = [
        .icon20,
        .icon40,
        .icon100,
        .icon50,
        .icon144,
        .icon72,
        .icon152,
        .icon76,
        .icon167
    ]
    
    static let watchIcons: [Self] = [
        .icon48,
        .icon55,
        .icon66,
        .icon88,
        .icon92,
        .icon102,
        .icon108,
        .icon172,
        .icon196,
        .icon216,
        .icon234,
        .icon258
    ]
    
    static let macIcons: [Self] = [
        //.icon1024,
        .icon512,
        .icon256,
        .icon128,
        .icon64,
        .icon32,
        .icon16
    ]
}
