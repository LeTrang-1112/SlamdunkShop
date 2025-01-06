<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\NguoiDung;

class NguoiDungController extends Controller
{
    public function store(Request $request)
    {
        // Xác thực đầu vào
        $validatedData = $request->validate([
            'TenNguoiDung' => 'required|string|max:100',
            'Email' => 'required|email|unique:NguoiDung,Email',
            'SoDienThoai' => 'nullable|string|max:15',
            'MatKhau' => 'required|string|min:6',
            'DiaChi' => 'nullable|string|max:255',
        ]);

        // Tạo người dùng mới
        $user = new NguoiDung();
        $user->TenNguoiDung = $validatedData['TenNguoiDung'];
        $user->Email = $validatedData['Email'];
        $user->SoDienThoai = $validatedData['SoDienThoai'];
        $user->MatKhau = Hash::make($validatedData['MatKhau']);
        $user->DiaChi = $validatedData['DiaChi'];
        $user->save();

        // Gửi email xác thực
        $user->sendEmailVerificationNotification();

        return response()->json(['message' => 'Đăng ký thành công. Vui lòng kiểm tra email để xác thực tài khoản.'], 201);
    }
}
