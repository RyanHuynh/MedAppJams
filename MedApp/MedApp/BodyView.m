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
@synthesize ageTextFIeld;
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
@synthesize singlePickerComponent;
@synthesize ageData;
@synthesize heightType;
@synthesize weightType;

static int weightModifier;
static int heightModifier;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a n
    
        
    //if(setting.weightSetting.selectedSegmentIndex == 0)
      //  weightType.text = setting.stringForWeightUse;
    
    //Initialize dictionary
    //Boy Weight chart, variable name is corespoding to age, e.g. bw0 is for boy with age 0, bw1 for boy with age 1, etc..
    
    
    NSMutableDictionary *bw1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                               @"3rd Percentile for Weight.", @"3.6",
                               @"5th Percentile for Weight.", @"3.7",
                               @"10th Percentile for Weight.", @"4.0",
                               @"25th Percentile for Weight.", @"4.4",
                               @"50th Percentile for Weight.", @"4.8",
                               @"75th Percentile for Weight.", @"5.3",
                               @"90th Percentile for Weight.", @"5.7",
                               @"95th Percentile for Weight.", @"5.9",
                               @"97th Percentile for Weight.", @"6.1",
                               nil];
    
    NSMutableDictionary *bw0 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"2.3",
                                @"5th Percentile for Weight.", @"2.5",
                                @"10th Percentile for Weight.", @"2.7",
                                @"25th Percentile for Weight.", @"3.1",
                                @"50th Percentile for Weight.", @"3.5",
                                @"75th Percentile for Weight.", @"3.8",
                                @"90th Percentile for Weight.", @"4.1",
                                @"95th Percentile for Weight.", @"4.3",
                                @"97th Percentile for Weight.", @"4.4",
                                nil];
    
    
    NSMutableDictionary *bw2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"4.3",
                                @"5th Percentile for Weight.", @"4.5",
                                @"10th Percentile for Weight.", @"4.8",
                                @"25th Percentile for Weight.", @"5.2",
                                @"50th Percentile for Weight.", @"5.7",
                                @"75th Percentile for Weight.", @"6.2",
                                @"90th Percentile for Weight.", @"6.6",
                                @"95th Percentile for Weight.", @"6.9",
                                @"97th Percentile for Weight.", @"7.2",
                                nil];
    
    NSMutableDictionary *bw3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"5.0",
                                @"5th Percentile for Weight.", @"5.2",
                                @"10th Percentile for Weight.", @"5.4",
                                @"25th Percentile for Weight.", @"5.9",
                                @"50th Percentile for Weight.", @"6.4",
                                @"75th Percentile for Weight.", @"6.9",
                                @"90th Percentile for Weight.", @"7.5",
                                @"95th Percentile for Weight.", @"7.8",
                                @"97th Percentile for Weight.", @"8.0",
                                nil];
    
    NSMutableDictionary *bw4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"5.6",
                                @"5th Percentile for Weight.", @"5.7",
                                @"10th Percentile for Weight.", @"6.0",
                                @"25th Percentile for Weight.", @"6.5",
                                @"50th Percentile for Weight.", @"7.0",
                                @"75th Percentile for Weight.", @"7.6",
                                @"90th Percentile for Weight.", @"8.2",
                                @"95th Percentile for Weight.", @"8.6",
                                @"97th Percentile for Weight.", @"8.9",
                                nil];
    NSMutableDictionary *bw5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"6.1",
                                @"5th Percentile for Weight.", @"6.3",
                                @"10th Percentile for Weight.", @"6.6",
                                @"25th Percentile for Weight.", @"7.0",
                                @"50th Percentile for Weight.", @"7.6",
                                @"75th Percentile for Weight.", @"8.3",
                                @"90th Percentile for Weight.", @"8.9",
                                @"95th Percentile for Weight.", @"9.3",
                                @"97th Percentile for Weight.", @"9.5",
                                nil];
    
    NSMutableDictionary *bw6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"6.6",
                                @"5th Percentile for Weight.", @"6.7",
                                @"10th Percentile for Weight.", @"7.0",
                                @"25th Percentile for Weight.", @"7.5",
                                @"50th Percentile for Weight.", @"8.2",
                                @"75th Percentile for Weight.", @"8.8",
                                @"90th Percentile for Weight.", @"9.5",
                                @"95th Percentile for Weight.", @"9.9",
                                @"97th Percentile for Weight.", @"10.2",
                                nil];
    NSMutableDictionary *bw7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"7.0",
                                @"5th Percentile for Weight.", @"7.2",
                                @"10th Percentile for Weight.", @"7.5",
                                @"25th Percentile for Weight.", @"8.0",
                                @"50th Percentile for Weight.", @"8.6",
                                @"75th Percentile for Weight.", @"9.3",
                                @"90th Percentile for Weight.", @"10.0",
                                @"95th Percentile for Weight.", @"10.5",
                                @"97th Percentile for Weight.", @"10.7",
                                nil];
    NSMutableDictionary *bw8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"7.4",
                                @"5th Percentile for Weight.", @"7.6",
                                @"10th Percentile for Weight.", @"7.9",
                                @"25th Percentile for Weight.", @"8.4",
                                @"50th Percentile for Weight.", @"9.1",
                                @"75th Percentile for Weight.", @"9.8",
                                @"90th Percentile for Weight.", @"10.5",
                                @"95th Percentile for Weight.", @"11.0",
                                @"97th Percentile for Weight.", @"11.3",
                                nil];
    NSMutableDictionary *bw9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"7.7",
                                @"5th Percentile for Weight.", @"7.9",
                                @"10th Percentile for Weight.", @"8.2",
                                @"25th Percentile for Weight.", @"8.8",
                                @"50th Percentile for Weight.", @"9.5",
                                @"75th Percentile for Weight.", @"10.2",
                                @"90th Percentile for Weight.", @"11.0",
                                @"95th Percentile for Weight.", @"11.4",
                                @"97th Percentile for Weight.", @"11.7",
                                nil];
    NSMutableDictionary *bw10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Weight.", @"8.0",
                                 @"5th Percentile for Weight.", @"8.2",
                                 @"10th Percentile for Weight.", @"8.5",
                                 @"25th Percentile for Weight.", @"9.1",
                                 @"50th Percentile for Weight.", @"9.8",
                                 @"75th Percentile for Weight.", @"10.6",
                                 @"90th Percentile for Weight.", @"11.4",
                                 @"95th Percentile for Weight.", @"11.8",
                                 @"97th Percentile for Weight.", @"12.2",
                                 nil];
    NSMutableDictionary *bw11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Weight.", @"8.3",
                                 @"5th Percentile for Weight.", @"8.5",
                                 @"10th Percentile for Weight.", @"8.8",
                                 @"25th Percentile for Weight.", @"9.4",
                                 @"50th Percentile for Weight.", @"10.2",
                                 @"75th Percentile for Weight.", @"11.0",
                                 @"90th Percentile for Weight.", @"11.7",
                                 @"95th Percentile for Weight.", @"12.2",
                                 @"97th Percentile for Weight.", @"12.6",
                                 nil];
    NSMutableDictionary *bw12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Weight.", @"8.5",
                                 @"5th Percentile for Weight.", @"8.8",
                                 @"10th Percentile for Weight.", @"9.1",
                                 @"25th Percentile for Weight.", @"9.7",
                                 @"50th Percentile for Weight.", @"10.5",
                                 @"75th Percentile for Weight.", @"11.3",
                                 @"90th Percentile for Weight.", @"12.1",
                                 @"95th Percentile for Weight.", @"12.6",
                                 @"97th Percentile for Weight.", @"12.9",
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
                               @"3rd Percentile for Height.", @"44.9",
                               @"5th Percentile for Height.", @"45.5",
                               @"10th Percentile for Height.", @"46.5",
                               @"25th Percentile for Height.", @"48.1",
                               @"50th Percentile for Height.", @"49.9",
                               @"75th Percentile for Height.", @"51.7",
                               @"90th Percentile for Height.", @"53.3",
                               @"95th Percentile for Height.", @"54.3",
                               @"97th Percentile for Height.", @"54.9",
                               nil];
    
    NSMutableDictionary *bh1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"52.1",
                                @"5th Percentile for Height.", @"52.7",
                                @"10th Percentile for Height.", @"53.5",
                                @"25th Percentile for Height.", @"54.9",
                                @"50th Percentile for Height.", @"56.6",
                                @"75th Percentile for Height.", @"58.3",
                                @"90th Percentile for Height.", @"59.9",
                                @"95th Percentile for Height.", @"60.9",
                                @"97th Percentile for Height.", @"61.6",
                                nil];
    NSMutableDictionary *bh2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"55.2",
                                @"5th Percentile for Height.", @"55.7",
                                @"10th Percentile for Height.", @"56.5",
                                @"25th Percentile for Height.", @"57.9",
                                @"50th Percentile for Height.", @"59.6",
                                @"75th Percentile for Height.", @"61.3",
                                @"90th Percentile for Height.", @"62.9",
                                @"95th Percentile for Height.", @"64.0",
                                @"97th Percentile for Height.", @"64.6",
                                nil];
    NSMutableDictionary *bh3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"57.7",
                                @"5th Percentile for Height.", @"58.2",
                                @"10th Percentile for Height.", @"59.0",
                                @"25th Percentile for Height.", @"60.4",
                                @"50th Percentile for Height.", @"62.0",
                                @"75th Percentile for Height.", @"63.8",
                                @"90th Percentile for Height.", @"65.4",
                                @"95th Percentile for Height.", @"66.5",
                                @"97th Percentile for Height.", @"67.2",
                                nil];
    NSMutableDictionary *bh4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"59.8",
                                @"5th Percentile for Height.", @"60.3",
                                @"10th Percentile for Height.", @"61.1",
                                @"25th Percentile for Height.", @"62.5",
                                @"50th Percentile for Height.", @"64.2",
                                @"75th Percentile for Height.", @"65.9",
                                @"90th Percentile for Height.", @"67.6",
                                @"95th Percentile for Height.", @"68.7",
                                @"97th Percentile for Height.", @"69.4",
                                nil];
    NSMutableDictionary *bh5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"61.6",
                                @"5th Percentile for Height.", @"62.1",
                                @"10th Percentile for Height.", @"63.0",
                                @"25th Percentile for Height.", @"64.4",
                                @"50th Percentile for Height.", @"66.1",
                                @"75th Percentile for Height.", @"67.9",
                                @"90th Percentile for Height.", @"69.6",
                                @"95th Percentile for Height.", @"70.7",
                                @"97th Percentile for Height.", @"71.4",
                                nil];
    NSMutableDictionary *bh6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"63.3",
                                @"5th Percentile for Height.", @"63.8",
                                @"10th Percentile for Height.", @"64.6",
                                @"25th Percentile for Height.", @"66.1",
                                @"50th Percentile for Height.", @"67.8",
                                @"75th Percentile for Height.", @"69.6",
                                @"90th Percentile for Height.", @"71.4",
                                @"95th Percentile for Height.", @"72.5",
                                @"97th Percentile for Height.", @"73.3",
                                nil];
    NSMutableDictionary *bh7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"64.8",
                                @"5th Percentile for Height.", @"65.3",
                                @"10th Percentile for Height.", @"66.2",
                                @"25th Percentile for Height.", @"67.7",
                                @"50th Percentile for Height.", @"69.4",
                                @"75th Percentile for Height.", @"71.3",
                                @"90th Percentile for Height.", @"73.1",
                                @"95th Percentile for Height.", @"74.2",
                                @"97th Percentile for Height.", @"74.9",
                                nil];
    NSMutableDictionary *bh8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"66.1",
                                @"5th Percentile for Height.", @"66.7",
                                @"10th Percentile for Height.", @"67.6",
                                @"25th Percentile for Height.", @"69.1",
                                @"50th Percentile for Height.", @"70.9",
                                @"75th Percentile for Height.", @"72.8",
                                @"90th Percentile for Height.", @"74.6",
                                @"95th Percentile for Height.", @"75.8",
                                @"97th Percentile for Height.", @"76.5",
                                nil];
    NSMutableDictionary *bh9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"67.4",
                                @"5th Percentile for Height.", @"68.0",
                                @"10th Percentile for Height.", @"68.9",
                                @"25th Percentile for Height.", @"70.5",
                                @"50th Percentile for Height.", @"72.3",
                                @"75th Percentile for Height.", @"74.2",
                                @"90th Percentile for Height.", @"76.1",
                                @"95th Percentile for Height.", @"77.2",
                                @"97th Percentile for Height.", @"78.0",
                                nil];
    NSMutableDictionary *bh10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Height.", @"68.6",
                                 @"5th Percentile for Height.", @"69.2",
                                 @"10th Percentile for Height.", @"70.2",
                                 @"25th Percentile for Height.", @"71.8",
                                 @"50th Percentile for Height.", @"73.6",
                                 @"75th Percentile for Height.", @"75.6",
                                 @"90th Percentile for Height.", @"77.5",
                                 @"95th Percentile for Height.", @"78.6",
                                 @"97th Percentile for Height.", @"79.4",
                                 nil];
    NSMutableDictionary *bh11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Height.", @"69.8",
                                 @"5th Percentile for Height.", @"70.4",
                                 @"10th Percentile for Height.", @"71.3",
                                 @"25th Percentile for Height.", @"73.0",
                                 @"50th Percentile for Height.", @"74.9",
                                 @"75th Percentile for Height.", @"76.9",
                                 @"90th Percentile for Height.", @"78.8",
                                 @"95th Percentile for Height.", @"79.9",
                                 @"97th Percentile for Height.", @"80.7",
                                 nil];
    NSMutableDictionary *bh12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Height.", @"70.9",
                                 @"5th Percentile for Height.", @"71.5",
                                 @"10th Percentile for Height.", @"72.5",
                                 @"25th Percentile for Height.", @"74.1",
                                 @"50th Percentile for Height.", @"76.1",
                                 @"75th Percentile for Height.", @"78.1",
                                 @"90th Percentile for Height.", @"80.0",
                                 @"95th Percentile for Height.", @"81.2",
                                 @"97th Percentile for Height.", @"82.0",
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
                                @"3rd Percentile for Weight.", @"2.4",
                                @"5th Percentile for Weight.", @"2.5",
                                @"10th Percentile for Weight.", @"2.7",
                                @"25th Percentile for Weight.", @"3.0",
                                @"50th Percentile for Weight.", @"3.3",
                                @"75th Percentile for Weight.", @"3.7",
                                @"90th Percentile for Weight.", @"3.9",
                                @"95th Percentile for Weight.", @"4.1",
                                @"97th Percentile for Weight.", @"4.2",
                                nil];
    
    NSMutableDictionary *wg1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"3.4",
                                @"5th Percentile for Weight.", @"3.5",
                                @"10th Percentile for Weight.", @"3.7",
                                @"25th Percentile for Weight.", @"4.1",
                                @"50th Percentile for Weight.", @"4.5",
                                @"75th Percentile for Weight.", @"4.9",
                                @"90th Percentile for Weight.", @"5.3",
                                @"95th Percentile for Weight.", @"5.5",
                                @"97th Percentile for Weight.", @"5.6",
                                nil];
    
    
    NSMutableDictionary *wg2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"3.9",
                                @"5th Percentile for Weight.", @"4.1",
                                @"10th Percentile for Weight.", @"4.3",
                                @"25th Percentile for Weight.", @"4.7",
                                @"50th Percentile for Weight.", @"5.2",
                                @"75th Percentile for Weight.", @"5.6",
                                @"90th Percentile for Weight.", @"6.0",
                                @"95th Percentile for Weight.", @"6.3",
                                @"97th Percentile for Weight.", @"6.4",
                                nil];
    
    NSMutableDictionary *wg3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"4.5",
                                @"5th Percentile for Weight.", @"4.7",
                                @"10th Percentile for Weight.", @"4.9",
                                @"25th Percentile for Weight.", @"5.3",
                                @"50th Percentile for Weight.", @"5.8",
                                @"75th Percentile for Weight.", @"6.3",
                                @"90th Percentile for Weight.", @"6.8",
                                @"95th Percentile for Weight.", @"7.0",
                                @"97th Percentile for Weight.", @"7.2",
                                nil];
    
    NSMutableDictionary *wg4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"5.0",
                                @"5th Percentile for Weight.", @"5.2",
                                @"10th Percentile for Weight.", @"5.4",
                                @"25th Percentile for Weight.", @"5.9",
                                @"50th Percentile for Weight.", @"6.4",
                                @"75th Percentile for Weight.", @"6.9",
                                @"90th Percentile for Weight.", @"7.4",
                                @"95th Percentile for Weight.", @"7.7",
                                @"97th Percentile for Weight.", @"7.9",
                                nil];
    
    NSMutableDictionary *wg5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"5.5",
                                @"5th Percentile for Weight.", @"5.6",
                                @"10th Percentile for Weight.", @"5.9",
                                @"25th Percentile for Weight.", @"6.4",
                                @"50th Percentile for Weight.", @"6.9",
                                @"75th Percentile for Weight.", @"7.5",
                                @"90th Percentile for Weight.", @"8.0",
                                @"95th Percentile for Weight.", @"8.3",
                                @"97th Percentile for Weight.", @"8.5",
                                nil];
    
    NSMutableDictionary *wg6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"5.9",
                                @"5th Percentile for Weight.", @"6.1",
                                @"10th Percentile for Weight.", @"6.4",
                                @"25th Percentile for Weight.", @"6.8",
                                @"50th Percentile for Weight.", @"7.4",
                                @"75th Percentile for Weight.", @"8.0",
                                @"90th Percentile for Weight.", @"8.6",
                                @"95th Percentile for Weight.", @"8.9",
                                @"97th Percentile for Weight.", @"9.1",
                                nil];
    
    NSMutableDictionary *wg7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"6.3",
                                @"5th Percentile for Weight.", @"6.5",
                                @"10th Percentile for Weight.", @"6.8",
                                @"25th Percentile for Weight.", @"7.3",
                                @"50th Percentile for Weight.", @"7.9",
                                @"75th Percentile for Weight.", @"8.5",
                                @"90th Percentile for Weight.", @"9.1",
                                @"95th Percentile for Weight.", @"9.4",
                                @"97th Percentile for Weight.", @"9.7",
                                nil];
    
    NSMutableDictionary *wg8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"6.7",
                                @"5th Percentile for Weight.", @"6.9",
                                @"10th Percentile for Weight.", @"7.1",
                                @"25th Percentile for Weight.", @"7.7",
                                @"50th Percentile for Weight.", @"8.3",
                                @"75th Percentile for Weight.", @"8.9",
                                @"90th Percentile for Weight.", @"9.5",
                                @"95th Percentile for Weight.", @"9.9",
                                @"97th Percentile for Weight.", @"10.2",
                                nil];
    
    NSMutableDictionary *wg9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Weight.", @"7.0",
                                @"5th Percentile for Weight.", @"7.2",
                                @"10th Percentile for Weight.", @"7.5",
                                @"25th Percentile for Weight.", @"8.0",
                                @"50th Percentile for Weight.", @"8.6",
                                @"75th Percentile for Weight.", @"9.3",
                                @"90th Percentile for Weight.", @"10.0",
                                @"95th Percentile for Weight.", @"10.4",
                                @"97th Percentile for Weight.", @"10.6",
                                nil];
    
    NSMutableDictionary *wg10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Weight.", @"7.3",
                                 @"5th Percentile for Weight.", @"7.5",
                                 @"10th Percentile for Weight.", @"7.8",
                                 @"25th Percentile for Weight.", @"8.4",
                                 @"50th Percentile for Weight.", @"9.0",
                                 @"75th Percentile for Weight.", @"9.7",
                                 @"90th Percentile for Weight.", @"10.3",
                                 @"95th Percentile for Weight.", @"10.8",
                                 @"97th Percentile for Weight.", @"11.0",
                                 nil];
    
    NSMutableDictionary *wg11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Weight.", @"7.6",
                                 @"5th Percentile for Weight.", @"7.8",
                                 @"10th Percentile for Weight.", @"8.1",
                                 @"25th Percentile for Weight.", @"8.7",
                                 @"50th Percentile for Weight.", @"9.3",
                                 @"75th Percentile for Weight.", @"10.0",
                                 @"90th Percentile for Weight.", @"10.7",
                                 @"95th Percentile for Weight.", @"11.1",
                                 @"97th Percentile for Weight.", @"11.4",
                                 nil];
    
    NSMutableDictionary *wg12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Weight.", @"7.9",
                                 @"5th Percentile for Weight.", @"8.1",
                                 @"10th Percentile for Weight.", @"8.4",
                                 @"25th Percentile for Weight.", @"8.9",
                                 @"50th Percentile for Weight.", @"9.6",
                                 @"75th Percentile for Weight.", @"10.3",
                                 @"90th Percentile for Weight.", @"11.1",
                                 @"95th Percentile for Weight.", @"11.5",
                                 @"97th Percentile for Weight.", @"11.8",
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
                                @"3rd Percentile for Height.", @"45.0",
                                @"5th Percentile for Height.", @"45.5",
                                @"10th Percentile for Height.", @"46.3",
                                @"25th Percentile for Height.", @"47.6",
                                @"50th Percentile for Height.", @"49.2",
                                @"75th Percentile for Height.", @"51.0",
                                @"90th Percentile for Height.", @"52.7",
                                @"95th Percentile for Height.", @"53.7",
                                @"97th Percentile for Height.", @"54.4",
                                nil];
    NSMutableDictionary *gh1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"50.9",
                                @"5th Percentile for Height.", @"51.4",
                                @"10th Percentile for Height.", @"52.2",
                                @"25th Percentile for Height.", @"53.6",
                                @"50th Percentile for Height.", @"55.2",
                                @"75th Percentile for Height.", @"56.9",
                                @"90th Percentile for Height.", @"58.4",
                                @"95th Percentile for Height.", @"59.3",
                                @"97th Percentile for Height.", @"60.0",
                                nil];
    NSMutableDictionary *gh2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"53.6",
                                @"5th Percentile for Height.", @"54.1",
                                @"10th Percentile for Height.", @"55.0",
                                @"25th Percentile for Height.", @"56.4",
                                @"50th Percentile for Height.", @"58.0",
                                @"75th Percentile for Height.", @"59.7",
                                @"90th Percentile for Height.", @"61.2",
                                @"95th Percentile for Height.", @"62.1",
                                @"97th Percentile for Height.", @"62.7",
                                nil];
    NSMutableDictionary *gh3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"55.8",
                                @"5th Percentile for Height.", @"56.4",
                                @"10th Percentile for Height.", @"57.3",
                                @"25th Percentile for Height.", @"58.8",
                                @"50th Percentile for Height.", @"60.4",
                                @"75th Percentile for Height.", @"62.1",
                                @"90th Percentile for Height.", @"63.6",
                                @"95th Percentile for Height.", @"64.5",
                                @"97th Percentile for Height.", @"65.1",
                                nil];
    NSMutableDictionary *gh4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"57.8",
                                @"5th Percentile for Height.", @"58.4",
                                @"10th Percentile for Height.", @"59.3",
                                @"25th Percentile for Height.", @"60.8",
                                @"50th Percentile for Height.", @"62.5",
                                @"75th Percentile for Height.", @"64.2",
                                @"90th Percentile for Height.", @"65.7",
                                @"95th Percentile for Height.", @"66.6",
                                @"97th Percentile for Height.", @"67.2",
                                nil];
    NSMutableDictionary *gh5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"59.5",
                                @"5th Percentile for Height.", @"60.1",
                                @"10th Percentile for Height.", @"61.1",
                                @"25th Percentile for Height.", @"62.6",
                                @"50th Percentile for Height.", @"64.4",
                                @"75th Percentile for Height.", @"66.1",
                                @"90th Percentile for Height.", @"67.6",
                                @"95th Percentile for Height.", @"68.5",
                                @"97th Percentile for Height.", @"69.1",
                                nil];
    NSMutableDictionary *gh6 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"61.1",
                                @"5th Percentile for Height.", @"61.7",
                                @"10th Percentile for Height.", @"62.7",
                                @"25th Percentile for Height.", @"64.3",
                                @"50th Percentile for Height.", @"66.1",
                                @"75th Percentile for Height.", @"67.8",
                                @"90th Percentile for Height.", @"69.4",
                                @"95th Percentile for Height.", @"70.3",
                                @"97th Percentile for Height.", @"70.9",
                                nil];
    NSMutableDictionary *gh7 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"62.6",
                                @"5th Percentile for Height.", @"63.2",
                                @"10th Percentile for Height.", @"64.2",
                                @"25th Percentile for Height.", @"65.8",
                                @"50th Percentile for Height.", @"67.7",
                                @"75th Percentile for Height.", @"69.4",
                                @"90th Percentile for Height.", @"71.0",
                                @"95th Percentile for Height.", @"72.0",
                                @"97th Percentile for Height.", @"72.6",
                                nil];
    NSMutableDictionary *gh8 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"63.9",
                                @"5th Percentile for Height.", @"64.6",
                                @"10th Percentile for Height.", @"65.6",
                                @"25th Percentile for Height.", @"67.3",
                                @"50th Percentile for Height.", @"69.1",
                                @"75th Percentile for Height.", @"71.0",
                                @"90th Percentile for Height.", @"72.6",
                                @"95th Percentile for Height.", @"73.5",
                                @"97th Percentile for Height.", @"74.2",
                                nil];
    NSMutableDictionary *gh9 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"3rd Percentile for Height.", @"65.2",
                                @"5th Percentile for Height.", @"65.9",
                                @"10th Percentile for Height.", @"66.9",
                                @"25th Percentile for Height.", @"68.7",
                                @"50th Percentile for Height.", @"70.5",
                                @"75th Percentile for Height.", @"72.4",
                                @"90th Percentile for Height.", @"74.0",
                                @"95th Percentile for Height.", @"75.0",
                                @"97th Percentile for Height.", @"75.7",
                                nil];
    NSMutableDictionary *gh10 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Height.", @"66.4",
                                 @"5th Percentile for Height.", @"67.1",
                                 @"10th Percentile for Height.", @"68.2",
                                 @"25th Percentile for Height.", @"70.0",
                                 @"50th Percentile for Height.", @"71.9",
                                 @"75th Percentile for Height.", @"73.8",
                                 @"90th Percentile for Height.", @"75.4",
                                 @"95th Percentile for Height.", @"76.4",
                                 @"97th Percentile for Height.", @"77.1",
                                 nil];
    NSMutableDictionary *gh11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Height.", @"67.6",
                                 @"5th Percentile for Height.", @"68.3",
                                 @"10th Percentile for Height.", @"69.4",
                                 @"25th Percentile for Height.", @"71.2",
                                 @"50th Percentile for Height.", @"73.1",
                                 @"75th Percentile for Height.", @"75.0",
                                 @"90th Percentile for Height.", @"76.8",
                                 @"95th Percentile for Height.", @"77.8",
                                 @"97th Percentile for Height.", @"78.4",
                                 nil];
    NSMutableDictionary *gh12 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 @"3rd Percentile for Height.", @"68.7",
                                 @"5th Percentile for Height.", @"69.4",
                                 @"10th Percentile for Height.", @"70.5",
                                 @"25th Percentile for Height.", @"72.4",
                                 @"50th Percentile for Height.", @"74.3",
                                 @"75th Percentile for Height.", @"76.3",
                                 @"90th Percentile for Height.", @"78.1",
                                 @"95th Percentile for Height.", @"79.1",
                                 @"97th Percentile for Height.", @"79.8",
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
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkGender];
    weightType.text = [[Model uniqueModel] weightSetting];
    heightType.text = [[Model uniqueModel] heightSetting];
    weightModifier = [[Model uniqueModel] getWeightModifier];
    heightModifier = [[Model uniqueModel] getHeightModifier];
}
-(void) checkGender
{
    if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
    {
        bodyPic.image = [UIImage imageNamed:@"BodyView_boy.png"];
        weightChartUse= weightChartB;
        heightChartUse= heightChartB;
    }
    else
    {
        bodyPic.image = [UIImage imageNamed:@"BodyView_girl.png"];
        weightChartUse= weightChartG;
        heightChartUse= heightChartG;
    }
}
- (void)viewDidUnload
{
    [self setHeightLabel:nil];
    [self setWeightLabel:nil];
    [self setHeightTextField:nil];
    [self setAgeTextFIeld:nil];
    [self setWeightTextField:nil];
    [self setWeightType:nil];
    
    //NEED TO DESTROY DICTIONARIES LATER.
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)updateRecord:(id)sender {
    if(![[Model uniqueModel] logIn])
       [self doAlert];
    else
    {
        [[Model uniqueModel] bodyViewUpdate: heightTextField.text: weightTextField.text :weightLabel.text :heightLabel.text  :0];
        [self showComfirmation];
    }
    //update
}

