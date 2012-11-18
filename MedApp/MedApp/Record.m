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
    NSLog(weightPLabel.text);
    heightPLabel.text = [temp objectForKey:@"heightP"];
    headLabel.text = [temp objectForKey:@"head"];
    headPLabel.text = [temp objectForKey:@"headP"];
    heightPLabel.text = [temp objectForKey:@"heightP"];
    headA.text = [temp objectForKey:@"headA"];
    heightA.text = [temp objectForKey:@"heightA"];
    weightA.text = [temp objectForKey:@"weightA"];
    gender.text = [temp objectForKey:@"gender"];
    idLabel.text = [temp objectForKey:@"id"];
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
    [super viewDidUnload];
}
@end
