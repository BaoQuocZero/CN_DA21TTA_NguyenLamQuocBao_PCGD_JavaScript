const pool = require("../../config/database");
const bcrypt = require("bcrypt");
const saltRounds = 10;
const salt = bcrypt.genSaltSync(saltRounds);

const getPhanCongGV_MAGV = async (MAGV) => {
    try {
        const [results1, fields] = await pool.execute(
            `
        SELECT gv.MAGV, bpc.*, ctpc.*, mh.*, l.* FROM giangvien gv
        JOIN bangphancong bpc ON bpc.MAGV = gv.MAGV
        JOIN hockynienkhoa hknk ON bpc.MAHKNK = hknk.MAHKNK
        JOIN chitietphancong ctpc ON ctpc.MAPHANCONG = bpc.MAPHANCONG
        JOIN monhoc mh ON mh.MAMONHOC = ctpc.MAMONHOC
        JOIN lop l ON l.MALOP = ctpc.MALOP
        WHERE gv.MAGV = ?
        `,
            [MAGV]
        );

        return {
            EM: "Xem thông tin tất cả tên khung giờ chuẩn theo tên chức danh thành công",
            EC: 1,
            DT: results1,
        };
    } catch (error) {
        console.log(error);
        return {
            EM: "lỗi services getPhanCongGV_MAGV",
            EC: -1,
            DT: [],
        };
    }
};

//hàm hash mật khẩu
const hashPassword = (userPassword) => {
    let hashPassword = bcrypt.hashSync(userPassword, salt);
    return hashPassword;
};

const doiMatKhau_GV = async (TENDANGNHAP, MATKHAU_CU, MATKHAU_MOI) => {
    try {
        // Lấy thông tin tài khoản từ database
        const [taikhoan] = await pool.execute(
            `
            SELECT * 
            FROM taikhoan
            WHERE TENDANGNHAP = ?
            `,
            [TENDANGNHAP]
        );

        if (taikhoan.length === 0) {
            return {
                EM: "Tài khoản không tồn tại",
                EC: 0,
                DT: [],
            };
        }

        const user = taikhoan[0];

        // Trường hợp tài khoản không có mật khẩu (lần đầu thiết lập)
        if (!user.MATKHAU) {
            const hashedPassword = await bcrypt.hash(MATKHAU_MOI, 10);
            await pool.execute(
                `
                UPDATE taikhoan
                SET MATKHAU = ?
                WHERE TENDANGNHAP = ?
                `,
                [hashedPassword, TENDANGNHAP]
            );

            return {
                EM: "Thêm mật khẩu thành công",
                EC: 1,
                DT: [],
            };
        }

        // So sánh mật khẩu cũ với mật khẩu trong database
        const isCorrectPass = await bcrypt.compare(MATKHAU_CU, user.MATKHAU);
        if (!isCorrectPass) {
            return {
                EM: "Đổi mật khẩu thất bại, mật khẩu cũ không đúng!",
                EC: 0,
                DT: [],
            };
        }

        // Mã hóa mật khẩu mới
        const hashedNewPassword = await bcrypt.hash(MATKHAU_MOI, 10);

        // Cập nhật mật khẩu mới vào database
        await pool.execute(
            `
            UPDATE taikhoan
            SET MATKHAU = ?
            WHERE TENDANGNHAP = ?
            `,
            [hashedNewPassword, TENDANGNHAP]
        );

        return {
            EM: "Đổi mật khẩu thành công",
            EC: 1,
            DT: [],
        };
    } catch (error) {
        console.error("Lỗi trong doiMatKhau_GV:", error);
        return {
            EM: "Lỗi hệ thống khi đổi mật khẩu",
            EC: -1,
            DT: [],
        };
    }
};

module.exports = {
    getPhanCongGV_MAGV,
    doiMatKhau_GV
};