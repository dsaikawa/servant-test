{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

module Lib
    ( runServant
    ) where

import Servant
import Data.Aeson(ToJSON, FromJSON)
import Data.Time.Calendar
import GHC.Generics(Generic)
import Network.Wai(Application)
import Network.Wai.Handler.Warp(run)

data User = User
  { name :: String
  , age :: Int
  , email :: String
  , registration_date :: Day
  } deriving (Eq, Show, Generic)

instance ToJSON User


isaac :: User
isaac = User "Isaac Newton" 372 "isaac@newton.co.uk" (fromGregorian 1683 3 1)

albert :: User
albert = User "Albert Einstein" 136 "ae@mc2.org" (fromGregorian 1905 12 1)

users2 :: [User]
users2 = [isaac, albert]

data Temparture = Temparture
  { temparture :: Float
  , uid :: String
  } deriving Generic

instance FromJSON Temparture
instance ToJSON Temparture

data Message = Message
 { message :: String
 , userId :: String
 } deriving Generic

instance ToJSON Message

createMessage :: Temparture -> Message
createMessage c = Message message' userId'
  where message' = show (temparture c) ++ "度です。"
        userId' = uid c

type UserAPI2 = "users" :> Get '[JSON] [User]
           :<|> "albert" :> Get '[JSON] User
           :<|> "isaac" :> Get '[JSON] User
           :<|> "temparture" :> ReqBody '[JSON] Temparture :> Post '[JSON] Message

server2 :: Server UserAPI2
server2 = return users2
     :<|> return albert
     :<|> return isaac
     :<|> temparture

     where temparture :: Temparture -> Handler Message
           temparture m = return (createMessage m)

userAPI :: Proxy UserAPI2
userAPI = Proxy

-- 'serve' comes from servant and hands you a WAI Application,
-- which you can think of as an "abstract" web application,
-- not yet a webserver.
app2 :: Application
app2 = serve userAPI server2

runServant :: IO ()
runServant = do
  print "server running ..."
  run 8080 app2