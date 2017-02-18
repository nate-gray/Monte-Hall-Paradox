//
//  ViewController.h
//  MHP
//
//  Created by Gray, Nathan on 2/6/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

//Outlets

@property (weak, nonatomic) IBOutlet UIImageView *door1;

@property (weak, nonatomic) IBOutlet UIImageView *door2;

@property (weak, nonatomic) IBOutlet UIImageView *door3;

@property (weak, nonatomic) IBOutlet UISegmentedControl *doorSelector;

@property (weak, nonatomic) IBOutlet UILabel *selectLBL;

@property (weak, nonatomic) IBOutlet UIButton *revealBTN;

@property (weak, nonatomic) IBOutlet UISegmentedControl *keepSelector;

@property (weak, nonatomic) IBOutlet UIButton *showBTN;

@property (weak, nonatomic) IBOutlet UIButton *resetBTN;

@property (weak, nonatomic) IBOutlet UIImageView *arrow1;

@property (weak, nonatomic) IBOutlet UIImageView *arrow2;

@property (weak, nonatomic) IBOutlet UIImageView *arrow3;

@property (weak, nonatomic) IBOutlet UILabel *keepTotal;

@property (weak, nonatomic) IBOutlet UILabel *keepWin;

@property (weak, nonatomic) IBOutlet UILabel *keepLoss;

@property (weak, nonatomic) IBOutlet UILabel *switchTotal;

@property (weak, nonatomic) IBOutlet UILabel *switchWin;

@property (weak, nonatomic) IBOutlet UILabel *switchLoss;


//Actions

- (IBAction)doorSelected:(id)sender;

- (IBAction)revealDoor:(id)sender;

- (IBAction)showResults:(id)sender;

- (IBAction)keepSwitch:(id)sender;

- (IBAction)resetGame:(id)sender;

//Other

- (void)showArrow;
- (void)revealDoorNum:(id)doorID;
- (void) resetDoors;

@end

