//
//  SpeakLIneAppDelegate.h
//  SpeakLine
//
//  Created by Shawn Hooton on 1/22/14.
//  Copyright (c) 2014 Sixpanel LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpeakLIneAppDelegate : NSObject <NSApplicationDelegate>
{
    NSSpeechSynthesizer *_speechSynth;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;


@end
