//
//  MainViewController.m
//  MyFirstCore
//
//  Created by Andre Morrison on 11/23/13.
//  Copyright (c) 2013 Andre Morrison. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"


@interface MainViewController ()

@end

@implementation MainViewController

@synthesize line1, line2, line3, line4;

- (void)viewDidLoad
{
    AppDelegate *appDel=[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=[appDel managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
    NSFetchRequest *request =[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects==nil)
    {
        NSLog(@"There was an error");
        //do whatever error handling is appropriate
    }
    
    for (NSManagedObject *oneObject in objects)
    {
        NSNumber *lineNum = [oneObject valueForKey:@"lineNum"];
        NSString *lineText = [oneObject valueForKey:@"lineText"];
        
        NSString *fieldName = [NSString stringWithFormat:@"line%d", [lineNum integerValue]];
        UITextField *theField = [self valueForKey:fieldName];
        theField.text=lineText;
    }
    //[request release];
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDel managedObjectContext];
    NSError *error;
    for (int i=1;i<=4;i++)
    {
        NSString *fieldName = [NSString stringWithFormat:@"line%d", i];
        UITextField *theField = [self valueForKey:fieldName];
        
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
        [request setEntity:entityDescription];
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(lineNum = %d)", i];
        [request setPredicate:pred];
        
        NSManagedObject *theLine = nil;
        
        NSArray *objects = [context executeFetchRequest:request error:&error];
        
        if (objects==nil)
        {
            NSLog(@"There was an error!");
           //do whatever
        }
        
        if ([objects count] > 0)
        {
            theLine = [objects objectAtIndex:0];
        }
        else
        {
            theLine=[NSEntityDescription insertNewObjectForEntityForName:@"Line" inManagedObjectContext:context];
            [theLine setValue:[NSNumber numberWithInt:i] forKey:@"lineNum"];
            [theLine setValue:theField.text forKey:@"lineText"];
            
        }
        [context save:&error];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
