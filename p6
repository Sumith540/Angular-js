<!DOCTYPE html>
<html lang="en" ng-app="todoApp">
<head>
    <meta charset="UTF-8">
    <title>AngularJS Todo List</title>
    <style>
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 5px 0;
        }
        .completed {
            text-decoration: line-through;
        }
    </style>
</head>
<body ng-controller="TodoController">
    <h1>Todo List</h1>
    <form ng-submit="addTask()">
        <input type="text" ng-model="newTask" placeholder="Add a new task" required>
        <button type="submit">Add</button>
    </form>
    <ul>
        <li ng-repeat="task in tasks">
            <input type="checkbox" ng-model="task.completed">
<span ng-class="{completed: task.completed}">{{ task.text }}</span>
            <button ng-click="editTask(task)">Edit</button>
            <button ng-click="deleteTask(task)">Delete</button>
        </li>
    </ul>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script>
        var app = angular.module('todoApp', []);
        app.controller('TodoController', function($scope) {
            $scope.tasks = [];
            $scope.newTask = '';
            $scope.addTask = function() {
                if ($scope.newTask.trim() !== '') {
                    $scope.tasks.push({ text: $scope.newTask, completed: false });
                    $scope.newTask = '';
                }
            };
            $scope.editTask = function(task) {
                var editedTask = prompt('Edit task:', task.text);
                if (editedTask !== null) {
                    task.text = editedTask;
                }
            };
            $scope.deleteTask = function(task) {
                var index = $scope.tasks.indexOf(task);
                if (index !== -1) {
                    $scope.tasks.splice(index, 1);
                }
            };
        });
    </script>
</body>
</html>
