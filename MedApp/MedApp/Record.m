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
@synthesize monthLabel;
@synthesize prevButton;
@synthesize nextButton;

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
    nameLabel.text = [[Model uniqueModel] selectedRecord];
    monthLabel.text = [NSString stringWithFormat:@"%d", selectedMonth];
    NSMutableArray *temp = [[Model uniqueModel] getRecordForMonth:0];
    weightLabel.text = [temp objectAtIndex:1];
    heightLabel.text = [temp objectAtIndex:2];
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
@end
