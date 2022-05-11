# QRKit

With QRKit you can easily create QR codes in Swift. QRKit supports a simple customization. The QR code you get simply as ```UIImage```.

## Features

- [x] Create QR codes
- [x] Create bar codes
- [x] Change the foreground color
- [x] Change the background color

## Installation

You can install QRKit with the Swift Package Manager.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/lassestolley/QRKit.git", from: "1.0.0")
    ],
)
```

## How To Use

**1.** Import QRKit

```swift
import QRKit
```

**2.** Create QR code

`URL`
```swift
if let url = yourUrl {
    var qrCode = QRCode(url)
    yourImageView.image = qrCode?.image
}
```

`Data`
```swift
if let data = yourData {
    var qrCode = QRCode(data)
    yourImageView.image = qrCode?.image
}
```

`String`
```swift
if let string = yourString {
    var qrCode = QRCode(string)
    yourImageView.image = qrCode?.image
}
```

## Customize the QR code

You can customize the QR code as you wish.

```swift
qrCode.backgroundColor = .systemRed
qrCode.foregroundColor = .systemGreen
qrCode.type = .qrCode
qrCode.correction = .low
```

## UIImageView extension

QRKit supports native implementation with a `UIImageView`

```swift
let imageView = UIImageView(qrCode: qrCode)
```
