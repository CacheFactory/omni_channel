//
//  User.m
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "User.h"
#import "BaseModel.h"
#import "Client.h"

static User *currentUser = nil;

@implementation User
@synthesize first_name,last_name,password,email,authentication_token;

- (void)login: (void ( ^ ) ( User *updatedUser))success {
    RKObjectManager *objectManager = [BaseModel objectManager];
    
    [objectManager postObject:self path:@"authentication/users/sign_in" parameters:nil success: ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        User *userObj =(User *)result.firstObject;
        [User setCurrentUser:userObj];
        success(userObj);
        
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        
    } failure: [BaseModel errorHandeler]];
}

- (void)createAccount: (void ( ^ ) ( User *newUser))success withErrorHandeler:(void ( ^ ) ( RKObjectRequestOperation *operation , NSError *error ))errorHandeler {
    // POST to create
    
    RKObjectManager *objectManager = [BaseModel objectManager];
    [objectManager postObject:self path:@"authentication/users" parameters:nil success: ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        User *newUser =(User *)result.firstObject;
        [User setCurrentUser:newUser];
        
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        
        success(newUser);
        
    } failure: errorHandeler];
}


+(id <OmniModel>) belongsTo{ return [Client class];}
+(id <OmniModel>) hasMany{ return NULL;}
+(NSString *) modelName{ return @"user";}

+(NSArray *)propertyMapping{
    return @[@"first_name", @"last_name", @"password", @"email", @"authentication_token", @"model_id"];
}

+ (void) setCurrentUser:(User *)user{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userDict = @{@"email": user.email,
                               @"authentication_token": user.authentication_token};
    [defaults setObject:userDict forKey:@"currentUser"];
    [defaults synchronize];
    currentUser=user;
}

+(void) logoutCurrentUser{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"currentUser"];
    [defaults synchronize];
    currentUser=nil;
    [BaseModel resetObjectManager]; //for auth token cache
    
}

+ (User *) getCurrentUser{
    if(currentUser){
        return currentUser;
    }else{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *userDict = [defaults objectForKey:@"currentUser"];
        if(userDict){
            User *user = [User new];
            user.email = [userDict objectForKey:@"email"];
            user.authentication_token = [userDict objectForKey:@"authentication_token"];
            [User setCurrentUser:user];
            return user;
            
        }
    }
    return nil;
}

@end
