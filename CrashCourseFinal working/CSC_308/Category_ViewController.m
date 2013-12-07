//
//  Category_ViewController.m
//  CSC_308
//
//  Created by student on 12/3/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import "Category_ViewController.h"

@interface Category_ViewController ()
{
    
}
@end

@implementation Category_ViewController;
@synthesize category, gradeLevel, grade1, grade2, grade3, grade4, currentGrade;
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
    gradeLevel = ((Main_ViewController*)self.presentingViewController).grade;
    currentGrade.text = [NSString stringWithFormat:@"Current Grade Level: %d", gradeLevel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)catagorySelected:(id)sender
{
    category = [sender tag];
    [self performSegueWithIdentifier: @"toQuestions" sender:sender];
}

- (IBAction)goHome:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
