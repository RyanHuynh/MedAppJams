//
//  Record.m
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "Record.h"

@interface Record ()

@end

@implementation Record
@synthesize nameLabel;
@synthesize weightLabel;
@synthesize heightLabel;
@synthesize weightPLabel;
@synthesize heightPLabel;
@synthesize monthLabel;
@synthesize prevButton;
@synthesize nextButton;

@synthesize headA;
@synthesize heightA;
@synthesize weightA;
@synthesize headLabel;
@synthesize headPLabel;
@synthesize idLabel;
@synthesize gender;

@synthesize ocdLabel;
@synthesize icdLabel;
@synthesize ipdLabel;
@synthesize ocdAvg;
@synthesize icdAvg;
@synthesize ipdAvg;
@synthesize earRLabel;
@synthesize earAvg;
@synthesize earLLabel;
@synthesize mouthLabel;
@synthesize mouthAvg;
@synthesize neckLabel;
@synthesize neckAvg;

@synthesize palmLabel;
@synthesize palmA;
@synthesize fingerLabel;
@synthesize fingerA;
@synthesize indLabel;
@synthesize indA;
@synthesize chestLabel;
@synthesize chestA;
@synthesize handLabel;
@synthesize handAvg;
@synthesize farmLabel;
@synthesize farmA;
@synthesize uaLabel;
@synthesize uaA;
@synthesize armSLabel;
@synthesize armSA;
@synthesize armLabel;
@synthesize armA;
@synthesize scroll;


static int selectedMonth;
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
    self.scroll.contentSize = CGSizeMake(700.0, 3000.0);
       
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    selectedMonth = 0;
    [self display];
    [prevButton setEnabled:NO];
    
 }
-(void) display
{
    nameLabel.text = [[Model uniqueModel] getSelectedRecordName];
    monthLabel.text = [NSString stringWithFormat:@"%d", selectedMonth];
    NSMutableDictionary *temp = [[Model uniqueModel] getRecordForMonth:selectedMonth];
    weightLabel.text = [temp objectForKey:@"weight"];
    heightLabel.text = [temp objectForKey:@"height"];
    weightPLabel.text = [temp objectForKey:@"weightP"];
   
    heightPLabel.text = [temp objectForKey:@"heightP"];
    headLabel.text = [temp objectForKey:@"head"];
    headPLabel.text = [temp objectForKey:@"headP"];
    heightPLabel.text = [temp objectForKey:@"heightP"];
    headA.text = [temp objectForKey:@"headA"];
    heightA.text = [temp objectForKey:@"heightA"];
    weightA.text = [temp objectForKey:@"weightA"];
    gender.text = [temp objectForKey:@"gender"];
    idLabel.text = [temp objectForKey:@"id"];
    
    ocdLabel.text = [temp objectForKey:@"ocd"];
    icdLabel.text = [temp objectForKey:@"icd"];
    ipdLabel.text = [temp objectForKey:@"ipd"];
    ocdAvg.text = [temp objectForKey:@"ocdAvg"];
    icdAvg.text = [temp objectForKey:@"icdAvg"];
    ipdAvg.text = [temp objectForKey:@"ipdAvg"];
    earAvg.text = [temp objectForKey:@"earLRAvg"];
    earRLabel.text = [temp objectForKey:@"earLR"];
    earLLabel.text = [temp objectForKey:@"earLL"];
    mouthLabel.text = [temp objectForKey:@"mouth"];
   
    mouthAvg.text = [temp objectForKey:@"mouthAvg"];
    neckLabel.text = [temp objectForKey:@"neck"];
    neckAvg.text = [temp objectForKey:@"neckAvg"];
    
    NSLog([temp objectForKey:@"fingerR"]);
   
    palmLabel.text = [temp objectForKey:@"palmR"];
   
    palmA.text = [temp objectForKey:@"palmAvg"];
    fingerLabel.text = [temp objectForKey:@"fingerR"];
    
    fingerA.text = [temp objectForKey:@"fingerAvg"];
    indLabel.text = [temp objectForKey:@"ind"];
    indA.text = [temp objectForKey:@"indAvg"];
     
    chestLabel.text = [temp objectForKey:@"chest"];
    chestA.text = [temp objectForKey:@"chestAvg"];
    handLabel.text = [temp objectForKey:@"handR"];
    handAvg.text = [temp objectForKey:@"handAvg"];
    farmLabel.text = [temp objectForKey:@"fArmR"];
     NSLog(@"TEST2");
    farmA.text = [temp objectForKey:@"fArmAvg"];
    uaLabel.text = [temp objectForKey:@"upArmR"];
    uaA.text = [temp objectForKey:@"upArmAvg"];
    armSLabel.text = [temp objectForKey:@"armSpan"];
    armSA.text = [temp objectForKey:@"armSpanAvg"];
    armLabel.text = [temp objectForKey:@"armR"];
    armA.text = [temp objectForKey:@"armA"];
    
}

- (IBAction)prevMonth:(id)sender {
    selectedMonth--;
    [self display];
    [self enableButton];
}


- (IBAction)nextMonth:(id)sender {
    selectedMonth++;
    [self display];
    [self enableButton];
}
-(void) enableButton
{
    if(selectedMonth == 0)
        [prevButton setEnabled:NO];
    else
        [prevButton setEnabled:YES];
    if(selectedMonth == 12)
        [nextButton setEnabled:NO];
    else
        [nextButton setEnabled:YES];
}
- (void)viewDidUnload {
    
    [self setWeightA:nil];
    [self setHeightA:nil];
    [self setHeadLabel:nil];
    [self setHeadPLabel:nil];
    [self setHeadA:nil];
    [self setIdLabel:nil];
    [self setOcdLabel:nil];
    [self setIcdLabel:nil];
    [self setIpdLabel:nil];
    [self setOcdAvg:nil];
    [self setIcdAvg:nil];
    [self setIpdAvg:nil];
    [self setEarRLabel:nil];
    [self setEarAvg:nil];
    [self setEarLLabel:nil];
    [self setMouthLabel:nil];
    [self setNeckLabel:nil];
    [self setNeckAvg:nil];
    [self setPalmLabel:nil];
    [self setPalmA:nil];
    [self setFingerLabel:nil];
    [self setFingerA:nil];
    [self setIndLabel:nil];
    [self setIndA:nil];
    [self setChestLabel:nil];
    [self setChestA:nil];
    [self setHandLabel:nil];
    [self setHandAvg:nil];
    [self setFarmLabel:nil];
    [self setFarmA:nil];
    [self setUaLabel:nil];
    [self setUaA:nil];
    [self setArmSLabel:nil];
    [self setArmSA:nil];
    [self setArmLabel:nil];
    [self setArmA:nil];
    [self setFingerLabel:nil];
    [self setScroll:nil];

    [super viewDidUnload];
}
@end
