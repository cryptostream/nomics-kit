# NomicsKit

Platform agnostic strongly typed programatic access to `api.nomics.com` in Swift

## Install

Add NomicsKit as a dependency in your `Package.swift` file.

```swift
.package(url: "https://github.com/cryptostream/nomics-kit.git", from: "0.1.0"),
```

## Use

Import framework

```swift
import NomicsKit
```

Create instance and request. Tthe `NomicsAPIEndpoint` type will automatically return a strongly typed object

```swift
let nomics = Nomics(key: "YOUR_NOMICS_API_KEY")
nomics.request(endpoint: NomicsAPI.currencies(.dashboard).endpoint) { (result) in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error.description)
    }
}
```
