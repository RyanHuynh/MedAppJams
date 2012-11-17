//
//  LogInList.m
//  MedApp
//
//  Created by Ryan Huynh on 11/17/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "LogInList.h"

@interface LogInList ()

@end

@implementation LogInList
@synthesize list;
@synthesize name;
@synthesize gender;
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
    list = [NSMutableArray array];
    for(id key in [[Model uniqueModel] log])
    {
        NSString *uniqueID = key;
        [list addObject:[[[[[Model uniqueModel] log] objectForKey:uniqueID] objectAtIndex:0] objectForKey:@"name"]];
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    return @"Record List";
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"record"];
    
    cell.textLabel.text=[self.list objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *recordSelected = [list objectAtIndex:[indexPath row]];
    [[Model uniqueModel] selectRecord:recordSelected];
    [[Model uniqueModel] setLogIn:YES];
    [self performSegueWithIdentifier:@"toMainMenu" sender:nil];
}
- (IBAction)createRecord:(id)sender {
    int genderID = gender.selectedSegmentIndex;
    [[Model uniqueModel]createNewRecord:name.text :genderID];
    [[Model uniqueModel] selectRecord:name.text];
    [[Model uniqueModel] setLogIn:YES];
   }
@end
