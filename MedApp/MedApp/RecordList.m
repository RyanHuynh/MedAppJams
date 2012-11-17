//
//  RecordList.m
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "RecordList.h"
#define kSectionCount 1;
@interface RecordList ()

@end

@implementation RecordList
@synthesize list;
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
    return kSectionCount;
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
                             dequeueReusableCellWithIdentifier:@"recordCell"];
    
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
    NSString *recordSelected = [list objectAtIndex:[indexPath row]];
    [[Model uniqueModel] selectRecord:recordSelected];
    [self performSegueWithIdentifier:@"toRecord" sender:nil];
}

@end
