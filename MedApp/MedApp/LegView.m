//
//  LegView.m
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "LegView.h"

@interface LegView ()

@end

@implementation LegView
@synthesize legImage;
@synthesize agePicker;
@synthesize ageData;
@synthesize ageTextField;
@synthesize pickerViewContainer;
@synthesize avgValue;
//INIT
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
    ageData = [[NSArray alloc] initWithObjects: @"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    pickerViewContainer.hidden = YES;
    
    
    //Add avg
    NSMutableArray *headG = nil;
    avgValue = nil;
    avgValue = [[NSMutableDictionary alloc]initWithObjectsAndKeys:headG,@"headB",nil];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
        legImage.image = [UIImage imageNamed:@"LegView_boy"];
    else
        legImage.image = [UIImage imageNamed:@"LegView_girl"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//PICKER SECTION
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    ageTextField.text = [ageData objectAtIndex:[pickerView selectedRowInComponent:0]];
}
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [ageData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [ageData objectAtIndex:row];
}
- (IBAction)showAge:(id)sender {
    pickerViewContainer.hidden = NO;}
- (IBAction)pickerDone:(id)sender {
    pickerViewContainer.hidden = YES;
    //[self getAvgValue];}
}

//ALERT HANDLING
-(void) showComfirmation
{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Record has ben saved."
                   message:nil
                   delegate: self
                   cancelButtonTitle: @"OK"
                   otherButtonTitles: nil];
    
    
	[alertDialog show];
}
-(void)doAlert{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"No record selected"
                   message:@"You have to login inorder to update record."
                   delegate: self
                   cancelButtonTitle: nil
                   otherButtonTitles: @"Log in",@"Cancel",nil];
    
    
	[alertDialog show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@"Log in"]) {
        [self performSegueWithIdentifier:@"toLogIn" sender:nil];}
}

@end
