@interface MMData : NSObject

@property (nonatomic, readonly) MCPeerID *peerID;
@property (nonatomic, readonly) NSData *data;

- (instancetype)initWithPeerID:(MCPeerID *)peerID data:(NSData *)data;

@end
