# QRKit

With QRKit you can easily create QR or bar codes in Swift. You can choose foreground and background colors. The QR code you get simply as ```UIImage```.

## Features

- [x] Create QR Codes
- [x] Create bar codes
- [x] Change the foreground color
- [x] Change the background color
- [x] Automatic umlaut replacement

## Installation

You can install QRKit with the Swift Package Manager.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/Technikabo/QRKit.git", from: "1.0.0")
    ],
)
```

## How To Use

**1.** Import QRKit

```swift
import QRKit
```

**2.** A string with the content

```swift
let dataString = "Hello, I am the developer of this framework."
```

**3.** UIImageView

```swift
qrImageView.image = generateQRCode(from: dataString, type: .qrCode, backroundColor: UIColor.opaqueSeparator, foregroundColor: UIColor.systemBlue)
```
