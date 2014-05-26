//
//  UserSettingsViewController.m
//  OmniChannel
//
//  Created by Edward anderson on 5/26/14.
//  Copyright (c) 2014 Edward anderson. All rights reserved.
//

#import "UserSettingsViewController.h"
#import "User.h"

@interface UserSettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;



@end

@implementation UserSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)logoutButtonPressed:(id)sender {
    [currentUser logout:^{
        UIStoryboard *settingsStoryboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *initialSettingsVC = [settingsStoryboard instantiateInitialViewController];
        initialSettingsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:initialSettingsVC animated:YES completion:nil];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentUser = [User getCurrentUser];
    self.nameLabel.text = currentUser.first_name;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
