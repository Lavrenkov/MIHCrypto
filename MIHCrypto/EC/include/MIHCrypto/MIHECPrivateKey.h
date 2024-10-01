#import <Foundation/Foundation.h>


//
//  MIHECPrivateKey.h
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
#import <MIHCrypto/MIHPrivateKey.h>
#else
#import "MIHPrivateKey.h"
#endif

@interface MIHECPrivateKey : MIHECBaseKey @end

@class MIHECSignature;
@interface MIHECPrivateKey (MIHPrivateKey) <MIHPrivateKey>
- (NSData *)signMessage:(NSData *)message error:(NSError *__autoreleasing *)error;
- (MIHECSignature *)theSignMessage:(NSData *)message error:(NSError *__autoreleasing *)error;
@end
