//
//  TimeTableController.m
//  LapTimer
//
//  Created by Andre Morrison on 11/23/13.
//  Copyright (c) 2013 Andre Morrison. All rights reserved.
//

#import "TimeTableController.h"

@interface TimeTableController ()

@end

@implementation TimeTableController
@synthesize managedObjectContext,eventArray;

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
    self.title=@"Lap Times";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(addTime:)];
    self.navigationItem.rightBarButtonItem=addButton;
    [self fetchRecords];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addTime:(id)sender
{
    Event *event = (Event *) [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext: managedObjectContext];
    [event setTimeStamp:[NSDate date]];
    NSError *error;
    
    if (![managedObjectContext save:&error])
    {
        //This is a serious error saying the record
        //could not be saved.  Advise the user
        //try again or restart the application.
    }
    [eventArray insertObject:event atIndex:0];
    [self.tableView reloadData];
}

-(void)fetchRecords
{
    //Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];
    
    //Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject: sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    //Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest: request error:&error] mutableCopy];
    if (!mutableFetchResults)
    {
        //Handle this error
        //This is s a serious error and should advise to restart
    }
    [self setEventArray:mutableFetchResults];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [eventArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    static NSDateFormatter *dateFormater = nil;
    
    if (dateFormater== nil)
    {
        dateFormater =[[NSDateFormatter alloc] init];
        [dateFormater setDateFormat:@"h:mm.ss a"];
    }
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    Event *event = [eventArray objectAtIndex:[indexPath row]];
    Event *previousEvent =nil;
    if ([eventArray count]>([indexPath row]+1))
    {
        previousEvent = [eventArray objectAtIndex:([indexPath row]+1)];
    }
    
    [cell.textLabel setText:[dateFormater stringFromDate:[event timeStamp]]];
    if (previousEvent)
    {
        NSTimeInterval timeDifference = [[event timeStamp] timeIntervalSinceDate:[previousEvent timeStamp]];
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"+%.02f sec",timeDifference]];
    }
    else
    {
        [cell.detailTextLabel setText:@"---"];
    }
    return cell;
    
}

@end
