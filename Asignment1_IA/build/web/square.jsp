<%-- 
    Document   : square
    Created on : Oct 23, 2016, 1:08:15 AM
    Author     : abdullah-fadhel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table style="border: 1px green solid;" id="to_be_slided">
        </table>

        <script>

            var to_be_slided = document.getElementById("to_be_slided"),
                    number_of_columns = parseInt(get("columns_number"));
            var td_white, td_blue, number_of_rows = 2 * number_of_columns - 1, row;

            console.log(number_of_rows);
            for (var i = 1; i <= number_of_rows; i++) {
                row = create_tr();
                if (i <= number_of_columns) {
                    for (var j = 1; j <= number_of_columns - (number_of_columns - i); j++) {
                        td_blue = create_blue_col();
                        row.appendChild(td_blue);
                    }
                    for (var j = 1; j <= number_of_columns - i; j++) {
                        td_white = create_white_col();
                        row.appendChild(td_white);
                    }
                } else {

                    for (var j = 1; j <= number_of_columns - (i - number_of_columns); j++) {
                        td_blue = create_blue_col();
                        row.appendChild(td_blue);
                    }

                    for (var j = 1; j <= (i - number_of_columns); j++) {
                        td_white = create_white_col();
                        row.appendChild(td_white);
                    }
                }
                to_be_slided.appendChild(row);
            }


            window.setTimeout(function () {
                to_be_slided.style.color = "red";
            }, 2000);

            var marg = 20;
            if (to_be_slided.clientHeight < 600 && to_be_slided.clientWidth < 600)
            {
                window.setTimeout(function () {
                    var interval = setInterval(function () {
                        to_be_slided.style.marginLeft = marg + "px";
                        marg += 20;
                        if (marg === 300) {
                            to_be_slided.style.webkitTransform = 'rotate(' + 90 + 'deg)';
                            to_be_slided.style.mozTransform = 'rotate(' + 90 + 'deg)';
                            to_be_slided.style.msTransform = 'rotate(' + 90 + 'deg)';
                            to_be_slided.style.oTransform = 'rotate(' + 90 + 'deg)';
                            to_be_slided.style.transform = 'rotate(' + 90 + 'deg)';
                            marg = 0;
                            goDown();
                            clearInterval(interval);
                        }
                    }, 500);
                }, 2500);
            }

            function goDown() {
                var interval = setInterval(function () {
                    to_be_slided.style.marginTop = marg + "px";
                    marg += 20;
                    if (marg === 300) {
                        to_be_slided.style.webkitTransform = 'rotate(' + -90 + 'deg)';
                        to_be_slided.style.mozTransform = 'rotate(' + -90 + 'deg)';
                        to_be_slided.style.msTransform = 'rotate(' + -90 + 'deg)';
                        to_be_slided.style.oTransform = 'rotate(' + -90 + 'deg)';
                        to_be_slided.style.transform = 'rotate(' + -90 + 'deg)';
                        clearInterval(interval);
                    }
                }, 500);
            }


            function get(name) {
                if (name = (new RegExp('[?&]' + encodeURIComponent(name) + '=([^&]*)')).
                        exec(location.search))
                    return decodeURIComponent(name[1]);
            }

            function create_tr()
            {
                var tr = document.createElement("tr");
                return tr;
            }

            function create_white_col()
            {
                var td_white = document.createElement("td");
                td_white.style = "border: 1px black solid;width: 50px;height: 20px;text-align: center;";
                return td_white;
            }

            function create_blue_col() {
                var td_blue = document.createElement("td");
                td_blue.style = "border: 1px black solid;width: 50px;height: 20px;background-color: blueviolet;text-align: center;";
                td_blue.innerText = "*";
                return td_blue;
            }
        </script>
    </body>
</html>
