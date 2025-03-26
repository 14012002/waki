@extends('layout.client')
@section('content')
<div class="blog-area pt-100 pb-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="blog-details-wrapper">
                    <div class="blog-details-img-date-wrap mb-25">
                        <div class="blog-details-img">
                            <img src="{{ Storage::url($tintuc->hinh_anh) }}" alt="{{ $tintuc->tieu_de }}">
                        </div>
                        <div class="blog-details-date" style="width:100px;border-radius: 10px;background-color: #f8f9fa;">
                            <h5>{{ optional($tintuc->created_at)->format('d-m-Y') ?? 'N/A' }}</h5>
                        </div>
                    </div>
                    <div class="blog-meta">
                        <ul>
                            <li>By: <a href="#">{{ $tintuc->user->ten_dang_nhap }}</a></li>
                        </ul>
                    </div>
                    <h1>{{ $tintuc->tieu_de }}</h1>
                    <div class="blog-details-content">
                        <p>{!! nl2br(e($tintuc->noi_dung)) !!}</p>
                    </div>
                    <div class="tag-social-wrap">
                        <div class="blog-btn-2 btn-hover" style=" border-radius: 45px; border: 1px solid black;">
                            <a class="btn hover-border-radius theme-color" href="{{ route('client.tintuc.hienTinTuc') }}">Quay lại</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection