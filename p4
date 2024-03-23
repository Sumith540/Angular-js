<!DOCTYPE html>
<html ng-app="calculatorApp">
<head>
<title>AngularJS Calculator</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<style>
body {
font-family: Arial, sans-serif;
}
.calculator {
max-width: 400px;
margin: 50px auto;
padding: 20px;
border: 1px solid #ccc;
border-radius: 5px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
input {
width: 100%;
margin-bottom: 10px;
padding: 8px;
box-sizing: border-box;
}
button {
width: 100%;
padding: 10px;
background-color: #4CAF50;
color: white;
border: none;
border-radius: 3px;
cursor: pointer;
}
button:hover {
background-color: #45a049;
}
</style>
</head>
<body ng-controller="calculatorController">
<div class="calculator">
<h2>AngularJS Calculator</h2>
<label for="number">Enter a number:</label>
<input type="number" id="number" ng-model="inputNumber" placeholder="Enter a number" />
<button ng-click="calculateFactorial()">Calculate Factorial</button>
<p>Factorial: {{ factorialResult }}</p>
<button ng-click="calculateSquare()">Calculate Square</button>
<p>Square: {{ squareResult }}</p>
</div>
<script>
var app = angular.module('calculatorApp', []);
app.controller('calculatorController', function ($scope) {
$scope.calculateFactorial = function () {
var result = 1;
for (var i = 1; i <= $scope.inputNumber; i++) {
result *= i;
}
$scope.factorialResult = result;
};
$scope.calculateSquare = function () {
$scope.squareResult = Math.pow($scope.inputNumber, 2);
};
});
</script>
</body>
</html>
