module Test (trainAndTest) where

import LinearRegression (gradientDescent, costFunction, predict)

x :: [[Double]]
x = [[1, 1400, 3], 
     [1, 1600, 4], 
     [1, 1700, 3], 
     [1, 1875, 4]
    ]

y :: [Double]
y = [245, 312, 279, 308]

trainAndTest :: IO ()
trainAndTest = do
    let initialTheta = [0, 0, 0] -- Bias, Size Coefficient, Bedroom Coefficient
        alpha = 0.0000001
        iterations = 10000
        theta = gradientDescent x y initialTheta alpha iterations

    putStrLn $ "Trained Theta: " ++ show theta
    let predictions = map (flip predict theta) x
    putStrLn $ "Predictions: " ++ show predictions