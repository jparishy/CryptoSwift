//
//  String+Extension.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 13/10/15.
//  Copyright © 2015 Marcin Krzyzanowski. All rights reserved.
//

import Foundation

extension String {

    /// Return Base64 representation
    public func encrypt(cipher: Cipher) throws -> String {
        let encrypted = try self.utf8.lazy.map({ $0 as UInt8 }).encrypt(cipher)
        return NSData(bytes: encrypted).base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
    }

    public func decrypt(cipher: Cipher) throws -> String {
        let decrypted = try self.utf8.lazy.map({ $0 as UInt8 }).decrypt(cipher)
        return NSData(bytes: decrypted).base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
    }

#if os(OSX)
	internal func bridge() -> NSString {
		return self as NSString
	}
#endif
}

extension NSString {

#if os(OSX)
	internal func bridge() -> String {
		return self as String
	}
#endif
}