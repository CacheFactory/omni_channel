//
//  ShoppingListItem.m
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "ShoppingListItem.h"

@implementation ShoppingListItem

    +(id <OmniModel>) belongsTo{ return NULL;}
    +(id <OmniModel>) hasMany{ return NULL;}
    +(NSString *) modelName{ return @"shopping_list_item";}
    +(NSArray *) propertyMapping{
        return @[@"name", @"model_id"];
    }

@end
