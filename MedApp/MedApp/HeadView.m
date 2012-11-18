//
//  HeadView.m
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "HeadView.h"

@interface HeadView ()

@end

@implementation HeadView
@synthesize agePicker;
@synthesize ageData;
@synthesize ageTextField;
@synthesize pickerViewContainer;
@synthesize headImage;

@synthesize icd;
@synthesize icdAvg;
@synthesize earLR;
@synthesize earLRAvg;
@synthesize earLL;
@synthesize earLLAvg;
@synthesize pflL;
@synthesize pflLAvg;
@synthesize pflR;
@synthesize pflRAvg;
@synthesize neck;
@synthesize neckAvg;
@synthesize mouth;
@synthesize mouthAvg;
@synthesize philtrum;
@synthesize philtrumAvg;
@synthesize ipd;
@synthesize ipdAvg;
@synthesize ocd;
@synthesize ocdAvg;

@synthesize avgValue;


//INITIALIZE
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
- (void)viewDidUnload {
    [self setIcd:nil];
    [self setEarLR:nil];
    [self setNeck:nil];
    [self setMouth:nil];
    [self setPhiltrum:nil];
    [self setIpd:nil];
    [self setOcd:nil];
    [super viewDidUnload];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
         headImage.image = [UIImage imageNamed:@"HeadView_boy"];
    else
        headImage.image = [UIImage imageNamed:@"HeadView_girl"];
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
    //[self getAvgValue];
}


//DISPLAY AVG.
-(void) getAvgValue
{
    int index = [ageTextField.text intValue];
   
        double _icd = round([[[avgValue objectForKey:@"icd"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double _ear = round([[[avgValue objectForKey:@"ear"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _pfl = round([[[avgValue objectForKey:@"pfl"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double _neck = round([[[avgValue objectForKey:@"neck"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _mouth = round([[[avgValue objectForKey:@"mouth"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _philtrum = round([[[avgValue objectForKey:@"philtrum"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double _ipd = round([[[avgValue objectForKey:@"ipd"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _ocd = round([[[avgValue objectForKey:@"ocd"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        icdAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_icd,@")"];
        earLRAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_ear,@")"];
        earLLAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_ear,@")"];
        pflLAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_pfl,@")"];
        pflRAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_pfl,@")"];
        neckAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_neck,@")"];
        mouthAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_mouth,@")"];
        philtrumAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_philtrum,@")"];
        ipdAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_ipd,@")"];
        ocdAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",_ocd,@")"];
}

//UPDATE PFLR MISSING
- (IBAction)updateRecord:(id)sender {
    if(![[Model uniqueModel] logIn])
        [self doAlert];
    else
    {
        [[Model uniqueModel] headViewUpdate: icd.text: icdAvg.text : earLR.text: earLRAvg.text :earLL.text  :earLLAvg.text: pflL.text: pflLAvg.text : neck.text: neckAvg.text :mouth.text  :mouthAvg.text: philtrum.text: philtrumAvg.text :ipd.text  :ipdAvg.text: ocd.text  :ocdAvg.text: [ageTextField.text intValue]];
        [self showComfirmation];
    }
    
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
