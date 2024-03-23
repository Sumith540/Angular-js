<!DOCTYPE html>
<html lang="en" ng-app="loginApp">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<style>
.error {
color: red;
}
</style>
</head>
<body>
<div ng-controller="loginController as loginCtrl">
<h2>Login Form</h2>
<form name="loginForm" ng-submit="loginCtrl.submitForm()" novalidate>
<label for="username">Username:</label>
<input type="text" id="username" name="username" ng-model="loginCtrl.user.username"
required>
<span class="error" ng-show="loginForm.username.$dirty && loginForm.username.$invalid">
<span ng-show="loginForm.username.$error.required">Username is required.</span>
</span>
<br>
<label for="password">Password:</label>
<input type="password" id="password" name="password" ng-model="loginCtrl.user.password"
required>
<span class="error" ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
<span ng-show="loginForm.password.$error.required">Password is required.</span>
</span>
<br>
<button type="submit" ng-disabled="loginForm.$invalid">Login</button>
</form>
</div>
<script>
angular.module('loginApp', [])
.controller('loginController', function () {
var vm = this;
vm.user = {};
vm.submitForm = function () {
// Perform login logic here
console.log('Logging in:', vm.user);
};
});
</script>
</body>
</html>
