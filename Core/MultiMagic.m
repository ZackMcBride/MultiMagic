#import "MultiMagic.h"

@interface MultiMagic ()

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;

@end

@implementation MultiMagic

#pragma mark - Object Lifecycle

+ (instancetype)manager {
    static MultiMagic *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

-(id)init {
    self = [super init];

    if (self) {
        _peerID = nil;
        _session = nil;
        _browser = nil;
        _advertiser = nil;
    }

    return self;
}

#pragma mark - Public Interface

- (void)startSessionWithName:(NSString *)displayName
                    visible:(BOOL)visible {

    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];

    self.session = [[MCSession alloc] initWithPeer:self.peerID
                                                             securityIdentity:nil
                                                         encryptionPreference:MCEncryptionNone];
    self.session.delegate = self;
    [self advertiseSelf:visible];
    [self setupMCBrowser];
}

-(void)setupMCBrowser{
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"chat-files" session:self.session];
}

-(void)advertiseSelf:(BOOL)shouldAdvertise{
    if (shouldAdvertise) {
        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"chat-files"
                                                           discoveryInfo:nil
                                                                 session:self.session];
        [self.advertiser start];
    }
    else{
        [self.advertiser stop];
        self.advertiser = nil;
    }
}

#pragma mark - MCSessionDelegate Methods

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{

    MMState *sessionState = [[MMState alloc] initWithPeerID:peerID
                                                        state:state];

    if (self.onSessionDidChangeState) {
        self.onSessionDidChangeState(sessionState);
    }
}


-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{
    MMData *sessionData = [[MMData alloc] initWithPeerID:peerID data:data];

    if (self.onSessionDidReceiveData) {
        self.onSessionDidReceiveData(sessionData);
    }
}


-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{

    MMResource *sessionResource = [[MMResource alloc] initWithPeerID:peerID resourceName:resourceName progress:progress];

    if (self.onSessionDidStartReceivingResource) {
        self.onSessionDidStartReceivingResource(sessionResource);
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [progress addObserver:self
                   forKeyPath:@"fractionCompleted"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    });
}


-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{

    MMResource *sessionResource = [[MMResource alloc] initWithPeerID:peerID resourceName:resourceName localURL:localURL];

    if (self.onSessionDidFinishReceivingResource) {
        self.onSessionDidFinishReceivingResource(sessionResource);
    }

}


-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{

    MMStream *sessionStream = [[MMStream alloc] initWithPeerID:peerID streamName:streamName stream:stream];

    if (self.onSessionDidReceiveStream) {
        self.onSessionDidReceiveStream(sessionStream);
    }
}

@end
