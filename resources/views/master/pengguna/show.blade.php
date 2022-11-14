<input type="hidden" id="id_pengguna" value="{{ $id }}">
@if(count($stase) > 0)
@foreach($stase as $r)
<div class="form-group row" style="border-bottom: solid 1px #ddd;">
    <label class="col-md-9 mt-sm-2">{{ $r->nama_stase }} ({{ $r->jenis }})</label> 
    <div class="col-md-3">
        <input type="hidden" name="id_stase[]" class="id_stase" value="{{ $r->id }}">
        <input type="text" name="daya_tampung[]" class="form-control daya_tampung integeronly" value="{{ @$dayatampung[$r->id] ?? 0 }}">
    </div>
</div>
@endforeach
@else
<div class="alert alert-danger">
    <h4 class="text-danger">Stase tidak ditemukan</h4>
    <p>Pastikan Anda telah mengatur <b><a href="{{ route('mk-kurikulum.kurikulum-prodi.mata-kuliah', $data->id_kurikulum_prodi) }}">Mata Kuliah Kurikulum Prodi</a></b></p>
</div>
@endif