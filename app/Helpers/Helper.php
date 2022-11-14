<?php
if (!function_exists('uuid')) {
    /**
     * Generate a UUID (version 4) 
     * 
     * @return string
     */
    function uuid()
    {
        return (string) \Str::uuid();
    }
}
 
if (!function_exists('active_menu')) {
    /**
     * Check for active menu
     * 
     * @return string
     */
    function active_menu($route)
    {
        $route = str_replace('.index', '', $route);
        $current_route = Route::currentRouteName();
        $len = strlen($route);
        if(substr($current_route, 0, $len) == $route)
            return true;
        return false;
    }
}
if (!function_exists('active_groupmenu')) {
    /**
     * Check for active group menu
     * 
     * @return string
     */
    function active_groupmenu($path)
    {
        $current_route = Route::currentRouteName();
        $paths = explode('.', $current_route);
        if(is_array($path)) {
            foreach($path AS $index=>$item) {
                if(in_array($index, $paths)) {
                    return true;
                }
            }
        } else {
            return in_array($path, $paths);
        }
    }
}
if (!function_exists('generate_breadcrumbs')) {
    /**
     * Generate breadcrumbs based on current route
     * 
     * @return string
     */
    function generate_breadcrumbs()
    {
        $breadcrumbs = [];
        $path = explode('.',Route::currentRouteName());
        $route = $path[0];
        for($i = 1; $i < count($path); $i++){
            $route .= '.'.$path[$i];
            $breadcrumbs[route($route)] = __('menu.'.$route);
        }
        return $breadcrumbs;
    }
}
if (!function_exists('pagetitle')) {
    /**
     * Generate auto pagetitle
     * 
     * @return string
     */
    function pagetitle()
    {
        $breadcrumbs = [];
        $path = explode('.',Route::currentRouteName());
        $route = $path[0];
        for($i = 1; $i < count($path); $i++){
            $route .= '.'.$path[$i];
            $breadcrumbs[route($route)] = __('menu.'.$route);
        }
        return $breadcrumbs;
    }
}
if (!function_exists('verify_ajax_request')) {
    /**
     * Prevent access ajax directly from URL
     * 
     * @return string
     */
    function verify_ajax_request($request)
    {
        if (!$request->ajax() && config('app.debug') == false) {
            abort(403, 'Unauthorized action.');
        }
    }
}
if (!function_exists('has_access')) {
    /**
     * Validate if Authenticated user has access to this page
     * 
     * @return string
     */
    function has_access($route)
    {
        return true;
    }
}
if (!function_exists('data_access')) {
    /**
     * Validate if user is allowed to access this data
     * 
     * @return string
     */
    function data_access($id, $field = 'foundation_id')
    {
        $user = Auth::user();
        if($field == 'foundation_id')
        {
            if($id == $user->foundation_id)
                return true;
        }
        return false;
    }
}
if (!function_exists('is_uuid')) {
    /**
     * Prevent access ajax directly from URL
     * 
     * @return string
     */
    function is_uuid($uuid)
    {
        $UUIDv4 = '/^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i';
        if (preg_match($UUIDv4, $uuid))
            return true;
        return false;
    }
}
if (!function_exists('button')) {
    /**
     * Prevent access ajax directly from URL
     * 
     * @return string
     */
    function button($button, $route, $params = null)
    {
        if(has_access($route)){
            $url = \Route::has($route) ? route($route, $params) : '#';
            if($button == 'show'){
                return '<a href="'.$url.'" class="btn btn-info btn-mini" title="Detail"><i class="fa fa-eye"></i></a>';
            }elseif($button == 'edit'){
                return '<a href="'.$url.'" class="btn btn-primary btn-mini" title="Ubah"><i class="fas fa-edit"></i></a>';
            }elseif($button == 'destroy'){
                return '<form method="POST" action"'.$url.'" style="display:inline;">
                            <input type="hidden" name="_token" value="'.csrf_token().'">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="hidden" name="action" value="reload">
                            <button type="button" class="btn btn-danger btn-destroy btn-mini" title="Hapus"><i class="fa fa-trash"></i> Hapus</button>
                        </form>';
            }
            return '';
        }
    }
}
/**
 * Get all keys of multidimensional array
 */
if (! function_exists('array_keys_multi')) {
    function array_keys_multi(array $array)
    {
        $keys = array();
        foreach ($array as $key => $value) {
            $keys[] = $key;
            if (is_array($value)) {
                $keys = array_merge($keys, array_keys_multi($value));
            }
        }
        return $keys;
    }
}
/**
 * Get all keys of multidimensional array
 */
if (! function_exists('convert_date')) {
    function convert_date($oldformat, $newformat, $date)
    {
        if($date){
            if($newformat == 'Indonesia'){
                $datetime = \Carbon\Carbon::createFromFormat($oldformat, $date);
                $dates = explode('-',$datetime->format('d-m-Y'));
                $tanggal = $dates[0].' '.config('siakad.bulan')[$dates[1]].' '.$dates[2];
                if(strpos($oldformat, 'H:i:s') !== false)
                    $tanggal .= ' '.$datetime->format('H:i:s');
                return $tanggal;
            }else{
                return \Carbon\Carbon::createFromFormat($oldformat, $date)->format($newformat);
            }
        }
        return '';
    }
}
/**
 * Get IPK
 */
