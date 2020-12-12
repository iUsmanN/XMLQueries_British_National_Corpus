<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Probability</th>
            </tr>
            {
            let $x := "has"
            let $words := (collection('.?select=*.xml'))//bncDoc//stext//div//u//s//w
            let $targetWords:= $words[lower-case(normalize-space()) = $x]
            let $distinct := distinct-values(($targetWords)/following-sibling::w[1])
            for $val in $distinct
            let $groups := $targetWords/following-sibling::w[1][. = $val]
            let $occurances := $words[. = $val]
            order by count($groups) div count($occurances) descending
            return
                <tr>
                    <td>{$x}</td>
                    <td>{$val}</td>
                    <td>{count($groups) div count($occurances)}</td>
                </tr>
            }
        </table>
    </body>
</html>