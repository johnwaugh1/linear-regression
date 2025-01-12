module MainApp (mainApp) where

import Test (trainAndTest)
import Chart (plotData)
import LinearRegression (predict, gradientDescent)

mainApp :: IO ()
mainApp = do
    trainAndTest
    let x = [ [1, 1400, 3], 
              [1, 1600, 4], 
              [1, 1700, 3], 
              [1, 1875, 4] ]
        y = [245, 312, 279, 308]
        initialTheta = [0, 0, 0]
        alpha = 0.0000001
        iterations = 10000
        theta = gradientDescent x y initialTheta alpha iterations
        sizes = map (!! 1) x
        predictions = map (flip predict theta) x
    plotData sizes y theta predictions
