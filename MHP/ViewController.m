//
//  ViewController.m
//  MHP
//
//  Created by Gray, Nathan on 2/6/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//  

#import "ViewController.h"

@interface ViewController ()

{
    AVAudioPlayer *_audioPlayerWin;
    AVAudioPlayer *_audioPlayerLose;
}

@end

@implementation ViewController
@synthesize door1;
@synthesize door2;
@synthesize door3;
@synthesize doorSelector;
@synthesize selectLBL;
@synthesize revealBTN;
@synthesize keepSelector;
@synthesize showBTN;
@synthesize resetBTN;
@synthesize arrow1;
@synthesize arrow2;
@synthesize arrow3;
@synthesize keepTotal;
@synthesize keepWin;
@synthesize keepLoss;
@synthesize switchTotal;
@synthesize switchWin;
@synthesize switchLoss;

UIImageView *imageView1;
UIImageView *imageView2;

int doorWinner;
int playerChoice;
int doorRevealed;

int keepTotalCounter;
int switchTotalCounter;
int keepWinCounter;
int switchWinCounter;
int keepLossCounter;
int switchLossCounter;

bool isWinner;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *winnerPath = [NSString stringWithFormat:@"%@/WINNER.WAV", [[NSBundle mainBundle] resourcePath]];
    NSString *loserPath = [NSString stringWithFormat:@"%@/LoserHorns.wav", [[NSBundle mainBundle] resourcePath]];
    
    NSURL *soundUrlWin = [NSURL fileURLWithPath:winnerPath];
    NSURL *soundUrlLose = [NSURL fileURLWithPath:loserPath];
    
    _audioPlayerWin = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrlWin error:nil];
    _audioPlayerLose = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrlLose error:nil];
    
    doorWinner = ((arc4random() % 3) + 1);
    keepTotalCounter = 0;
    switchTotalCounter = 0;
    keepWinCounter = 0;
    switchWinCounter = 0;
    keepLossCounter = 0;
    switchLossCounter = 0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doorSelected:(id)sender {
    
    selectLBL.hidden = true;
    revealBTN.hidden = false;
    doorSelector.hidden = true;
    
    if (doorSelector.selectedSegmentIndex == 0) {
        
        playerChoice = 1;
        
    }
    
    if (doorSelector.selectedSegmentIndex == 1) {
        
        playerChoice = 2;
        
    }
    
    if (doorSelector.selectedSegmentIndex == 2) {
        
        playerChoice = 3;
        
    }
    
    [self showArrow];
    
}

- (void)showArrow {
    
    if (playerChoice == 1) {
        
        arrow1.hidden = false;
        arrow2.hidden = true;
        arrow3.hidden = true;
        
    }
    
    if (playerChoice == 2) {
        
        arrow1.hidden = true;
        arrow2.hidden = false;
        arrow3.hidden = true;
        
    }
    
    if (playerChoice == 3) {
        
        arrow1.hidden = true;
        arrow2.hidden = true;
        arrow3.hidden = false;
        
    }
    
}

- (IBAction)revealDoor:(id)sender {
    
    bool selectionRepeat = true;
    
    while (selectionRepeat) {
        
        doorRevealed = ((arc4random() % 3) + 1);
        
        if (doorRevealed != doorWinner && doorRevealed != playerChoice) {
            
            selectionRepeat = false;
            
        }
        
    }
    
    if (doorRevealed == 1) {
        
        [self revealDoorNum:door1];
        
    }
    
    if (doorRevealed == 2) {
        
        [self revealDoorNum:door2];
        
    }
    
    if (doorRevealed == 3) {
        
        [self revealDoorNum:door3];
        
    }
    
    revealBTN.hidden = true;
    
    keepSelector.hidden = false;
    
}

- (void)revealDoorNum:(id)doorID {
    
    UIImageView *doorIN = (UIImageView *) doorID;
    
    if (doorWinner == doorIN.tag) {
        
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner"]];
        
    }
    
    else {
        
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser"]];
        
    }
    
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:doorIN cache:YES];
    
    [doorIN addSubview:imageView2];
    [UIView commitAnimations];
    
}


- (IBAction)showResults:(id)sender {
    
    [self revealDoorNum:door1];
    [self revealDoorNum:door2];
    [self revealDoorNum:door3];
    
    showBTN.hidden = true;
    resetBTN.hidden = false;
    
    keepTotal.text = [[NSString alloc] initWithFormat:@"%d", keepTotalCounter];
    switchTotal.text = [[NSString alloc] initWithFormat:@"%d", switchTotalCounter];
    
    keepWin.text = [[NSString alloc] initWithFormat:@"%d", keepWinCounter];
    switchWin.text = [[NSString alloc] initWithFormat:@"%d", switchWinCounter];
    
    keepLoss.text = [[NSString alloc] initWithFormat:@"%d", keepLossCounter];
    switchLoss.text = [[NSString alloc] initWithFormat:@"%d", switchLossCounter];
    
    if (isWinner) {
        
        [_audioPlayerWin play];
        
    }
    
    else {
        
        [_audioPlayerLose play];
        
    }
    
}

- (IBAction)keepSwitch:(id)sender {
    
    if (keepSelector.selectedSegmentIndex == 1) {
        
        if (doorRevealed == 1) {
            
            if (playerChoice == 2) {
                
                playerChoice = 3;
                
            }
            
            else {
                
                playerChoice = 2;
                
            }
            
        }
        
        if (doorRevealed == 2) {
            
            if (playerChoice == 1) {
                
                playerChoice = 3;
                
            }
            
            else {
                
                playerChoice = 1;
                
            }
            
        }

        if (doorRevealed == 3) {
            
            if (playerChoice == 1) {
                
                playerChoice = 2;
                
            }
            
            else {
                
                playerChoice = 1;
                
            }
            
        }
        
        [self showArrow];
        
        switchTotalCounter = switchTotalCounter + 1;
        
        if (playerChoice == doorWinner) {
            
            switchWinCounter = switchWinCounter + 1;
            isWinner = true;
            
        }
        
        else {
            
            switchLossCounter = switchLossCounter + 1;
            isWinner = false;
            
        }
        
    }
    
    else {
        
        keepTotalCounter = keepTotalCounter + 1;
        
        if (playerChoice == doorWinner) {
            
            keepWinCounter = keepWinCounter + 1;
            isWinner = true;
            
        }
        
        else {
            
            keepLossCounter = keepLossCounter + 1;
            isWinner = false;
            
        }

        
    }
    
    keepSelector.hidden = true;
    showBTN.hidden = false;
    
}

- (IBAction)resetGame:(id)sender {
    
    doorWinner = ((arc4random() % 3) + 1);
    
    resetBTN.hidden = true;
    
    [self resetDoors];
    arrow1.hidden = true;
    arrow2.hidden = true;
    arrow3.hidden = true;
    
    doorSelector.hidden = false;
    [doorSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [keepSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    
    selectLBL.hidden = false;
    
}

- (void) resetDoors {
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door1 cache:YES];
    
    [imageView2 removeFromSuperview];
    [door1 addSubview:imageView1];
    [UIView commitAnimations];
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door2 cache:YES];
    
    [imageView2 removeFromSuperview];
    [door2 addSubview:imageView1];
    [UIView commitAnimations];
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door3 cache:YES];
    
    [imageView2 removeFromSuperview];
    [door3 addSubview:imageView1];
    [UIView commitAnimations];
    
}

@end
