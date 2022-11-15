@extends('layouts.master')

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
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <div class="border-left text-center p-t-10">
                        <h3 class="mb-0 font-weight-bold" id="t_koperasi">{!! $t_koperasi ?? $t_laporan !!}</h3>
                        <span class="text-muted">{!! (!empty($t_koperasi)) ? 'Total Koperasi' : 'Total Laporan' !!}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <div class="border-left text-center p-t-10">
                        <h3 class="mb-0 font-weight-bold" id="t_terlapor">{!! number_to_currency($t_terlapor, 'Rp. ') !!}</h3>
                        <span class="text-muted">Total Terlapor</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Table End -->
    <!-- ============================================================== -->
</div>

@endsection