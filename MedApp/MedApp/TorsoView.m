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
@synthesize bar;
@synthesize armL;
@synthesize armAvg;
@synthesize upArmL;
@synthesize upArmAvg;
@synthesize handL;
@synthesize handAvg;
@synthesize fArmL;
@synthesize fArmAvg;
@synthesize palmL;
@synthesize palmAvg;
@synthesize fingerL;
@synthesize fingerAvg;
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
    NSMutableArray  *indA = [NSMutableArray array];
    [indA addObject:@"8.5"];
    [indA addObject:@"8.7"];
    [indA addObject:@"8.9"];
    [indA addObject:@"9.1"];
    [indA addObject:@"9.3"];
    [indA addObject:@"9.5"];
    [indA addObject:@"9.7"];
    [indA addObject:@"9.9"];
    [indA addObject:@"10.1"];
    [indA addObject:@"10.2"];
    [indA addObject:@"10.3"];
    [indA addObject:@"10.4"];
    [indA addObject:@"10.5"];
    
    NSMutableArray *ua = [NSMutableArray array];
    [ua addObject:@"10.5"];
    [ua addObject:@"10.5"];
    [ua addObject:@"10.5"];
    [ua addObject:@"10.6"];
    [ua addObject:@"10.6"];
    [ua addObject:@"10.7"];
    [ua addObject:@"10.7"];
    [ua addObject:@"10.8"];
    [ua addObject:@"10.8"];
    [ua addObject:@"10.9"];
    [ua addObject:@"10.9"];
    [ua addObject:@"11"];
    [ua addObject:@"11"];
    
    NSMutableArray *chestA = [NSMutableArray array];
    [chestA addObject:@"32.5"];
    [chestA addObject:@"35.8"];
    [chestA addObject:@"37.6"];
    [chestA addObject:@"39.2"];
    [chestA addObject:@"41.1"];
    [chestA addObject:@"42.1"];
    [chestA addObject:@"43"];
    [chestA addObject:@"44"];
    [chestA addObject:@"44.9"];
    [chestA addObject:@"45.5"];
    [chestA addObject:@"46.2"];
    [chestA addObject:@"47"];
    [chestA addObject:@" 47.5"];
    NSMutableArray *foreArm = [NSMutableArray array];
    [foreArm addObject:@"11"];
    [foreArm addObject:@"11"];
    [foreArm addObject:@"11"];
    [foreArm addObject:@"11.1"];
    [foreArm addObject:@"11.1"];
    [foreArm addObject:@"11.2"];
    [foreArm addObject:@"11.2"];
    [foreArm addObject:@"11.3"];
    [foreArm addObject:@"11.3"];
    [foreArm addObject:@"11.4"];
    [foreArm addObject:@"11.4"];
    [foreArm addObject:@"11.5"];
    [foreArm addObject:@"11.5"];
    
    NSMutableArray *armSpanA = [NSMutableArray array];
    [armSpanA addObject:@"51"];
    [armSpanA addObject:@"54"];
    [armSpanA addObject:@"57"];
    [armSpanA addObject:@"60"];
    [armSpanA addObject:@"62"];
    [armSpanA addObject:@"64"];
    [armSpanA addObject:@"65"];
    [armSpanA addObject:@"67"];
    [armSpanA addObject:@"69"];
    [armSpanA addObject:@"70"];
    [armSpanA addObject:@"72"];
    [armSpanA addObject:@"73"];
    [armSpanA addObject:@"74"];
    
    NSMutableArray *palm = [NSMutableArray array];
    [palm addObject:@"3.8"];
    [palm addObject:@"4"];
    [palm addObject:@"4.2"];
    [palm addObject:@"4.3"];
    [palm addObject:@"4.5"];
    [palm addObject:@"4.6"];
    [palm addObject:@"4.7"];
    [palm addObject:@"4.8"];
    [palm addObject:@"4.9"];
    [palm addObject:@"5"];
    [palm addObject:@"5.1"];
    [palm addObject:@"5.2"];
    [palm addObject:@"5.3"];
    
    
    NSMutableArray *mFinger = [NSMutableArray array];
    [mFinger addObject:@"2.8"];
    [mFinger addObject:@"2.9"];
    [mFinger addObject:@"3"];
    [mFinger addObject:@"3.1"];
    [mFinger addObject:@"3.2"];
    [mFinger addObject:@"3.3"];
    [mFinger addObject:@"3.4"];
    [mFinger addObject:@"3.4"];
    [mFinger addObject:@"3.5"];
    [mFinger addObject:@"3.6"];
    [mFinger addObject:@"3.7"];
    [mFinger addObject:@"3.8"];
    [mFinger addObject:@"3.8"];
    
    NSMutableArray *hand = [NSMutableArray array];
    [hand addObject:@"6.6"];
    [hand addObject:@"6.9"];
    [hand addObject:@"7.2"];
    [hand addObject:@"7.5"];
    [hand addObject:@"7.7"];
    [hand addObject:@"8"];
    [hand addObject:@"8.2"];
    [hand addObject:@"8.4"];
    [hand addObject:@"8.5"];
    [hand addObject:@"8.6"];
    [hand addObject:@"8.8"];
    [hand addObject:@"8.9"];
    [hand addObject:@"9.1"];
    
    NSMutableArray *tArm = [NSMutableArray array];
    [tArm addObject:@"21.5"];
    [tArm addObject:@"21.5"];
    [tArm addObject:@"21.5"];
    [tArm addObject:@"21.7"];
    [tArm addObject:@"21.7"];
    [tArm addObject:@"21.9"];
    [tArm addObject:@"21.9"];
    [tArm addObject:@"22.1"];
    [tArm addObject:@"22.1"];
    [tArm addObject:@"22.3"];
    [tArm addObject:@"22.3"];
    [tArm addObject:@"22.5"];
    [tArm addObject:@"22.5"];
    
    avgValue = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                indA,@"ind",
                ua,@"ua",
                chestA,@"chest",
                foreArm,@"foreArm",
                armSpanA,@"armSpan",
                palm,@"palm",
                mFinger,@"mFinger",
                hand,@"hand",
                tArm,@"tArm",nil];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
        torsoImage.image = [UIImage imageNamed:@"TorsoView_boy"];
    else
        torsoImage.image = [UIImage imageNamed:@"TorsoView_girl"];
    [self getAvgValue];
    bar.topItem.title = [[[[[Model uniqueModel] log] objectForKey:[[Model uniqueModel] loginID]] objectAtIndex:0] objectForKey:@"name"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//AVG.
-(void) getAvgValue
{
    int index = [ageTextField.text intValue];
   
        double al = round([[[avgValue objectForKey:@"tArm"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier] *10)/10.0;
       
        double ua = round([[[avgValue objectForKey:@"ua"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
       
        double fa = round([[[avgValue objectForKey:@"foreArm"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
       
        double p = round([[[avgValue objectForKey:@"palm"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier] *10)/10.0;
       
        double mf = round([[[avgValue objectForKey:@"mFinger"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
       
        double h = round([[[avgValue objectForKey:@"hand"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        
        double as = round([[[avgValue objectForKey:@"armSpan"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier] *10)/10.0;
        double c = round([[[avgValue objectForKey:@"chest"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double indT = round([[[avgValue objectForKey:@"ind"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        
        armAvg.text = [NSString stringWithFormat:@"%.1f",al];
        upArmAvg.text = [NSString stringWithFormat:@"%.1f",ua];
        
        fArmAvg.text = [NSString stringWithFormat:@"%.1f",fa];
        palmAvg.text = [NSString stringWithFormat:@"%.1f",p];
       
        fingerAvg.text = [NSString stringWithFormat:@"%.1f",mf];
        
        handAvg.text = [NSString stringWithFormat:@"%.1f",h];
        armSpanAvg.text = [NSString stringWithFormat:@"%.1f",as];
        chestAvg.text = [NSString stringWithFormat:@"%.1f",c];
        indAvg.text = [NSString stringWithFormat:@"%.1f",indT];
        
   
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
    [self getAvgValue];}


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
- (IBAction)updateRecord:(id)sender
{
    if(![[Model uniqueModel] logIn])
        [self doAlert];
    else
    {
        [[Model uniqueModel] torsoViewUpdate: armR.text: armL.text: armAvg.text: upArmR.text: upArmL.text:upArmAvg.text:handR.text:handL.text: handAvg.text: fArmR.text:fArmL.text: fArmAvg.text: palmR.text: palmL.text: palmAvg.text: fingerR.text: fingerL.text:fingerAvg.text:ind.text: indAvg.text: chest.text: chestAvg.text: armSpan.text: armSpanAvg.text: [ageTextField.text intValue]];
        [self showComfirmation];
       
    }
}

- (void)viewDidUnload {
    [self setFingerR:nil];
    [self setBar:nil];
    [super viewDidUnload];
}
@end
