module Main where

import Prelude

import Data.Time.Duration (Milliseconds(..))
import Effect (Effect)
import Effect.Aff (delay, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (logShow)
import Effect.Console (log)
import Data.Array
foreign import data Context :: Type

foreign import getCtx :: Effect Context
foreign import drawCanvas :: Context -> Array(Array Int)-> Effect Unit

add2AndMultiplyBy3 :: Int -> Int
add2AndMultiplyBy3 x =
  let
    x1 = x + 2
      in x1 * 3



main :: Effect Unit
main = do
  ctx <- getCtx
  let vertices = [[75,75,75], [-75,75,75], [-75,-75,75], [75,-75,75], [75,75,75], [75,75,-75], [-75,75,-75], [-75,-75,-75], [75,-75,-75], [75,75,-75], [75,-75,-75], [75,-75,75], [-75,-75,75], [-75,-75,-75], [-75,75,-75], [-75,75,75]]
  drawCanvas ctx vertices
  