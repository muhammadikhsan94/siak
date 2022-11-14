
@push('modals')
<div class="modal" id="tambah" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal-title">Tambah Akun</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
                <input id="id_coa" type="hidden">
				<div class="form-group row">
                    <label class="col-md-4">Kepala Akun</label> 
                    <div class="col-md-8">
                        <select class="form-control select2" id="id_coa_sub">
                            <option value="" selected disabled>Pilih</option>
                            @foreach(\App\Models\Master\COA::whereNull('id_coa_sub')->whereNull('deleted_at')->orderby('created_at')->get() AS $no=>$item)
                            <option value="{!! $item->id_coa !!}">{!! strtoupper($item->nm_coa) !!}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">No. Akun</label> 
                    <div class="col-md-8">
                        <input type="number" id="no_coa" class="form-control" placeholder="no akun">
                    </div>
                </div>
				<div class="form-group row">
                    <label class="col-md-4">Nama Akun<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <input type="text" id="nm_coa" class="form-control" placeholder="nama akun" required>
                    </div>
                </div>
                <i><span class="required-label">*</span> wajib</i>
			</div>
			<div class="modal-footer">
				<button type="button" id="save-modal" class="btn btn-info" data-url="{!! route($basepath.'.store') !!}"><i class="fa fa-save"></i> Simpan</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fa fa-times"></i> Close</button>
			</div>
		</div>
	</div>
</div>
@endpush