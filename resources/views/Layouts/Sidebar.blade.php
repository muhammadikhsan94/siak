<!-- ============================================================== -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<aside class="left-sidebar" data-sidebarbg="skin5">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav" class="pt-4">

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{!! url('/') !!}" aria-expanded="false">
                        <i class="fas fa-home me-2"></i>
                        <span class="hide-menu">Beranda</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{!! url('akuntansi') !!}" aria-expanded="false">
                        <i class="fas fa-balance-scale me-2"></i>
                        <span class="hide-menu">Akuntansi</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="fas fa-cog me-2"></i>
                        <span class="hide-menu">Master Data</span>
                    </a>
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item"><a href="{!! url('pengguna') !!}" class="sidebar-link">
                            <i class="fas fa-circle me-2"></i>
                            <span class="hide-menu"> Pengguna</span></a>
                        </li>
                        <li class="sidebar-item"><a href="{!! url('peran') !!}" class="sidebar-link">
                            <i class="fas fa-circle me-2"></i>
                            <span class="hide-menu"> Peran</span></a>
                        </li>
                        <li class="sidebar-item"><a href="{!! url('coa') !!}" class="sidebar-link">
                            <i class="fas fa-circle me-2"></i>
                            <span class="hide-menu"> Bagan Akun (CoA)</span></a>
                        </li>
                    </ul>
                </li>

            </ul>
        </nav>
        <!-- End Sidebar navigation -->
        <div class="d-block text-light text-center px-4" style="bottom:0;position:absolute;">
            &copy {{date('Y')}} <a href="{{ url('/') }}"></a> All Rights Reserved.<br>
            Modified by <a href="http://muhammadikhsan94.github.io">MI</a>.
        </div>
    </div>
    <!-- End Sidebar scroll-->
</aside>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->