//
//  Main_ViewController.m
//  CSC_308
//
//  Created by student on 12/4/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import "Main_ViewController.h"

@interface Main_ViewController ()

@end

@implementation Main_ViewController
@synthesize grade4, grade3, grade2, grade1, grade10, grade11, grade12, grade5, grade6, grade7, grade8, grade9, grade;
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
    grade = 1;
}
-(void) viewDidAppear:(BOOL)animated
{
    grade = 1;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gradeSelected:(id)sender
{
    grade = [sender tag];
    [self performSegueWithIdentifier: @"toCatagories" sender:sender];
}
@end
