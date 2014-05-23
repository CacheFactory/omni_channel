//
//  BaseModel.h
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface BaseModel : NSObject

@property NSInteger model_id;

+(RKObjectManager *)objectManager;
+(void) resetObjectManager;

+ (void ( ^ ) ( RKObjectRequestOperation *operation , NSError *error )) errorHandeler;

@end
