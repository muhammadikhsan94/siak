<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::group([

    'namespace' => 'App\Http\Controllers',

], function () {

    Route::middleware(['auth'])->group(function () {

        Route::get('', 'HomeController@index')->name('index');

        Route::get('akuntansi', 'AkuntansiController@index')->name('akuntansi');
        Route::get('akuntansi/data', 'AkuntansiController@data')->name('akuntansi.data');
        Route::post('akuntansi', 'AkuntansiController@store')->name('akuntansi.store');
        Route::delete('akuntansi', 'AkuntansiController@destroy')->name('akuntansi.destroy');
        Route::get('akuntansi/{id}', 'AkuntansiController@create')->name('akuntansi.create');
        Route::get('akuntansi/{id}/{coa_header}', 'AkuntansiController@create_id')->name('akuntansi.create_id');
        Route::post('akuntansi/{id}/{coa_header}', 'AkuntansiController@update')->name('akuntansi.update');
        Route::post('akuntansi/{id}', 'AkuntansiController@kunci')->name('akuntansi.kunci');

        Route::name('print.')->group(function() {
            Route::get('print/pengguna/{id}', 'PrintController@pengguna')->name('pengguna');
        });


        Route::name('master.')->namespace('Master')->group(function() {
            // PENGGUNA
            Route::get('pengguna', 'PenggunaController@index')->name('pengguna');
            Route::get('pengguna/data', 'PenggunaController@data')->name('pengguna.data');
            Route::post('pengguna', 'PenggunaController@store')->name('pengguna.store');
            Route::get('pengguna/{id}', 'PenggunaController@show')->name('pengguna.show');
            Route::delete('pengguna/{id}', 'PenggunaController@destroy')->name('pengguna.destroy');
            //PERAN
            Route::get('peran', 'PeranController@index')->name('peran');
            Route::get('peran/data', 'PeranController@data')->name('peran.data');
            Route::post('peran', 'PeranController@store')->name('peran.store');
            Route::get('peran/{id}', 'PeranController@show')->name('peran.show');
            Route::delete('peran/{id}', 'PeranController@destroy')->name('peran.destroy');
            //COA
            Route::get('coa', 'CoaController@index')->name('coa');
            Route::get('coa/data', 'CoaController@data')->name('coa.data');
            Route::post('coa', 'CoaController@store')->name('coa.store');
            Route::get('coa/{id}', 'CoaController@show')->name('coa.show');
            Route::delete('coa/{id}', 'CoaController@destroy')->name('coa.destroy');
        });
    });

});
