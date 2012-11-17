//
//  LogIn.m
//  MedApp
//
//  Created by Ryan Huynh on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "LogIn.h"

@interface LogIn ()

@end

@implementation LogIn

@synthesize genderSC;
@synthesize name;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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

- (IBAction)goMainMenu:(id)sender {
    NSString *input = name.text;
    if([input isEqualToString:@""])
    {
        [[Model uniqueModel] setLogIn:false];
        [self performSegueWithIdentifier:@"toMainMenu" sender:nil];
    } else
    {
        [[Model uniqueModel] setLogIn:true];
        if([[Model uniqueModel] checkRecord:input] == false)
           [self doAlert];
        else
            [self performSegueWithIdentifier:@"toMainMenu" sender:nil];
    }
}


-(void)doAlert{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: [NSString stringWithFormat:@"%@%@", @"There is no record for ", name.text]
                   message:[NSString stringWithFormat:@"%@%@", @"Do you want to create a record for ", name.text]
                   delegate: self
                   cancelButtonTitle: nil
                   otherButtonTitles: @"Ok", @"Skip", nil];
	[alertDialog show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@"Ok"]) {
		[[Model uniqueModel] createNewRecord:name.text];
        [self performSegueWithIdentifier:@"toMainMenu" sender:nil];
    } else if ([buttonTitle isEqualToString:@"Skip"]) {
		
    }
    
}

@end
