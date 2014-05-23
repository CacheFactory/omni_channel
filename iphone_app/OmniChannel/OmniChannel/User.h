//
//  User.h
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "BaseModel.h"
#import "OmniModel.h"

@interface User : BaseModel <OmniModel>;

@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *last_name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *authentication_token;

+ (User *) getCurrentUser;

@end
