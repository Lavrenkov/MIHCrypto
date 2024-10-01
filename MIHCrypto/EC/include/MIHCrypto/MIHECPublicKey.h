#import <Foundation/Foundation.h>


//
//  MIHECPublicKey.h
//  MIHCrypto
//
//  Created by Dmitry Lobanov on 14.08.2018.
//  Copyright © 2018 Michael Hohl. All rights reserved.
//

#ifndef SWIFTPM
#import <MIHCrypto/MIHECObject.h>
#else
#import "MIHECObject.h"
#endif
#ifndef SWIFTPM
#import <MIHCrypto/MIHECBaseKey.h>
#else
#import "MIHECBaseKey.h"
#endif
#ifndef SWIFTPM
#import <MIHCrypto/MIHPublicKey.h>
#else
#import "MIHPublicKey.h"
#endif

@interface MIHECPublicKey : MIHECBaseKey

@end
@class MIHECSignature;
@interface MIHECPublicKey (MIHPublicKey) <MIHPublicKey>
- (BOOL)verifySignature:(NSData *)signature message:(NSData *)message;
- (BOOL)verifyTheSignature:(MIHECSignature *)signature message:(NSData *)message;
@end
