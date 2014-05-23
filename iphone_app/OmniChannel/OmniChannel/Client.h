//
//  Client.h
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "BaseModel.h"
#import "OmniModel.h"

@interface Client : BaseModel <OmniModel>
@property (nonatomic, strong) NSString *name;

@end