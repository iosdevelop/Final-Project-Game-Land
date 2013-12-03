//
//  QuizGameViewController.h
//  HistoryInterfaceTeamProjectApp
//
//  Created by Andre Morrison on 11/24/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import "ViewController.h"

@interface QuizGameViewController : ViewController 
{
    NSMutableArray *rightAnswer;
    NSMutableArray *wrongAnswer;
    NSMutableArray *question;
}



- (IBAction)checkAnswer:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *quizCard;
@property (weak, nonatomic) IBOutlet UIButton *wrongAnswerButton;
@property (weak, nonatomic) IBOutlet UIButton *rightAnswerbutton;

- (IBAction)keyboard:(id)sender;

@end
