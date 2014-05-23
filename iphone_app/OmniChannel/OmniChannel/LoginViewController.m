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
    NSString *message = @"";
    User *user = [User new];
    user.email = self.emailField.text;
    user.password = self.passwordField.text;

    
    if(![self NSStringIsValidEmail:user.email]){
        message = @"Invalid email address";
    }else if(user.password.length < 8){
        message = @"Password must be 8 characters long";
    }
    
    if(message.length > 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation error" message: message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [user createAccount:^(User *user) {
            /*
            ViewController *presentingViewController = (ViewController *)self.presentingViewController;
            [self dismissViewControllerAnimated:YES completion:^{
                [presentingViewController  showLocationsWithAnnimation: YES];
            }];
            */
        } withErrorHandeler: [BaseModel errorHandeler]];
    }
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
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
