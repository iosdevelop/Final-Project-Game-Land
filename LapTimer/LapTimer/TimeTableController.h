//
//  TimeTableController.h
//  LapTimer
//
//  Created by Andre Morrison on 11/23/13.
//  Copyright (c) 2013 Andre Morrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface TimeTableController : UITableViewController


@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *eventArray;
-(void) fetchRecords;
-(void) addTime:(id)sender;

@end
