
import UIKit
import CoreImage
import Foundation

// Generate QR Code
public func generateQRCode(from string: String) -> UIImage? {
    
    // Remove umlauts
    let removeÄ = string.replacingOccurrences(of: "ä", with: "ae")
    let removeÜ = removeÄ.replacingOccurrences(of: "ü", with: "ue")
    let removeÖ = removeÜ.replacingOccurrences(of: "ö", with: "oe")
    let validString = removeÖ
    
    let data = validString.data(using: String.Encoding.ascii)
    
    if let filter = CIFilter(name: "CIQRCodeGenerator") {
        
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 20, y: 20)
        
        if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
        }
    }
    
    return nil
}
