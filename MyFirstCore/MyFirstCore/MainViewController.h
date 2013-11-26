//
//  MainViewController.h
//  MyFirstCore
//
//  Created by Andre Morrison on 11/23/13.
//  Copyright (c) 2013 Andre Morrison. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *line1;
@property (weak, nonatomic) IBOutlet UITextField *line2;
@property (weak, nonatomic) IBOutlet UITextField *line3;
@property (weak, nonatomic) IBOutlet UITextField *line4;

@end
