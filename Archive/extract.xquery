<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
            </tr>
            {
            let $x := "has"
            for $s in (collection('.?select=*.xml'))//bncDoc//stext//div//u//s//w[lower-case(normalize-space()) = $x]
            for $w in $s
            return
                <tr>
                    <td>{$x}</td>
                    <td>{$w/following-sibling::w[1]/text()}</td>
                </tr>
            }
        </table>
    </body>
</html>