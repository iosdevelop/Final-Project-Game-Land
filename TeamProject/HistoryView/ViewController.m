//
//  ViewController.m
//  HistoryInterfaceTeamProjectApp
//
//  Created by student on 11/22/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
}

@end

@implementation ViewController
@synthesize questionLabel, answerAButton, answerBButton, answerCButton, progressBar, questionNumber;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    questionNumber = 1; //questionID to pull from database
    
    //here we would set up the initial view with the first question and its answers, pulling them from the database
}

-(void) viewDidAppear:(BOOL)animated//we call this everytime we need to load new questions 
{
    if(questionNumber == 6)//indicates we have been through all the questions and there are no more to load
    {
        //calculate the grade
        int gradePercentage = progressBar.progress*10;
        NSString * letterGrade;
        if(gradePercentage <= 2)
        {
            letterGrade = @"F";
        }
        else if(gradePercentage <= 4)
        {
            letterGrade = @"D";
        }
        else if(gradePercentage <=6)
        {
            letterGrade = @"C";
        }
        else if(gradePercentage <= 8)
        {
            letterGrade = @"B";
        }
        else
        {
            letterGrade = @"A";
        }
            
        UIAlertView *alertDialog = [[UIAlertView alloc] initWithTitle:@"CLASS COMPLETED!" message:[NSString stringWithFormat:@"You have completed this set of History questions with a(n) %@",letterGrade] delegate:self cancelButtonTitle:@"Choose Next Category" otherButtonTitles: nil];
        [alertDialog show];
        //we would also need a statement here to update the presenting controller (categoryPickerView or whatever we are calling it)  This statement would need to update the history grade label with the letterGrade as well as disable the history button if the grade was a passing grade
    }
    else
    {
        //load new questions from database
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex//this method is determines what to do when an alertView is dismissed
{
    if([alertView.title isEqualToString: @"CLASS COMPLETED!"])
        exit(0);//i have this terminating once the class is completed, for our project this is where we would go back to pick the category
    else//the alert window was not a class completion window so load new questions (answer correct or incorrect)
        [self viewDidAppear:true];
}
- (IBAction)checkAnswer:(id)sender
{
    UIAlertView * alertDialog;
    if(sender == answerAButton)
    {
        if(//the correct answer is a)
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progressBar.progress +=.2;
        }
        else//the correct answer was not a
            alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    else if(sender == answerBButton)
    {
        if(//correct answer is b)
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progressBar.progress +=.2;
        }
            else
                alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    else//sender == answerCButton
    {
        if(//correct answer is c)
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progressBar.progress +=.2;
        }
            else
                alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
        }
    [alertDialog show];
    questionNumber+=1;//set up to move to next question
}
@end
