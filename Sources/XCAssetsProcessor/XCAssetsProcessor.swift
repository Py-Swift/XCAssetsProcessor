// The Swift Programming Language
// https://docs.swift.org/swift-book
import CoreGraphics
import CoreImage
import CoreImage.CIFilterBuiltins
import Cocoa
import Foundation
import PathKit

public enum XCAssetsError: Error {
    case badURL
}

extension CIImage {
    func lanczosScale(scale: Float, aspectRatio: Float = 1) -> CIImage {
        let lanczosScaleFilter = CIFilter.lanczosScaleTransform()
        lanczosScaleFilter.inputImage = self
        lanczosScaleFilter.scale =  scale
        lanczosScaleFilter.aspectRatio = aspectRatio
        return lanczosScaleFilter.outputImage!
    }
    
    func lanczosScale(scaledTo rect: CGRect) -> CIImage {
        let size = extent.size
        let org_w = size.width
        let org_h = size.height
        
        let new_size = rect.size
        let new_w = new_size.width
        let new_h = new_size.height
        let scalingFactor = min(new_w / org_w, new_h / org_h)
        
        return lanczosScale(scale: Float(scalingFactor))
    }
    
    var bitmap: NSBitmapImageRep {
        .init(ciImage: self)
    }
    
    func saveAsPng(dest: Path) throws {
        let pngData = bitmap.representation(using: .png, properties: [:])!
        try pngData.write(to: dest.url)
    }
}

public class XCAssetsProcessor {
    
    let source: Path
    
    public init(source: Path) throws {
        self.source = source
        
    }
    
    public func process(dest: Path, sizes: [CGFloat]) throws {
        guard let original = CIImage(contentsOf: source.url) else { throw XCAssetsError.badURL }
        let is_1024x1024 = original.extent.size == .init(width: 1024, height: 1024)
        let icon1024 = is_1024x1024 ? original : IconType.icon1024.process(input: original)
        try icon1024.saveAsPng(dest: dest + IconType.icon1024.name)
        let icons = IconType.ipadIcons + IconType.iphoneIcons + IconType.watchIcons + IconType.macIcons
        for icon in icons.filter({icon in sizes.contains(where: {icon.size.width == $0})}) {
            
            let resized = icon.process(input: icon1024)
            try resized.saveAsPng(dest: dest + icon.name)
        }
    }
}
