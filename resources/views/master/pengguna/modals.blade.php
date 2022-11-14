
@push('modals')
<div class="modal" id="tambah" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Tambah Pengguna</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
                <input id="id_pengguna" type="hidden">
				<div class="form-group row">
                    <label class="col-md-4">Role<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <select class="form-control select2" id="id_peran" required>
                            <option value="" selected disabled>Pilih</option>
                            @foreach(\App\Models\Master\Peran::getList() AS $no=>$item)
                            <option value="{!! $item->id_peran !!}">{!! $item->nm_peran !!}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">Username<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <input type="text" id="username" class="form-control" placeholder="username" required>
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">Nama Pengguna<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <input type="text" id="nm_pengguna" class="form-control" placeholder="nama pengguna" required>
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">Jenis Kelamin<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <select class="form-control" id="jk" required>
                            <option value="" selected disabled>Pilih</option>
                            <option value="l">Laki-laki</option>
                            <option value="p">Perempuan</option>
                        </select>
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">No. HP<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <input type="number" id="no_hp" class="form-control" placeholder="no HP" required>
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">Alamat<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <textarea class="form-control" id="alamat" required></textarea>
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" id="save-modal" class="btn btn-info" data-url="{!! route($basepath.'.store') !!}"><i class="fa fa-save"></i> Simpan</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fa fa-times"></i> Close</button>
			</div>
		</div>
	</div>
</div>
@endpush