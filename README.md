# MultiMagic - Magic Multipeer Connectivity

[![Version](http://cocoapod-badges.herokuapp.com/v/MultiMagic/badge.png)](http://cocoadocs.org/docsets/MultiMagic)
[![Platform](http://cocoapod-badges.herokuapp.com/p/MultiMagic/badge.png)](http://cocoadocs.org/docsets/MultiMagic)

A very simple wrapper for the iOS7 Multipeer Connectivity framework. 

## Installation

~~MultiMagic is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:~~

   ~~ pod "MultiMagic"~~


## Usage

### Creating a session

Getting started is easy. Just write

```objective-c
[MultiMagic.manager startSessionWithName:[UIDevice currentDevice].name
                                 visible:YES];
```

### Browsing available devices

1. Set your current view controller as the browser delegate

```objective-c
    MultiMagic.manager.browser.delegate = self;
```

2. Present the browser

```objective-c
    [self presentViewController:MultiMagic.manager.browser 
                       animated:YES 
                     completion:nil];
```

This will enable the default iOS modal viewController for connecting with peers.

### Listening for session changes

1. Implement this block (it's probably good to do this at the same time that you start the session)

```objective-c
    MultiMagic.manager.onSessionDidChangeState = ^(MMState *state){
        // Do some good stuff here...
    };
```

This will fire whenever something changes in your session

### Receiving things

Use these blocks to interact with all that multipeer goodness

```objective-c
@property (nonatomic, copy) void (^onSessionDidReceiveData)(MMData *data);
```

This will get called whenever data is received from another peer. You receive an MMData instance which holds the message.


```objective-c
@property (nonatomic, copy) void (^onSessionDidReceiveStream)(MMStream *stream);
```

This will get called when a nearby peer opens a stream to your device. The MMStream object you receive contains an NSInputStream.


```objective-c
@property (nonatomic, copy) void (^onSessionDidStartReceivingResource)(MMResource *resource);
```

Indicates that you have begun receiving a resource from another peer. This instance of MMResource holds an NSProgress object.


```objective-c
@property (nonatomic, copy) void (^onSessionDidFinishReceivingResource)(MMResource *resource);
```

Indicates that the stream you have been receiving just finished. It contains an NSURL object pointing to the brand new local file stored on your device.

### Sending things

  ***Simple data***
  
  ```objective-c
    [MultiMagic.manager.session sendData:(NSData *)data 
                                 toPeers:(NSArray *)peerIDs 
                                withMode:(MCSessionSendDataMode)mode 
                                   error:(NSError **)error;
  ```
  
  ***Files***
  
  ```objective-c
    [MultiMagic.manager.session sendResourceAtURL:(NSURL *)resourceURL 
                                         withName:(NSString *)resourceName 
                                           toPeer:(MCPeerID *)peerID
                            withCompletionHandler:(void(^)(NSError *error))completionHandler;
  ```
  
  ***Streams***
  
  ```objective-c
    [MultiMagic.manager.session startStreamWithName:(NSString *)streamName 
                                             toPeer:(MCPeerID *)peerID 
                                              error:(NSError **)error;
  ```
Hopefully you get the idea. Have fun!

## Author

Zack McBride, zackmcbride@gmail.com

## License

MultiMagic is available under the MIT license. See the LICENSE file for more info.

