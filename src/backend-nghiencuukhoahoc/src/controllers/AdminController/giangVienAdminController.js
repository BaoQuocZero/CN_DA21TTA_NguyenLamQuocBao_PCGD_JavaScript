const {
  selectGiangVien,
  selectOnlyGiangVien,
  selectOnlyGiangVienByTenDangNhap,
  createGiangVien,

  updateGiangVien,
  updateTrangThaiTaiKhoanGiangVien,
  searchTenGiangVien,
  deleteGiangVien,
  fakeChonKhungGV,
} = require("../../services/AdminServices/CRUDGiangvien");

const {
  update_ChucVu_ChucDanh_GiangVien,
} = require("../../services/AdminServices/AdminServiceGiangVien/GiangVienServices");

const {
  timTaiKhoan_TENDANGNHAP,
  timGiangVien_MAGV,
  selectBomon_TENBOMON,
  selectChucdanh_TENCHUCDANH,
  timChucVu_TENCHUCVU,
  timChucVu_MAGV,
  timCoChucDanh_MAGV,
  timChucVu_MACHUCVU,
  timChucDanh_MACHUCDANH,

  dataFronEnd,
} = require("../../services/AdminServices/helpers");

const getAllGiangVien_indatabase = async (req, res) => {
  try {
    let page = req.query.page;
    let limit = req.query.limit;

    if (!page || !limit) {
      return res.status(400).json({
        EM: "Lỗi không xác định phân trang",
        EC: -1,
        DT: null,
      });
    }

    let results = await selectGiangVien(page, limit);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller getAllGiangVien",
      EC: -1,
      DT: [],
    });
  }
};

const getAllGiangVien = async (req, res) => {
  try {
    const isOpenGetAllApiGV = req.body.isOpenGetAllApiGV;
    const MABOMON = req.body.MABOMON;
    if (!MABOMON) {
      return res.status(400).json({
        EM: " MABOMON bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await dataFronEnd(isOpenGetAllApiGV, MABOMON);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller getAllGiangVien",
      EC: -1,
      DT: [],
    });
  }
};

const getOnlyGiangVienbyTENDANGNHAP = async (req, res) => {
  try {
    const TENDANGNHAP = req.params.TENDANGNHAP;
    if (!TENDANGNHAP) {
      return res.status(400).json({
        EM: " TENDANGNHAP bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results;
    results = await selectOnlyGiangVienByTenDangNhap(TENDANGNHAP);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller getOnlyGiangVienbyTENDANGNHAP",
      EC: -1,
      DT: [],
    });
  }
};

const getOnlyGiangVienbyBoMon = async (req, res) => {
  try {
    const MABOMON = req.params.MABOMON;
    if (!MABOMON) {
      return res.status(400).json({
        EM: " MABOMON bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await selectOnlyGiangVien(MABOMON);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller getOnlyGiangVienbyBoMon",
      EC: -1,
      DT: [],
    });
  }
};

const createGiangVienControler = async (req, res) => {
  try {
    let dataGiangVien = req.body;
    if (
      !dataGiangVien.MABOMON ||
      !dataGiangVien.MAGV ||
      !dataGiangVien.TENDANGNHAP
    ) {
      return res.status(400).json({
        EM: " MABOMON bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await createGiangVien(dataGiangVien);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller createGiangVienControler",
      EC: -1,
      DT: [],
    });
  }
};

const updateTrangThaiTaiKhoanGiangVienController = async (req, res) => {
  try {
    //api này dùng để đình chỉ hoạt động của 1 tài khoản
    const { TRANGTHAITAIKHOAN, MABOMON, isOpenGetAllApiGV } = req.body;
    const MAGV = req.params.MAGV;
    if (!MAGV) {
      return res.status(400).json({
        EM: " MAGV bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await updateTrangThaiTaiKhoanGiangVien(
      MAGV,
      TRANGTHAITAIKHOAN,
      MABOMON,
      isOpenGetAllApiGV
    );

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    return res.status(500).json({
      EM: "Lỗi server",
      EC: -1,
      DT: [],
    });
  }
};

const updateGiangVienController = async (req, res) => {
  try {
    const MAGV = req.params.MAGV;
    let dataGiangVien = req.body;
    if (!MAGV) {
      return res.status(400).json({
        EM: " MAGV bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await updateGiangVien(MAGV, dataGiangVien);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller updateGiangVienController",
      EC: -1,
      DT: [],
    });
  }
};

const update_ChucVu_ChucDanh_GiangVien_Controller = async (req, res) => {
  try {
    const a = req.params.TENDANGNHAP;
    const isOpenGetAllApiGV = req.body.isOpenGetAllApiGV;

    // Khởi tạo dataGiangVien với các trường cần thiết, mặc định là ''
    let dataGiangVien = {
      TENDANGNHAP: "",
      TENGV: "",

      TENCHUCVU: "",
      TUNGAY: "", //Từ ngày

      TENCHUCDANH: "",
      THOIGIANNHAN: "", // Thời gian nhận
      SOQUYETDINH: "",
      DIENTHOAI: "",
      DIACHI: "",
      TENBOMON: "",
      PHANQUYEN: "",
      TRANGTHAITAIKHOAN: "",
    };

    // Cập nhật giá trị từ req.body vào dataGiangVien
    Object.keys(dataGiangVien).forEach((field) => {
      if (req.body[field]) {
        dataGiangVien[field] = req.body[field];
      }
    });

    let results = await update_ChucVu_ChucDanh_GiangVien(
      dataGiangVien,
      isOpenGetAllApiGV
    );

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller update_ChucVu_ChucDanh_GiangVien_Controller",
      EC: -1,
      DT: [],
    });
  }
};

const deleteGiangVienController = async (req, res) => {
  try {
    let MAGV = req.query.MAGV;
    let MABOMON = req.query.MABOMON;
    let isOpenGetAllApiGV = req.query.isOpenGetAllApiGV;
    if (!MAGV || !MABOMON) {
      return res.status(400).json({
        EM: " MAGV bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await deleteGiangVien(MAGV, MABOMON, isOpenGetAllApiGV);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller deleteGiangVienController",
      EC: -1,
      DT: [],
    });
  }
};
const searchEmailGiangVienController = async (req, res) => {
  try {
    const TENGIANGVIEN = req.body.TENGIANGVIEN;
    if (!TENGIANGVIEN) {
      return res.status(400).json({
        EM: " TENGIANGVIEN bị rỗng",
        EC: 400,
        DT: null,
      });
    }
    let results = await searchTenGiangVien(TENGIANGVIEN);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller searchTenGiangVien",
      EC: -1,
      DT: [],
    });
  }
};
const FakeChonKhungController = async (req, res) => {
  try {
    const { data } = req.body;

    let results = await fakeChonKhungGV(data);

    return res.status(200).json({
      EM: results.EM,
      EC: results.EC,
      DT: results.DT,
    });
  } catch (error) {
    console.log(error);
    return res.status(404).json({
      EM: "lỗi controller searchTenGiangVien",
      EC: -1,
      DT: [],
    });
  }
};
module.exports = {
  getAllGiangVien,
  getAllGiangVien_indatabase,
  getOnlyGiangVienbyBoMon,
  getOnlyGiangVienbyTENDANGNHAP,
  createGiangVienControler,

  updateGiangVienController,
  updateTrangThaiTaiKhoanGiangVienController,
  update_ChucVu_ChucDanh_GiangVien_Controller,

  deleteGiangVienController,
  searchEmailGiangVienController,
  FakeChonKhungController,
};
