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
        [list addObject:key];
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
    NSString *recordId = [self.list objectAtIndex:indexPath.row];
    cell.textLabel.text=[[[[[Model uniqueModel] log] objectForKey:recordId]objectAtIndex:0]objectForKey:@"name"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *test = [[[[[Model uniqueModel] log] objectForKey:[list objectAtIndex:[indexPath row]]]objectAtIndex:0]objectForKey:@"gender"];
    [[Model uniqueModel] setLogin:[list objectAtIndex:[indexPath row]]];
    [[Model uniqueModel] changeGender:test];
    [self performSegueWithIdentifier:@"toMainMenu" sender:nil];
}
- (IBAction)createRecord:(id)sender {
    int genderID = gender.selectedSegmentIndex;
    if(genderID == 0)
    {
        [[Model uniqueModel]changeGender:@"Boy"];
    }
    else
         [[Model uniqueModel]changeGender:@"Girl"];
    [[Model uniqueModel]createNewRecord:name.text :genderID];
    [[Model uniqueModel] setLogin:[[Model uniqueModel] loginID]];
}
@end
