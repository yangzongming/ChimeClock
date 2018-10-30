//
//  ViewController.h
//  ChimeClockHD
//
//  Created by Yang leo on 13-1-10.
//  Copyright (c) 2013年 Shandongjingjixueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "const.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController{
    IBOutlet UISwitch *timeSwitch;
}

-(IBAction)valueChanged:(id)sender;

@end
