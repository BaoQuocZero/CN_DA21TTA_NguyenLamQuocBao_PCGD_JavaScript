const pool = require("../../config/database");

const executeQuery = async (query, params) => {
  try {
    const [results, fields] = await pool.execute(query, params);
    return results;
  } catch (error) {
    console.log("Database query error >>>", error);
    return null;
  }
};

const timTaiKhoan_TENDANGNHAP = async (TENDANGNHAP) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM taikhoan WHERE TENDANGNHAP = ?",
      [TENDANGNHAP]
    );
    return results;
  } catch (error) {
    console.log("timTaiKhoan_TENDANGNHAP errr >>>", error);
    return false;
  }
};

const timGiangVien_MAGV = async (MAGV) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM giangvien WHERE MAGV = ?",
      [MAGV]
    );
    return results;
  } catch (error) {
    console.log("timGiangVien errr >>>", error);
    return [];
  }
};

const timGiangVien_TENGV = async (TENGV, EMAIL) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM giangvien WHERE TENGV = ? and EMAIL = ? ",
      [TENGV, EMAIL]
    );
    return results[0];
  } catch (error) {
    console.log("timGiangVien errr >>>", error);
    return [];
  }
};

const timGiangVien_TENGV_TENDANGNHAP = async (TENGV, EMAIL) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT giangvien.*,taikhoan.* FROM giangvien,taikhoan WHERE giangvien.MAGV = taikhoan.MAGV and giangvien.TENGV = ? and taikhoan.TENDANGNHAP = ? ",
      [TENGV, EMAIL]
    );
    return results[0];
  } catch (error) {
    console.log("timGiangVien errr >>>", error);
    return [];
  }
};

const selectBomon_TENBOMON = async (TENBOMON) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM bomon WHERE TENBOMON = ?",
      [TENBOMON]
    );
    return results;
  } catch (error) {
    console.log("selectBomon_TENBOMON errr >>>", error);
    return [];
  }
};

const selectChucdanh_TENCHUCDANH = async (TENCHUCDANH) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM chucdanh WHERE TENCHUCDANH = ?",
      [TENCHUCDANH]
    );
    return results;
  } catch (error) {
    console.log("selectChucdanh_TENCHUCDANH errr >>>", error);
    return [];
  }
};

const timChucVu_TENCHUCVU = async (TENCHUCVU) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM chucvu WHERE TENCHUCVU = ?",
      [TENCHUCVU]
    );
    return results;
  } catch (error) {
    console.log("timChucVu_TENCHUCVU errr >>>", error);
    return [];
  }
};

// Tìm xem giảng viên đang giữ chức vụ nào
const timChucVu_MAGV = async (MAGV) => {
  try {
    const [results, fields] = await pool.execute(
      `SELECT giu_chuc_vu.*
            FROM giu_chuc_vu
            WHERE giu_chuc_vu.MAGV = ?
            ORDER BY giu_chuc_vu.TUNGAY DESC
            LIMIT 1
            `,
      [MAGV]
    );
    return results;
  } catch (error) {
    console.log("timChucVu_TENCHUCVU errr >>>", error);
    return [];
  }
};

// Tìm xem giảng viên đang giữ chức vụ nào
const timCoChucDanh_MAGV = async (MAGV) => {
  try {
    const [results, fields] = await pool.execute(
      "SELECT * FROM co_chuc_danh WHERE MAGV = ?",
      [MAGV]
    );
    return results;
  } catch (error) {
    console.log("timChucVu_TENCHUCVU errr >>>", error);
    return [];
  }
};

const timChucVu_MACHUCVU = async (MACHUCVU) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM chucvu WHERE MACHUCVU = ?",
      [MACHUCVU]
    );
    return results1;
  } catch (error) {
    console.log("timChucVu_MACHUCVU errr >>>", error);
    return [];
  }
};

const timChucDanh_MACHUCDANH = async (MACHUCDANH) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM chucdanh WHERE MACHUCDANH = ?",
      [MACHUCDANH]
    );
    return results1;
  } catch (error) {
    console.log("timChucVu_MACHUCVU errr >>>", error);
    return [];
  }
};

