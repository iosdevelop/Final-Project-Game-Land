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
    NSArray *questions;
    NSArray *correctAnswers;
    NSArray *Answers;
    NSString *question1, *question2, *question3, *question4, *question5;
}

@end

@implementation ViewController
@synthesize questionLabel, answerAButton, answerBButton, answerCButton, progressBar, questionNumber;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    questionNumber = 0;
    question1 = @"Who was the first president of the United States?";
    question2 = @"How many states are there in the United States?";
    question3 = @"In _______, Columbus sailed the ocean blue.";
    question4 = @"Which date is America's birthday?";
    question5 = @"The Mayflower was the Pilgrim ship that landed where in 1620?";
    questions = [[NSArray alloc] initWithObjects:question1, question2, question3, question4, question5, nil];
    correctAnswers = [[NSArray alloc] initWithObjects:@"a", @"b", @"b", @"a", @"c", nil];
    Answers = [[NSArray alloc] initWithObjects:@"George Washington", @"Thomas Jefferson", @"Benjamin Franklin", @"40", @"50",@"13", @"1776", @"1492", @"1942", @"July 4th", @"October 11th", @"December 25th", @"Cuba", @"Jamestown, Virginia", @"Plymouth Rock, Plymouth, Massachusetts", nil];
    questionLabel.text = [NSString stringWithFormat: @"%@", [questions objectAtIndex:questionNumber]];
    [answerAButton setTitle:[NSString stringWithFormat:@"%@", [Answers objectAtIndex:(questionNumber*3)]] forState:normal];
    [answerBButton setTitle:[NSString stringWithFormat:@"%@", [Answers objectAtIndex:(questionNumber*3)+1]] forState:normal];
    [answerCButton setTitle:[NSString stringWithFormat:@"%@", [Answers objectAtIndex:(questionNumber*3)+2]] forState:normal];
}

-(void) viewDidAppear:(BOOL)animated
{
    if(questionNumber == 5)
    {
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
    }
    else
    {
        questionLabel.text = [NSString stringWithFormat: @"%@", [questions objectAtIndex:questionNumber]];
        [answerAButton setTitle:[NSString stringWithFormat:@"%@", [Answers objectAtIndex:(questionNumber*3)]] forState:normal];
        [answerBButton setTitle:[NSString stringWithFormat:@"%@", [Answers objectAtIndex:(questionNumber*3)+1]] forState:normal];
        [answerCButton setTitle:[NSString stringWithFormat:@"%@", [Answers objectAtIndex:(questionNumber*3)+2]] forState:normal];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView.title isEqualToString: @"CLASS COMPLETED!"])
        exit(0);
    else
        [self viewDidAppear:true];
}
- (IBAction)checkAnswer:(id)sender
{
    UIAlertView * alertDialog;
    if(sender == answerAButton)
    {
        if([[correctAnswers objectAtIndex:questionNumber] isEqualToString:@"a"])
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progressBar.progress +=.2;
        }
        else
            alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    else if(sender == answerBButton)
    {
        if([[correctAnswers objectAtIndex:questionNumber] isEqualToString:@"b"])
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progressBar.progress +=.2;
        }
            else
                alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    if(sender == answerCButton)
    {
        if([[correctAnswers objectAtIndex:questionNumber] isEqualToString:@"c"])
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progressBar.progress +=.2;
        }
            else
                alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
        }
    [alertDialog show];
    questionNumber+=1;
}
@end
