<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class ReportPengguna implements FromView, WithTitle, ShouldAutoSize
{
    private $d;

    public function __construct($d)
    {
        $this->d = $d;
    }

    /**
     * @return Builder
     */
    public function view(): View
    {
        $d = $this->d;
        return view('print.pengguna', $d);
    }

    /**
     * @return string
     */
    public function title(): string
    {
        return 'Report Akuntansi';
    }
    
}
