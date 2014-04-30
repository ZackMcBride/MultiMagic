@import MultipeerConnectivity;

#import "MMData.h"
#import "MMResource.h"
#import "MMState.h"
#import "MMStream.h"

@interface MultiMagic : NSObject <MCSessionDelegate>



+ (instancetype)manager;



@property (nonatomic, readonly) MCPeerID *peerID;

@property (nonatomic, readonly) MCSession *session;

@property (nonatomic, readonly) MCBrowserViewController *browser;

@property (nonatomic, readonly) MCAdvertiserAssistant *advertiser;




-(void)startSessionWithName:(NSString *)displayName visible:(BOOL)visible;




-(void)advertiseSelf:(BOOL)shouldAdvertise;




@property (nonatomic, copy) void (^onSessionDidChangeState)(MMState *sessionState);




@property (nonatomic, copy) void (^onSessionDidReceiveData)(MMData *data);




@property (nonatomic, copy) void (^onSessionDidReceiveStream)(MMStream *stream);




@property (nonatomic, copy) void (^onSessionDidStartReceivingResource)(MMResource *resource);




@property (nonatomic, copy) void (^onSessionDidFinishReceivingResource)(MMResource *resource);




@end
