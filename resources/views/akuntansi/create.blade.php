@extends('layouts.master')
@include('__partial.datatable')

@php
$s = \App\Models\AkuntansiReporting::where('id_coa_reporting', $id)->first();
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
                        <li class="breadcrumb-item"><a href="{!! route($basepath) !!}">{!! ucwords($basepath) !!}</a></li>
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
        <div class="col-md-4 col-12">
            <div class="card">
                <div class="card-body">
					<h4 class="card-title">Bagan Akun</h4><hr>
                    @if(!empty($all) && $all == '1' && $s->a_submit==0 && is_null($role))
                    <button class="btn btn-warning text-light p-3 my-3 col-12" id="kunci-button" data-url="{!! route($basepath.'.kunci', $id) !!}"><i class="fas fa-key me-2"></i>KUNCI DATA</button>
                    <hr>
                    @endif
                    @foreach(\App\Models\Master\COA::whereNull('id_coa_sub')->orderby('created_at')->get() AS $no=>$item)
                    @php
                    $temp = \App\Models\Master\COA::where('id_coa_sub', $item->id_coa)->pluck('id_coa');
                    $check = \App\Models\Akuntansi::where('id_coa_reporting', $id)->whereIn('id_coa', $temp)->count();
                    @endphp
                    <button class="btn {!! ($check==0) ? 'btn-info text-light' : 'btn-success text-light' !!} col-12 mb-2 navButton" data-url="{!! route($basepath.'.create_id', [$id, $item->id_coa]) !!}"><i class="fas {!! ($check>0) ? 'fa-check' : 'fa-edit' !!} me-2"></i>{!! $item->nm_coa !!}</button>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="col-md-8 col-12">
            <div class="card">
                <div class="card-body">
					<h4 class="card-title" id="card-title"></h4><hr>
                    @if(!empty($data))
					<div class="table-responsive" id="tabel">
						<table class="table table-striped table-bordered table-hover datatables" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>No. Akun</th>
									<th>Uraian</th>
									<th>Nilai</th>
								</tr>
							</thead>
                            <tbody>
                                @foreach($data AS $no=>$r)
                                @php
                                $value = \App\Models\Akuntansi::where('id_coa_reporting', $id)->where('id_coa', $r->id_coa)->sum('total');
                                @endphp
                                <tr>
                                    <td>{!! $r->no_coa !!}</td>
                                    <td>{!! $r->nm_coa !!}</td>
                                    <td>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input id="id_coa_header" type="hidden">
                                            <input class="form-control money" name="total[]" id="{!! $r->id_coa !!}" type="text" value="{!! number_to_currency($value) ?? 0 !!}" pattern="[0-9]+([,\.][0-9]+)?" {!! ($s->a_submit==0 && is_null($role)) ? 'required' : 'readonly' !!}>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="2">Total</th>
                                    <th>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input class="form-control" id="subtotal" type="text" value="0" pattern="[0-9]+([,\.][0-9]+)?" readonly>
                                        </div>
                                    </th>
                                </tr>
                            </tfoot>
						</table>
					</div>
                    @if($s->a_submit==0 && is_null($role))
                    <div class="my-3 text-right">
                        <button class="btn btn-primary ml-auto" id="save-button" data-url="{!! route($basepath.'.update', [$id, $id_coa_header]) !!}"><i class="fas fa-save me-2"></i>UPDATE</button>
                    </div>
                    @endif
                    @endif
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

    function convertToAngka(angka)
    {
        var rupiah = '';
        angka = angka.replace(/[^0-9]/g, '');
        var angkarev = angka.toString().split('').reverse().join('');
        for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.';
        return rupiah.split('',rupiah.length-1).reverse().join('');
    }

    $(document).ready(function() {

        var urlLength = (location.pathname.split('/').length - 1) - (location.pathname[location.pathname.length - 1] == '/' ? 1 : 0);

        $('.money').on('keyup change', function() {
            var id = this.id;
            $('#'+id).val( convertToAngka($(this).val()) );
        });

        if(urlLength<3) {
            $('#tabel').hide();
            $('#card-title').html('Pilih Bagan Akun Terlebih Dahulu');
        } else {
            $('#tabel').show();
            $('#card-title').html('Masukkan Nilai Akun');
        }

        $('.navButton').on('click', function() {
            var url = $(this).data('url');
            window.location.href = url;
        })

        $('#save-button').on('click', function() {
            var id_coa_sub = $('#id_coa_header').val();
            var url = $(this).data('url');
            
            var data = {};
            $(".money").each(function() {
                data[this.id] = $(this).val();
            });
            
            ajaxSubmit(url, data);

            window.location.href = window.location.href;
        });

        $('#kunci-button').on('click', function() {
            var url = $(this).data('url');

            swal({
                title: "Apakah anda yakin akan mengunci data ini?",
                text: "",
                icon: "warning",
                dangerMode: true,
                buttons: ["Batal", "Ya!"],
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: 'POST',
                        url: url,
                        success:function(msg){
                            if(msg=='success') {
                                sweetalert('success', 'Data Berhasil Dikunci !');
                                window.location.replace('http://' + window.location.hostname + '/akuntansi');
                            } else {
                                sweetalert('error', msg);
                            }
                        }
                    });
                }
            });
        });

        let subtotal = 0;
        $.each($('.money'), function(index,value) {
            subtotal += parseInt($(this).val().replace(/[^0-9]/g, ''));
        });
        $('#subtotal').val(convertToAngka(subtotal.toString()));
    });
</script>
@endpush

@endsection