<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Frequency</th>
            </tr>
            {
            let $x := "has"
            let $all:= (collection('.?select=*.xml'))//bncDoc//stext//div//u//s//w[lower-case(normalize-space()) = $x]
            let $distinct := distinct-values(($all)/following-sibling::w[1])
            for $val in $distinct
            let $groups := $all/following-sibling::w[1][. = $val]
            order by count($groups) descending
            return
                <tr>
                    <td>{$x}</td>
                    <td>{$val}</td>
                    <td>{count($groups)}</td>
                </tr>
            }
        </table>
    </body>
</html>