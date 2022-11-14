@extends('Layouts.Master')
@include('__Partial.datatable')

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
									<th>Nama</th>
									<th>Username</th>
									<th>Peran</th>
									<th>Status</th>
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

@include('master.pengguna.modals')

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
                { data: 'nm_pengguna', name: 'nm_pengguna' },
                { data: 'username', name: 'username' },
                { data: 'nm_peran', name: 'nm_peran' },
                { data: 'status', name: 'status' },
                { data: 'action', name: 'action' }
            ],
            order:[[0,'asc']],
        });
        
        $('#tambah-modal').on('click', function() {
            $('#tambah').modal('show');
            $('#id_peran').val('').trigger('change');
            $('#username').val('');
            $('#nm_pengguna').val('');
            $('#jk').val('').trigger('change');
            $('#no_hp').val('');
            $('#alamat').val('');
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
                    $('#modal-title').html('Data Pengguna');
                    $('#id_pengguna').val(id);
                    $('#id_peran').val(result.id_peran);
                    $('#username').val(result.username);
                    $('#nm_pengguna').val(result.nm_pengguna);
                    $('#jk').val(result.jk);
                    $('#no_hp').val(result.no_hp);
                    $('#alamat').val(result.alamat);
                    $('#save-modal').show();
                }
            });
        });

        $('#save-modal').on('click', function() {
            var id_pengguna = $('#id_pengguna').val();
            var id_peran = $('#id_peran option:selected').val();
            var username = $('#username').val();
            var nm_pengguna = $('#nm_pengguna').val();
            var jk = $('#jk option:selected').val();
            var no_hp = $('#no_hp').val();
            var alamat = $('#alamat').val();

            var url = $(this).data('url');
            var data = {
                id_pengguna: id_pengguna,
                id_peran: id_peran,
                username: username,
                nm_pengguna: nm_pengguna,
                jk: jk,
                no_hp: no_hp,
                alamat: alamat
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