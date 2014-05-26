//
//  OmniModel.h
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OmniModel <NSObject>
    +(NSArray *) propertyMapping;
    +(id <OmniModel>) belongsTo;
    +(id <OmniModel>) hasMany;
    +(NSString *) modelName;
    +(NSString *) pathPrefix;
@end
