<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="resultsBean" scope="request" type="servlet.simple_servlet.model.ResultsBean"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Лабораторная</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/3.1.2/svg.min.js" integrity="sha512-I+rKw3hArzZIHzrkdELbKqrXfkSvw/h0lW/GgB8FThaBVz2e5ZUlSW8kY8v3q6wq37eybIwyufkEZxe4qSlGcg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style type="text/css">
        #svg{
            margin-top: 5%;
            margin-right: 70px;
            width: 420px;
            height: 500px;
            display: inline-block;
        }
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
        form{
            margin-top: 10%;
            width: 33%;
            display: inline-block;
            vertical-align: top;
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
        input[type='submit'] {
            margin-top: 5%;
            padding: 10px;
            border: none;
            background-color: #297a61;
            color: #fff;
            font-weight: 600;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }
        input[type=text] {
            border: 1px solid #fff;
            width: 100%;
            padding:10px;
            margin:10px 0;
            box-shadow:0 0 15px 4px rgba(0,0,0,0.08);
            border-radius:10px;
        }
        select{
            margin: 10px 0;
            border: 1px solid #fff;
            width: 100%;
            padding:10px;
            border-radius:10px;
            background-color: #fff;
            box-shadow:0 0 15px 4px rgba(0,0,0,0.08);
        }
        button.r_selection{
            padding: 7px;
            border: none;
            background-color: #297a61;
            color: #fff;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
        }
        form input:disabled {
            background-color: #92bdaf;
            cursor: default;
        }
        *:focus {
            outline: none;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="header">
        <div>Авшистер Ольга Аркадьевна</div>
        <div>Группа: P3213</div>
        <div>Вариант: 2370</div>
        <div>Лабораторная работа №2</div>
    </div>
    <h4>Результаты последних вычислений:</h4>
    <table>
        <thead>
        <tr>
            <th>R</th>
            <th>X</th>
            <th>Y</th>
            <th>Результат</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="result" items="${resultsBean.resultsList}">
            <tr>
                <td>${result.r}</td>
                <td>${result.x}</td>
                <td>${result.y}</td>
                <td>${result.fallsIntoArea}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h4>Для определения попадания точки в область, выберите параметр R и кликните на координатную плоскость</h4>
    <div id="svg">

    </div>
    <form id="form" action="./" method="get">
        <div>
            <label for="field_x1">Параметр X {-5, ..., 3}</label><br>
            <input checked type="radio" id="field_x1" class="field_x" name="x" value="-5" onchange="handleRadioChange();"><label for="field_x1">-5</label><br>
            <input type="radio" id="field_x2" class="field_x" name="x" value="-4" onchange="handleRadioChange();"><label for="fielx_x2">-4</label><br>
            <input type="radio" id="field_x3" class="field_x" name="x" value="-3" onchange="handleRadioChange();"><label for="field_x3">-3</label><br>
            <input type="radio" id="field_x4" class="field_x" name="x" value="-2" onchange="handleRadioChange();"><label for="fielx_x4">-2</label><br>
            <input type="radio" id="field_x5" class="field_x" name="x" value="-1" onchange="handleRadioChange();"><label for="field_x5">-1</label><br>
            <input type="radio" id="field_x6" class="field_x" name="x" value="0" onchange="handleRadioChange();"><label for="field_x6"> 0</label><br>
            <input type="radio" id="field_x7" class="field_x" name="x" value="1" onchange="handleRadioChange();"><label for="field_x7"> 1</label><br>
            <input type="radio" id="field_x8" class="field_x" name="x" value="2" onchange="handleRadioChange();"><label for="field_x8"> 2</label><br>
            <input type="radio" id="field_x9" class="field_x" name="x" value="3" onchange="handleRadioChange();"><label for="field_x9"> 3</label><br>
            <br>
        </div>
        <div>
            <label for="field_y">Y [-5; 3]</label>
            <input id="field_y" type="text" name="y">
        </div>
        <div>
            <label for="field_r">Параметр R [2; 5]</label><br>
            <input id="field_r" type="text" name="r">
        </div>
        <input disabled id="send" type="submit" value="Рассчитать">
    </form>
</div>
</body>

<script>
    R = 150
    cntr = 190
    let draw = SVG().addTo('#svg').size(500, 500)
    var circle = draw.circle()
    circle.radius(R).center(cntr, cntr).fill('#55a6e7')

    var rect = draw.rect({width: R, height: R, x: cntr, y: cntr-R}).fill('#fff')
    var rect = draw.rect({width: R, height: R, x: cntr-R, y: cntr-R}).fill('#fff')
    var rect = draw.rect({width: R, height: R, x: cntr, y: cntr}).fill('#fff')
    var polyline = draw
        .polyline([
            [cntr-R/2, cntr],
            [cntr-R/2, cntr-R],
            [cntr, cntr-R],
            [cntr, cntr-R/2],
            [cntr+R/2, cntr],
        ])
        .fill('#55a6e7').stroke({ width: 1 })

    draw.line(cntr, 2*cntr, cntr, 0).stroke({ width: 1 , color: '#000'})
    draw.line(0, cntr, 2*cntr, cntr).stroke({ width: 1 , color: '#000'})

    var textX = draw.text("X").attr({x:2*cntr, y: cntr-10})
    var textY = draw.text("Y").attr({x:cntr+10, y: 15})


    var svgElement = document.getElementById('svg')
    var fieldR = document.getElementById('field_r')
    var fieldY = document.getElementById('field_y')
    var fieldX = document.querySelector('input[name="x"]:checked')
    var form = document.getElementById('form')
    var submitE = document.getElementById("send");
    var isUserPointStaged = false;
    function sendUserPoint(event) {
        if(!(isValid(fieldR.value) && fieldR.value !== '' &&  fieldR.value>=2 && fieldR.value<=5)){
            alert('Пожалуйста, введите параметр R')
            return
        }
        offsetTop = svgElement.offsetTop-window.scrollY
        offsetLeft = svgElement.offsetLeft
        x = event.clientX-offsetLeft-cntr
        y = cntr-event.clientY+offsetTop
        fieldX.value = Math.round(x/R*fieldR.value*100)/100
        fieldY.value = Math.round(y/R*fieldR.value*100)/100
        if(isUserPointStaged){
            draw.last().remove()
        }
        drawPoint(x, y, 1)
        isUserPointStaged = true;
        form.submit()
    }



    function drawPoint(x, y, r){
        offsetTop = svgElement.offsetTop+window.scrollY
        offsetLeft = svgElement.offsetLeft
        draw.circle().radius(2).center((x/r+cntr), (cntr-y/r)).fill('#000')
    }
    svgElement.addEventListener("click", sendUserPoint);




    function set_x(x){
        document.getElementById('field_x').value=x;
        onInput_x();
    }


    //JSP FOREACH

    <c:forEach var="result" items="${resultsBean.resultsList}">
        drawPoint((${result.x} * R), (${result.y} * R), ${result.r})
    </c:forEach>


    function isValid(value) {
        return REGEXP.test(value);
    }

    const REGEXP = /^[-]?[0-9]*[.,]?[0-9]+$/ui;


/*    function onInput_x() {
        if (isValid(fieldX.value) && fieldX.value>=-5 && fieldX.value<=3) {
            fieldX.style.borderColor = 'green'
        } else {
            fieldX.style.borderColor = 'red'
        }
        checkAllFields();
    }*/
    function onInput_y() {
        if (isValid(fieldY.value) && fieldY.value>=-5 && fieldY.value<=3) {
            fieldY.style.borderColor = 'green'
        } else {
            fieldY.style.borderColor = 'red'
        }
        checkAllFields();
    }
    function onInput_r() {
        if (isValid(fieldR.value) && fieldR.value !== '' &&  fieldR.value>=2 && fieldR.value<=5) {
            fieldR.style.borderColor = 'green'
        } else {
            fieldR.style.borderColor = 'red'
        }
        checkAllFields();
    }
    function handleRadioChange(){
        fieldX = document.querySelector('input[name="x"]:checked')
    }
    //fieldX.addEventListener('change', onInput_x);
    fieldY.addEventListener('input', onInput_y);
    fieldR.addEventListener('input', onInput_r);
    function checkAllFields() {
        if ((isValid(fieldY.value) && fieldY.value>=-5 && fieldY.value<=3) &&
            isValid(fieldR.value) && fieldR.value !== '' &&  fieldR.value>=2 && fieldR.value<=5 &&
            isValid(fieldX.value)) {
            submitE.disabled = false;
        } else {
            submitE.disabled = true;
        }
    }
</script>

</html>