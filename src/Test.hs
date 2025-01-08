module Test (trainAndTest) where

import LinearRegression (gradientDescent, costFunction, predict)

-- Example data (x includes a column of ones for the bias term)
x :: [[Double]]
x = [[1, 1], [1, 2], [1, 3], [1, 4]]  -- Simple linear data

y :: [Double]
y = [2, 3, 4, 5]  -- Expected outputs

trainAndTest :: IO ()
trainAndTest = do
    let initialTheta = [0, 0]  -- Initial guess for theta
        alpha = 0.01  -- Learning rate
        iterations = 1000
        theta = gradientDescent x y initialTheta alpha iterations

    putStrLn $ "Trained Theta: " ++ show theta
    let predictions = map (flip predict theta) x
    putStrLn $ "Predictions: " ++ show predictions
    -- Optionally: Call the chart plotting function here (from Chart.hs)
