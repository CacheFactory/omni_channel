//
//  User.h
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "BaseModel.h"
#import "OmniModel.h"
#import "Client.h"

@interface User : BaseModel <OmniModel>;

@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *last_name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *authentication_token;
@property (nonatomic, strong) Client *client;

+ (User *) getCurrentUser;
- (void)createAccount: (void ( ^ ) ( User *newUser))success withErrorHandeler:(void ( ^ ) ( RKObjectRequestOperation *operation , NSError *error ))errorHandeler ;
- (void)login: (void ( ^ ) ( User *updatedUser))success;
- (void)logout: (void ( ^ ) ())success;


@end
