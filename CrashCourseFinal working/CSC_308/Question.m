//
//  Question.m
//  CSC_308
//
//  Created by student on 12/5/13.
//  Copyright (c) 2013 cs@eku.edu. All rights reserved.
//

#import "Question.h"
//#import "FMDatabase.h"

@interface Question ()
{
    NSArray *historyQuestions;
    NSArray *historyCorrectAnswers;
    NSArray *historyAnswers;
    NSArray *mathQuestions;
    NSArray *mathCorrectAnswers;
    NSArray *mathAnswers;
    NSArray *scienceQuestions;
    NSArray *scienceCorrectAnswers;
    NSArray *scienceAnswers;
    NSArray *englishQuestions;
    NSArray *englishCorrectAnswers;
    NSArray *englishAnswers;
    NSString* letterGrade;
    NSString* correctAnswer;
}
@end

@implementation Question
@synthesize questionLabel, answerA, answerB, answerC, progress, questionNumber, questionCategory, level, backgroundControl;

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

    //Here we have hard coded the questions into NSArray.
    
    questionCategory = ((Category_ViewController *)self.presentingViewController).category;
    level = ((Category_ViewController *)self.presentingViewController).gradeLevel;
    historyQuestions = [[NSArray alloc]initWithObjects:@"Who was the first president of the United States?", @"How many states are there in the United States?", @"In _______, Columbus sailed the ocean blue.",@"Which date is America's birthday?", @"The Mayflower was the Pilgrim ship that landed where in 1620?", @"What year was the 'Declaration of Independence' signed?", @"What was 'Manifest Destiney?'", @"The creation of what made it possible for pioneers to no longer have to travel by covered wagons?", @"What was the first tax imposed on American colonists by King George?", @"___________ purchased 828,000 sq miles of land from the French in 1803.  This purchase is known as __________", @"Which statement is NOT true about Christopher Columbus?", @"What ancient civilization is known as the birthplace of democracy?", @"What was the Northwest Passage?", @"Early civilization were founded around which of the following?", @"Who was Julius Caesar?", @"All of the following were reasons for American colonization except which?", @"The Boston Tea Party was:", @"Indentured servants differed from slaves in that:", @"Taxation without representation meant:", @"The Lewis and Clark expedition was the first American expedition to do what?", @"What were 3 Native American tribes in the southeast region of North America before European Conquest?", @"Which of the following was not one of the original 13 colonies?", @"Pennsylvania was settled by what religious group?", @"The Revolutionary War began and ended with which battles?", @"Which of the following, written by Frances Scott Key after witnessing the British bombardment of Fort McHenry, became the American National anthem?", @"Hunter-Gatherer societies were:", @"Onte of the first sets of written laws were made to equalize society, establish justice and fairness, and protect the weak from the strong.  This set of laws was called:", @"The first monotheistic religion based on the concept of one God who sets down moral laws for humanity was:", @"What was the Silk Road?", @"The Roman Empire fostered economic growth through the use of:", @"One reason for the fall of the Roman Empire was:", @"In the middle ages, Islam was founded on the teachings of the prophet __________ as an expression of serrender to Allah, and is central to Arabic culture.", @"Which of the following were not technological developments of the Tang Dynasty?", @"What route expanded slave trade from Africa into Europe in the middle ages?", @"The military nobility of medieval and early modern Japan were the _________, most commonly known for their swift effectiveness on the battlefield.", @"'All men are created equal, that they are endowed by their Creator with certain unalienable rights' is cited from which of the following?", @"The second congressional congress is responsible for approving which document?", @"The first 2 political parites in the US and their founders were:", @"The Industrial Revolution refers to the expansion of:", @"Andrew Jackson was all of the following except:", @"The War of 1812 was faught between:", @"The Underground Railroad was:", @"Susan B. Anthony and Margaret Fuller were famous women involved in what?",@"Transcendentalism refers to what?", @"The Battle of the Alamo was part of which war?", @"Western political ideas can be traced back to all but which of the following?", @"Politically, Napolean Bonaparte was a:", @"Eli Whitney's invention of this led to the expansion of slavery west of the Mississippi.", @"What pivotal incident instigated WWI?", @"Which of the following was a result of World War I?", @"Enlightenment refers to which of the following?", @"The emergence of the Unites States as a world power can greatly be attributed to:", @"United States cities developed in the 20th century were divided by rase, ethnicity, and ______.", @"The 'Great Awakening' refers to:", @"The Spanish-American War resulted in all but which of the following?", @"What is the Bill of Rights?", @"All of the following are protected by the first amendment except which?", @"Article 1 of the US Constitution relates to which brach of government?", @"The US constitution established a supreme court wiht how many justices?", @"European political 'thinkers' that influenced the development of American government included Charles-Louis Montesquieu, William Blackstone, and _________.", nil];
    
    historyAnswers = [[NSArray alloc] initWithObjects:@"George Washington", @"Thomas Jefferson", @"Benjamin Franklin", @"40", @"50",@"13", @"1776", @"1492", @"1942", @"July 4th", @"October 11th", @"December 25th", @"Cuba", @"Jamestown, Virginia", @"Plymouth Rock, Plymouth, Massachusetts", @"1865", @"1945", @"1776", @"The belief in freedom of religion", @"The Belief that America should spread from the Atlantic to Pacific coasts", @"A religion", @"Automobile", @"Transcontinental Railroad", @"Prairie Schooner", @"Stamp Act", @"Tea Act", @"King George Act", @"George Washington; The Louisiana Purchase", @"Thomas Jefferson, Phelps and Gorham Purchase", @"Thomas Jefferson; The Louisiana Purchase", @"He was an Italian sailor.", @"The King and Queen of Spain gave him 2 ships to use on his journeys.", @"He believed he could reach the Indies by traveling west.", @"Ancient Greece",@"Ancient Rome",@"Ancient Eqypt", @"The path of the Hudson River through Canada", @"A flight path across North America", @"A route from Europe to the Indies by traveling northwest through North America", @"Water", @"Mountains",  @"Deserts", @"Invertor of the Caesar salad", @"A Roman emperor assissinated by a group of senators", @"The king of Athens who was stabbed by a fellow states-man", @"To escape religious persecution", @"To expand European culture to the Native Americans", @"To own land", @"A rebellion in which colonists tossed English imported tea into the Atlantic Ocean", @"A party to celebrate the settlement of Boston", @"A political group that urged settlers to revolt", @"They returned home at the end of each work day", @"The did not work in the fields", @"The worked for pay and their freedom", @"The colonists wanted to be taed without being represented in parliament", @"The colonists did not want to be taxed unless they had representation in parliament", @"The colonists did not want to be taxed or have representation in parliament", @"Reach the Gulf of Mexico by travelling south from St. Louis", @"Reach the Pacific Coast by traveding west from St. Louis", @"Reach the Atlantic coast by traveling east from St. Lous", @"Crow, Sioux, and Cheyenne", @"Navajo, Pueblo, and Apache", @"Cherokee, Chickasaw, and Creek", @"New York", @"Ohio", @"Georgia", @"The Quakers", @"The Puritans", @"The Irish-Catholics", @"The Battle of Bunker Hill and the Battle of Yorktown", @"The Battle of Saratoga and the Battle of Bunker Hill", @"The Battle of Concord and the Battle of Yorktown", @"The Star-Spangled Banner", @"My Country 'tis of Thess", @"God Save the Queen", @"Nomads- groups of people who moved from place to place", @"Groups of people who hunted and gathered food", @"Both a and b", @"The United States Constitution", @"Hammurabi's Code", @"The Ten Commandments", @"Judaism", @"Islam", @"Buddhism", @"A trade roudte that allowed commerce between Europe and China", @"A road made of silk across the Bering Strait", @"A trade route that allowed commerce between North and South America", @"Tyranny and a strong military", @"A central currency and trade routes", @"Conquest", @"The assassination of Julius Caesar", @"The establishment of Constantinople", @"The undermining of citizenship through the growth of corruption and slavery", @"Muhammad", @"Joseph Smith", @"Jesus Christ", @"Tea and gunpowder", @"Paper currency and the compass", @"Paved roads and automobiles", @"the Silk Road", @"The Trans-Saharan Trade routes", @"The Oregan Trail", @"Samurai", @"Ninjas", @"Knights", @"The Magna Carta", @"The Constitution of the Unites States", @"The Mayflower Compact", @"The Declaration of Independence", @"The Constitution of the United States", @"The Articles of Confederation", @"The Federalists, founded by Thomas Jefferson and the Whigs, founded by Alexander Hamilton", @"The Democrats, Founded by Andrew Jackson and the Republicans, founded by Abraham Lincoln", @"The Federalists, founded by George Washington, and the Whigs founded by Henry Clay",  @"Slavery", @"Factories", @"Democracy", @"A US President", @"A lawyer", @"An abolitionist", @"The French and the British", @"The Americans and the British", @"The Americans and the Indians", @"A network of abolitionists who helped escaped slaves find freedom in the north", @"A subway escaped slaves used to travel north", @"A black market for slave trade", @"The Women's Suffrage Movement", @"The Civil Rights Movement", @"The Hippie Movement", @"Purification through institutions and organized religion", @"The belief that individualism corrupts civilization", @"The idea that people are at their best when independent and self-reliant", @"The Civil War", @"The Mexican-American War", @"The Texas War for Independence", @"Aristotle's 'Politics'", @"The Bible", @"Plato's Republic", @"Democrat", @"Republican", @"Enlightened Despot", @"The plow", @"The cotton gin", @"The tractor", @"The assassination of the Prince of Austria", @"A tickle fight between the Prince of Austria and the Czar of Russia", @"The Japanese attack on Pearl Harbor", @"Revolutions in many of the countries involved", @"The ousting of Adolf Hitler", @"The unification of Berlin", @"Thomas Eddison's invention of the light bulb", @"A cultural movement emphasizing reasoning over tradition", @"The belief in superstition", @"The development of its navy", @"Democracy", @"Agriculture", @"Religion", @"Occupation", @"Class", @"Periods of religious revival in America", @"The time most Americans wake up to go to work", @"The age of enlightenment", @"The Phiippine-American War", @"The Mexican-American War", @"Cuba's Independence", @"The first 10 amendments of the US Constitution", @"A part of the the Magna carta", @"the first 10 amendments of the Articles of confederation", @"Freedom of speech", @"The right to bare arms", @"The right to peaceably assemble", @"Judicial", @"Executive", @"Legislative", @"4", @"9", @"12", @"John Locke", @"Winston Churchill", @"Aristotle",nil];
    
    historyCorrectAnswers = [[NSArray alloc] initWithObjects:@"a", @"b", @"b", @"a", @"c", @"c", @"b", @"b", @"a", @"c", @"b", @"a", @"c", @"a", @"b", @"b", @"a", @"c", @"b", @"b", @"c", @"b", @"a", @"c", @"a", @"c", @"b", @"a", @"a", @"b", @"c", @"a", @"c", @"b", @"a", @"b", @"c", @"a", @"b", @"c", @"b", @"a", @"a", @"c", @"c", @"b", @"c", @"b", @"a", @"a", @"b", @"a", @"c", @"a", @"b", @"a", @"b", @"c", @"b", @"a", nil];
    
    questionCategory = ((Category_ViewController *)self.presentingViewController).category;
    level = ((Category_ViewController *)self.presentingViewController).gradeLevel;
    
    englishQuestions = [[NSArray alloc]initWithObjects:@"Choose the sentence with correct capitalization and punctuation.", @"Choose the sentence with correct capitalization and punctuation.", @"Choose the sentence with the correct capitalization and punctuation.",@"Choose the sentence with the correct capitalization and punctuation.",@"Which two words are rhyming words?",@"",nil];
    
    englishAnswers = [[NSArray alloc] initWithObjects:@"my birthday is in August.", @"My birthday is in August", @"My BiRtHday is in August.", @"i like to eat pizza.", @"I like to eat pizza.",@"I Like to eat Pizza.", @"EKU is a great School", @"EKU is a great school.", @"EKU, is a great school.",@"We are going to Disneyland.", @"We are going to disneyland.", @"we are going to disneyland.",@"Can and Cat",@"Quack and Quick", @"Fit and Hit",nil];
    
    englishCorrectAnswers = [[NSArray alloc] initWithObjects:@"b", @"b", @"b", @"a", @"c",nil];
    
    mathQuestions = [[NSArray alloc]initWithObjects:@"How many sides does a rectangle have?", @"Which coins have the same value as 1 nickel?", @"If you had one apple and your friend gave you one MORE apple, how many apples would you have now?", @"In which place value is the number 7 in the number 1072?", @" 10 + 15 = ?", @"A gallon is smaller than a quart.", @"Which number would make this statement true? 865 > __ < 756", @"If Sayna has 12 milks cartons, how many gallons does she have?", @"Dan is 15 years old. In how many years will he be 18?", @"Mary has 16 marbles. Sasha gave Mary 9 more marbles. How many marbles does Mary have altogether?", @"You have a doctor's appointment in the morning at 10:00. You leave the office three hours later. What time did you leave?", @"Maria has a garden that is 6 feet by 4 feet. What is the perimeter of Maria's garden?", @"What would be best to measure the weight of a postcard?", @"eight hundred three thousand, five hundred sixty-four", @"Which choice shows the fractions ordered least to greatest.", @"What is smaller than a right angle?", @"Two angles are _____ angles if the sum of their measures are 180 degrees", @"Estimat: 238 x 7 = ?",@"What is a rule for the pattern?", @"In a fraction, the number on top that shows the part of a whole is known as the ___.", @"Which of the following is true?", @"Choose an answer that has a digit in the hundreds place that has a greater value than the digit in the thousands place.", @"Which of the following is NOT a parallelogram?", @"Which of the following is equal to 2?", @"6 to the 2nd power", @"The temperature at 3:00 PM was 15 degrees. At midnight the temperature was -2 degrees. What's the difference between those two temperatures?", @"6x6x6x6x6x6x6 = ?", @"What integer represents the situation when a sports announcer says that a football team has lost five yards?", @"43% of what number is 4300?", @"Select the correct decimal for the percent: 85%",nil];
    
    mathAnswers = [[NSArray alloc] initWithObjects: @"3", @"4", @"5", @"5 pennies", @"10 pennies", @"25 pennies", @"2 apples", @"0 apples",@"1 apples", @"ones", @"tens", @"hundreds", @"34", @"20", @"25", @"true", @"false", @"n/a",  nil];
    
    mathCorrectAnswers = [[NSArray alloc] initWithObjects: @"b", @"a", @"a", @"b", @"c", @"b", nil];
    
    scienceQuestions = [[NSArray alloc]initWithObjects: @"Scientists ____ to find out the size or amount of something.", @"A special name for a group of stars is ___.", @"The name of the galaxy that Earth is in is ______." ,@"All insects have _____ legs.", @"What is found at the center of the solar system?", @"What is an example of a solid turning into another state of matter?",nil];
    
    scienceAnswers = [[NSArray alloc] initWithObjects: @"classify", @"eat", @"measure", @"constellation", @"picture", @"stars", @"constellation", @"Milky Way", @"stars",@"2", @"6", @"8", @"Earth", @"Mars", @"Sun", @"breaking a chair into pieces", @"snow becoming a puddle", @"water freezing",nil];
    
    
    scienceCorrectAnswers = [[NSArray alloc] initWithObjects: @"c", @"a", @"b", @"b", @"c", @"b",nil];
    
    [self load:YES];
}

