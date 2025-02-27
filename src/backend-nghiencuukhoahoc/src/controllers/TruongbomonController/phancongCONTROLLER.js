const {
  select_giangvien_chuachonkhung,
  select_giangvien_dachonkhung,
  select_lophoc_monhoc,
  select_giangvien_dachonkhung_chitiet,

  create_listgiangvien_phancong,
  xem_listgiangvien_phancong,
  selectLop_BoMon,
  phancong_tudong_giangvien,
  update_phancong_giangvien,
} = require("../../services/TruongbomonServices/CRUDphancong");
const get_giangvien_CNTT_chuachonkhung = async (req, res) => {
  try {
    const TENNAMHOC = req.body.TENNAMHOC;
    let results = await select_giangvien_chuachonkhung(TENNAMHOC);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi get_giangvien_CNTT_chuachonkhung",
      EC: -1,
      DT: [],
    });
  }
};
const getAllLop_BoMon_controller = async (req, res) => {
  try {
    const TENBOMON = req.body.TENBOMON;
    const data = req.body;
    // Kiểm tra dữ liệu đầu vào
    console.log(data);
    if (!TENBOMON) {
      return res.status(400).json({
        EM: "Tên bộ môn không được bỏ trống và phải là một chuỗi hợp lệ",
        EC: 400,
        DT: null,
      });
    }
    let results = await selectLop_BoMon(TENBOMON, data);
    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller getAllLop",
      EC: -1,
      DT: [],
    });
  }
};

const get_giangvien_CNTT_dachonkhung = async (req, res) => {
  try {
    let results = await select_giangvien_dachonkhung();

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi get_giangvien_CNTT_chuachonkhung",
      EC: -1,
      DT: [],
    });
  }
};

const get_giangvien_CNTT_dachonkhung_chitietonly = async (req, res) => {
  try {
    const TENNAMHOC = req.body.TENNAMHOC;
    if (!TENNAMHOC) {
      return res.status(400).json({
        EM: "Tên năm học không được bỏ trống",
        EC: 400,
        DT: null,
      });
    }
    let results = await select_giangvien_dachonkhung_chitiet(TENNAMHOC);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi get_giangvien_CNTT_chuachonkhung",
      EC: -1,
      DT: [],
    });
  }
};

const get_monhoc_lop_hocki = async (req, res) => {
  try {
    const MALOP = req.body.MALOP;
    const SOHOCKI = req.body.HOCKINIENKHOA.TENHKNK;
    const MAHKNK = req.body.HOCKINIENKHOA.MAHKNK;
    const TEN_NAM_HOC = req.body.HOCKINIENKHOA.TEN_NAM_HOC;
    // console.log("req.body: ", req.body)
    if (!MALOP || !SOHOCKI) {
      return res.status(400).json({
        EM: "Dữ liệu không hợp lệ",
        EC: 400,
        DT: [],
      });
    }
    let results = await select_lophoc_monhoc(
      MALOP,
      SOHOCKI,
      MAHKNK,
      TEN_NAM_HOC
    );

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
      DT_2: results.DT_2,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi get_monhoc_lop_hocki",
      EC: -1,
      DT: [],
    });
  }
};

//bảng phân công
const get_listgiangvien_phancong = async (req, res) => {
  try {
    let page = req.query.page;
    let limit = req.query.limit;
    let results = await xem_listgiangvien_phancong(page, limit);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi get_listgiangvien_phancong",
      EC: -1,
      DT: [],
    });
  }
};

//bảng phân công
const create_onlylistgiangvien_phancong = async (req, res) => {
  try {
    const MAGV = req.body.MAGV;
    if (!MAGV) {
      return res.status(400).json({
        EM: "Mã giảng viên không được bỏ trống",
        EC: 400,
        DT: null,
      });
    }

    let results = await create_listgiangvien_phancong(MAGV);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi create_onlylistgiangvien_phancong",
      EC: -1,
      DT: [],
    });
  }
};

const phancongtudong_giangvien_Controller = async (req, res) => {
  try {
    const data = req.body;
    let results = await phancong_tudong_giangvien(data);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi create_onlylistgiangvien_phancong",
      EC: -1,
      DT: [],
    });
  }
};

const update_phancong_giangvienController = async (req, res) => {
  try {
    const dataOld = req.body.selectedRow;
    const dataNew = req.body.row;
    let results = await update_phancong_giangvien(dataOld, dataNew);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      EM: "lỗi create_onlylistgiangvien_phancong",
      EC: -1,
      DT: [],
    });
  }
};

module.exports = {
  get_giangvien_CNTT_chuachonkhung,
  get_giangvien_CNTT_dachonkhung,
  get_monhoc_lop_hocki,
  get_giangvien_CNTT_dachonkhung_chitietonly,

  get_listgiangvien_phancong,
  create_onlylistgiangvien_phancong,
  getAllLop_BoMon_controller,
  phancongtudong_giangvien_Controller,
  update_phancong_giangvienController
};
