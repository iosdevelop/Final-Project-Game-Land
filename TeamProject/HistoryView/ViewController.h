//
//  ViewController.h
//  HistoryInterfaceTeamProjectApp
//
//  Created by student on 11/22/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerAButton;
@property (weak, nonatomic) IBOutlet UIButton *answerBButton;
@property (weak, nonatomic) IBOutlet UIButton *answerCButton;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
- (IBAction)checkAnswer:(id)sender;
@property int questionNumber;

@end
