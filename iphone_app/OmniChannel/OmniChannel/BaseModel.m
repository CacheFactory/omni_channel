//
//  BaseModel.m
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "BaseModel.h"
#import <RestKit/RestKit.h>
#import <AFNetworking.h>
#import "Constants.h"
#import "User.h"
#import "Client.h"
#import "SaleItem.h"

static RKObjectManager * objectManagerSingleton;

@implementation BaseModel
@synthesize model_id;

+(RKObjectManager *)objectManager{
    if (!objectManagerSingleton) {
        RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString: BASE_URL]];
        NSArray *klasses = @[[User class], [Client class], [SaleItem class]];
        for(id klass in klasses){
            [self responseMappingForClass:klass withObjectManager:objectManager];
            [objectManager addRequestDescriptor: [self requestDescriptorForClass: klass] ];
        }
        
        
        User *currentUser = [User getCurrentUser];
        if (currentUser) {
            [(AFHTTPClient *) objectManager.HTTPClient setDefaultHeader:@"authentication_token" value:currentUser.authentication_token];
            [(AFHTTPClient *) objectManager.HTTPClient setDefaultHeader:@"email" value:currentUser.email];
        }
        objectManagerSingleton =objectManager;
    }
    
    
    return objectManagerSingleton;
}

+(void) resetObjectManager{

}

+(RKObjectMapping *)responseMappingForClass:(id <OmniModel>)klass withObjectManager:(RKObjectManager *)objectManager{
    
    RKObjectMapping *responseMapping = [[RKObjectMapping alloc]  initWithClass: [klass class] ];
    [responseMapping addAttributeMappingsFromArray: [klass propertyMapping]];
    
    id <OmniModel> hasMany =[klass hasMany];
    if (hasMany) {
        RKObjectMapping *relationshipMapping = [self responseMappingForClass: hasMany withObjectManager:objectManager];
        NSString *pathName = [NSString stringWithFormat:@"%@s" ,[[hasMany description] lowercaseString]];
        [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:pathName
                                                                                            toKeyPath:pathName
                                                                                          withMapping: relationshipMapping ]];
    }
    id <OmniModel> belongsTo =[klass belongsTo];
    if (belongsTo) {
        RKObjectMapping *relationshipMapping = [self responseMappingForClass: belongsTo withObjectManager:objectManager];
        NSString *pathName = [[belongsTo description] lowercaseString];
        [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:pathName
                                                                                        toKeyPath:pathName
                                                                                      withMapping: relationshipMapping ]];
    }
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    
    
    RKResponseDescriptor * responseDiscriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping method:RKRequestMethodAny pathPattern:nil  keyPath:[klass modelName] statusCodes:statusCodes];
    [objectManager addResponseDescriptor:responseDiscriptor];
    
    return responseMapping;
}

+(RKRequestDescriptor *)requestDescriptorForClass:(id <OmniModel>)klass{
    
     RKObjectMapping *propertyMapping =[RKObjectMapping requestMapping ];
     [propertyMapping addAttributeMappingsFromArray: [klass propertyMapping]];
     RKRequestDescriptor *requestDescriptor= [RKRequestDescriptor requestDescriptorWithMapping:propertyMapping objectClass:[klass class] rootKeyPath:[klass modelName] method:RKRequestMethodAny];
    return requestDescriptor;
    
}

@end






