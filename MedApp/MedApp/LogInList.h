//
//  LogInList.h
//  MedApp
//
//  Created by Ryan Huynh on 11/17/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface LogInList : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *list;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gender;
- (IBAction)createRecord:(id)sender;

@end
