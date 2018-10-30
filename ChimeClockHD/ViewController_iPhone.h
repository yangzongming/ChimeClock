//
//  ViewController_iPhone.h
//  ChimeClockHD
//
//  Created by Yang leo on 13-1-13.
//  Copyright (c) 2013年 Shandongjingjixueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "const.h"
#import "AppDelegate.h"


@interface ViewController_iPhone : UIViewController{
    IBOutlet UISwitch *timeSwitch;
    IBOutlet UILabel *timeSwitchLabel;
}

@property (nonatomic,retain)IBOutlet UILabel *timeSwitchLabel;

-(IBAction)valueChanged:(id)sender;

@end
