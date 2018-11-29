module Main where

import Prelude

import Data.Time.Duration (Milliseconds(..))
import Effect (Effect)
import Effect.Aff (delay, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (logShow)
import Effect.Console (log)
import Data.Array
import Math
import Graphics.Canvas
import Data.Maybe (Maybe(..))
import Partial.Unsafe (unsafePartial)
foreign import data Context :: Type

foreign import getCtx :: Effect Context
foreign import drawCanvas :: Context -> Array(Array Number)-> Effect Unit

-- add2AndMultiplyBy3 :: Int -> Int
-- add2AndMultiplyBy3 x =
--   let
--     x1 = x + 2
--       in x1 * 3


type Vertices = 
  { x :: Number
  , y :: Number
  }

type Cords = 
  { x :: Number
  , y :: Number
  , z :: Number
  }




transf :: Vertices -> Vertices
transf v = {
            x : v.x + 300.0,
            y : -v.y + 200.0 
        }
    
rotate  :: Cords -> Vertices
rotate  c = do
  let max = pi/4.0
  let may = pi/3.0
  let maz = pi/4.0
  let xRotQz = c.x*cos(maz) + c.y*sin(maz)
  let yRotQz = c.y*cos(maz) - c.x*sin(maz)
  let zRotQz = c.z
  let xRotQzQx = xRotQz
  let yRotQzQx = yRotQz*cos(max) + zRotQz*sin(max)
  let zRotQzQx = zRotQz*cos(max) - yRotQz*sin(max)
  let xRotQzQxQy = xRotQzQx*cos(may) + zRotQzQx*sin(may)
  let yRotQzQxQy = yRotQzQx
  { x: xRotQzQxQy,y: yRotQzQxQy}

drawLine :: forall eff. Context2D -> Vertices -> Vertices -> Effect Unit
drawLine ctx v1 v2= do
  beginPath ctx
  moveTo ctx  v1.x v1.y
  lineTo ctx  v2.x v2.y
  stroke ctx
  

drawcube :: forall eff. Context2D ->  Effect Unit
drawcube ctx = do
  let v1 = transf $ rotate  { x: 100.0, y: 100.0, z: 100.0 }
  let v2 = transf $ rotate  { x: -100.0, y: 100.0, z: 100.0 }
  let v3 = transf $ rotate  { x: -100.0, y: -100.0, z: 100.0 }
  let v4 = transf $ rotate  { x: 100.0, y: -100.0, z: 100.0}
  let v5 = transf $ rotate  { x: 100.0, y: 100.0, z: 100.0}
  let v6 = transf $ rotate  { x: 100.0, y: 100.0, z: -100.0} 
  let v7 = transf $ rotate  { x: -100.0, y: 100.0, z: -100.0 }
  let v8 = transf $ rotate  { x: -100.0, y: -100.0 ,z: -100.0 }
  let v9 = transf $ rotate  { x: 100.0, y: -100.0, z: -100.0}
  let v10 = transf $ rotate  { x: 100.0, y: 100.0, z: -100.0}
  let v11 = transf $ rotate   { x: 100.0, y: -100.0, z: -100.0}
  let v12 = transf $ rotate   { x: 100.0, y: -100.0, z: 100.0}
  let v13 = transf $ rotate   { x: -100.0, y: -100.0, z: 100.0}
  let v14 = transf $ rotate   { x: -100.0, y: -100.0, z: -100.0}
  let v15 = transf $ rotate   {x: -100.0, y: 100.0,z: -100.0}
  let v16 = transf $ rotate   {x: -100.0, y: 100.0, z: 100.0}
  beginPath ctx
  logShow v1
  logShow v2
  logShow v3
  logShow v4
  logShow v5
  logShow v6
  logShow v7
  logShow v8
  logShow v9
  logShow v10
  logShow v11
  logShow v12
  logShow v13
  logShow v14
  logShow v15
  logShow v16
  drawLine ctx v1 v2
  drawLine ctx v2 v3
  drawLine ctx v3 v4
  drawLine ctx v4 v5
  drawLine ctx v5 v6
  drawLine ctx v6 v7
  drawLine ctx v7 v8
  drawLine ctx v8 v9
  drawLine ctx v9 v10
  drawLine ctx v10 v11
  drawLine ctx v11 v12
  drawLine ctx v12 v13
  drawLine ctx v13 v14
  drawLine ctx v14 v15
  drawLine ctx v15 v16
  -- moveTo ctx v1.x v1.y
  -- lineTo ctx v2.x v2.y
  -- lineTo ctx v3.x v3.y
  -- stroke ctx

main :: Effect Unit
main = void $ unsafePartial do
  Just canvas <- getCanvasElementById "myC"
  ctx <- getContext2D canvas
  -- let vertices = [[100.0,100.0,100.0], [-100.0,100.0,100.0], [-100.0,-100.0,100.0], [100.0,-100.0,100.0], [100.0,100.0,100.0], [100.0,100.0,-100.0], [-100.0,100.0,-100.0], [-100.0,-100.0,-100.0], [100.0,-100.0,-100.0], [100.0,100.0,-100.0], [100.0,-100.0,-100.0], [100.0,-100.0,100.0], [-100.0,-100.0,100.0], [-100.0,-100.0,-100.0], [-100.0,100.0,-100.0], [-100.0,100.0,100.0]]
  -- drawCanvas ctx vertices
  drawcube ctx
 
 
