//
//  MainMenu.m
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "MainMenu.h"

@interface MainMenu ()

@end

@implementation MainMenu
@synthesize loginButton;
@synthesize logoutButton;
@synthesize bar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(void)doAlert{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Log Out"
                   message:[NSString stringWithFormat:@"%@%@", @"Do you want to sign out for ", [[[[[Model uniqueModel] log] objectForKey:[[Model uniqueModel] loginID]] objectAtIndex:0] objectForKey:@"name"]]
                   delegate: self
                   cancelButtonTitle: nil
                   otherButtonTitles: @"Ok",@"Cancel",nil];
    
    
	[alertDialog show];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([[Model uniqueModel] logIn])
    {
        [logoutButton setEnabled:YES];
        [loginButton setEnabled:NO];
        bar.topItem.title = [[[[[Model uniqueModel] log] objectForKey:[[Model uniqueModel] loginID]] objectAtIndex:0] objectForKey:@"name"];
    }
    else{
        [loginButton setEnabled:YES];
        [logoutButton setEnabled:NO];}
        }
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@"Ok"]) {
        [[Model uniqueModel] setLogIn:false];
        [self performSegueWithIdentifier:@"toLogIn" sender:nil];
        }
}


- (IBAction)logOut:(id)sender {
    [self doAlert];
}
- (void)viewDidUnload {
    [self setBar:nil];
    [super viewDidUnload];
}
@end
