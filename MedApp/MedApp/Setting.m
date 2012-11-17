//
//  Setting.m
//  MedApp
//
//  Created by Ryan Huynh on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "Setting.h"


@interface Setting ()

@end

@implementation Setting
@synthesize weightSetting;
@synthesize heightSetting;
@synthesize genderSC;

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
	// Do any additional setup after loading the view
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([[[Model uniqueModel] weightSetting] isEqualToString:@"(Kilogram)"])
        weightSetting.selectedSegmentIndex = 0;
    else
        weightSetting.selectedSegmentIndex = 1;
    if([[[Model uniqueModel] heightSetting] isEqualToString:@"(Centimeter)"])
        heightSetting.selectedSegmentIndex = 0;
    else
        heightSetting.selectedSegmentIndex = 1;
    if([[[Model uniqueModel] gender] isEqualToString:@"Boy"])
    {
        genderSC.selectedSegmentIndex = 0;
    }
    else
        genderSC.selectedSegmentIndex = 1;

}



- (IBAction)changeWeightSetting:(id)sender {
    if(weightSetting.selectedSegmentIndex == 0)
    {
        [[Model uniqueModel] changeWeightSetting:@"(Kilogram)"];
        [[Model uniqueModel] changeWeightModifier:1];
        
    }
    else
        [[Model uniqueModel] changeWeightSetting:@"(Pound)"];
        [[Model uniqueModel] changeWeightModifier:0.453592];

}

- (IBAction)changeHeightSetting:(id)sender {
    if(heightSetting.selectedSegmentIndex == 0)
    {
        [[Model uniqueModel] changeHeightSetting:@"(Centimeter)"];
        [[Model uniqueModel] changeHeightModifier:1];
        
    }
    else
        [[Model uniqueModel] changeHeightSetting:@"(Inch)"];
        [[Model uniqueModel] changeHeightModifier:2.54];
}
-(IBAction)changeGender:(id)sender {
        
    NSString *gender;
    if(genderSC.selectedSegmentIndex == 0)
        gender = @"Boy";
    else
        gender = @"Girl";
    [[Model uniqueModel] changeGender:gender];
}
@end
