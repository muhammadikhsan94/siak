@extends('layouts.master')
@include('__partial.datatable')

@section('Main-Content')
<div class="page-breadcrumb">
    <div class="row">
        <div class="col-12 d-flex no-block align-items-center">
            <h4 class="page-title mr-2">{!! $judul !!}</h4>
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
									<th>Nama Peran</th>
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

@include('master.peran.modals')

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
                { data: 'DT_RowIndex', width: 100, class: 'text-center' },
                { data: 'nm_peran', name: 'nm_peran' },
                { data: 'action', name: 'action' }
            ],
            order:[[0,'asc']],
        });
        
        $('#tambah-modal').on('click', function() {
            $('#tambah').modal('show');
            $('#nm_peran').val('');
        });

        $('#save-modal').on('click', function() {
            var nm_peran = $('#nm_peran').val();

            var url = $(this).data('url');
            var data = {
                nm_peran: nm_peran
            };
            
            ajaxSubmit(url, data, table, 'tambah');
        });

        $(document).on('click', '.btn-show', function(e) {
            e.preventDefault();
            $('input').removeAttr('required readonly');
            $('#id_peran').val('');
            $('.nm_peran').val('');
            var url = $(this).data('url');
            $.ajax({
                type:'GET',
                url:url,
                success:function(result){
                    $('#show').modal('show');
                    $('#modal-title').html('Data Peran');
                    $('.nm_peran').attr('readonly','');
                    $('.nm_peran').val(result.nm_peran);
                    $('#update-modal').hide();
                }
            });
        })

        $(document).on('click', '.btn-edit', function(e) {
            e.preventDefault();
            $('input').removeAttr('required readonly');
            $('#id_peran').val('');
            $('.nm_peran').val('');
            var id = $(this).data('id');
            var url = $(this).data('url');
            $.ajax({
                type:'GET',
                url:url,
                success:function(result){
                    $('#show').modal('show');
                    $('#modal-title').html('Data Peran');
                    $('#id_peran').val(id);
                    $('.nm_peran').attr('required','');
                    $('.nm_peran').val(result.nm_peran);
                    $('#update-modal').show();
                }
            });
        })

        $('#update-modal').on('click', function() {
            var id_peran = $('#id_peran').val();
            var nm_peran = $('.nm_peran').val();

            var url = $(this).data('url');
            var data = {
                id_peran: id_peran,
                nm_peran: nm_peran
            };
            
            ajaxSubmit(url, data, table, 'show');
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