//
//  Client.m
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "Client.h"
#import "ShoppingListItem.h"

@implementation Client
@synthesize sale_items;
+(id <OmniModel>) belongsTo{ return NULL;}
+(id <OmniModel>) hasMany{ return [ShoppingListItem class];}
+(NSString *) modelName{ return @"client";}
+(NSArray *) propertyMapping{
    return @[@"name", @"model_id"];
}

@end