if (! function_exists('get_ipk')) {
    function get_ipk($transkrip)
    {
        return number_format( $transkrip->sks ? ($transkrip->bobot_nilai/$transkrip->sks) : 0, 2);
    }
}
/**
 * Get Name from Number
 */
if (! function_exists('getNameFromNumber')) {
    function getNameFromNumber($num) {
        $numeric = $num % 26;
        $letter = chr(65 + $numeric);
        $num2 = intval($num / 26);
        if ($num2 > 0) {
            return getNameFromNumber($num2 - 1) . $letter;
        } else {
            return $letter;
        }
    }
}
/**
 * Get Periode Date1 to Date2
 */
if (! function_exists('periodeDate')) {
    function periodeDate($date1 = 'dd/mm/yyyy', $date2 = 'dd/mm/yyyy') {
        $month = ['','Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'];
        $d1 = explode('/', $date1);
        $d2 = explode('/', $date2);
        $string = $d1[0];
        if($d1[2] == $d2[2]){
            if($d1[1] == $d2[1]){
                $string .= ' s.d '.$d2[0];
                $string .= ' '.$month[(int)$d2[1]];
            }else{
                $string .= ' '.$month[(int)$d1[1]];
                $string .= ' s.d '.$d2[0];
                $string .= ' '.$month[(int)$d2[1]];
            }
            $string .= ' '.$d1[2];
        }else{
            $string .= ' '.$month[(int)$d1[1]];
            $string .= ' '.$d1[2];
            $string .= ' s.d '.$d2[0];
            $string .= ' '.$month[(int)$d2[1]];
            $string .= ' '.$d2[2];
        }
        return $string;
    }
}
/**
 * Get Readable format of Bytes filesize
 */
function human_filesize($bytes, $decimals = 2, $definedSize = null) {
    $size = array('B','KB','MB','GB','TB','PB','EB','ZB','YB');
    if($definedSize){
        $factor = array_keys($size, $definedSize)[0];
    }
    else
        $factor = floor((strlen($bytes) - 1) / 3);
    return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . ' '. @$size[$factor];
}
/**
 * Get Words from Text
 */
if (! function_exists('get_words')) {
    function get_words($text, $count = 10)
    {
        $text = explode(' ', $text);
        $originCount = count($text);
        if (empty($text) == false) {
            $text = array_chunk($text, $count);
            $text = $text[0];
        }
        $text = implode(' ', $text);
        if($originCount > $count)
          $text .= " ...";
        return $text;
    }
  }
/**
 * Jumlah Semester
 */
if (! function_exists('jumlah_semester')) {
    function jumlah_semester($smt_mulai, $smt_aktif = null)
    {
        if(!$smt_aktif){
            $smt_aktif = \App\Models\Ref\Semester::periodeAktif("id");
        }
        $tahun1 = (int)substr($smt_mulai, 0, 4);
        $smt1 = (int)substr($smt_mulai, -1);
        $tahun2 = (int)substr($smt_aktif, 0, 4);
        $smt2 = (int)substr($smt_aktif, -1);
        $jml_smt = ($tahun2-$tahun1)*2;
        if($smt1 == $smt2)
            $jml_smt  += 1;
        elseif($smt1 < $smt2)
            $jml_smt += 2;
        elseif($smt1 > $smt2)
            $jml_smt -= 1;
        return $jml_smt;
    }
}
/**
 * Semester mahasiswa ke-x
 */
if (! function_exists('semester_target')) {
    function semester_target($smt_mulai, $jml_smt)
    {
        $semester = $smt_mulai;
        for($i = 0; $i < $jml_smt; $i++){
            $tahun = (int)substr($semester, 0, 4);
            $smt = (int)substr($semester, -1);
            if($smt % 2 == 0){ 
                if($i > 0){
                    $tahun++; 
                    $smt = 1;
                }
            } 
            else{ 
                $smt = 2;
            } 
            $semester = $tahun.$smt;
        }
        return [
            'id' => $semester,
            'tahun' => $tahun,
            'semester' => $smt,
            'nama_semester' => $tahun.'/'.($tahun+1).' '.config('siakad.semester')[$smt]
        ];
    }
}
/**
 * Timestamps
 */
if( !function_exists( 'currDateTime' ) ){
    function currDateTime()
    {
        return date('Y-m-d H:i:s');
    }
}
/**
 * Convert month en to id
 */
if( !function_exists('bulanIndonesia') ){
    function bulanIndonesia($o=false){
        $obj = [1=> 'Januari', 'Febuari', 'Maret',
                    'April',   'Mei',     'Juni',
                'Juli',    'Agustus', 'September',
                'Oktober', 'November','Desember'];
    
        if( $o === false )
            return $obj;
        else
            return( $obj[$o] );
    }
}
/**
 * Convert datetime to calendar id
 */
if( !function_exists( 'tglWaktuIndonesia' ) ){
    function tglWaktuIndonesia($date)
    {
        if( trim($date) != '' ){
            $pecah_waktu = explode(' ',$date);
          $arr_date = explode('-', $pecah_waktu[0]);
          $month = bulanIndonesia( sprintf("%d", $arr_date[1]) );
          return "{$arr_date[2]} {$month} $arr_date[0]".' '.$pecah_waktu[1];
        }
        return $date;
    }
  
}
/**
 * Convert number to currency
 */
if (!function_exists('number_to_currency')) {
    function number_to_currency($number, $rp = '', $belakang_koma = 0)
    {
        $new_number = number_format($number, $belakang_koma, ',', '.');
        return $rp . $new_number;
    }
}
