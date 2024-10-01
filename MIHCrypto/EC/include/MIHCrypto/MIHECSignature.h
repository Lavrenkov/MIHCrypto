#import <Foundation/Foundation.h>


//
//  MIHECSignature.h
//  MIHCrypto
//
//  Created by Dmitry Lobanov on 21.08.2018.
//  Copyright © 2018 Michael Hohl. All rights reserved.
//

#ifndef SWIFTPM
#import <MIHCrypto/MIHECObject.h>
#else
#import "MIHECObject.h"
#endif
#ifndef SWIFTPM
#import <MIHCrypto/MIHEC.h>
#else
#import "MIHEC.h"
#endif
#ifndef SWIFTPM
#import <MIHCrypto/MIHCoding.h>
#else
#import "MIHCoding.h"
#endif

@interface MIHECSignature : MIHECObject
@property (assign, nonatomic, readonly) ECDSA_SIG *signature;
- (instancetype)initWithSignature:(ECDSA_SIG *)signature;
@end

@interface MIHECSignature (MIHCoding) <MIHCoding> @end

@interface MIHECSignature (Conversion)
+ (ECDSA_SIG *)signatureFromData:(NSData *)data;
+ (NSData *)dataFromSignature:(ECDSA_SIG *)signature;
@end
