@import MultipeerConnectivity;

#import "MMData.h"
#import "MMResource.h"
#import "MMState.h"
#import "MMStream.h"

@interface MultiMagic : NSObject <MCSessionDelegate>

/**
	Shared manager instance. You can connect to up to 8 peers at a time per session
*/
+ (instancetype)manager;


/**
	Your device identifier that will be visible to others
*/
@property (nonatomic, readonly) MCPeerID *peerID;

/**
	The current session if there is one
*/
@property (nonatomic, readonly) MCSession *session;

/**
	The browser that controls connecting to other peers
*/
@property (nonatomic, readonly) MCBrowserViewController *browser;

/**
	The advertiser for handling your visibility to other peers
*/
@property (nonatomic, readonly) MCAdvertiserAssistant *advertiser;



/**
	Start a multipeer session
	@param displayName your personal identifier that will appear to others
	@param visible determines your visibility to other potential peers
*/
-(void)startSessionWithName:(NSString *)displayName visible:(BOOL)visible;



/**
	Set to deterimine visibility to other peers
	@param shouldAdvertise is NO if the device should be invisible
*/
-(void)advertiseSelf:(BOOL)shouldAdvertise;



/**
	This will get called when peers are connected or disconnected
*/
@property (nonatomic, copy) void (^onSessionDidChangeState)(MMState *sessionState);



/** 
	This will get called whenever data is received from another peer. You receive an MMData instance which holds the message.
*/
@property (nonatomic, copy) void (^onSessionDidReceiveData)(MMData *data);



/** 
	This will get called when a nearby peer opens a stream to your device. The MMStream object you receive contains an NSInputStream.
*/
@property (nonatomic, copy) void (^onSessionDidReceiveStream)(MMStream *stream);



/** 
	Indicates that you have begun receiving a resource from another peer. This instance of MMResource holds an NSProgress object.
*/
@property (nonatomic, copy) void (^onSessionDidStartReceivingResource)(MMResource *resource);



/** 
	Indicates that the stream you have been receiving just finished. It contains an NSURL object pointing to the brand new local file stored on your device.
*/
@property (nonatomic, copy) void (^onSessionDidFinishReceivingResource)(MMResource *resource);




@end
