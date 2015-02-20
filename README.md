<p align="center" >
  <img src="https://github.com/hohl/MIHCrypto/raw/master/Assets/MIHCrypto-Logo.png" alt="MIHCrypto" title="MIHCrypto">
</p>

[![Build Status](https://travis-ci.org/hohl/MIHCrypto.svg?branch=master)](https://travis-ci.org/hohl/MIHCrypto)


[OpenSSL](https://www.openssl.org/) is the most powerful SSL and TLS library available which wraps a full cryptographic library. The library is written in pure C and due to its endless size and not-so-well-designed C interface it is very hard for beginners to step into it.

The aim of the MIHCrypto library is to provide an object-oriented interface which allows developers to write simple and clean code by still using the power of the OpenSSL `libCrypto` library. OpenSSL is a very large library so (yet) not the whole library is wrapped by MIHCrypto. Since [I](http://www.michaelhohl.net/) am developing the library because personal needs focus of the functionallity is on modern cryptographic apporaches, but everybody is welcome to contrbute other parts to the library.

## How To Get Started

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like MIHCrypto in your projects.

```ruby
platform :ios, '6.0'
pod "MIHCrypto", "~> 0.3.3"
```

### Sample Code

MIHCrypto is based on some less protocol declarations (in `MIHCrypto/Core`) and all ciphers are implementing these. So you have to use only a few interfaces for encrypting and decrypting with different cryptographic approaches.

    id<MIHSymmetricKey> symmetricKey = ...
    NSError *encryptionError = nil;
    NSData *messageData = [@"My top secret message" dataByUsingEncoding:NSUTF8Encoding];
    NSData *encryptedData = [symmetricKey encrypt:messageData error:&encryptionError];

These keys are either loaded from a file or generated by using an implementation of `MIHKeyFactory`.

    MIHAESKeyFactory *factory = [[MIHAESKeyFactory alloc] init];
    id<MIHSymmetricKey> aesKey = [factory generateKey];
    
If you need more sample code have a look at the unit tests or have a look at the <a href="http://cocoadocs.org/docsets/MIHCrypto/">docs</a>.

### Architecture

MIHCrypto is based on 5 core protocols which are implemented by various algorithms and approaches.

 - `MIHKeyFactory` - used to generate new keys
 - `MIHSymmetricKey` - represents a symmetric key (like AES or DES) and can be used to encrypt and decrypt data
 - `MIHPublicKey` - represents a public key (like RSA PUBKEY) and can be used to encrypt data and to verify a signature
 - `MIHPrivateKey` - represents a private key (like RSA private key) and can used to decrypt data and to sign a message
 - `MIHHashAlgorithm` - represents a hash funtion and only has one method to create the hash sum of the passed data

### Requirements

MIHCrypto requires Xcode 4 and above, targeting either iOS 5.0 and above, or Mac OS 10.7 Mountain Lion (64-bit with modern Cocoa runtime) and above.

## About

As already mentioned OpenSSL is very powerful and large project so this library doesn't support all functionallity of it yet and new functions are added as needed. At the moment following cryptographic approaches are supported:

 - AES (block cipher)
 - BIGNUM (discrete mathematics)
 - DES (block cipher)
 - MD5 (hash algorithm)
 - RSA (public-key cryptography)
 - SHA, SHA256, SHA384, SHA512 (hash algorithm)

Following approaches are in progress and may get published shortly:

 - ECC (public-key cryptography)
 
Anybody is welcome to add additional support for other approaches.

### Authors

 - [Michael Hohl](http://www.michaelhohl.net/)
 - [Akhil Stanislavose](https://github.com/akhilstanislavose)

### License

MIHCrypto is available under the MIT license. See the LICENSE file for more info.
