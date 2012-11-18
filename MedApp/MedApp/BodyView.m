//
//  BodyView.m
//  MedApp
//
//  Created by Eiling Fernandez on 11/11/12.
//  Copyright (c) 2012 UCI. All rights reserved.
//

#import "BodyView.h"
#import "Setting.h"

@interface BodyView ()

@end

@implementation BodyView

@synthesize heightTextField;
@synthesize headTextField;
@synthesize weightTextField;
@synthesize heightLabel;
@synthesize weightLabel;
@synthesize weightChartB;
@synthesize heightChartB;
@synthesize weightChartG;
@synthesize heightChartG;

@synthesize bodyPic;
@synthesize weightChartUse;
@synthesize heightChartUse;
@synthesize headChartUse;
@synthesize singlePickerComponent;
@synthesize ageData;
@synthesize heightType;
@synthesize weightType;
@synthesize agePicker;

@synthesize ageTextField;
@synthesize pickerViewContainer;
@synthesize avgValue;
@synthesize weightAvg;
@synthesize heightAvg;
@synthesize headAvg;
@synthesize headLabel;
@synthesize headChartB;
@synthesize headChartG;
static int weightModifier;
static int heightModifier;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a n
    
    ageData = [[NSArray alloc] initWithObjects: @"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    pickerViewContainer.hidden = YES;

    
    //Initialize dictionary
    //Boy Weight chart, variable name is corespoding to age, e.g. bw0 is for boy with age 0, bw1 for boy with age 1, etc..
    NSMutableDictionary *bw1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"3.6",
                                @"5th", @"3.7",
                                @"10th", @"4.0",
                                @"25th", @"4.4",
                                @"50th", @"4.8",
                                @"75th", @"5.3",
                                @"90th", @"5.7",
                                @"95th", @"5.9",
                                @"97th", @"6.1",
                                nil];
    
    NSMutableDictionary *bw0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"2.3",
                                @"5th", @"2.5",
                                @"10th", @"2.7",
                                @"25th", @"3.1",
                                @"50th", @"3.5",
                                @"75th", @"3.8",
                                @"90th", @"4.1",
                                @"95th", @"4.3",
                                @"97th", @"4.4",
                                nil];
    
    
    NSMutableDictionary *bw2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"4.3",
                                @"5th", @"4.5",
                                @"10th", @"4.8",
                                @"25th", @"5.2",
                                @"50th", @"5.7",
                                @"75th", @"6.2",
                                @"90th", @"6.6",
                                @"95th", @"6.9",
                                @"97th", @"7.2",
                                nil];
    
    NSMutableDictionary *bw3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"5.0",
                                @"5th", @"5.2",
                                @"10th", @"5.4",
                                @"25th", @"5.9",
                                @"50th", @"6.4",
                                @"75th", @"6.9",
                                @"90th", @"7.5",
                                @"95th", @"7.8",
                                @"97th", @"8.0",
                                nil];
    
    NSMutableDictionary *bw4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"5.6",
                                @"5th", @"5.7",
                                @"10th", @"6.0",
                                @"25th", @"6.5",
                                @"50th", @"7.0",
                                @"75th", @"7.6",
                                @"90th", @"8.2",
                                @"95th", @"8.6",
                                @"97th", @"8.9",
                                nil];
    NSMutableDictionary *bw5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"6.1",
                                @"5th", @"6.3",
                                @"10th", @"6.6",
                                @"25th", @"7.0",
                                @"50th", @"7.6",
                                @"75th", @"8.3",
                                @"90th", @"8.9",
                                @"95th", @"9.3",
                                @"97th", @"9.5",
                                nil];
    
    NSMutableDictionary *bw6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"6.6",
                                @"5th", @"6.7",
                                @"10th", @"7.0",
                                @"25th", @"7.5",
                                @"50th", @"8.2",
                                @"75th", @"8.8",
                                @"90th", @"9.5",
                                @"95th", @"9.9",
                                @"97th", @"10.2",
                                nil];
    NSMutableDictionary *bw7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"7.0",
                                @"5th", @"7.2",
                                @"10th", @"7.5",
                                @"25th", @"8.0",
                                @"50th", @"8.6",
                                @"75th", @"9.3",
                                @"90th", @"10.0",
                                @"95th", @"10.5",
                                @"97th", @"10.7",
                                nil];
    NSMutableDictionary *bw8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"7.4",
                                @"5th", @"7.6",
                                @"10th", @"7.9",
                                @"25th", @"8.4",
                                @"50th", @"9.1",
                                @"75th", @"9.8",
                                @"90th", @"10.5",
                                @"95th", @"11.0",
                                @"97th", @"11.3",
                                nil];
    NSMutableDictionary *bw9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"7.7",
                                @"5th", @"7.9",
                                @"10th", @"8.2",
                                @"25th", @"8.8",
                                @"50th", @"9.5",
                                @"75th", @"10.2",
                                @"90th", @"11.0",
                                @"95th", @"11.4",
                                @"97th", @"11.7",
                                nil];
    NSMutableDictionary *bw10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"8.0",
                                 @"5th", @"8.2",
                                 @"10th", @"8.5",
                                 @"25th", @"9.1",
                                 @"50th", @"9.8",
                                 @"75th", @"10.6",
                                 @"90th", @"11.4",
                                 @"95th", @"11.8",
                                 @"97th", @"12.2",
                                 nil];
    NSMutableDictionary *bw11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"8.3",
                                 @"5th", @"8.5",
                                 @"10th", @"8.8",
                                 @"25th", @"9.4",
                                 @"50th", @"10.2",
                                 @"75th", @"11.0",
                                 @"90th", @"11.7",
                                 @"95th", @"12.2",
                                 @"97th", @"12.6",
                                 nil];
    NSMutableDictionary *bw12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"8.5",
                                 @"5th", @"8.8",
                                 @"10th", @"9.1",
                                 @"25th", @"9.7",
                                 @"50th", @"10.5",
                                 @"75th", @"11.3",
                                 @"90th", @"12.1",
                                 @"95th", @"12.6",
                                 @"97th", @"12.9",
                                 nil];
    
    weightChartB = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                    bw0, [NSNumber numberWithInt:0],
                    bw1, [NSNumber numberWithInt:1],
                    bw2, [NSNumber numberWithInt:2],
                    bw3, [NSNumber numberWithInt:3],
                    bw4, [NSNumber numberWithInt:4],
                    bw5, [NSNumber numberWithInt:5],
                    bw6, [NSNumber numberWithInt:6],
                    bw7, [NSNumber numberWithInt:7],
                    bw8, [NSNumber numberWithInt:8],
                    bw9, [NSNumber numberWithInt:9],
                    bw10, [NSNumber numberWithInt:10],
                    bw11, [NSNumber numberWithInt:11],
                    bw12, [NSNumber numberWithInt:12],
                    nil];
    
    
    //Boy Height Chart.
    NSMutableDictionary *bh0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"44.9",
                                @"5th", @"45.5",
                                @"10th", @"46.5",
                                @"25th", @"48.1",
                                @"50th", @"49.9",
                                @"75th", @"51.7",
                                @"90th", @"53.3",
                                @"95th", @"54.3",
                                @"97th", @"54.9",
                                nil];
    
    NSMutableDictionary *bh1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"52.1",
                                @"5th", @"52.7",
                                @"10th", @"53.5",
                                @"25th", @"54.9",
                                @"50th", @"56.6",
                                @"75th", @"58.3",
                                @"90th", @"59.9",
                                @"95th", @"60.9",
                                @"97th", @"61.6",
                                nil];
    NSMutableDictionary *bh2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"55.2",
                                @"5th", @"55.7",
                                @"10th", @"56.5",
                                @"25th", @"57.9",
                                @"50th", @"59.6",
                                @"75th", @"61.3",
                                @"90th", @"62.9",
                                @"95th", @"64.0",
                                @"97th", @"64.6",
                                nil];
    NSMutableDictionary *bh3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"57.7",
                                @"5th", @"58.2",
                                @"10th", @"59.0",
                                @"25th", @"60.4",
                                @"50th", @"62.0",
                                @"75th", @"63.8",
                                @"90th", @"65.4",
                                @"95th", @"66.5",
                                @"97th", @"67.2",
                                nil];
    NSMutableDictionary *bh4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"59.8",
                                @"5th", @"60.3",
                                @"10th", @"61.1",
                                @"25th", @"62.5",
                                @"50th", @"64.2",
                                @"75th", @"65.9",
                                @"90th", @"67.6",
                                @"95th", @"68.7",
                                @"97th", @"69.4",
                                nil];
    NSMutableDictionary *bh5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"61.6",
                                @"5th", @"62.1",
                                @"10th", @"63.0",
                                @"25th", @"64.4",
                                @"50th", @"66.1",
                                @"75th", @"67.9",
                                @"90th", @"69.6",
                                @"95th", @"70.7",
                                @"97th", @"71.4",
                                nil];
    NSMutableDictionary *bh6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"63.3",
                                @"5th", @"63.8",
                                @"10th", @"64.6",
                                @"25th", @"66.1",
                                @"50th", @"67.8",
                                @"75th", @"69.6",
                                @"90th", @"71.4",
                                @"95th", @"72.5",
                                @"97th", @"73.3",
                                nil];
    NSMutableDictionary *bh7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"64.8",
                                @"5th", @"65.3",
                                @"10th", @"66.2",
                                @"25th", @"67.7",
                                @"50th", @"69.4",
                                @"75th", @"71.3",
                                @"90th", @"73.1",
                                @"95th", @"74.2",
                                @"97th", @"74.9",
                                nil];
    NSMutableDictionary *bh8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"66.1",
                                @"5th", @"66.7",
                                @"10th", @"67.6",
                                @"25th", @"69.1",
                                @"50th", @"70.9",
                                @"75th", @"72.8",
                                @"90th", @"74.6",
                                @"95th", @"75.8",
                                @"97th", @"76.5",
                                nil];
    NSMutableDictionary *bh9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"67.4",
                                @"5th", @"68.0",
                                @"10th", @"68.9",
                                @"25th", @"70.5",
                                @"50th", @"72.3",
                                @"75th", @"74.2",
                                @"90th", @"76.1",
                                @"95th", @"77.2",
                                @"97th", @"78.0",
                                nil];
    NSMutableDictionary *bh10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"68.6",
                                 @"5th", @"69.2",
                                 @"10th", @"70.2",
                                 @"25th", @"71.8",
                                 @"50th", @"73.6",
                                 @"75th", @"75.6",
                                 @"90th", @"77.5",
                                 @"95th", @"78.6",
                                 @"97th", @"79.4",
                                 nil];
    NSMutableDictionary *bh11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"69.8",
                                 @"5th", @"70.4",
                                 @"10th", @"71.3",
                                 @"25th", @"73.0",
                                 @"50th", @"74.9",
                                 @"75th", @"76.9",
                                 @"90th", @"78.8",
                                 @"95th", @"79.9",
                                 @"97th", @"80.7",
                                 nil];
    NSMutableDictionary *bh12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"70.9",
                                 @"5th", @"71.5",
                                 @"10th", @"72.5",
                                 @"25th", @"74.1",
                                 @"50th", @"76.1",
                                 @"75th", @"78.1",
                                 @"90th", @"80.0",
                                 @"95th", @"81.2",
                                 @"97th", @"82.0",
                                 nil];
    
    
    heightChartB = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                    bh0, [NSNumber numberWithInt:0],
                    bh1, [NSNumber numberWithInt:1],
                    bh2, [NSNumber numberWithInt:2],
                    bh3, [NSNumber numberWithInt:3],
                    bh4, [NSNumber numberWithInt:4],
                    bh5, [NSNumber numberWithInt:5],
                    bh6, [NSNumber numberWithInt:6],
                    bh7, [NSNumber numberWithInt:7],
                    bh8, [NSNumber numberWithInt:8],
                    bh9, [NSNumber numberWithInt:9],
                    bh10, [NSNumber numberWithInt:10],
                    bh11, [NSNumber numberWithInt:11],
                    bh12, [NSNumber numberWithInt:12],
                    nil];
    
    NSMutableDictionary *wg0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"2.4",
                                @"5th", @"2.5",
                                @"10th", @"2.7",
                                @"25th", @"3.0",
                                @"50th", @"3.3",
                                @"75th", @"3.7",
                                @"90th", @"3.9",
                                @"95th", @"4.1",
                                @"97th", @"4.2",
                                nil];
    
    NSMutableDictionary *wg1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"3.4",
                                @"5th", @"3.5",
                                @"10th", @"3.7",
                                @"25th", @"4.1",
                                @"50th", @"4.5",
                                @"75th", @"4.9",
                                @"90th", @"5.3",
                                @"95th", @"5.5",
                                @"97th", @"5.6",
                                nil];
    
    
    NSMutableDictionary *wg2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"3.9",
                                @"5th", @"4.1",
                                @"10th", @"4.3",
                                @"25th", @"4.7",
                                @"50th", @"5.2",
                                @"75th", @"5.6",
                                @"90th", @"6.0",
                                @"95th", @"6.3",
                                @"97th", @"6.4",
                                nil];
    
    NSMutableDictionary *wg3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"4.5",
                                @"5th", @"4.7",
                                @"10th", @"4.9",
                                @"25th", @"5.3",
                                @"50th", @"5.8",
                                @"75th", @"6.3",
                                @"90th", @"6.8",
                                @"95th", @"7.0",
                                @"97th", @"7.2",
                                nil];
    
    NSMutableDictionary *wg4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"5.0",
                                @"5th", @"5.2",
                                @"10th", @"5.4",
                                @"25th", @"5.9",
                                @"50th", @"6.4",
                                @"75th", @"6.9",
                                @"90th", @"7.4",
                                @"95th", @"7.7",
                                @"97th", @"7.9",
                                nil];
    
    NSMutableDictionary *wg5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"5.5",
                                @"5th", @"5.6",
                                @"10th", @"5.9",
                                @"25th", @"6.4",
                                @"50th", @"6.9",
                                @"75th", @"7.5",
                                @"90th", @"8.0",
                                @"95th", @"8.3",
                                @"97th", @"8.5",
                                nil];
    
    NSMutableDictionary *wg6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"5.9",
                                @"5th", @"6.1",
                                @"10th", @"6.4",
                                @"25th", @"6.8",
                                @"50th", @"7.4",
                                @"75th", @"8.0",
                                @"90th", @"8.6",
                                @"95th", @"8.9",
                                @"97th", @"9.1",
                                nil];
    
    NSMutableDictionary *wg7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"6.3",
                                @"5th", @"6.5",
                                @"10th", @"6.8",
                                @"25th", @"7.3",
                                @"50th", @"7.9",
                                @"75th", @"8.5",
                                @"90th", @"9.1",
                                @"95th", @"9.4",
                                @"97th", @"9.7",
                                nil];
    
    NSMutableDictionary *wg8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"6.7",
                                @"5th", @"6.9",
                                @"10th", @"7.1",
                                @"25th", @"7.7",
                                @"50th", @"8.3",
                                @"75th", @"8.9",
                                @"90th", @"9.5",
                                @"95th", @"9.9",
                                @"97th", @"10.2",
                                nil];
    
    NSMutableDictionary *wg9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"7.0",
                                @"5th", @"7.2",
                                @"10th", @"7.5",
                                @"25th", @"8.0",
                                @"50th", @"8.6",
                                @"75th", @"9.3",
                                @"90th", @"10.0",
                                @"95th", @"10.4",
                                @"97th", @"10.6",
                                nil];
    
    NSMutableDictionary *wg10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"7.3",
                                 @"5th", @"7.5",
                                 @"10th", @"7.8",
                                 @"25th", @"8.4",
                                 @"50th", @"9.0",
                                 @"75th", @"9.7",
                                 @"90th", @"10.3",
                                 @"95th", @"10.8",
                                 @"97th", @"11.0",
                                 nil];
    
    NSMutableDictionary *wg11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"7.6",
                                 @"5th", @"7.8",
                                 @"10th", @"8.1",
                                 @"25th", @"8.7",
                                 @"50th", @"9.3",
                                 @"75th", @"10.0",
                                 @"90th", @"10.7",
                                 @"95th", @"11.1",
                                 @"97th", @"11.4",
                                 nil];
    
    NSMutableDictionary *wg12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"7.9",
                                 @"5th", @"8.1",
                                 @"10th", @"8.4",
                                 @"25th", @"8.9",
                                 @"50th", @"9.6",
                                 @"75th", @"10.3",
                                 @"90th", @"11.1",
                                 @"95th", @"11.5",
                                 @"97th", @"11.8",
                                 nil];
    weightChartG = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                    wg0, [NSNumber numberWithInt:0],
                    wg1, [NSNumber numberWithInt:0],
                    wg2, [NSNumber numberWithInt:0],
                    wg3, [NSNumber numberWithInt:0],
                    wg4, [NSNumber numberWithInt:0],
                    wg5, [NSNumber numberWithInt:0],
                    wg6, [NSNumber numberWithInt:0],
                    wg7, [NSNumber numberWithInt:0],
                    wg8, [NSNumber numberWithInt:0],
                    wg9, [NSNumber numberWithInt:0],
                    wg10, [NSNumber numberWithInt:0],
                    wg11, [NSNumber numberWithInt:0],
                    wg12, [NSNumber numberWithInt:0],
                    nil];
    
    //Girl Height Chart
    NSMutableDictionary *gh0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"45.0",
                                @"5th", @"45.5",
                                @"10th", @"46.3",
                                @"25th", @"47.6",
                                @"50th", @"49.2",
                                @"75th", @"51.0",
                                @"90th", @"52.7",
                                @"95th", @"53.7",
                                @"97th", @"54.4",
                                nil];
    NSMutableDictionary *gh1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"50.9",
                                @"5th", @"51.4",
                                @"10th", @"52.2",
                                @"25th", @"53.6",
                                @"50th", @"55.2",
                                @"75th", @"56.9",
                                @"90th", @"58.4",
                                @"95th", @"59.3",
                                @"97th", @"60.0",
                                nil];
    NSMutableDictionary *gh2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"53.6",
                                @"5th", @"54.1",
                                @"10th", @"55.0",
                                @"25th", @"56.4",
                                @"50th", @"58.0",
                                @"75th", @"59.7",
                                @"90th", @"61.2",
                                @"95th", @"62.1",
                                @"97th", @"62.7",
                                nil];
    NSMutableDictionary *gh3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"55.8",
                                @"5th", @"56.4",
                                @"10th", @"57.3",
                                @"25th", @"58.8",
                                @"50th", @"60.4",
                                @"75th", @"62.1",
                                @"90th", @"63.6",
                                @"95th", @"64.5",
                                @"97th", @"65.1",
                                nil];
    NSMutableDictionary *gh4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"57.8",
                                @"5th", @"58.4",
                                @"10th", @"59.3",
                                @"25th", @"60.8",
                                @"50th", @"62.5",
                                @"75th", @"64.2",
                                @"90th", @"65.7",
                                @"95th", @"66.6",
                                @"97th", @"67.2",
                                nil];
    NSMutableDictionary *gh5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"59.5",
                                @"5th", @"60.1",
                                @"10th", @"61.1",
                                @"25th", @"62.6",
                                @"50th", @"64.4",
                                @"75th", @"66.1",
                                @"90th", @"67.6",
                                @"95th", @"68.5",
                                @"97th", @"69.1",
                                nil];
    NSMutableDictionary *gh6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"61.1",
                                @"5th", @"61.7",
                                @"10th", @"62.7",
                                @"25th", @"64.3",
                                @"50th", @"66.1",
                                @"75th", @"67.8",
                                @"90th", @"69.4",
                                @"95th", @"70.3",
                                @"97th", @"70.9",
                                nil];
    NSMutableDictionary *gh7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"62.6",
                                @"5th", @"63.2",
                                @"10th", @"64.2",
                                @"25th", @"65.8",
                                @"50th", @"67.7",
                                @"75th", @"69.4",
                                @"90th", @"71.0",
                                @"95th", @"72.0",
                                @"97th", @"72.6",
                                nil];
    NSMutableDictionary *gh8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"63.9",
                                @"5th", @"64.6",
                                @"10th", @"65.6",
                                @"25th", @"67.3",
                                @"50th", @"69.1",
                                @"75th", @"71.0",
                                @"90th", @"72.6",
                                @"95th", @"73.5",
                                @"97th", @"74.2",
                                nil];
    NSMutableDictionary *gh9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd", @"65.2",
                                @"5th", @"65.9",
                                @"10th", @"66.9",
                                @"25th", @"68.7",
                                @"50th", @"70.5",
                                @"75th", @"72.4",
                                @"90th", @"74.0",
                                @"95th", @"75.0",
                                @"97th", @"75.7",
                                nil];
    NSMutableDictionary *gh10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"66.4",
                                 @"5th", @"67.1",
                                 @"10th", @"68.2",
                                 @"25th", @"70.0",
                                 @"50th", @"71.9",
                                 @"75th", @"73.8",
                                 @"90th", @"75.4",
                                 @"95th", @"76.4",
                                 @"97th", @"77.1",
                                 nil];
    NSMutableDictionary *gh11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"67.6",
                                 @"5th", @"68.3",
                                 @"10th", @"69.4",
                                 @"25th", @"71.2",
                                 @"50th", @"73.1",
                                 @"75th", @"75.0",
                                 @"90th", @"76.8",
                                 @"95th", @"77.8",
                                 @"97th", @"78.4",
                                 nil];
    NSMutableDictionary *gh12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd", @"68.7",
                                 @"5th", @"69.4",
                                 @"10th", @"70.5",
                                 @"25th", @"72.4",
                                 @"50th", @"74.3",
                                 @"75th", @"76.3",
                                 @"90th", @"78.1",
                                 @"95th", @"79.1",
                                 @"97th", @"79.8",
                                 nil];
    
    heightChartG = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                    gh0, [NSNumber numberWithInt:0],
                    gh1, [NSNumber numberWithInt:1],
                    gh2, [NSNumber numberWithInt:2],
                    gh3, [NSNumber numberWithInt:3],
                    gh4, [NSNumber numberWithInt:4],
                    gh5, [NSNumber numberWithInt:5],
                    gh6, [NSNumber numberWithInt:6],
                    gh7, [NSNumber numberWithInt:7],
                    gh8, [NSNumber numberWithInt:8],
                    gh9, [NSNumber numberWithInt:9],
                    gh10, [NSNumber numberWithInt:10],
                    gh11, [NSNumber numberWithInt:11],
                    gh12, [NSNumber numberWithInt:12],
                    nil];
    
    //Boy head chart
    NSMutableDictionary *bhead0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"31.4",
                                   @"5th", @"32.1",
                                   @"10th", @"33.0",
                                   @"25th", @"34.4",
                                   @"50th", @"35.8",
                                   @"75th", @"37.0",
                                   @"90th", @"37.9",
                                   @"95th", @"38.5",
                                   @"97th", @"38.8",
                                   nil];
    NSMutableDictionary *bhead1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"35.7",
                                   @"5th", @"36.2",
                                   @"10th", @"36.9",
                                   @"25th", @"38.0",
                                   @"50th", @"39.2",
                                   @"75th", @"40.2",
                                   @"90th", @"41.1",
                                   @"95th", @"41.6",
                                   @"97th", @"41.9",
                                   nil];
    NSMutableDictionary *bhead2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"37.5",
                                   @"5th", @"37.9",
                                   @"10th", @"38.6",
                                   @"25th", @"39.6",
                                   @"50th", @"40.6",
                                   @"75th", @"41.6",
                                   @"90th", @"42.4",
                                   @"95th", @"42.9",
                                   @"97th", @"43.2",
                                   nil];
    NSMutableDictionary *bhead3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"38.8",
                                   @"5th", @"39.2",
                                   @"10th", @"39.8",
                                   @"25th", @"40.7",
                                   @"50th", @"41.7",
                                   @"75th", @"42.7",
                                   @"90th", @"43.5",
                                   @"95th", @"44.0",
                                   @"97th", @"44.3",
                                   nil];
    NSMutableDictionary *bhead4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"39.9",
                                   @"5th", @"40.3",
                                   @"10th", @"40.8",
                                   @"25th", @"41.7",
                                   @"50th", @"42.6",
                                   @"75th", @"43.5",
                                   @"90th", @"44.3",
                                   @"95th", @"44.8",
                                   @"97th", @"45.1",
                                   nil];
    NSMutableDictionary *bhead5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"40.8",
                                   @"5th", @"41.1",
                                   @"10th", @"41.6",
                                   @"25th", @"42.4",
                                   @"50th", @"43.4",
                                   @"75th", @"44.3",
                                   @"90th", @"45.1",
                                   @"95th", @"45.5",
                                   @"97th", @"45.8",
                                   nil];
    NSMutableDictionary *bhead6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"41.5",
                                   @"5th", @"41.8",
                                   @"10th", @"42.3",
                                   @"25th", @"43.1",
                                   @"50th", @"44.0",
                                   @"75th", @"44.9",
                                   @"90th", @"45.7",
                                   @"95th", @"46.1",
                                   @"97th", @"46.5",
                                   nil];
    NSMutableDictionary *bhead7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"42.1",
                                   @"5th", @"42.4",
                                   @"10th", @"42.9",
                                   @"25th", @"43.7",
                                   @"50th", @"44.5",
                                   @"75th", @"45.4",
                                   @"90th", @"46.2",
                                   @"95th", @"46.7",
                                   @"97th", @"47.0",
                                   nil];
    NSMutableDictionary *bhead8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"42.6",
                                   @"5th", @"42.9",
                                   @"10th", @"43.4",
                                   @"25th", @"44.1",
                                   @"50th", @"45.0",
                                   @"75th", @"45.9",
                                   @"90th", @"46.7",
                                   @"95th", @"47.1",
                                   @"97th", @"47.5",
                                   nil];
    NSMutableDictionary *bhead9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"43.1",
                                   @"5th", @"43.3",
                                   @"10th", @"43.8",
                                   @"25th", @"44.6",
                                   @"50th", @"45.4",
                                   @"75th", @"46.3",
                                   @"90th", @"47.1",
                                   @"95th", @"47.6",
                                   @"97th", @"47.9",
                                   nil];
    NSMutableDictionary *bhead10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    @"3rd", @"43.4",
                                    @"5th", @"43.7",
                                    @"10th", @"44.2",
                                    @"25th", @"44.9",
                                    @"50th", @"45.8",
                                    @"75th", @"46.7",
                                    @"90th", @"47.5",
                                    @"95th", @"47.9",
                                    @"97th", @"48.3",
                                    nil];
    NSMutableDictionary *bhead11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    @"3rd", @"43.8",
                                    @"5th", @"44.1",
                                    @"10th", @"44.5",
                                    @"25th", @"45.3",
                                    @"50th", @"46.1",
                                    @"75th", @"47.0",
                                    @"90th", @"47.8",
                                    @"95th", @"48.3",
                                    @"97th", @"48.6",
                                    nil];
    NSMutableDictionary *bhead12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    @"3rd", @"44.1",
                                    @"5th", @"44.4",
                                    @"10th", @"44.8",
                                    @"25th", @"45.6",
                                    @"50th", @"46.4",
                                    @"75th", @"47.3",
                                    @"90th", @"48.1",
                                    @"95th", @"48.6",
                                    @"97th", @"48.9",
                                    nil];
    headChartB = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                  bhead0, [NSNumber numberWithInt:0],
                  bhead1, [NSNumber numberWithInt:1],
                  bhead2, [NSNumber numberWithInt:2],
                  bhead3, [NSNumber numberWithInt:3],
                  bhead4, [NSNumber numberWithInt:4],
                  bhead5, [NSNumber numberWithInt:5],
                  bhead6, [NSNumber numberWithInt:6],
                  bhead7, [NSNumber numberWithInt:7],
                  bhead8, [NSNumber numberWithInt:8],
                  bhead9, [NSNumber numberWithInt:9],
                  bhead10, [NSNumber numberWithInt:10],
                  bhead11, [NSNumber numberWithInt:11],
                  bhead12, [NSNumber numberWithInt:12],
                  nil];
    
    
    //Girl head chart
    NSMutableDictionary *ghead0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"31.9",
                                   @"5th", @"32.2",
                                   @"10th", @"32.7",
                                   @"25th", @"33.6",
                                   @"50th", @"34.7",
                                   @"75th", @"35.8",
                                   @"90th", @"36.9",
                                   @"95th", @"37.6",
                                   @"97th", @"38.1",
                                   nil];
    NSMutableDictionary *ghead1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"35.4",
                                   @"5th", @"35.7",
                                   @"10th", @"36.2",
                                   @"25th", @"37.0",
                                   @"50th", @"37.9",
                                   @"75th", @"38.9",
                                   @"90th", @"39.9",
                                   @"95th", @"40.5",
                                   @"97th", @"40.9",
                                   nil];
    NSMutableDictionary *ghead2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"36.9",
                                   @"5th", @"37.2",
                                   @"10th", @"37.7",
                                   @"25th", @"38.4",
                                   @"50th", @"39.3",
                                   @"75th", @"40.3",
                                   @"90th", @"41.2",
                                   @"95th", @"41.8",
                                   @"97th", @"42.2",
                                   nil];
    
    NSMutableDictionary *ghead3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"38.1",
                                   @"5th", @"38.4",
                                   @"10th", @"38.8",
                                   @"25th", @"39.5",
                                   @"50th", @"40.4",
                                   @"75th", @"41.3",
                                   @"90th", @"42.2",
                                   @"95th", @"42.8",
                                   @"97th", @"43.2",
                                   nil];
    NSMutableDictionary *ghead4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"39.0",
                                   @"5th", @"39.3",
                                   @"10th", @"39.7",
                                   @"25th", @"40.4",
                                   @"50th", @"41.3",
                                   @"75th", @"42.2",
                                   @"90th", @"43.1",
                                   @"95th", @"43.6",
                                   @"97th", @"44.0",
                                   nil];
    NSMutableDictionary *ghead5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"39.7",
                                   @"5th", @"40.0",
                                   @"10th", @"40.4",
                                   @"25th", @"41.2",
                                   @"50th", @"42.0",
                                   @"75th", @"42.9",
                                   @"90th", @"43.8",
                                   @"95th", @"44.3",
                                   @"97th", @"44.6",
                                   nil];
    NSMutableDictionary *ghead6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"40.4",
                                   @"5th", @"40.7",
                                   @"10th", @"41.1",
                                   @"25th", @"41.8",
                                   @"50th", @"42.7",
                                   @"75th", @"43.5",
                                   @"90th", @"44.4",
                                   @"95th", @"44.9",
                                   @"97th", @"45.2",
                                   nil];
    NSMutableDictionary *ghead7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"40.9",
                                   @"5th", @"41.2",
                                   @"10th", @"41.6",
                                   @"25th", @"42.4",
                                   @"50th", @"43.2",
                                   @"75th", @"44.1",
                                   @"90th", @"44.9",
                                   @"95th", @"45.4",
                                   @"97th", @"45.7",
                                   nil];
    NSMutableDictionary *ghead8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"41.4",
                                   @"5th", @"41.7",
                                   @"10th", @"42.1",
                                   @"25th", @"42.8",
                                   @"50th", @"43.7",
                                   @"75th", @"44.6",
                                   @"90th", @"45.4",
                                   @"95th", @"45.9",
                                   @"97th", @"46.2",
                                   nil];
    
    NSMutableDictionary *ghead9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   @"3rd", @"41.8",
                                   @"5th", @"42.1",
                                   @"10th", @"42.5",
                                   @"25th", @"43.3",
                                   @"50th", @"44.1",
                                   @"75th", @"45.0",
                                   @"90th", @"45.8",
                                   @"95th", @"46.3",
                                   @"97th", @"46.6",
                                   nil];
    NSMutableDictionary *ghead10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    @"3rd", @"42.2",
                                    @"5th", @"42.5",
                                    @"10th", @"42.9",
                                    @"25th", @"43.6",
                                    @"50th", @"44.5",
                                    @"75th", @"45.4",
                                    @"90th", @"46.2",
                                    @"95th", @"46.6",
                                    @"97th", @"47.0",
                                    nil];
    NSMutableDictionary *ghead11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    @"3rd", @"42.5",
                                    @"5th", @"42.8",
                                    @"10th", @"43.2",
                                    @"25th", @"44.0",
                                    @"50th", @"44.8",
                                    @"75th", @"45.7",
                                    @"90th", @"46.5",
                                    @"95th", @"47.0",
                                    @"97th", @"47.3",
                                    nil];
    
    NSMutableDictionary *ghead12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    @"3rd", @"42.8",
                                    @"5th", @"43.1",
                                    @"10th", @"43.5",
                                    @"25th", @"44.3",
                                    @"50th", @"45.1",
                                    @"75th", @"46.0",
                                    @"90th", @"46.8",
                                    @"95th", @"47.3",
                                    @"97th", @"47.6",
                                    nil];
    
    headChartG = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                  ghead0, [NSNumber numberWithInt:0],
                  ghead1, [NSNumber numberWithInt:1],
                  ghead2, [NSNumber numberWithInt:2],
                  ghead3, [NSNumber numberWithInt:3],
                  ghead4, [NSNumber numberWithInt:4],
                  ghead5, [NSNumber numberWithInt:5],
                  ghead6, [NSNumber numberWithInt:6],
                  ghead7, [NSNumber numberWithInt:7],
                  ghead8, [NSNumber numberWithInt:8],
                  ghead9, [NSNumber numberWithInt:9],
                  ghead10, [NSNumber numberWithInt:10],
                  ghead11, [NSNumber numberWithInt:11],
                  ghead12, [NSNumber numberWithInt:12],
                  nil];
    //Avg.
    NSMutableArray *weightG = [NSMutableArray array];
    [weightG addObject:@"3.4"];
    [weightG addObject:@"4.5"];
    [weightG addObject:@"5.2"];
    [weightG addObject:@"5.8"];
    [weightG addObject:@"6.4"];
    [weightG addObject:@"6.9"];
    [weightG addObject:@"7.4"];
    [weightG addObject:@"7.9"];
    [weightG addObject:@"8.3"];
    [weightG addObject:@"8.6"];
    [weightG addObject:@"9.0"];
    [weightG addObject:@"9.3"];
    [weightG addObject:@"9.6"];
    
    NSMutableArray *weightB = [NSMutableArray array];
    [weightB addObject:@"3.5"];
    [weightB addObject:@"4.8"];
    [weightB addObject:@"5.6"];
    [weightB addObject:@"6.3"];
    [weightB addObject:@"7.0"];
    [weightB addObject:@"7.6"];
    [weightB addObject:@"8.1"];
    [weightB addObject:@"8.6"];
    [weightB addObject:@"9.0"];
    [weightB addObject:@"9.4"];
    [weightB addObject:@"9.8"];
    [weightB addObject:@"10.1"];
    [weightB addObject:@"10.4"];
    
    NSMutableArray *heightB = [NSMutableArray array];
    [heightB addObject:@"49.9"];
    [heightB addObject:@"56.6"];
    [heightB addObject:@"59.6"];
    [heightB addObject:@"62.0"];
    [heightB addObject:@"64.2"];
    [heightB addObject:@"66.1"];
    [heightB addObject:@"67.8"];
    [heightB addObject:@"69.4"];
    [heightB addObject:@"70.9"];
    [heightB addObject:@"72.3"];
    [heightB addObject:@"73.6"];
    [heightB addObject:@"74.9"];
    [heightB addObject:@"76.1"];
    
    NSMutableArray *heightG = [NSMutableArray array];
    [heightG addObject:@"49.2"];
    [heightG addObject:@"55.2"];
    [heightG addObject:@"58.0"];
    [heightG addObject:@"60.4"];
    [heightG addObject:@"62.5"];
    [heightG addObject:@"64.4"];
    [heightG addObject:@"66.1"];
    [heightG addObject:@"67.7"];
    [heightG addObject:@"69.1"];
    [heightG addObject:@"70.5"];
    [heightG addObject:@"71.9"];
    [heightG addObject:@"73.1"];
    [heightG addObject:@"74.3"];
    
    
    NSMutableArray *headB = [NSMutableArray array];
    [headB addObject:@"35.8"];
    [headB addObject:@"39.2"];
    [headB addObject:@"40.6"];
    [headB addObject:@"41.7"];
    [headB addObject:@"42.6"];
    [headB addObject:@"43.4"];
    [headB addObject:@"44.0"];
    [headB addObject:@"44.5"];
    [headB addObject:@"45.0"];
    [headB addObject:@"45.4"];
    [headB addObject:@"45.8"];
    [headB addObject:@"46.1"];
    [headB addObject:@"46.4"];
    
    NSMutableArray *headG = [NSMutableArray array];
    [headG addObject:@"34.7"];
    [headG addObject:@"37.9"];
    [headG addObject:@"39.3"];
    [headG addObject:@"40.4"];
    [headG addObject:@"41.3"];
    [headG addObject:@"42.0"];
    [headG addObject:@"42.7"];
    [headG addObject:@"43.2"];
    [headG addObject:@"43.7"];
    [headG addObject:@"44.1"];
    [headG addObject:@"44.5"];
    [headG addObject:@"44.8"];
    [headG addObject:@"45.1"];

    avgValue = [[NSMutableDictionary alloc]initWithObjectsAndKeys:headB,@"headB",
                                                                 headG, @"headG",
                                                                weightB, @"weightB",
                                                                weightG, @"weightG",
                                                                heightB, @"heightB",
                                                                heightG, @"heightG",nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkGender];
    weightType.text = [[Model uniqueModel] weightSetting];
    heightType.text = [[Model uniqueModel] heightSetting];
    weightModifier = [[Model uniqueModel] getWeightModifier];
    heightModifier = [[Model uniqueModel] getHeightModifier];
    [self getAvgValue];
}
-(void) checkGender
{
    if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
    {
        bodyPic.image = [UIImage imageNamed:@"BodyView_boy.png"];
        weightChartUse= weightChartB;
        heightChartUse= heightChartB;
        headChartUse= headChartB;
        NSLog(@"ii");
    }
    else
    {
        bodyPic.image = [UIImage imageNamed:@"BodyView_girl.png"];
        weightChartUse= weightChartG;
        heightChartUse= heightChartG;
        headChartUse= headChartG;
    }
}
- (void)viewDidUnload
{
    [self setHeightLabel:nil];
    [self setWeightLabel:nil];
    [self setHeightTextField:nil];
    
    [self setWeightTextField:nil];
    [self setWeightType:nil];
    
    //NEED TO DESTROY DICTIONARIES LATER.
    [self setHeadLabel:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//UPDATE
- (IBAction)updateRecord:(id)sender {
    if(![[Model uniqueModel] logIn])
       [self doAlert];
    else
    {
        [[Model uniqueModel] bodyViewUpdate: heightTextField.text: weightTextField.text : headTextField.text:weightLabel.text :heightLabel.text  :headLabel.text:weightAvg.text :heightAvg.text  :headAvg.text:[ageTextField.text intValue]];
        [self showComfirmation];
    }
    
}


//SUBMIT BUTTON
- (IBAction)submitButton:(id)sender {
    
    //submitAll(ageTextFIeld, heightTextField, heightLabel, weightTextField, weightLabel);
    NSString *w;
     NSString *h;
     NSString *he;
    
    //Weight
    double distance = 0;
    double weight = round(weightTextField.text.doubleValue * weightModifier * 10)/10.0 ;
    NSMutableDictionary *wTemp = [weightChartUse objectForKey:[NSNumber numberWithInt:ageTextField.text.intValue]];
    
    while([wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight + distance]] == nil
          &&[wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight - distance]] == nil)
    {
       distance += 0.1;
    }
    if(distance == 0)
        w = [wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight]];
    else
    {
        if([wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight + distance]] != nil)
           w = [wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight + distance]];
        else
            w = [wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight - distance]];
    }
    weightLabel.text = w;
    //Height
    distance = 0;
    double height = round(heightTextField.text.doubleValue * heightModifier * 10)/10.0 ;
    NSMutableDictionary *hTemp = [heightChartUse objectForKey:[NSNumber numberWithInt:ageTextField.text.intValue]];
    while([hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height + distance]] == nil
          &&[hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height - distance]] == nil)
    {
        distance += 0.1;
    }
    if(distance == 0)
       h = [hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height]];
    else
    {
        if([hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height + distance]] != nil)
            h = [hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height + distance]];
        else
            h = [hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height - distance]];
    }
      heightLabel.text = h;
    
    //Head
    distance = 0;
    double head = round(headTextField.text.doubleValue * heightModifier * 10)/10.0 ;
    NSMutableDictionary *heTemp = [headChartUse objectForKey:[NSNumber numberWithInt:ageTextField.text.intValue]];
    while([heTemp objectForKey:[NSString stringWithFormat:@"%.1f", head + distance]] == nil
          &&[heTemp objectForKey:[NSString stringWithFormat:@"%.1f", head - distance]] == nil)
    {
        distance += 0.1;
    }
    if(distance == 0)
        he = [heTemp objectForKey:[NSString stringWithFormat:@"%.1f", head]];
    else
    {
        if([heTemp objectForKey:[NSString stringWithFormat:@"%.1f", head + distance]] != nil)
            he = [heTemp objectForKey:[NSString stringWithFormat:@"%.1f", head + distance]];
        else
            he = [heTemp objectForKey:[NSString stringWithFormat:@"%.1f", head - distance]];
    }
    headLabel.text = he;
}


