module Main where

import Prelude

import Data.Time.Duration (Milliseconds(..))
import Effect (Effect)
import Effect.Aff (delay, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (logShow)
import Effect.Console (log)

foreign import data Context :: Type

foreign import getCtx :: Effect Context
foreign import drawLine :: Context -> {x:: Int, y:: Int} -> {x:: Int, y:: Int} -> Effect Unit

add2AndMultiplyBy3 :: Int -> Int
add2AndMultiplyBy3 x =
  let
    x1 = x + 2
      in x1 * 3

main :: Effect Unit
main = do
  ctx <- getCtx
  launchAff_ (do
    -- delay (Milliseconds 2000.0)
    liftEffect (drawLine ctx {x: 50, y: 50} {x: 50, y: 250})
   
    liftEffect (drawLine ctx {x: 100, y: 100} {x: 100, y: 300})
   
)
