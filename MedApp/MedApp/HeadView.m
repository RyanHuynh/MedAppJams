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
@synthesize bar;
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
    if([[Model uniqueModel] logIn])
    {
        bar.topItem.title = [[[[[Model uniqueModel] log] objectForKey:[[Model uniqueModel] loginID]] objectAtIndex:0] objectForKey:@"name"];
    }
    
    //Add avg
    NSMutableArray *ocdAv = [NSMutableArray array];
    [ocdAv addObject:@"6.3"];
    [ocdAv addObject:@"6.4"];
    [ocdAv addObject:@"6.5"];
    [ocdAv  addObject:@"6.6"];
    [ocdAv addObject:@"6.7"];
    [ocdAv addObject:@"6.8"];
    [ocdAv addObject:@"6.9"];
    [ocdAv  addObject:@"7.0"];
    [ocdAv addObject:@"7.0"];
    [ocdAv addObject:@"7.1"];
    [ocdAv addObject:@"7.2"];
    [ocdAv addObject:@"7.3"];
    [ocdAv  addObject:@"7.3"];
    
    NSMutableArray *ipdAv = [NSMutableArray array];
    [ipdAv addObject:@"3.7"];
    [ipdAv addObject:@"3.8"];
    [ipdAv addObject:@"3.9"];
    [ipdAv addObject:@"4.0"];
    [ipdAv addObject:@"4.1"];
    [ipdAv addObject:@"4.1"];
    [ipdAv addObject:@"4.2"];
    [ipdAv addObject:@"4.2"];
    [ipdAv addObject:@"4.2"];
    [ipdAv addObject:@"4.3"];
    [ipdAv addObject:@"4.3"];
    [ipdAv addObject:@"4.3"];
    
    NSMutableArray *icdAv = [NSMutableArray array];
    [icdAv addObject:@"2.0"];
    [icdAv addObject:@"2.1"];
    [icdAv addObject:@"2.2"];
    [icdAv addObject:@"2.2"];
    [icdAv addObject:@"2.3"];
    [icdAv addObject:@"2.3"];
    [icdAv addObject:@"2.4"];
    [icdAv addObject:@"2.4"];
    [icdAv addObject:@"2.4"];
    [icdAv addObject:@"2.4"];
    [icdAv addObject:@"2.5"];
    [icdAv addObject:@"2.5"];
    [icdAv addObject:@"2.5"];
    
    NSMutableArray *pflAv = [NSMutableArray array];
    [pflAv addObject:@"1.5"];
    [pflAv addObject:@"1.5"];
    [pflAv addObject:@"1.6"];
    [pflAv addObject:@"1.6"];
    [pflAv addObject:@"1.6"];
    [pflAv addObject:@"1.7"];
    [pflAv addObject:@"1.7"];
    [pflAv addObject:@"1.8"];
    [pflAv addObject:@"2.0"];
    [pflAv addObject:@"2.1"];
    [pflAv addObject:@"2.1"];
    [pflAv addObject:@"2.2"];
    [pflAv addObject:@"2.3"];
    
    NSMutableArray *earAv = [NSMutableArray array];
    [earAv addObject:@"3.6"];
    [earAv addObject:@"3.7"];
    [earAv addObject:@"3.8"];
    [earAv addObject:@"4.1"];
    [earAv addObject:@"4.2"];
    [earAv addObject:@"4.3"];
    [earAv addObject:@"4.4"];
    [earAv addObject:@"4.5"];
    [earAv addObject:@"4.6"];
    [earAv addObject:@"4.7"];
    [earAv addObject:@"4.8"];
    [earAv addObject:@"4.8"];
   
    NSMutableArray *pL = [NSMutableArray array];
    [pL addObject:@"0.8"];
    [pL addObject:@"0.8"];
    [pL addObject:@"0.8"];
    [pL addObject:@"0.9"];
    [pL addObject:@"0.9"];
    [pL addObject:@"0.9"];
    [pL addObject:@"1"];
    [pL addObject:@"1"];
    [pL addObject:@"1"];
    [pL addObject:@"1.1"];
    [pL addObject:@"1.1"];
    [pL addObject:@"1.2"];
    [pL addObject:@"1.2"];
    
    
    NSMutableArray *mouthA = [NSMutableArray array];
    [mouthA addObject:@"2.8"];
    [mouthA addObject:@"2.8"];
    [mouthA addObject:@"2.8"];
    [mouthA addObject:@"2.9"];
    [mouthA addObject:@"2.9"];
    [mouthA addObject:@"2.9"];
    [mouthA addObject:@"3"];
    [mouthA addObject:@"3"];
    [mouthA addObject:@"3"];
    [mouthA addObject:@"3"];
    [mouthA addObject:@"3.1"];
    [mouthA addObject:@"3.1"];
    [mouthA addObject:@"3.1"];
    
    
    NSMutableArray *neckA = [NSMutableArray array];
    [neckA addObject:@"18.9"];
    [neckA addObject:@"19.2"];
    [neckA addObject:@"19.5"];
    [neckA addObject:@"19.8"];
    [neckA addObject:@"20"];
    [neckA addObject:@"20.2"];
    [neckA addObject:@"20.4"];
    [neckA addObject:@"20.6"];
    [neckA addObject:@"20.8"];
    [neckA addObject:@"20.9"];
    [neckA addObject:@"21"];
    [neckA addObject:@"21.1"];
    [neckA addObject:@"21.2"];
    
    
    avgValue = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                ocdAv,@"ocd",
                ipdAv,@"ipd",
                icdAv,@"icd",
                earAv,@"ear",
                neckA,@"neck",
                pL,@"philtrum",
                mouthA,@"mouth",
                pflAv,@"pfl",nil];
    
}
- (void)viewDidUnload {
    [self setIcd:nil];
    [self setEarLR:nil];
    [self setNeck:nil];
    [self setMouth:nil];
    [self setPhiltrum:nil];
    [self setIpd:nil];
    [self setOcd:nil];
    [self setBar:nil];
    [super viewDidUnload];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
         headImage.image = [UIImage imageNamed:@"HeadView_boy"];
    else
        headImage.image = [UIImage imageNamed:@"HeadView_girl"];
    [self getAvgValue];
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
    [self getAvgValue];
}


