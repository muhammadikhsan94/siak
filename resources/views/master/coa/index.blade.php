@extends('layouts.master')
@include('__partial.datatable')

@section('Main-Content')
<div class="page-breadcrumb">
    <div class="row">
        <div class="col-12 d-flex no-block align-items-center">
            <h4 class="page-title">{!! $judul !!}</h4>
            <div class="ms-auto text-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{!! url('/') !!}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{!! $judul !!}</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <!-- ============================================================== -->
    <!-- Table Start -->
    <!-- ============================================================== -->
    <div class="row">
        <div class="col-md-12">
            @if ($errors->any())
                <div class="alert alert-danger border-left-danger" role="alert">
                    <ul class="pl-4 my-2">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="card">
                <div class="card-body">
					<h4 class="card-title">{!! $judul !!}</h4><hr>
					<button type="button" class="btn btn-info mb-3" id="tambah-modal">
						<i class="fas fa-plus mr-1"></i> Tambah
					</button>
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="datatables" width="100%" cellspacing="0" data-url="{!! route($basepath.'.data') !!}">
							<thead>
								<tr>
									<th>No</th>
									<th>No. Akun</th>
									<th>Nama Akun</th>
									<th>Aksi</th>
								</tr>
							</thead>
						</table>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Table End -->
    <!-- ============================================================== -->
</div>

@include($basepath.'.modals')

@push('js')
<script>
    $(document).ready(function() {
        var table = $('#datatables').DataTable({
            processing: true,
            serverSide: true,
            autoWidth: false,
            ajax: {
                url: $('#datatables').data("url")
            },
            columns: [
                { data: 'DT_RowIndex', width: 50, class: 'text-center' },
                { data: 'no_coa', name: 'no_coa' },
                { data: 'nm_coa', name: 'nm_coa' },
                { data: 'action', name: 'action' }
            ],
            order:[[0,'asc']],
        });
        
        $('#tambah-modal').on('click', function() {
            $('#tambah').modal('show');
            $('#id_coa').val('');
            $('#id_coa_sub').val('').trigger('change');
            $('#no_coa').val('');
            $('#nm_coa').val('');
        });

        $(document).on('click', '.btn-edit', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            var url = $(this).data('url');
            $.ajax({
                type:'GET',
                url:url,
                success:function(result){
                    $('#tambah').modal('show');
                    $('#modal-title').html('Data Akun');
                    $('#id_coa').val(id);
                    $('#id_coa_sub').val(result.id_coa_sub);
                    $('#no_coa').val(result.no_coa);
                    $('#nm_coa').val(result.nm_coa);
                    $('#save-modal').show();
                }
            });
        });

        $('#save-modal').on('click', function() {
            var id_coa = $('#id_coa').val();
            var no_coa = $('#no_coa').val();
            var nm_coa = $('#nm_coa').val();
            var id_coa_sub = $('#id_coa_sub option:selected').val();

            var url = $(this).data('url');
            var data = {
                id_coa: id_coa,
                no_coa: no_coa,
                nm_coa: nm_coa,
                id_coa_sub: id_coa_sub
            };
            
            ajaxSubmit(url, data, table, 'tambah');
        });

        $(document).on('click', '.btn-destroy', function (e) {
            e.preventDefault();
            var url = $(this).data('url');
            ajaxDelete(url, table);
        });
    });
</script>
@endpush
@endsection