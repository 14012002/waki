<?php

use App\Http\Controllers\Admin\DanhMucController;
use App\Http\Controllers\Admin\DonHangController;
use App\Http\Controllers\Admin\SanPhamController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\BinhLuanController;
use App\Http\Controllers\Admin\LienHeController;
use App\Http\Controllers\Admin\TinTucController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Client\ClientController;
use App\Http\Controllers\Client\DonHangController as ClientDonHangController;
use App\Http\Controllers\Client\GioHangController;
use App\Http\Controllers\Client\SanPhamController as ClientSanPhamController;
use App\Http\Controllers\Client\UserController as ClientUserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('client.index');
// });
Route::prefix('/')->as('client.')->group(function(){
    Route::get('/', [ClientController::class, 'index'])->name('index');
    Route::get('/tat-ca-sanpham', [ClientController::class, 'allSanPham'])->name('sanpham.all');
    Route::get('/danhmucsanpham/{id}',[ClientController::class,'danhMucSanPham'])->name('sanpham.danhmucsanpham');
    Route::get('/chi-tiet-san-pham/{id}', [ClientSanPhamController::class, 'detailSanPham'])->name('sanpham.chitiet');
    Route::post('/store-review', [ClientController::class, 'storeReview'])->name('review.store');
    Route::get('/gio-hang', [GioHangController::class, 'listGioHang'])->name('giohang.list');
    Route::post('/add-gio-hang', [GioHangController::class, 'addGioHang'])->name('giohang.add');
    Route::post('/update-gio-hang', [GioHangController::class, 'updateGioHang'])->name('giohang.update');
    Route::middleware('auth')->prefix('donhangs')->as('donhang.')->group(function(){
        Route::resource('donhang', ClientDonHangController::class);
    });
    Route::resource('profile', ClientUserController::class);
    Route::get('/lienhe',[ClientController::class,'hienLienHe'])->name('lienhe.hienLienHe');
    Route::post('/lienhe',[ClientController::class,'storeLienHe'])->name('lienhe.storeLienHe');
    Route::get('/gioithieu',[ClientController::class,'hienGioiThieu'])->name('gioithieu.hienGioiThieu');
    Route::get('/tintuc',[ClientController::class,'hienTinTuc'])->name('tintuc.hienTinTuc');
    Route::get('/tintuc/{id}',[ClientController::class,'detailTinTuc'])->name('tintuc.chitiet');
});


