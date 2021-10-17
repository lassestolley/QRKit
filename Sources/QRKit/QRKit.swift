
import UIKit
import CoreImage
import Foundation

// QR Code types
public enum QRType {
    
    case qrCode, barCode, aztecCode
    
    var filterName: String {
        
        switch self {
        
        case .qrCode:
            return "CIQRCodeGenerator"
        case .barCode:
            return "CICode128BarcodeGenerator"
        default:
            return "CIQRCodeGenerator"
        }
    }
}

// Generate QR Code
public func generateQRCode(from string: String, type: QRType, backroundColor: UIColor, foregroundColor: UIColor) -> UIImage? {
    
    // Remove umlauts
    let removeÄ = string.replacingOccurrences(of: "ä", with: "ae")
    let removeÜ = removeÄ.replacingOccurrences(of: "ü", with: "ue")
    let removeÖ = removeÜ.replacingOccurrences(of: "ö", with: "oe")
    let validString = removeÖ
    
    let data = validString.data(using: String.Encoding.ascii)
    
    // QR filter
    if let filter = CIFilter(name: type.filterName) {
        
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 20, y: 20)
        
        if let output = filter.outputImage?.transformed(by: transform) {
            
            // Color filter
            let colorFilter = CIFilter(name: "CIFalseColor")!

            // Set Colors
            colorFilter.setDefaults()
            colorFilter.setValue(output, forKey: "inputImage")
            colorFilter.setValue(CIColor(cgColor: foregroundColor.cgColor), forKey: "inputColor0")
            colorFilter.setValue(CIColor(cgColor: backroundColor.cgColor), forKey: "inputColor1")

            let outputImage = colorFilter.outputImage!
            
            return UIImage(ciImage: outputImage)
        }
    }
    
    return nil
}
