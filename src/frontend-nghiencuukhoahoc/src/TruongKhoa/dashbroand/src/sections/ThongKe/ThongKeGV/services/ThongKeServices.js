import CookiesAxios from "../../../CookiesAxios";

export const fetchDataNamHoc = async (taikhoan) => {
    try {
        const response = await CookiesAxios.get(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/thongke//getNamHoc_HocKiNienKhoa`
        );
        return response.data.DT; // Trả về dữ liệu giảng viên
    } catch (error) {
        console.error("Lỗi khi lấy dữ liệu GIANG VIEN:", error);
        throw error;
    }
};

// Lấy thông tin giảng viên theo tài khoản
export const fetchDataGV = async (taikhoan) => {
    try {
        const response = await CookiesAxios.get(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/only/xemprofile/${taikhoan}`
        );
        return response.data.DT; // Trả về dữ liệu giảng viên
    } catch (error) {
        console.error("Lỗi khi lấy dữ liệu GIANG VIEN:", error);
        throw error;
    }
};

export const fetchBieuDo_GioGiang = async (MAGV) => {
    try {
        const response = await CookiesAxios.post(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/thongke/getBieuDo_GioGiang`,
            { MAGV }
        );
        return response.data.DT;
    } catch (error) {
        console.error("Error fetching data:", error);
        throw error;
    }
};

export const fetchBieuDo_GioGiangChonKhung = async (MAGV, SelectNamHoc_HocKiNienKhoa) => {
    try {
        const response = await CookiesAxios.post(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/thongke/getBieuDo_GioGiangChonKhung`,
            { MAGV, SelectNamHoc_HocKiNienKhoa }
        );
        return response.data.DT;
    } catch (error) {
        console.error("Error fetching data:", error);
        throw error;
    }
};

export const fetchPhanCongGVThongKe = async (MAGV, SelectNamHoc_HocKiNienKhoa) => {
    try {
        const response = await CookiesAxios.post(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/thongke/PhanCongGVThongKe`,
            { MAGV, SelectNamHoc_HocKiNienKhoa }
        );
        return response.data.DT;
    } catch (error) {
        console.error("Error fetching data:", error);
        throw error;
    }
};