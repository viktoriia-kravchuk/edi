<!DOCTYPE html>
<html>
<head>
    <title>Zadanie domowe EDI</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style2.css">
    <meta name="author" content="Viktoriia Kravchuk">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h1>Informatyka stosowana</h1>
<h2>WZISS1-1112</h2>
<h2>Viktoriia Kravchuk</h2>
<table id="plan">
    <thead>
    <tr>
        <th>Termin</th>
        <th>Dzień,godzina</th>
        <th>Przedmiot</th>
        <th>Typ</th>
        <th>Nauczyciel</th>
        <th>Sala</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
<script>
    $(document).ready(function () {
        $.getJSON("plan.json", function (data) {
            var json = data['zajecia'];
            var row;
            for (var i = 0; i < json.length; i++) {
                if (json[i].hasOwnProperty( "kolokwium")) {
                    row = "<tr class='red' id='jsonObj_"+[i]+"'>";
                } else {
                    row = "<tr >"
                }
                row += "<td class='termin'>" + json[i]['termin'] + '</td>' +
                    "<td class='godziny'>" + json[i]['dzien'] + ' ' + json[i]['od-godz'] + '-' + json[i]['do-godz'] + " </td>" +
                    "<td class='przedmiot'>" + json[i]['przedmiot'] + " </td>" +
                    "<td class='typ'>" + json[i]['typ'] + "</td>";
                "</tr>";
                if (json[i]['nauczyciel'].hasOwnProperty('#text')) {
                    row += "<td class='nauczyciel'>" + json[i]['nauczyciel']['#text'] + "</td>";

                } else {
                    row += "<td></td>"
                }
                if (json[i].hasOwnProperty('sala')) {
                    row += "<td class='sala'>" + json[i]['sala'] + "</td>";
                } else {
                    row += "<td></td>"
                }

                $('#plan').append(row);
            }


            $(".przedmiot").click(function () {
            var obj=this.id.split('_')[1]
            var eng=json[obj]['przedmiot']+'\n'+json[obj]['przedmiot_eng'];
            this.innerText=eng
            });
            $(".przedmiot").dblclick(function(){
            var obj=this.id.split('_')[1]
            var pl=json[obj]['przedmiot'];
            this.innerText=pl
            })
            $(".red").mouseover(function () {
            var obj=this.id.split('_')[1]
            var message='Zakres tematyczny obowiązujący na kolokwium: '+json[obj]['kolokwium'];
            alert(message)

            });
        })
       
    })
</script>
</body>
</html>