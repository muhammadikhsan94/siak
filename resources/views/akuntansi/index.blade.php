@extends('layouts.master')
@include('__partial.datatable')

@php
$role = \App\Models\Master\RolePengguna::where('id_pengguna', auth()->user()->id_pengguna)->where('id_peran', 1)->first();
@endphp

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
            <div class="card">
                <div class="card-body">
					<h4 class="card-title">
                        {!! $judul !!}
                    </h4><hr>
                    @if(is_null($role))
					<button type="button" class="btn btn-info mb-3" id="tambah-modal" data-url="{!! route($basepath.'.store') !!}">
						<i class="fas fa-plus mr-1"></i> Tambah
					</button>
                    @endif
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="datatables" width="100%" cellspacing="0" data-url="{!! route($basepath.'.data') !!}">
							<thead>
								<tr>
									<th>No</th>
									<th>Pelapor</th>
									<th>Tgl Upload Report</th>
									<th>Total Terisi</th>
									<th>Tgl Submit</th>
									<th>Verifikator</th>
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
                { data: 'nm_pelapor', name: 'tgl_create' },
                { data: 'tgl_create', name: 'tgl_create' },
                { data: 'total', name: 'total' },
                { data: 'tgl_submit', name: 'tgl_submit' },
                { data: 'nm_verifikator', name: 'nm_verifikator' },
                { data: 'a_submit', name: 'a_submit' },
                { data: 'action', name: 'action' }
            ],
            order:[[0,'asc']],
        });
        
        $('#tambah-modal').on('click', function() {
            var url = $(this).data('url');
            var data = {};

            ajaxSubmit(url, data, table);
        });

        $(document).on('click', '.btn-add', function(e) {
            e.preventDefault();
            var url = $(this).data('url');
            window.location.href = url;
        })

        $(document).on('click', '.btn-print', function(e) {
            e.preventDefault();
            var url = $(this).data('url');
            window.location.href = url;
        })

        $(document).on('click', '.btn-verifikasi', function(e) {
            var url = $(this).data('url');
            var data = {};

            ajaxSubmit(url, data, table);
        })
    });
</script>
@endpush

@endsection