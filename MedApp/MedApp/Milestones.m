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
@synthesize bar;
@synthesize image;

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
    
    ageData = [[NSArray alloc] initWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    pickerViewContainer.hidden = YES;
    if([[Model uniqueModel] logIn])
    {
            bar.topItem.title = [[[[[Model uniqueModel] log] objectForKey:[[Model uniqueModel] loginID]] objectAtIndex:0] objectForKey:@"name"];
    }
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

//- (IBAction)tap:(id)sender {
  //  pickerViewContainer.hidden = YES;
//}

- (IBAction)showAge:(id)sender {
    pickerViewContainer.hidden = NO;

    
}

- (IBAction)pickerDone:(id)sender {
    pickerViewContainer.hidden = YES;
    NSString *url = [NSString stringWithFormat:@"%@%@%@",@"appjam_milestone", ageTextField.text,@".png"];
    NSLog(url);
    image.image = [UIImage imageNamed:url];
    
}

- (void)viewDidUnload {
    [self setImage:nil];
    [self setBar:nil];
    [super viewDidUnload];
}
@end
