//
//  ViewController.m
//  iVoice
//
//  Created by luo lei on 13-7-21.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    voiceCenter = [[VoiceCenter alloc] init];
    [voiceCenter start];
    seg = [[self.view subviews] objectAtIndex:0];
    [seg addTarget:self
                         action:@selector(action:)
               forControlEvents:UIControlEventValueChanged];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) action:(id)sender
{
    NSLog(@"%@",@([seg selectedSegmentIndex]));
    [voiceCenter startAtIndex:[seg selectedSegmentIndex]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
