# Bruynet

> Bruynet is a network layer implemented in Swift using Combine framework.

## Explanation

### Calling Protocol

We have a protocol which name is 'Calling' and it has a function which is responsible to request and respond it's result.

```swift
public protocol Calling {
    func call<T: Decodable>(type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, Error>
}
```

You can create a mock struct which conforms 'Calling' protocol to be able to write test cases. 

### Bruynet
Bruynet is a struct that conforms 'Calling' protocol. I should say it is hearth of this Swift Package.

### Endpoint
Endpoint is a struct which has your request path, http body object as Data and HttpMethod (get, post..).

You can create a get request by first initilazer.

```swift
init(path: String, httpMethod: HTTPMethod = .get)
```

If you want to create a post request with httpBody, you have to use second initilazer.

```swift
init<C>(path: String, body: C? = nil, httpMethod: HTTPMethod = .post) where C: Encodable
```

> BaseURL is the constant base string of your backend. You can assing it at the beginning of application.

```swift
URLSession.shared.baseURL = ""
```

### Requestable
Requestable is a protocol which has a property named 'networkProtocol' type of 'Calling'. 
You will create an struct which conforms 'Requestable' and add your own backend-specific functions.

```swift
public struct MemberRequest: Requestable {
    public var networkProtocol: Calling
    
    public init(networkProtocol: Calling = Bruynet()) {
        self.networkProtocol = networkProtocol
    }
}
```

If you want to use this struct to write test, you can create a struct which conforms 'Calling' then create 'MemberRequest' using that struct,
you will be able to use your own mock data.

## Installation

You will be able to add this package to your project easily by SPM.

> File -> Swift Packages -> Add Package Dependency

and find 'Bruynet' in that huge list then add it to your project.

I recommend to you use latest version.

## Meta

Barış UYAR – [@prospectcha](https://twitter.com/prospectcha) – baris.uyar@hotmail.com

[Github](https://github.com/barisuyar)
