#import <Foundation/Foundation.h>


//
//  MIHECKey.h
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
#import <MIHCrypto/MIHEC.h>
#else
#import "MIHEC.h"
#endif

@interface MIHECKey : MIHECObject

@property (assign, nonatomic, readonly) EC_KEY *key;
- (instancetype)initWithKey:(EC_KEY *)key;

@end

@interface MIHECKey (NSCopying) <NSCopying> @end
