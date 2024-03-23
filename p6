<!DOCTYPE html>
<html ng-app="todoApp">
<head>
<title>AngularJS ToDo App</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</head>
<body ng-controller="TodoController">
<h2>ToDo List</h2>
<form ng-submit="addTask()">
<input type="text" ng-model="newTask" placeholder="Add a new task" required />
<button type="submit">Add</button>
</form>
<ul>
<li ng-repeat="task in tasks">
<span>{{ task.name }}</span>
<button ng-click="editTask(task)">Edit</button>
<button ng-click="deleteTask(task)">Delete</button>
</li>
</ul>
<div ng-show="editingTask">
<h3>Edit Task</h3>
<form ng-submit="updateTask()">
<input type="text" ng-model="editingTask.name" required />
<button type="submit">Update</button>
<button type="button" ng-click="cancelEdit()">Cancel</button>
</form>
</div>
<script>
var app = angular.module('todoApp', []);
app.controller('TodoController', function ($scope) {
$scope.tasks = [];
$scope.newTask = '';
$scope.editingTask = null;
$scope.addTask = function () {
if ($scope.newTask.trim() !== '') {
$scope.tasks.push({ name: $scope.newTask });
$scope.newTask = '';
}
};
$scope.editTask = function (task) {
$scope.editingTask = angular.copy(task);
};
$scope.updateTask = function () {
var index = $scope.tasks.indexOf($scope.editingTask);
$scope.tasks[index] = $scope.editingTask;
$scope.editingTask = null;
};
$scope.cancelEdit = function () {
$scope.editingTask = null;
};
$scope.deleteTask = function (task) {
var index = $scope.tasks.indexOf(task);
$scope.tasks.splice(index, 1);
};
});
</script>
</body>
</html>