//Trả dữ liệu FronEnd
const dataFronEnd = async (isOpenGetAllApiGV, MABOMON) => {
  try {
    const query = isOpenGetAllApiGV
      ? `SELECT k.TENKHOA, bm.MABOMON, bm.TENBOMON, tk.TENDANGNHAP, gv.TENGV, gv.EMAIL, tk.MAGV, cd.TENCHUCDANH, ccd.THOIGIANNHAN, cv.TENCHUCVU, gcv.TUNGAY,gcv.SOQUYETDINH, gv.DIENTHOAI, gv.DIACHI, tk.PHANQUYEN, tk.TRANGTHAITAIKHOAN
                FROM taikhoan AS tk
                LEFT JOIN giangvien AS gv ON tk.MAGV = gv.MAGV
                LEFT JOIN bomon AS bm ON bm.MABOMON = gv.MABOMON
                LEFT JOIN khoa AS k ON k.MAKHOA = bm.MAKHOA
                LEFT JOIN giu_chuc_vu AS gcv ON gv.MAGV = gcv.MAGV
                LEFT JOIN chucvu AS cv ON gcv.MACHUCVU = cv.MACHUCVU
                LEFT JOIN co_chuc_danh AS ccd ON ccd.MAGV = gv.MAGV
                LEFT JOIN chucdanh AS cd ON ccd.MACHUCDANH = cd.MACHUCDANH
                ORDER BY tk.TENDANGNHAP ASC`
      : `SELECT k.TENKHOA, bm.MABOMON, bm.TENBOMON, tk.TENDANGNHAP, gv.TENGV, gv.EMAIL, tk.MAGV, cd.TENCHUCDANH, ccd.THOIGIANNHAN, cv.TENCHUCVU, gcv.TUNGAY,gcv.SOQUYETDINH, gv.DIENTHOAI, gv.DIACHI, tk.PHANQUYEN, tk.TRANGTHAITAIKHOAN
                FROM taikhoan AS tk
                LEFT JOIN giangvien AS gv ON tk.MAGV = gv.MAGV
                LEFT JOIN bomon AS bm ON bm.MABOMON = gv.MABOMON
                LEFT JOIN khoa AS k ON k.MAKHOA = bm.MAKHOA
                LEFT JOIN giu_chuc_vu AS gcv ON gv.MAGV = gcv.MAGV
                LEFT JOIN chucvu AS cv ON gcv.MACHUCVU = cv.MACHUCVU
                LEFT JOIN co_chuc_danh AS ccd ON ccd.MAGV = gv.MAGV
                LEFT JOIN chucdanh AS cd ON ccd.MACHUCDANH = cd.MACHUCDANH
                WHERE bm.MABOMON = ?
                ORDER BY tk.TENDANGNHAP ASC`;

    const results = await executeQuery(
      query,
      isOpenGetAllApiGV ? [] : [MABOMON]
    );
    return {
      EM: "",
      EC: 1,
      DT: results,
    };
  } catch (error) {
    console.log("dataFronEnd error >>>", error);
    return {
      EM: "Lỗi truy vấn cơ sở dữ liệu",
      EC: -1,
      DT: [],
    };
  }
};

const timchuongtrinh_TENCHUONGTRINH = async (TENCHUONGTRINH) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM chuongtrinhdaotao WHERE TENCHUONGTRINH = ?",
      [TENCHUONGTRINH]
    );

    return results1[0];
  } catch (error) {
    console.log("timchuongtrinh_TENCHUONGTRINH errr >>>", error);
    return [];
  }
};

const timmonhoc_TENMONHOC = async (TENMONHOC) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM monhoc WHERE TENMONHOC = ?",
      [TENMONHOC]
    );
    return results1[0];
  } catch (error) {
    console.log("timmonhoc_TENMONHOC errr >>>", error);
    return [];
  }
};

const timnamhoc_MANAMHOC = async (MANAMHOC) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM namhoc WHERE namhoc.MANAMHOC = ?",
      [MANAMHOC]
    );
    return results1[0];
  } catch (error) {
    console.log("timnamhoc_MANAMHOC errr >>>", error);
    return [];
  }
};

const timnamhoc_TENNAMHOC = async (TENNAMHOC) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM namhoc WHERE namhoc.TENNAMHOC = ?",
      [TENNAMHOC]
    );
    return results1[0].MANAMHOC;
  } catch (error) {
    console.log("timnamhoc_TENNAMHOC errr >>>", error);
    return [];
  }
};

const timtacgia_TEN_LOAI_TAC_GIA = async (TEN_LOAI_TAC_GIA) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM loai_tac_gia WHERE loai_tac_gia.TEN_LOAI_TAC_GIA = ?",
      [TEN_LOAI_TAC_GIA]
    );
    return results1[0].MA_LOAI_TAC_GIA;
  } catch (error) {
    console.log("timnamhoc_TENNAMHOC errr >>>", error);
    return [];
  }
};

const timlop_MALOP = async (MALOP) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM lop WHERE MALOP = ?",
      [MALOP]
    );
    return results1;
  } catch (error) {
    console.log("timnamhoc_TENNAMHOC errr >>>", error);
    return [];
  }
};

const timdetai_TENDETAI = async (TEN_DE_TAI) => {
  try {
    const [results1, fields] = await pool.execute(
      "SELECT * FROM nghien_cuu_kh WHERE TEN_DE_TAI = ?",
      [TEN_DE_TAI]
    );
    return results1;
  } catch (error) {
    console.log("timnamhoc_TENNAMHOC errr >>>", error);
    return [];
  }
};

module.exports = {
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
  timchuongtrinh_TENCHUONGTRINH,
  timmonhoc_TENMONHOC,
  timnamhoc_MANAMHOC,
  timnamhoc_TENNAMHOC,
  timtacgia_TEN_LOAI_TAC_GIA,
  timGiangVien_TENGV,
  timGiangVien_TENGV_TENDANGNHAP,
  timlop_MALOP,
  timdetai_TENDETAI,
};
