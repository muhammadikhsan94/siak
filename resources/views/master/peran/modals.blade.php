@push('modals')
<div class="modal" id="tambah" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal-title">Tambah Peran</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group row">
                    <label class="col-md-4">Nama Peran<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <input type="text" id="nm_peran" class="form-control" placeholder="nama peran" required>
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

<div class="modal" id="show" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal-title"></h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
                <input id="id_peran" type="hidden">
				<div class="form-group row">
                    <label class="col-md-4">Nama Peran<span class="required-label">*</span></label> 
                    <div class="col-md-8">
                        <input type="text" class="form-control nm_peran" required>
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" id="update-modal" class="btn btn-info" data-url="{!! route($basepath.'.store') !!}"><i class="fa fa-save"></i> Simpan</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fa fa-times"></i> Close</button>
			</div>
		</div>
	</div>
</div>
@endpush