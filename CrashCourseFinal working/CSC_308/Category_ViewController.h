
///  Eastern Kentucky University
//  12/5/2013
//  CSC 308
//  Final Project
//  Dr. Yang
//
//  Team:  Arrow Brown, Daniel Marifjeren, Sirena McKinley, Andre Morrison
//
//  Purpose:  This is a quiz game where each user starts off on the same
//  level and answer questions in that category.  Once they have passed
//  each category (History, Math, Language Arts, and Science) they can
//  then move on to the next level of questions in the same categories.
//
//  We used a variety of three view controllers, alert dialogues to give
//  if questions where answered correctly or not.  We also used a progress
//  to show pass fail for answers questions in a particular category.
//
//  We wanted to use sqlite database to hold the questions and answers.  It
//  would also keep track of users and their current levels when they returned to
//  the game.  We used a data modeler to create the fields and their data type.  We then
//  used an addon in firefox to manage the sqlite database and added
//  all the questions and answers.
//
//  We were going to use the FMDB database sqlite wrapper for objective C since it
//  would make making using the database easier.  We would have also added sqlite3 framework
//  to use the database features.
//
//  We had problem getting write permission to the database once it was copied to the app document
//  folder.
//
//  The graphics were designed by Daniel, Arrow and Sirena.
//
//  Our working copy only works for level 1.  Which we will submitt for full grade but hope
//  to get the database working over the winter break.
//
//  Created by student on 12/4/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//
//
//  Category_ViewController.h


#import <UIKit/UIKit.h>
#import "Question.h"
#import "Main_ViewController.h"
@interface Category_ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentGrade;
@property int category, gradeLevel;
@property (weak, nonatomic) IBOutlet UILabel *grade1;
@property (weak, nonatomic) IBOutlet UILabel *grade2;
@property (weak, nonatomic) IBOutlet UILabel *grade3;
@property (weak, nonatomic) IBOutlet UILabel *grade4;
- (IBAction)catagorySelected:(id)sender;
- (IBAction)goHome:(id)sender;
@end
