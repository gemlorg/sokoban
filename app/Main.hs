module Main where

import CodeWorld

main :: IO ()
-- module Data.Angle where

main = animationOf design

design (t) = polyline ([cords (theta) | theta <- [0, 0.1 .. speed * t]])

speed = 100

w = 2 / pi * log (golden_ratio)

golden_ratio = (1 + sqrt (5)) / 2

scal = 1 / 100

cords (theta) = (radius (theta) * cos (theta), radius (theta) * sin (theta))

radius (theta) = exp (w * scal * theta)
