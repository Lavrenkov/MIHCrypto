#import <Foundation/Foundation.h>


//
//  MIHECObject.h
//  MIHCrypto
//
//  Created by Dmitry Lobanov on 14.08.2018.
//  Copyright © 2018 Michael Hohl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MIHECProtocol__DebugInformation <NSObject>
- (NSDictionary *)debugInformation;
@end

@interface MIHECObject : NSObject <MIHECProtocol__DebugInformation> @end