- (void) load:(BOOL)animated
{
    if(questionNumber == 5)
    {
        int gradePercentage = progress.progress*10;
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
        if(questionCategory == 1)
        {
            backgroundControl.image = [UIImage imageNamed:@"backgroundfrMath.jpg"];
            questionLabel.text = [mathQuestions objectAtIndex:(level-1)*5+questionNumber];
            [answerA setTitle:[mathAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)] forState:normal];
            [answerB setTitle:[mathAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)+1] forState:normal];
            [answerC setTitle:[mathAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)+2] forState:normal];
            correctAnswer = [mathCorrectAnswers objectAtIndex:(level-1)*5+questionNumber];
        }
        else if(questionCategory == 2)
        {
            backgroundControl.image = [UIImage imageNamed:@"backgroundfrHistory.jpg"];
            questionLabel.text = [historyQuestions objectAtIndex:(level-1)*5+questionNumber];
            [answerA setTitle:[historyAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)] forState:normal];
            [answerB setTitle:[historyAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)+1]forState:normal];
            [answerC setTitle:[historyAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)+2]forState:normal];
            correctAnswer = [historyCorrectAnswers objectAtIndex:(level-1)*5+questionNumber];
        }
        else if(questionCategory == 3)
        {
            backgroundControl.image = [UIImage imageNamed:@"backgroundfrscience.jpg"];
            questionLabel.text = [scienceQuestions objectAtIndex:(level-1)*5+questionNumber];
            [answerA setTitle:[scienceAnswers objectAtIndex:(level-1)*5*3+(questionNumber*3)] forState:normal];
            [answerB setTitle:[scienceAnswers objectAtIndex:(level-1)*5+(questionNumber*3)+1]forState:normal];
            [answerC setTitle:[scienceAnswers objectAtIndex:(level-1)*5+(questionNumber*3)+2]forState:normal];
            correctAnswer = [scienceCorrectAnswers objectAtIndex:(level-1)*5+questionNumber];
        }
        else 
        {
            backgroundControl.image = [UIImage imageNamed:@"backgroundfrenglish.jpg"];
            questionLabel.text = [englishQuestions objectAtIndex:(level-1)*5+questionNumber];
            [answerA setTitle:[englishAnswers objectAtIndex:(level-1)*5+(questionNumber*3)]forState:normal];
            [answerB setTitle:[englishAnswers objectAtIndex:(level-1)*5+(questionNumber*3)+1]forState:normal];
            [answerC setTitle:[englishAnswers objectAtIndex:(level-1)*5+(questionNumber*3)+2]forState:normal];
            correctAnswer = [englishCorrectAnswers objectAtIndex:(level-1)*5+questionNumber];
        }
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkAnswer:(id)sender
{
    UIAlertView * alertDialog;
    if(sender == answerA)
    {
        if([correctAnswer isEqualToString:@"a"])
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progress.progress +=.2;
        }
        else
            alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    else if(sender == answerB)
    {
        if([correctAnswer isEqualToString:@"b"])
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progress.progress +=.2;
        }
        else
            alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    if(sender == answerC)
    {
        if([correctAnswer isEqualToString:@"c"])
        {
            alertDialog =[[UIAlertView alloc] initWithTitle:@"CORRECT" message:@"Good Job!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
            progress.progress +=.2;
        }
        else
            alertDialog =[[UIAlertView alloc] initWithTitle:@"SORRY" message:@"That answer is incorrect!" delegate:self cancelButtonTitle:@"Next Question" otherButtonTitles: nil];
    }
    [alertDialog show];
    questionNumber+=1;
}
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView.title isEqualToString: @"CLASS COMPLETED!"])
    {
        if(questionCategory == 1)
        {
            ((Category_ViewController*)self.presentingViewController).grade1.text = [NSString stringWithFormat:@"Grade: %@",letterGrade];
        }
        else if(questionCategory == 2)
        {
            ((Category_ViewController*)self.presentingViewController).grade2.text = [NSString stringWithFormat:@"Grade: %@",letterGrade];
        }
        else if(questionCategory == 3)
        {
            ((Category_ViewController*)self.presentingViewController).grade3.text = [NSString stringWithFormat:@"Grade: %@",letterGrade];
        }
        else 
        {
            ((Category_ViewController*)self.presentingViewController).grade4.text = [NSString stringWithFormat:@"Grade: %@",letterGrade];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
        [self load:YES];
}

@end