// controller
Route::middleware('auth.admin')->prefix('admin')->as('admin.')->group(function(){
    Route::get('/admin', function(){
        // Fetch basic statistics for the dashboard
        $totalOrders = \App\Models\DonHang::count();
        $totalComments = \App\Models\Binhluan::count();
        $totalUsers = \App\Models\User::where('vai_tro', '!=', 1)->count();
        $totalProducts = \App\Models\SanPham::count();
        
        // Get current year and month
        $currentYear = date('Y');
        $currentMonth = date('m');
        
        // Calculate daily revenue for current month
        $dailyRevenue = \App\Models\DonHang::selectRaw('DAY(created_at) as day, SUM(tong_tien) as total')
            ->whereYear('created_at', $currentYear)
            ->whereMonth('created_at', $currentMonth)
            ->where('trang_thai', \App\Models\DonHang::DA_GIAO)
            ->where('thanh_toan', \App\Models\DonHang::DA_THANH_TOAN)
            ->groupBy('day')
            ->orderBy('day')
            ->get()
            ->pluck('total', 'day')
            ->toArray();
        
        // Fill in missing days with zero
        $daysInMonth = cal_days_in_month(CAL_GREGORIAN, $currentMonth, $currentYear);
        $dailyRevenueData = [];
        $dailyRevenueLabels = [];
        for ($day = 1; $day <= $daysInMonth; $day++) {
            $dailyRevenueLabels[] = $day;
            $dailyRevenueData[] = $dailyRevenue[$day] ?? 0;
        }
        
        // Calculate monthly revenue for current year
        $monthlyRevenue = \App\Models\DonHang::selectRaw('MONTH(created_at) as month, SUM(tong_tien) as total')
            ->whereYear('created_at', $currentYear)
            ->where('trang_thai', \App\Models\DonHang::DA_GIAO)
            ->where('thanh_toan', \App\Models\DonHang::DA_THANH_TOAN)
            ->groupBy('month')
            ->orderBy('month')
            ->get()
            ->pluck('total', 'month')
            ->toArray();
        
        // Fill in missing months with zero
        $monthlyRevenueData = [];
        $monthNames = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 
                       'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
        for ($month = 1; $month <= 12; $month++) {
            $monthlyRevenueData[] = $monthlyRevenue[$month] ?? 0;
        }
        
        // Calculate quarterly revenue for current year
        $quarterlyRevenue = \App\Models\DonHang::selectRaw('QUARTER(created_at) as quarter, SUM(tong_tien) as total')
            ->whereYear('created_at', $currentYear)
            ->where('trang_thai', \App\Models\DonHang::DA_GIAO)
            ->where('thanh_toan', \App\Models\DonHang::DA_THANH_TOAN)
            ->groupBy('quarter')
            ->orderBy('quarter')
            ->get()
            ->pluck('total', 'quarter')
            ->toArray();
        
        // Fill in missing quarters with zero
        $quarterlyRevenueData = [];
        $quarterNames = ['Quý 1', 'Quý 2', 'Quý 3', 'Quý 4'];
        for ($quarter = 1; $quarter <= 4; $quarter++) {
            $quarterlyRevenueData[] = $quarterlyRevenue[$quarter] ?? 0;
        }
        
        // Calculate revenue by category
        $categoryRevenue = \Illuminate\Support\Facades\DB::table('chi_tiet_don_hangs')
            ->join('don_hangs', 'chi_tiet_don_hangs.don_hang_id', '=', 'don_hangs.id')
            ->join('san_phams', 'chi_tiet_don_hangs.san_pham_id', '=', 'san_phams.id')
            ->join('danh_mucs', 'san_phams.danh_muc_id', '=', 'danh_mucs.id')
            ->select('danh_mucs.ten_danh_muc', \Illuminate\Support\Facades\DB::raw('SUM(chi_tiet_don_hangs.thanh_tien) as total'))
            ->where('don_hangs.trang_thai', \App\Models\DonHang::DA_GIAO)
            ->where('don_hangs.thanh_toan', \App\Models\DonHang::DA_THANH_TOAN)
            ->groupBy('danh_mucs.ten_danh_muc')
            ->orderByDesc('total')
            ->limit(5)
            ->get();
        
        $categoryRevenueLabels = $categoryRevenue->pluck('ten_danh_muc')->toArray();
        $categoryRevenueData = $categoryRevenue->pluck('total')->toArray();
        
        return view('admin.index', compact(
            'totalOrders', 'totalComments', 'totalUsers', 'totalProducts',
            'dailyRevenueLabels', 'dailyRevenueData',
            'monthNames', 'monthlyRevenueData',
            'quarterNames', 'quarterlyRevenueData',
            'categoryRevenueLabels', 'categoryRevenueData'
        ));
    })->name('admin');
    Route::resource('danhmuc', DanhMucController::class);
    Route::resource('sanpham', SanPhamController::class);
    Route::resource('donhang', DonHangController::class);
    Route::resource('taikhoan', UserController::class);
    Route::resource('tintuc',TinTucController::class);
    Route::resource('banner', BannerController::class);
    Route::resource('binhluan',BinhLuanController::class);
    Route::get('/binhluan/toggle-hide/{id}', [BinhLuanController::class, 'toggleHide'])->name('binhluan.toggleHide');
    Route::get('/lienhe',[LienHeController::class,'index'])->name('lienhe.index');
    Route::get('/taikhoanTV', [UserController::class, 'thanhVien'])->name('thanhVien');
    Route::get('/khoaTK/{id}',[UserController::class,'lock'])->name('taikhoan.lock');
    Route::post('/openTK/{id}',[UserController::class,'openTK'])->name('taikhoan.openTK');
    Route::get('/listkhoaTK',[UserController::class,'listkhoaTK'])->name('taikhoan.listkhoaTK');
});

// Auth
Route::get('/login', [AuthController::class, 'showFormLogin']);
Route::post('/login', [AuthController::class, 'login'])->name('login');
Route::get('/register', [AuthController::class, 'showFormRegister']);
Route::post('/register', [AuthController::class, 'register'])->name('register');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::get('forget-password', [ForgotPasswordController::class, 'showForgetPasswordForm'])->name('forget.password.get');
Route::post('forget-password', [ForgotPasswordController::class, 'submitForgetPasswordForm'])->name('forget.password.post'); 
Route::get('reset-password/{token}', [ForgotPasswordController::class, 'showResetPasswordForm'])->name('reset.password.get');
Route::post('reset-password', [ForgotPasswordController::class, 'submitResetPasswordForm'])->name('reset.password.post');