- (IBAction)submitButton:(id)sender {
    
    //submitAll(ageTextFIeld, heightTextField, heightLabel, weightTextField, weightLabel);
   
    double distance = 0;
    double weight = round(weightTextField.text.doubleValue * weightModifier * 10)/10.0 ;
    NSMutableDictionary *wTemp = [weightChartUse objectForKey:[NSNumber numberWithInt:ageTextFIeld.text.intValue]];
    while([wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight + distance]] == nil
          &&[wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight - distance]] == nil)
    {
       distance += 0.1;
    }
    if(distance == 0)
        weightLabel.text = [wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight]];
    else
    {
        if([wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight + distance]] != nil)
            weightLabel.text = [wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight + distance]];
        else
            weightLabel.text = [wTemp objectForKey:[NSString stringWithFormat:@"%.1f", weight - distance]];
    }
    
    distance = 0;
    double height = round(heightTextField.text.doubleValue * heightModifier * 10)/10.0 ;
    NSMutableDictionary *hTemp = [heightChartB objectForKey:[NSNumber numberWithInt:ageTextFIeld.text.intValue]];
    while([hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height + distance]] == nil
          &&[hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height - distance]] == nil)
    {
        distance += 0.1;
    }
    if(distance == 0)
        heightLabel.text = [hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height]];
    else
    {
        if([hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height + distance]] != nil)
            heightLabel.text = [hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height + distance]];
        else
            heightLabel.text = [hTemp objectForKey:[NSString stringWithFormat:@"%.1f", height - distance]];
    }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}
@end
