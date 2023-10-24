<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="resultModel" scope="request" type="servlet.simple_servlet.model.ResultModel"/>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Результаты последнего вычисления</title>
	<style>
	body {
                background-color: #703535;
            }

            .wrapper {
                background-color: white;
                padding: 3%;
                margin: 5% auto;
                width: 50%;
                font-family: "Arial", sans-serif;
                font-size: 18px;
                color: #5c5c5c;
                border: 1px solid #8c8c8c;
                border-radius: 4px;
            }
	table {
            margin: 3%;
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 14px;
            border-collapse: collapse;
            text-align: center;
            }
            th, td:first-child {
                background: #AFCDE7;
                color: white;
                padding: 10px 20px;
            }
            th, td {
                border-style: solid;
                border-width: 0 1px 1px 0;
                border-color: white;
            }
            td {
                background: #D8E6F3;
            }
            th:first-child, td:first-child {
                text-align: left;
            }
	</style>
</head>
<body>
    <div class="wrapper">
        <a href="./">Назад</a>
        <h2>Результат последнего вычисления:</h2>
        <table>
            <thead>
                <tr>
                    <th>R</th>
                    <th>X</th>
                    <th>Y</th>
                    <th>Результат</th>
                    <th>Время</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${resultModel.r}</td>
                    <td>${resultModel.x}</td>
                    <td>${resultModel.y}</td>
                    <td>${resultModel.fallsIntoArea}</td>
                    <td>${resultModel.time}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>