module Gaming where

import qualified Data.Map as Map

type UserName = String
type GamerId = Int 
type PlayerCredits = Int 
type WillCoId = Int

userNameDB :: Map.Map GamerId UserName
userNameDB = Map.fromList [(1, "banana")
                          , (2, "apple")]

creditsDB :: Map.Map UserName PlayerCredits
creditsDB = Map.fromList [("banana", 1000)
                         ,("apple", 2000) ]

willCoIdDB :: Map.Map WillCoId GamerId
willCoIdDB = Map.fromList [(1001, 1)
                        ,(1002, 2)] 

lookupUserName :: GamerId -> Maybe UserName
lookupUserName gId = Map.lookup gId userNameDB

lookupCredits :: UserName -> Maybe PlayerCredits
lookupCredits u = Map.lookup u creditsDB

lookupGamerId :: WillCoId -> Maybe GamerId
lookupGamerId wId = Map.lookup wId willCoIdDB

creditsFromId :: GamerId -> Maybe PlayerCredits
creditsFromId gId = lookupUserName gId >>= lookupCredits
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b

creditsFromWillCoId :: WillCoId -> Maybe PlayerCredits
creditsFromWillCoId wId = lookupGamerId wId >>= lookupUserName >>= lookupCredits