//ALERT
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
-(void) showComfirmation
{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Record has been saved."
                   message:nil
                   delegate: self
                   cancelButtonTitle: @"OK"
                   otherButtonTitles: nil];
    
    
	[alertDialog show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
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


//AVG.
-(void) getAvgValue
{
    int index = [ageTextField.text intValue];
    if([[[Model uniqueModel]gender] isEqualToString:@"Boy"])
    {
        double w = round([[[avgValue objectForKey:@"weightB"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double h = round([[[avgValue objectForKey:@"heightB"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double he = round([[[avgValue objectForKey:@"headB"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        weightAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",w,@")"];
        heightAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",h,@")"];
        headAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",he,@")"];
       
       //NSLog(heightAvg.text);
    }
    else
    {
        double w = round([[[avgValue objectForKey:@"weightG"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getWeightModifier] *10)/10.0;
        double h = round([[[avgValue objectForKey:@"heightG"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        double he = round([[[avgValue objectForKey:@"headG"]objectAtIndex:index] doubleValue] / [[Model uniqueModel] getHeightModifier]*10)/10.0;
        weightAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",w,@")"];
        heightAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",h,@")"];
        headAvg.text = [NSString stringWithFormat:@"%@%.1f%@",@"(avg. ",he,@")"];
    }
}
@end
