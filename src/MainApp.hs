module MainApp (mainApp) where

import Test (trainAndTest)
import Chart (plotData)
import LinearRegression (predict)

mainApp :: IO ()
mainApp = do
    -- Train the model and test it
    trainAndTest

    -- Optionally: Plot data after training
    let x = [[1, 1], [1, 2], [1, 3], [1, 4]]
        y = [2, 3, 4, 5]
        theta = [0.5, 1.0]  -- Assuming theta is trained
        predictions = map (flip predict theta) x
    plotData (map (!! 1) x) y theta predictions
