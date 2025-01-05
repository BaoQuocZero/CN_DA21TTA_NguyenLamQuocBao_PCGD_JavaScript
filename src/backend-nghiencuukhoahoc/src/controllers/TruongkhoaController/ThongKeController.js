const {
    Lay_BieuDo_GioDay_KhungChuan,
    Lay_BoMon_Thuoc_Khoa,
    Lay_NamHoc_HocKyNienKhoa,
    Lay_BieuDo_Theo_BoMon_NamHoc
} = require("../../services/TruongkhoaServices/ThongKeServices");

const Lay_BieuDo_GioDay_KhungChuanController = async (req, res) => {
    try {
        let MAGV = req.body.MAGV;
        let results = await Lay_BieuDo_GioDay_KhungChuan(MAGV);

        return res.status(200).json({
            EM: results.EM,
            EC: results.EC,
            DT: results.DT,
        });
    } catch (error) {
        console.log(error);
        return res.status(200).json({
            EM: "lỗi Lay_BieuDo_GioDay_KhungChuanController",
            EC: -1,
            DT: [],
        });
    }
};

const Lay_BoMon_Thuoc_KhoaChuanController = async (req, res) => {
    try {
        let MAGV = req.body.MAGV;
        let results = await Lay_BoMon_Thuoc_Khoa(MAGV);

        return res.status(200).json({
            EM: results.EM,
            EC: results.EC,
            DT: results.DT,
        });
    } catch (error) {
        console.log(error);
        return res.status(200).json({
            EM: "lỗi Lay_BoMon_Thuoc_KhoaChuanController",
            EC: -1,
            DT: [],
        });
    }
};

const Lay_NamHoc_HocKyNienKhoaController = async (req, res) => {
    try {
        let results = await Lay_NamHoc_HocKyNienKhoa();

        return res.status(200).json({
            EM: results.EM,
            EC: results.EC,
            DT: results.DT,
        });
    } catch (error) {
        console.log(error);
        return res.status(200).json({
            EM: "lỗi Lay_BoMon_Thuoc_KhoaChuanController",
            EC: -1,
            DT: [],
        });
    }
};

const Lay_BieuDo_Theo_BoMon_NamHocController = async (req, res) => {
    try {
        let MABOMON = req.body.MABOMON;
        let MAHKNK = req.body.MAHKNK;

        let results = await Lay_BieuDo_Theo_BoMon_NamHoc(MABOMON, MAHKNK);

        return res.status(200).json({
            EM: results.EM,
            EC: results.EC,
            DT: results.DT,
        });
    } catch (error) {
        console.log(error);
        return res.status(200).json({
            EM: "lỗi Lay_BieuDo_Theo_BoMon_NamHocController",
            EC: -1,
            DT: [],
        });
    }
};

module.exports = {
    Lay_BieuDo_GioDay_KhungChuanController,

    Lay_BoMon_Thuoc_KhoaChuanController,
    Lay_NamHoc_HocKyNienKhoaController,
    Lay_BieuDo_Theo_BoMon_NamHocController,
};