//DISPLAY AVG.
-(void) getAvgValue
{
    int index = [ageTextField.text intValue];
   
        double _icd = round([[[avgValue objectForKey:@"icd"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double _ear = round([[[avgValue objectForKey:@"ear"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier] *10)/10.0;
        double _pfl = round([[[avgValue objectForKey:@"pfl"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double _neck = round([[[avgValue objectForKey:@"neck"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _mouth = round([[[avgValue objectForKey:@"mouth"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _philtrum = round([[[avgValue objectForKey:@"philtrum"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double _ipd = round([[[avgValue objectForKey:@"ipd"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double _ocd = round([[[avgValue objectForKey:@"ocd"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        icdAvg.text = [NSString stringWithFormat:@"%.1f",_icd];
        earLRAvg.text = [NSString stringWithFormat:@"%.1f",_ear];
        earLLAvg.text = [NSString stringWithFormat:@"%.1f",_ear];
        pflLAvg.text = [NSString stringWithFormat:@"%.1f",_pfl];
        pflRAvg.text = [NSString stringWithFormat:@"%.1f",_pfl];
        neckAvg.text = [NSString stringWithFormat:@"%.1f",_neck];
        mouthAvg.text = [NSString stringWithFormat:@"%.1f",_mouth];
        philtrumAvg.text = [NSString stringWithFormat:@"%.1f",_philtrum];
        ipdAvg.text = [NSString stringWithFormat:@"%.1f",_ipd];
        ocdAvg.text = [NSString stringWithFormat:@"%.1f",_ocd];
}

//UPDATE PFLR MISSING
- (IBAction)updateRecord:(id)sender {
    if(![[Model uniqueModel] logIn])
        [self doAlert];
    else
    {
        [[Model uniqueModel] headViewUpdate: icd.text: icdAvg.text : earLR.text: earLL.text :earLRAvg.text :  pflR.text: pflL.text :pflLAvg.text : neck.text: neckAvg.text :mouth.text  :mouthAvg.text: philtrum.text: philtrumAvg.text :ipd.text  :ipdAvg.text: ocd.text  :ocdAvg.text: [ageTextField.text intValue]];
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
