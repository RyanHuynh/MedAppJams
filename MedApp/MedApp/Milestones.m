//
//  Milestones.m
//  MedApp
//
//  Created by Eiling Fernandez on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "Milestones.h"

@interface Milestones ()

@end

@implementation Milestones

@synthesize agePicker;
@synthesize ageData;
@synthesize ageTextField;
@synthesize pickerViewContainer;



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
    
    ageData = [[NSArray alloc] initWithObjects: @"0", @"1",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    
    pickerViewContainer.frame = CGRectMake(800, 109, 63, 235);
    
    
	// Do any additional setup after loading the view.
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    ageTextField.text = [ageData objectAtIndex:[pickerView selectedRowInComponent:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [UIView beginAnimations:nil context:(NULL)];
    [UIView setAnimationDuration:0.3];
    pickerViewContainer.frame = CGRectMake(139, 109, 63, 235);
    [UIView commitAnimations];
    
}

- (IBAction)pickerDone:(id)sender {
    [UIView beginAnimations:nil context:(NULL)];
    [UIView setAnimationDuration:0.3];
    pickerViewContainer.frame = CGRectMake(800, 109, 63, 235);    [UIView commitAnimations];
    
}
@end
