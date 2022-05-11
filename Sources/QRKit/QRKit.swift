//
//  MKInvertedCircleOverlay.swift
//  MKInvertedCircleOverlay
//
//  Created by Lasse Stolley on 11.04.22.
//  Copyright 2022 Lasse Stolley
//  MIT License
//
//  https://github.com/lassestolley/QRKit
//

import UIKit
import CoreImage

@available(iOS 13.0, *)
extension UIImageView {
    convenience init(qrCode: QRCode) {
        self.init(image: qrCode.image)
    }
}

@available(iOS 13.0, *)

/// Create a QR code with QRKit
struct QRCode {
    
    /// QR code background color. The default value is `.systemBackground`.
    public var backgroundColor: UIColor = .systemBackground
    
    /// QR code foreground color. The default value is `.label`.
    public var foregroundColor: UIColor = .label
    
    /// Type of QR code. The default value is `.qrCode`.
    public var type: QRCodeType = .qrCode
    
    /// Level of error correction. The default value is `.low`.
    public var correction: QRCodeCorrection = .low
    
    /// Data contained in the QR code.
    public var data: Data
    
    /// Type of QR code
    public enum QRCodeType: String {
        case qrCode = "CIQRCodeGenerator"
        case barCode = "CICode128BarcodeGenerator"
    }
    
    /// Level of error correction.
    public enum QRCodeCorrection: String {
        case low = "L"
        case medium = "M"
        case quartile = "Q"
        case high = "H"
    }
    
    public init(_ data: Data) {
        self.data = data
    }
    
    public init?(_ string: String) {
        if let data = string.data(using: .isoLatin1) {
            self.data = data
        } else {
            return nil
        }
    }
    
    public init?(_ url: URL) {
        if let data = url.absoluteString.data(using: .isoLatin1) {
            self.data = data
        } else {
            return nil
        }
    }
    
    /// Returns a `UIImage` containing the QR Code
    public var image: UIImage? {
        
        if let filter = CIFilter(name: type.rawValue) {
            
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue(correction.rawValue, forKey: "inputCorrectionLevel")
            let transform = CGAffineTransform(scaleX: 20, y: 20)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                
                let colorFilter = CIFilter(name: "CIFalseColor")!
                colorFilter.setDefaults()
                colorFilter.setValue(output, forKey: "inputImage")
                colorFilter.setValue(CIColor(cgColor: foregroundColor.cgColor), forKey: "inputColor0")
                colorFilter.setValue(CIColor(cgColor: backgroundColor.cgColor), forKey: "inputColor1")
                
                if let outputImage = colorFilter.outputImage {
                    return UIImage(ciImage: outputImage)
                }
            }
        }
        
        return nil
    }
}
