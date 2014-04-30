@import MultipeerConnectivity;

@interface MMResource : NSObject

@property (nonatomic, readonly) MCPeerID *peerID;
@property (nonatomic, readonly) NSString *resourceName;
@property (nonatomic, readonly) NSProgress *progress;
@property (nonatomic, readonly) NSURL *localURL;

- (instancetype)initWithPeerID:(MCPeerID *)peerID resourceName:(NSString *)resourceName progress:(NSProgress *)progress;
- (instancetype)initWithPeerID:(MCPeerID *)peerID resourceName:(NSString *)resourceName localURL:(NSURL *)localURL;

@end
