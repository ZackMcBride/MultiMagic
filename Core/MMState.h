@import MultipeerConnectivity;

@interface MMState : NSObject

@property (nonatomic, readonly) MCPeerID *peerID;
@property (nonatomic, readonly) MCSessionState state;

- (instancetype)initWithPeerID:(MCPeerID *)peerID state:(MCSessionState)state;

@end
