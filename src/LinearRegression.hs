-- src/LinearRegression.hs
module LinearRegression (
    addMatrices,
    multiplyMatrices,
    transpose,
    scalarMultiply,
    costFunction,
    gradientDescent,
    predict,
    dotProduct
) where

-- Matrix Operations
addMatrices :: [[Double]] -> [[Double]] -> [[Double]]
addMatrices = zipWith (zipWith (+))

multiplyMatrices :: [[Double]] -> [[Double]] -> [[Double]]
multiplyMatrices a b = [[sum $ zipWith (*) ar bc | bc <- transpose b] | ar <- a]

transpose :: [[Double]] -> [[Double]]
transpose ([]:_) = []
transpose x = (map head x) : transpose (map tail x)

scalarMultiply :: Double -> [[Double]] -> [[Double]]
scalarMultiply scalar = map (map (* scalar))

-- Cost Function
costFunction :: [[Double]] -> [Double] -> [Double] -> Double
costFunction x y theta = (1 / (2 * fromIntegral (length y))) * sum (map (^2) errors)
  where errors = zipWith (-) (map (dotProduct theta) x) y

-- Gradient Descent
gradientDescent :: [[Double]] -> [Double] -> [Double] -> Double -> Int -> [Double]
gradientDescent x y theta alpha iterations = go theta iterations
  where
    go t 0 = t
    go t n = go (updateTheta t) (n - 1)

    updateTheta :: [Double] -> [Double]
    updateTheta t = zipWith (-) t (map (* alpha) gradients)

    gradients :: [Double]
    gradients = map (sum . zipWith (*) (errors x y theta)) (transpose x)

    errors :: [[Double]] -> [Double] -> [Double] -> [Double]
    errors x y t = zipWith (-) (map (dotProduct t) x) y

-- Prediction
predict :: [Double] -> [Double] -> Double
predict x theta = dotProduct theta x

dotProduct :: [Double] -> [Double] -> Double
dotProduct xs ys = sum (zipWith (*) xs ys)
