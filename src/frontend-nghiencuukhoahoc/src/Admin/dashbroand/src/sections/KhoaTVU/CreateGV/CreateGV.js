// CreateKhoa.js
import React, { useState, useEffect } from "react";
import { Container, Row, Col, Modal, Form } from "react-bootstrap";

import axios from "axios";
import { jwtDecode } from "jwt-decode";
import { useNavigate } from "react-router-dom";
import Cookies from "js-cookie";
import CookiesAxios from "../../CookiesAxios.js";
import KhoaList from "./components/KhoaList.js";

import BoMonList from "./components/BoMonList.js";
import GiangVienList from "./components/GiangVienList.js";
import CreateGiangVienForm from "./components/CreateGiangVienForm.js";
import "../CreateKhoa/CreateKhoa.scss";
import { alpha } from "@mui/material/styles";
import ComponentExcelGV from "./components/ComponentExcel.js";
import { toast } from "react-toastify";
import {
  ButtonBase,
  Select,
  SelectChangeEvent,
  MenuItem,
  InputLabel,
  Box,
  FormControl,
  Button,
  Typography,
  Switch,
  FormControlLabel,
} from "@mui/material";
import UpdateGiangVienModal from "./modal/updateGiangVienModal.js";
const ComponenCreateGiangVien = () => {
  const [showUpdateModal, setShowUpdateModal] = useState(false);
  const [selectedLecturer, setSelectedLecturer] = useState({});
  //----------------------KHAI BÁO BIẾN INPUT DATA----------------------------
  const [tenKhoa, setTenKhoa] = useState("");
  const [TenBoMon, setTenBoMon] = useState("");
  const [MaKhoa, setMaKhoa] = useState(null);
  const [MaBoMon, setMaBoMon] = useState(null);
  const [MaGV, setMaGV] = useState(null);
  const [TenGV, setTenGV] = useState(null);
  const [TenDangNhapGV, setTenDangNhapGV] = useState(null);
  const [QuyenGiangVien, setQuyenGiangVien] = useState(null);
  const [TrangThaiGV, setTrangThaiGV] = useState(null);
  const [selectBoMon, setSelectBoMon] = useState(null);
  //----------------------KHAI BÁO BIẾN INPUT DATA--------------------------

  const auth = Cookies.get("accessToken");
  const navigate = useNavigate();
  //----------------------------ISOPEN--------------------------------------
  const [activeRow, setActiveRow] = useState(null); //biến đổi màu table KHOA
  const [disabledBM, setDisableBM] = useState(true);
  const [isOpenEditButton, setIsOpenEditButton] = useState(false);
  const [isOpenEditButtonBM, setIsOpenEditButtonBM] = useState(false);
  const [activeRowBM, setActiveRowBM] = useState(null);
  const [isOpenEditButtonGV, setIsOpenEditButtonGV] = useState(false);
  const [activeRowGV, setActiveRowGV] = useState(null);
  const [disabledGV, setDisableGV] = useState(true);
  const [isOpenGetAllApiGV, setisOpenGetAllApiGV] = useState(true);

  // --------------------------ISOPEN---------------------------------------
  const [ValueExcel, setValueExcel] = useState("Excel");
  //------------------KHAI BÁO BIẾN LƯU DATA TỪ BACKEND--------------------
  const [dataListKhoa, setdataListKhoa] = useState();
  const [dataListBoMon, setdataListBoMon] = useState(null);
  const [dataListGiangVien, setdataListGiangVien] = useState(null);
  //------------------KHAI BÁO BIẾN LƯU DATA TỪ BACKEND--------------------
  const [loading, setLoading] = useState(true);
  const fetchData = async () => {
    const token = Cookies.get("accessToken");

    const response = await CookiesAxios.get(
      `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/khoa/xem`,
      {
        headers: {
          Authorization: `Bearer ${token}`, // Đảm bảo gửi token JWT trong header
        },
      }
    );
    // console.log(response.data.DT);
    setdataListKhoa(response.data.DT);
  };

  const getBoMonByMaKhoa = async (MaKhoa) => {
    try {
      const response = await CookiesAxios.post(
        `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/bomon/only/xem`,
        {
          MAKHOA: MaKhoa,
        }
      );
      //  console.log("Dữ liệu bộ môn theo mã khoa:", response.data.DT);
      setdataListBoMon(response.data.DT);
    } catch (error) {
      console.error("Lỗi khi lấy dữ liệu bộ môn:", error);
    }
  };
  const [currentPage, setCurrentPage] = useState(1);
  const [pageSize] = useState(10);
  const [totalPages, setTotalPages] = useState(1);
  useEffect(() => {
    if (isOpenGetAllApiGV) {
      const fetchDataAllGV = async () => {
        try {
          const response = await CookiesAxios.get(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/xem/tatca`,
            {
              params: {
                page: currentPage, // trang hiện tại
                limit: pageSize, // số lượng giảng viên mỗi trang
              },
            }
          );
          console.log("Dữ liệu bộ môn theo mã khoa:", response.data.DT);
          if (response.data.EC === 1) {
            setdataListGiangVien(response.data.DT.items); // Cập nhật danh sách giảng viên
            setTotalPages(response.data.DT.totalPages); // Cập nhật tổng số trang
          }

          setLoading(false);
        } catch (error) {
          console.error("Lỗi khi lấy dữ liệu bộ môn:", error);
        }
      };
      fetchDataAllGV();
      // console.log("check isOpenGetAllApiGV", isOpenGetAllApiGV);
    } else {
      if (MaBoMon) {
        const fetchDataAllGV = async () => {
          try {
            const response = await CookiesAxios.post(
              `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/xem`,
              { isOpenGetAllApiGV: isOpenGetAllApiGV, MABOMON: MaBoMon }
            );
            //     console.log("Danh sách tài khoản:", response.data);
            setdataListGiangVien(response.data.DT);
          } catch (error) {
            console.error("Lỗi khi lấy dữ liệu bộ môn:", error);
          }
        };
        fetchDataAllGV();
      } else {
        toast.error("Vui lòng chọn bộ môn mà bạn muốn xem");
      }
    }
  }, [isOpenGetAllApiGV, currentPage, pageSize]);
  useEffect(() => {
    fetchData();
    if (auth) {
      const decodedToken = jwtDecode(auth);
      const expirationTime = decodedToken.exp * 1000;
      const currentTime = Date.now();
      if (expirationTime < currentTime) {
        Cookies.remove("accessToken");
        navigate("/login");
      }
    } else {
      navigate("/login");
    }
  }, [navigate]);

  // KHOA

  const handleChose = (id) => {
    //console.log("check id create khoa =>", id);
    //console.log(id);
    setActiveRow(id);
    setDisableBM(false);
    setMaKhoa(id);
    getBoMonByMaKhoa(id);
  };

  const handleDelete = async (MaKhoa) => {
    if (MaKhoa) {
      try {
        const response = await CookiesAxios.delete(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/khoa/xoa`,
          {
            params: {
              makhoa: MaKhoa,
            },
          }
        );
        //      console.log(response.data);
        setActiveRow(null);
        setDisableBM(true);
        fetchData();
      } catch (error) {
        console.error("Lỗi khi gửi yêu cầu đến backend:", error);
      }
    }
  };

  const handleChoseEditKhoa = (khoa) => {
    setTenKhoa(khoa.TENKHOA);
    setMaKhoa(khoa.MAKHOA);
    setIsOpenEditButton(true);
  };

  // BỘ MÔN

  const handleChoseRowBM = async (bomon) => {
    setDisableGV(false);

    setMaBoMon(bomon);
    setActiveRowBM(bomon);
  };
  useEffect(() => {
    const fetchDataTheoBoMon = async () => {
      try {
        const response = await CookiesAxios.post(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/taikhoan/xem/`,
          { TENBOMON: selectBoMon }
        );
        // console.log("Danh sách tài khoản:", response.data);
        if (response.data.EC == 1) {
          setdataListGiangVien(response.data.DT);
        }
      } catch (error) {
        console.error("Lỗi khi lấy dữ liệu bộ môn:", error);
      }
    };
    fetchDataTheoBoMon();
  }, [selectBoMon]);
  const handleChoseEditBM = (bomon) => {
    setTenBoMon(bomon.TENBOMON);
    setMaBoMon(bomon.MABOMON);
    // setIsOpenEditButtonBM(true);
  };

  // GiangVien

  //tên đăng nhập, trạng thái hoạt động, phân quyền, mã GV, MABOMON
  const handleSumitAddGV = async (event) => {
    event.preventDefault();
    if (
      QuyenGiangVien === "Admin" ||
      QuyenGiangVien === "Giảng Viên" ||
      QuyenGiangVien === "Trưởng Bộ Môn" ||
      QuyenGiangVien === "Trưởng Khoa" ||
      QuyenGiangVien === "Giảng Viên Ngoài Trường"
    ) {
      try {
        const response = await CookiesAxios.post(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/taikhoan/only/tao`,
          {
            TENDANGNHAP: TenDangNhapGV,
            MAGV: MaGV,
            PHANQUYEN: QuyenGiangVien,
            TRANGTHAITAIKHOAN: TrangThaiGV,
            MABOMON: MaBoMon,
          }
        );
        //    console.log(response.data.EC);

        if (response.data.EC == 1) {
          setdataListGiangVien(response.data.DT);
          toast.success("Thêm tài khoản giảng viên thành công !!");
        } else {
          toast.error(response.data.EM);
        }
      } catch (error) {
        console.error("Lỗi khi gửi yêu cầu đến backend:", error);
      }
    } else {
      toast.error("Phá web là không tốt !!");
    }
  };

  const handleChoseRowGV = (giangvien) => {
    setActiveRowGV(giangvien.MAGV);
    setMaGV(giangvien.MAGV);
  };

  const handleDeleteGiangVien = async (giangvien) => {
    // console.log("CHECK MAGV = >", giangvien.MAGV);
    // console.log("check Mabomon", giangvien.MABOMON);

    if (giangvien.MAGV) {
      try {
        const response = await CookiesAxios.delete(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/xoa`,
          {
            params: {
              MAGV: giangvien.MAGV,
              MABOMON: giangvien.MABOMON,
              isOpenGetAllApiGV: isOpenGetAllApiGV,
            },
          }
        );
        console.log(response.data);
        setdataListGiangVien(response.data.DT);
      } catch (error) {
        console.error("Lỗi khi gửi yêu cầu đến backend:", error);
      }
    } else {
      toast.error("Chưa chọn tài khoản giảng viên");
    }
  };

  const handleChoseEditGiangVien = async (giangvien) => {
    // console.log("check: ", giangvien);
    setMaGV(giangvien);
    let Trangthai;

    if (giangvien.TRANGTHAITAIKHOAN === "Đang hoạt động") {
      Trangthai = "Ngưng hoạt động";
    } else {
      Trangthai = "Đang hoạt động";
    }

    await functionUpdateTrangThaiGV(
      giangvien.MAGV,
      Trangthai,
      giangvien.MABOMON
    );
  };

  const functionUpdateTrangThaiGV = async (MaGV, TrangThai, MABOMON) => {
    // console.log("check disable tai khoan =>", MaGV);
    if (isOpenGetAllApiGV) {
      try {
        const response = await CookiesAxios.put(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/sua/trangthai/${MaGV}`,
          {
            TRANGTHAITAIKHOAN: TrangThai,
            MABOMON: MABOMON,
            isOpenGetAllApiGV: isOpenGetAllApiGV,
          }
        );
        setdataListGiangVien(response.data.DT);
      } catch (error) {
        console.error("Lỗi khi gửi yêu cầu đến backend:", error);
      }
    } else {
      try {
        const response = await CookiesAxios.put(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/sua/trangthai/${MaGV}`,
          {
            TRANGTHAITAIKHOAN: TrangThai,
            MABOMON: MABOMON,
            isOpenGetAllApiGV: isOpenGetAllApiGV,
          }
        );
        console.log(response.data);

        setdataListGiangVien(response.data.DT);
      } catch (error) {
        console.error("Lỗi khi gửi yêu cầu đến backend:", error);
      }
    }
  };

  const handleGetAllGiangVien = () => {
    setisOpenGetAllApiGV(!isOpenGetAllApiGV);
  };
  const handleIsOpenEditButtonGV = () => {
    setIsOpenEditButtonGV(false);
    setTenBoMon("");
    setMaBoMon(null);
  };

  const handleSumitEditGV = async (event) => { };
  // -----------------------IS OPEN EXCEL-----------------------------------

  const [searchStatus, setSearchStatus] = useState("All");
  const [searchEmail, setSearchEmail] = useState(null);
  const handleSearch = (e) => {
    setSearchEmail(e.target.value);
  };
  //
  useEffect(() => {
    const fetchDataAllGV = async () => {
      try {
        if (searchEmail) {
          const response = await CookiesAxios.post(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/email/search`,
            { TENGIANGVIEN: searchEmail }
          );
          console.log("aaaaaaaaaaa", response.data);
          setdataListGiangVien(response.data.DT);
        }
      } catch (error) {
        console.error("Lỗi khi lấy dữ liệu bộ môn:", error);
      }
    };
    fetchDataAllGV();
  }, [searchEmail]);

  const handleChangeExcel = (event) => {
    setValueExcel(event.target.value);
  };
  const handleStatusChange = (e) => {
    // console.log("check=>", searchStatus);
    setSearchStatus(e.target.value);
    setCurrentPage(0);
  };

  const [dataListChucVuGiangVien, setdataListChucVuGiangVien] = useState();
  const [dataListChucDanhGiangVien, setdataListChucDanhGiangVien] = useState();

  const handleShowUpdateModal = async (lecturer) => {
    // console.log("lecturer: ", lecturer)
    setSelectedLecturer(lecturer);

    try {
      const [chucVuResponse, chucDanhResponse] = await Promise.all([
        CookiesAxios.get(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/xemchucvu`
        ),
        CookiesAxios.get(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/xemchucdanh`
        ),
      ]);
      console.log("chucVuResponse.data.DT: ", chucVuResponse.data.DT)
      console.log("chucDanhResponse.data.DT: ", chucDanhResponse.data.DT)

      setdataListChucVuGiangVien(chucVuResponse.data?.DT || []);
      setdataListChucDanhGiangVien(chucDanhResponse.data?.DT || []);

      setShowUpdateModal(true);
    } catch (error) {
      console.error("Error updating lecturer information:", error);
      toast.error("Lỗi lấy dữ liệu ở phía server");
    }
  };

  const handleCloseUpdateModal = () => {
    setShowUpdateModal(false);
  };
  const updateLecturer = async (updatedLecturer) => {
    // console.log("check tendangnhap", updatedLecturer.TENDANGNHAP);
    if (updatedLecturer.TENDANGNHAP) {
      try {
        const response = await CookiesAxios.put(
          `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/sua/thongtin/${updatedLecturer.TENDANGNHAP}`,
          updatedLecturer
        );
        console.log(response.data);

        if (response.data.EC === 1) {
          toast.success("Cập nhật thành công");
          setdataListGiangVien(response.data.DT);
        } else {
          toast.error("Đã xảy ra lỗi !");
        }

        handleCloseUpdateModal();
      } catch (error) {
        console.error("Đã xảy ra lỗi !", error);
        toast.error("Đã xảy ra lỗi !");
      }
    } else {
      toast.error("Email bị lỗi");
    }
  };
  // console.log("check API ALL +> ", isOpenGetAllApiGV);
  if (loading) {
    return <Typography>Đang tải dữ liệu, vui lòng đợi...</Typography>; // Hiển thị thông báo tải dữ liệu
  }

  return (
    <Container>
      {" "}
      <h4>Quản lý thông tin giảng viên </h4>
      <Row className="mt-4">
        <Col md={2}>
          <KhoaList
            dataListKhoa={dataListKhoa}
            activeRow={activeRow}
            handleChose={handleChose}
            handleDelete={handleDelete}
            handleChoseEditKhoa={handleChoseEditKhoa}
          />
        </Col>{" "}
        <Col md={2}>
          <BoMonList
            dataListBoMon={dataListBoMon}
            activeRowBM={activeRowBM}
            handleChoseRowBM={handleChoseRowBM}
            handleChoseEditBM={handleChoseEditBM}
            setSelectBoMon={setSelectBoMon}
            selectBoMon={selectBoMon}
          />
        </Col>{" "}
        <Col md={2}>
          {" "}
          <Box sx={{ maxWidth: 300 }}>
            <FormControl fullWidth>
              <InputLabel id="select-label-trang-thai">Trạng thái</InputLabel>
              <Select
                labelId="select-label-trang-thai"
                id="trang-thai-select"
                className={`height-selectGV ${searchStatus === "Đang hoạt động"
                  ? "text-success"
                  : searchStatus === "Ngưng hoạt động"
                    ? "text-danger"
                    : ""
                  }`}
                value={searchStatus}
                label="Trạng thái"
                onChange={handleStatusChange}
              >
                <MenuItem value="All">Hiển thị tất cả</MenuItem>
                <MenuItem value="Đang hoạt động" className="text-success">
                  Đang hoạt động
                </MenuItem>
                <MenuItem value="Ngưng hoạt động" className="text-danger">
                  Ngưng hoạt động
                </MenuItem>
              </Select>{" "}
            </FormControl>
          </Box>
        </Col>
        <Col md={3}>
          <div className="mb-3">
            <input
              type="text"
              className="form-control height-selectGV"
              placeholder="Nhập email đăng nhập"
              value={searchEmail}
              onChange={handleSearch}
            />
          </div>
        </Col>
        <Col md={3}>
          <FormControlLabel
            control={
              <Switch
                checked={isOpenGetAllApiGV} // Kiểm tra trạng thái của switch
                onChange={handleGetAllGiangVien} // Hàm thay đổi trạng thái
                sx={{
                  "& .MuiSwitch-switchBase.Mui-checked": {
                    color: "primary.main", // Màu khi bật
                  },
                  "& .MuiSwitch-switchBase.Mui-checked + .MuiSwitch-track": {
                    bgcolor: "primary.main", // Màu nền khi bật
                  },
                  "& .MuiSwitch-track": {
                    bgcolor: "secondary.main", // Màu nền khi tắt
                  },
                  "& .MuiSwitch-switchBase": {
                    "&:hover": {
                      bgcolor: (theme) =>
                        alpha(theme.palette.primary.main, 0.1), // Background khi hover
                    },
                  },
                }}
              />
            }
            sx={{
              "& .MuiFormControlLabel-label": {
                fontSize: "13px", // Tùy chỉnh kích thước chữ
              },
            }}
            label={
              isOpenGetAllApiGV ? "Đang Xem Tất Cả" : "Đang Xem Theo Bộ Môn"
            } // Nhãn của switch
            title={
              isOpenGetAllApiGV
                ? "Xem Tất Cả Giảng Viên"
                : "Xem Tất Cả Giảng Viên Ở Bộ Môn"
            }
          />
        </Col>
      </Row>
      <Row>
        <Col md={6}>
          {" "}
          <h5 className="mt-4">Thêm Tài Khoản Giảng Viên</h5>
          <p className="opacity-7">
            Bạn có thể thêm giảng viên bằng chức năng excel hoặc thủ công.
          </p>
          <Box sx={{ maxWidth: 300 }}>
            <FormControl fullWidth>
              <InputLabel id="demo-simple-select-label">Thêm</InputLabel>
              <Select
                className="height-selectGV"
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={ValueExcel}
                label={ValueExcel}
                onChange={handleChangeExcel}
              >
                <MenuItem value="Excel">Excel</MenuItem>
                <MenuItem value="Thủ Công">Thủ Công</MenuItem>
              </Select>
            </FormControl>
          </Box>
        </Col>
        <Col md={6}></Col>
      </Row>
      <Row className="">
        {" "}
        {ValueExcel &&
          (ValueExcel === "Excel" ? (
            <>
              <Col md={6}>
                {" "}
                <ComponentExcelGV />
              </Col>
            </>
          ) : (
            <>
              {" "}
              <Col md={6}>
                <CreateGiangVienForm
                  QuyenGiangVien={QuyenGiangVien}
                  TrangThaiGV={TrangThaiGV}
                  setTrangThaiGV={setTrangThaiGV}
                  setQuyenGiangVien={setQuyenGiangVien}
                  setTenDangNhapGV={setTenDangNhapGV}
                  TenGV={TenGV}
                  setMaGV={setMaGV}
                  setTenGV={setTenGV}
                  disabledGV={disabledGV}
                  handleSumitAddGV={handleSumitAddGV}
                  isOpenEditButtonGV={isOpenEditButtonGV}
                  handleSumitEditGV={handleSumitEditGV}
                  handleIsOpenEditButtonGV={handleIsOpenEditButtonGV}
                />
              </Col>
            </>
          ))}
        <Col md={6}></Col>
      </Row>{" "}
      <Row>
        <Col md={12}>
          <GiangVienList
            searchStatus={searchStatus}
            currentPage={currentPage}
            totalPages={totalPages}
            pageSize={pageSize}
            setCurrentPage={setCurrentPage}
            isOpenGetAllApiGV={isOpenGetAllApiGV}
            handleGetAllGiangVien={handleGetAllGiangVien}
            dataListGiangVien={dataListGiangVien}
            activeRowGV={activeRowGV}
            handleChoseRowGV={handleChoseRowGV}
            handleDeleteGiangVien={handleDeleteGiangVien}
            handleChoseEditGiangVien={handleChoseEditGiangVien}
            handleShowUpdateModal={handleShowUpdateModal}
          />
        </Col>{" "}
        <Row>
          <Col>
            <UpdateGiangVienModal
              dataListChucDanhGiangVien={dataListChucDanhGiangVien}
              dataListChucVuGiangVien={dataListChucVuGiangVien}
              show={showUpdateModal}
              handleClose={handleCloseUpdateModal}
              lecturerData={selectedLecturer}
              updateLecturer={updateLecturer}
              isOpenGetAllApiGV={isOpenGetAllApiGV}
            />
          </Col>
        </Row>
      </Row>
    </Container>
  );
};

export default ComponenCreateGiangVien;
