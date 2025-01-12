module Chart (plotData) where

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams
import LinearRegression (predict)

plotData :: [Double] -> [Double] -> [Double] -> [Double] -> IO ()
plotData sizes prices theta predictions = toFile def "housing_prices.svg" $ do
    layout_title .= "Housing Prices vs. Size"
    layout_x_axis . laxis_title .= "Size (sq ft)"
    layout_y_axis . laxis_title .= "Price ($1000)"
    plot (points "Actual Prices" (zip sizes prices))
    plot (line "Predicted Prices" [zip sizes predictions])
