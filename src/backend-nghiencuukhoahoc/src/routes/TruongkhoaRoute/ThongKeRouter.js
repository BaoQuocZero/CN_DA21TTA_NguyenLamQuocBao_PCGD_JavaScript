const express = require("express");
const app = express();
const pool = require("../../config/database");
const router = express.Router();
const axios = require("axios");

const {
    Lay_BieuDo_GioDay_KhungChuanController,
    Lay_BoMon_Thuoc_KhoaChuanController,
    Lay_NamHoc_HocKyNienKhoaController,
    Lay_BieuDo_Theo_BoMon_NamHocController
} = require("../../controllers/TruongkhoaController/ThongKeController");


const { checkUserJWT } = require("../../middlewares/JWTAction");
const TruongKhoaThongKeRoute = (app) => {

    router.get("/xem/Lay_NamHoc_HocKyNienKhoa", Lay_NamHoc_HocKyNienKhoaController);

    router.post("/xem/Lay_BieuDo_GioDay_KhungChuan", Lay_BieuDo_GioDay_KhungChuanController);
    router.post("/xem/Lay_BoMon_Thuoc_KhoaChuan", Lay_BoMon_Thuoc_KhoaChuanController);
    router.post("/xem/Lay_BieuDo_Theo_BoMon_NamHoc", Lay_BieuDo_Theo_BoMon_NamHocController);

    return app.use("/api/v1/truongkhoa/thongke", router);
};

module.exports = TruongKhoaThongKeRoute;
