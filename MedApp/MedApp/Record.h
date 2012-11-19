//
//  Record.h
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface Record : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;



@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightPLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightPLabel;
@property (strong, nonatomic) IBOutlet UILabel *headLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *prevButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (strong, nonatomic) IBOutlet UILabel *heightA;
@property (strong, nonatomic) IBOutlet UILabel *idLabel;
@property (strong, nonatomic) IBOutlet UILabel *gender;
@property (strong, nonatomic) IBOutlet UILabel *weightA;
@property (strong, nonatomic) IBOutlet UILabel *headPLabel;

@property (strong, nonatomic) IBOutlet UILabel *ocdLabel;
@property (strong, nonatomic) IBOutlet UILabel *icdLabel;
@property (strong, nonatomic) IBOutlet UILabel *ipdLabel;
@property (strong, nonatomic) IBOutlet UILabel *ocdAvg;
@property (strong, nonatomic) IBOutlet UILabel *icdAvg;
@property (strong, nonatomic) IBOutlet UILabel *ipdAvg;
@property (strong, nonatomic) IBOutlet UILabel *earRLabel;
@property (strong, nonatomic) IBOutlet UILabel *earAvg;
@property (strong, nonatomic) IBOutlet UILabel *earLLabel;
@property (strong, nonatomic) IBOutlet UILabel *mouthLabel;
@property (strong, nonatomic) IBOutlet UILabel *mouthAvg;
@property (strong, nonatomic) IBOutlet UILabel *neckLabel;
@property (strong, nonatomic) IBOutlet UILabel *neckAvg;
@property (strong, nonatomic) IBOutlet UILabel *fingerLabel;


@property (strong, nonatomic) IBOutlet UILabel *palmLabel;
@property (strong, nonatomic) IBOutlet UILabel *palmA;

@property (strong, nonatomic) IBOutlet UILabel *fingerA;
@property (strong, nonatomic) IBOutlet UILabel *indLabel;
@property (strong, nonatomic) IBOutlet UILabel *indA;
@property (strong, nonatomic) IBOutlet UILabel *chestLabel;
@property (strong, nonatomic) IBOutlet UILabel *chestA;

@property (strong, nonatomic) IBOutlet UILabel *farmLabel;
@property (strong, nonatomic) IBOutlet UILabel *farmA;
@property (strong, nonatomic) IBOutlet UILabel *uaLabel;
@property (strong, nonatomic) IBOutlet UILabel *uaA;
@property (strong, nonatomic) IBOutlet UILabel *armSLabel;
@property (strong, nonatomic) IBOutlet UILabel *armSA;
@property (strong, nonatomic) IBOutlet UILabel *armLabel;
@property (strong, nonatomic) IBOutlet UILabel *armA;

@property (strong, nonatomic) IBOutlet UILabel *handLabel;
@property (strong, nonatomic) IBOutlet UILabel *handAvg;

@property (strong, nonatomic) IBOutlet UILabel *armSL;


- (IBAction)prevMonth:(id)sender;

- (IBAction)nextMonth:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *headA;
//something
@end
