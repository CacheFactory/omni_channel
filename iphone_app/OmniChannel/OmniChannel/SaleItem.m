//
//  SaleItem.m
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "SaleItem.h"

@implementation SaleItem
    +(id <OmniModel>) belongsTo{ return NULL;}
    +(id <OmniModel>) hasMany{ return NULL;}
    +(NSString *) modelName{ return @"client";}
    +(NSArray *) propertyMapping{
        return @[@"name", @"model_id"];
    }
@end
