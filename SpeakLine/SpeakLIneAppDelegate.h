//
//  SpeakLIneAppDelegate.h
//  SpeakLine
//
//  Created by Shawn Hooton on 1/22/14.
//  Copyright (c) 2014 Sixpanel LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpeakLIneAppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate>
{
    NSSpeechSynthesizer *_speechSynth;
    NSArray *_voices;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSButton *speakButton;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;


@end
