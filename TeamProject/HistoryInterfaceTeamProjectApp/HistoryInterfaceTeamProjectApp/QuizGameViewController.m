//
//  QuizGameViewController.m
//  HistoryInterfaceTeamProjectApp
//
//  Created by Andre Morrison on 11/24/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import "QuizGameViewController.h"
#import "FMDatabase.h"

@interface QuizGameViewController ()

@end

@implementation QuizGameViewController

@synthesize quizCard, rightAnswerbutton, wrongAnswerButton;

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
    [self createDatabaseInstance];
	
    rightAnswer =   [[NSMutableArray alloc] init];
    wrongAnswer =   [[NSMutableArray alloc] init];
    question    =   [[NSMutableArray alloc] init];
    [self updateTable];
    
    
}
 //Finds the NSDocumentDirectory path of our app and puts it in an array.
-(NSString *) dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Returns the file path. The index will always be 0.
    return [paths objectAtIndex:0];
}

-(void)updateTable
{
    //this was clearing objects
    [rightAnswer removeAllObjects];
    [wrongAnswer removeAllObjects];
    [question removeAllObjects];
    
    //this is the database declaration
    FMDatabase *db = [FMDatabase databaseWithPath:[[self dataFilePath] stringByAppendingPathComponent:@"GameLand2.sqlite"]];

    
    [db open];
    
//    if ([question count] == 0 )
//    {
//        [db executeUpdate:@"DELETE FROM science"];
//    }
//    
//    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS feathers (id INTEGER PRIMARY KEY, question TEXT)"];
//
//    [db executeUpdate:@"INSERT INTO feathers   (question) VALUES (?)", @"Purple"];
    
    //this is how to delete an entry from table
    //[db executeUpdate:@"DELETE FROM science WHERE  question = ?", @"Purple"];
    
    
    FMResultSet *scienceQuestions = [db executeQuery:@"SELECT * FROM science"];
    //FMResultSet *scienceAnswer = [db executeQuery:@"SELECT * FROM science"];
    
      //Adds the information from the database to our scienceQuestions array.
    while ([scienceQuestions next])
    {
        [question addObject:[scienceQuestions stringForColumn:@"question"]];
        
    }
    
//    while ([scienceAnswer next])
//    {
//        [rightAnswer addObject:[scienceAnswer stringForColumn:@"rightAnswer"]];
//        
//    }
    
    [db close];
    
    //[_table reloadData];
    
    
    //place sql question from table math column question
    quizCard.text=[question objectAtIndex:1];
    
    
    //place sql answer from math on buttons
    [rightAnswerbutton setTitle:[rightAnswer objectAtIndex:1] forState:UIControlStateNormal];
    [wrongAnswerButton setTitle:[wrongAnswer objectAtIndex:1] forState:UIControlStateNormal];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//just testing to see if when button is clicked I get alertview
- (IBAction)try:(id)sender {
}

-(IBAction)checkAnswer:(id)sender
{
    
        //create another reference to database
        //FMDatabase *db = [FMDatabase databaseWithPath:[[self dataFilePath] stringByAppendingPathComponent:@"GameLand2.sqlite"]];
    
    
//    if ([buttonAnswer isSelected]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct!" message:@"Good job!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
   
    
    //enter score into database after getting correct answer
    //[db executeUpdate:@"INSERT INTO science (rightScore) VALUES (?)", @"1"];
    
}



//gets the location of the database present in the document directory
-(NSString*)documentDirectoryDatabaseLocation
{
    NSArray *documentDirectoryFolderLocation = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[documentDirectoryFolderLocation objectAtIndex:0] stringByAppendingPathComponent:@"GameLand2.sqlite"];
}

//copyes the database from the Project bundle to the documetn directory
-(BOOL)copyDatabaseFromBundletoDocumentDirectory
{
    //if sqlite file does not exists at the document dir then create it
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self documentDirectoryDatabaseLocation]])
    {
        NSString *bundlePathofDatabase = [[NSBundle mainBundle] pathForResource:@"GameLand2" ofType:@"sqlite"];
        if (bundlePathofDatabase.length!=0)
        {
            NSString *docdirLocation = [self documentDirectoryDatabaseLocation];
            
            //it should return YES which indicates that file is copyied
            return [[NSFileManager defaultManager] copyItemAtPath: bundlePathofDatabase toPath:docdirLocation error:nil];
        }
        
        //This means that your fiel is not copies in the document directory
        return NO;
    
    }
    else
    {
        return YES;
    }
}

-(void)createDatabaseInstance
{
    if([self copyDatabaseFromBundletoDocumentDirectory])
    {
        NSLog(@"DB is copyied in doc directory");
    }
    else
    {
        NSLog(@"DB copying failed");
    }
}

- (IBAction)keyboard:(id)sender
{
    //The first responder is the keyboard.
    [sender resignFirstResponder];
}




@end


