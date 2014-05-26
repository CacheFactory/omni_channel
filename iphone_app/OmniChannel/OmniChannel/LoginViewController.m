//
//  LoginViewController.m
//  OmniChannel
//
//  Created by Edward anderson on 5/22/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "BaseModel.h"
#import "NSString+EddieString.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)loginButtonPressed:(id)sender {
    User *user = [User new];
    user.email = self.emailField.text;
    user.password = self.passwordField.text;
    
    [user login:^(User *loggedInUser) {
        [self showMainStoryboard];
        
    }];
}
- (IBAction)createUserButtonPressed:(id)sender {
    NSString *message = @"";
    User *user = [User new];
    user.email = self.emailField.text;
    user.password = self.passwordField.text;

    
    if(![user.email isValidEmail]){
        message = @"Invalid email address";
    }else if(user.password.length < 8){
        message = @"Password must be 8 characters long";
    }
    
    if(message.length > 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation error" message: message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [user createAccount:^(User *user) {
            [self showMainStoryboard];
        } withErrorHandeler: [BaseModel errorHandeler]];
    }
}

-(void)showMainStoryboard{
    UIStoryboard *settingsStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *initialSettingsVC = [settingsStoryboard instantiateInitialViewController];
    initialSettingsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:initialSettingsVC animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
