import CookiesAxios from "../../CookiesAxios";

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