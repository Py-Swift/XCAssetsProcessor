//
//  XCAssetsCLI.swift
//  XCAssetsProcessor
//
//  Created by CodeBuilder on 16/06/2025.
//

import PathKit
import XCAssetsProcessor
import Foundation

let png: Path = "/Volumes/CodeSSD/icon.png"
let dest: Path = "/Volumes/CodeSSD/kv_school_tests/ios_dev/MyProj/Resources/Images.xcassets"

let appiconset = dest + "AppIcon.appiconset"

try? appiconset.mkpath()

let assetData = [IconDataItem].allIcons.filter({$0.idiom != .mac})
let sizes: [CGFloat] = assetData.compactMap { Double($0.expected_size)! }
try XCAssetsProcessor(source: png).process(dest: appiconset, sizes: sizes)


try JSONEncoder().encode(ContentsJson(images: assetData)).write(to: (appiconset + "Contents.json").url)

