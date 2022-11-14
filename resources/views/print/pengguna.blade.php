<table>
    <thead>
    <tr>
        <th width="10" style="text-align: left">No. Akun</th>
        <th width="50" style="text-align: left">Uraian</th>
        <th width="20" style="text-align: right">Total</th>
    </tr>
    </thead>
    <tbody>
        @foreach($data as $r)
        <tr>
            <th colspan="3" style="text-align: left">{{ $r->nm_coa }}</th>
        </tr>
        @foreach($r->report AS $t)
        <tr>
            <td>{{ $t->no_coa }}</td>
            <td>{{ $t->nm_coa }}</td>
            <td style="text-align: right">{{ $t->total }}</td>
        </tr>
        @endforeach
        @endforeach
    </tbody>
    <tfoot>
        <tr></tr>
        <tr>
            <th colspan="2" align="left">Total</th>
            <th align="right">{{ $total }}</th>
        </tr>
    </tfoot>
</table>