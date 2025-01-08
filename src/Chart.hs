module Chart (plotData) where

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams
import LinearRegression (predict)

plotData :: [Double] -> [Double] -> [Double] -> [Double] -> IO ()
plotData x y theta predictions = toFile def "plot.svg" $ do
    layout_title .= "Linear Regression"
    plot (line "Data" [zip x y])
    plot (line "Prediction" [zip x predictions])
