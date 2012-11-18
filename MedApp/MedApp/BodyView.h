//
//  BodyView.h
//  App2
//
//  Created by Eiling Fernandez on 11/11/12.
//  Copyright (c) 2012 UCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"
#import "Model.h"

@interface BodyView: UIViewController <UIAlertViewDelegate,
UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    IBOutlet UIPickerView *agePicker;
    NSArray *ageData;
    
}

@property(nonatomic , retain) UIPickerView *singlePickerComponent;@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (strong, nonatomic) IBOutlet UIImageView *bodyPic;
@property (strong, nonatomic) NSMutableDictionary *heightChartB;
@property (strong, nonatomic) NSMutableDictionary *weightChartB;
@property (strong, nonatomic) NSMutableDictionary *weightChartG;
@property (strong, nonatomic) NSMutableDictionary *heightChartG;


@property (strong, nonatomic) NSMutableDictionary *weightChartUse;
@property (strong, nonatomic) NSMutableDictionary *heightChartUse;
@property (strong, nonatomic) IBOutlet UILabel *heightType;
@property (strong, nonatomic) IBOutlet UILabel *weightType;
@property(nonatomic, retain) UIPickerView *agePicker;

@property(nonatomic, retain) NSArray *ageData;

@property (weak, nonatomic) IBOutlet UILabel *ageTextField;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;

//- (IBAction)tap:(id)sender;
- (IBAction)showAge:(id)sender;
- (IBAction)pickerDone:(id)sender;

- (IBAction)updateRecord:(id)sender;
- (IBAction)submitButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *headAvg;
@property (strong, nonatomic) IBOutlet UILabel *heightAvg;
@property (strong, nonatomic) IBOutlet UITextField *headTextField;

@property (strong, nonatomic) IBOutlet UILabel *weightAvg;
@property (strong,nonatomic) NSMutableDictionary *avgValue;
@end
