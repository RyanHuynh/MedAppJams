//
//  TorsoView.m
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "TorsoView.h"

@interface TorsoView ()

@end

@implementation TorsoView
@synthesize torsoImage;
@synthesize agePicker;
@synthesize ageData;
@synthesize ageTextField;
@synthesize pickerViewContainer;

@synthesize armL;
@synthesize armLAvg;
@synthesize upArmL;
@synthesize upArmLAvg;
@synthesize handL;
@synthesize handLAvg;
@synthesize fArmL;
@synthesize fArmLAvg;
@synthesize palmL;
@synthesize palmLAvg;
@synthesize fingerL;
@synthesize fingerLAvg;
@synthesize ind;
@synthesize indAvg;
@synthesize chest;
@synthesize chestAvg;
@synthesize armSpan;
@synthesize armSpanAvg;

@synthesize armR;
@synthesize upArmR;
@synthesize handR;
@synthesize fArmR;
@synthesize palmR;
@synthesize fingerR;

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
        torsoImage.image = [UIImage imageNamed:@"TorsoView_boy"];
    else
        torsoImage.image = [UIImage imageNamed:@"TorsoView_girl"];
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
-(void)showComfirmation
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
