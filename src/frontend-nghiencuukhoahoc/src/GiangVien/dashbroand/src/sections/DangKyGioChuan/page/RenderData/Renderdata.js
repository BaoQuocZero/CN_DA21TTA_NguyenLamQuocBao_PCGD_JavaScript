import React, { useEffect, useState } from "react";
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  MenuItem,
  Box,
  FormControl,
  InputLabel,
  Select,
  Button,
  Modal,
  Typography,
} from "@mui/material";
import "./Renderdata.scss";
import { Col, Container, Row, Toast } from "react-bootstrap";
import axios from "axios";
import moment from "moment";
import { toast } from "react-toastify";
import CookiesAxios from "../../../CookiesAxios";
import { useNavigate } from "react-router-dom";

const RenderData = ({
  dataKhungChuan,
  dataTenKhungChuan,
  dataListNamHoc,
  MaGV,
  OpenChucNangtheokhungthoigian,
  fetchDataGV,
  IsOpenCheckKhoa,
  endTime,
  startTime,
}) => {
  const [TenKhung, setTenKhung] = useState();
  const [loading, setLoading] = useState(true);
  const [selectNamHoc, setSelectNamhoc] = useState(null);
  const [isOpenOption, setIsOpenOption] = useState("Xem Khung Giờ");
  const [selectedRow, setSelectedRow] = useState(null);
  const [SelectKhungGioChuan, setSelectKhungGioChuan] = useState(null);
  const [dataRenderKhungChuan, setDataRenderKhungChuan] = useState(null);
  const [isDisableNamHoc, setIsDisableNamHoc] = useState(false);
  const [isOpenButtonSelectKhung, setisOpenButtonSelectKhung] = useState(true);
  const [isModalOpen, setIsModalOpen] = useState(false); // State to control modal
  const [TimeDangKyKhungGioChuan, setTimeDangKyKhungGioChuan] = useState("");
  const [StartTime, setStartTime] = useState("");
  const [EndTime, setEndTime] = useState("");
  const [isRegistered, setIsRegistered] = useState(false);
  const navigate = useNavigate();
  useEffect(() => {
    if (dataKhungChuan) {
      const TimeKhungGioChuan = async () => {
        try {
          const response = await CookiesAxios.get(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/giangvien/xem/thoigianxacnhan`
          );

          if (response.data.EC === 1 && response.data.DT) {
            // Tìm phần tử có GHICHU là "CHONKHUNG"
            const matchedItem = response.data.DT.find(
              (item) => item.GHICHU === "CHONKHUNG"
            );

            if (matchedItem) {
              // Nếu tìm thấy, cập nhật các giá trị cần thiết
              setStartTime(matchedItem.THOIGIANBATDAU);
              setEndTime(matchedItem.THOIGIANKETTHUC);
              setTimeDangKyKhungGioChuan(
                ` ${formatDate(matchedItem.THOIGIANBATDAU)} đến ${formatDate(
                  matchedItem.THOIGIANKETTHUC
                )}`
              );
            } else {
              // Nếu không tìm thấy, xử lý trường hợp không có dữ liệu phù hợp
              setStartTime("");
              setEndTime("");
            }
          }
        } catch (error) {
          console.error("Lỗi khi gọi API:", error);
          toast.error("Lỗi khi gọi API để lấy dữ liệu.");
        } finally {
          setLoading(false);
        }
      };
      setSelectNamhoc(dataListNamHoc[0].TENNAMHOC);
      TimeKhungGioChuan();
    }
  }, [dataKhungChuan]);
  useEffect(() => {
    const DataXemKhungGio = async () => {
      try {
        if (isOpenOption === "Xem Khung Giờ") {
          setisOpenButtonSelectKhung(false);
          setIsDisableNamHoc(false);
          const response = await CookiesAxios.post(
            `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/giangvien/xem/canhan/khunggiochuan`,
            { MAGV: MaGV, TENNAMHOC: selectNamHoc }
          );
          setDataRenderKhungChuan(response.data.DT);

          if (response.data.DT && response.data.DT.length > 0) {
            setIsRegistered(true); // Bật nút nếu có dữ liệu
          } else {
            setIsRegistered(false); // Tắt nút nếu không có dữ liệu
          }
        } else if (isOpenOption === "Chọn Khung Giờ") {
          setDataRenderKhungChuan(dataKhungChuan);
          setIsDisableNamHoc(true);
          // setSelectNamhoc(dataListNamHoc[0].TENNAMHOC);
          setisOpenButtonSelectKhung(true);
        }
      } catch (error) {
        console.log(error);
      }
    };
    if (selectNamHoc) {
      DataXemKhungGio();
    }
  }, [isOpenOption, selectNamHoc]);
  const handleRowClick = (index, khungChuan) => {
    setSelectedRow(index);
    setSelectKhungGioChuan(khungChuan);
    console.log("check khungChuan", khungChuan);
  };
  const handleCancelSelectKhungGioChuan = () => {
    setSelectKhungGioChuan(null);
    setSelectedRow(null);
  };
  const formatDate = (dateString) => {
    if (!dateString) return ""; // Trả về chuỗi rỗng nếu ngày không có giá trị

    const date = moment(dateString);
    if (!date.isValid()) return ""; // Trả về chuỗi rỗng nếu định dạng không đúng

    return date.format("HH:mm - DD/MM/YYYY"); // Định dạng ngày theo yêu cầu
  };
  const handleSelectKhungGioChuan = async () => {
    const response = await CookiesAxios.post(
      `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/giangvien/tao/khunggiochuan`,
      {
        MAGV: MaGV,
        MAKHUNG: SelectKhungGioChuan.MAKHUNG,
        TENNAMHOC: selectNamHoc,
      }
    );
    if (response.data.EC === 1) {
      toast.success(response.data.EM);
      setIsRegistered(true);
    } else {
      setIsRegistered(false);
      toast.error(response.data.EM);
    }
  };
  const handleMoveRegisterDanhMuc = () => {
    if (!SelectKhungGioChuan) {
      toast.warn("Vui lòng chọn khung giờ chuẩn trước khi thực hiện đăng ký!");
    } else {
      navigate("/admin/dang-ky-danh-muc");
    }
  };
  const handleOpenModal = () => setIsModalOpen(true);
  const handleCloseModal = () => setIsModalOpen(false);

  if (loading) {
    return <p>loading</p>;
  }
  return (
    <>
      <Container>
        <Row className="mb-4 ">
          <Col md={6} className="row-with-border1">
            <Typography>
              {OpenChucNangtheokhungthoigian && (
                <Typography
                  component="p"
                  sx={{ fontSize: "1.3rem", margin: 0 }}
                >
                  {startTime ? (
                    <>
                      Thời gian mở cổng từ:{" "}
                      <Typography
                        component="span"
                        sx={{ fontSize: "1.1rem" }}
                        className="text-info"
                      >
                        {startTime}
                      </Typography>{" "}
                      đến{" "}
                      <Typography
                        component="span"
                        sx={{ fontSize: "1.1rem" }}
                        className="text-info"
                      >
                        {endTime}
                      </Typography>
                    </>
                  ) : (
                    "Hiện đang đóng cổng đăng ký"
                  )}
                </Typography>
              )}
            </Typography>
          </Col>{" "}
          <Col md={6} className="row-with-border1">
            {/* <Typography>
              <>
                <Col>
                  <Button
                    variant="contained"
                    onClick={handleMoveRegisterDanhMuc}
                    disabled={!isRegistered}
                  >
                    Thực Hiện Đăng Ký Khoa Học
                  </Button>
                </Col>
              </>
            </Typography>{" "}
            <p className="text-open-gate1">
              Lưu ý phải đăng ký khung giờ chuẩn nghiên cứu khoa học để có thể
              đăng ký danh mục khoa học công nghệ
            </p> */}
          </Col>
        </Row>
        <Row>
          <Col>
            <Box sx={{ maxWidth: 220 }}>
              <FormControl fullWidth className="profile-email-input">
                <InputLabel id="select-label-trang-thai">Chức Năng</InputLabel>
                <Select
                  labelId="select-label-trang-thai"
                  id="trang-thai-select"
                  name="TENCHUCDANH"
                  label="Chức Năng"
                  value={isOpenOption}
                  defaultValue={isOpenOption}
                  onChange={(e) => setIsOpenOption(e.target.value)}
                  variant="outlined"
                >
                  {Object.entries(OpenChucNangtheokhungthoigian).map(
                    ([key, value]) => (
                      <MenuItem key={key} value={value}>
                        {value}
                      </MenuItem>
                    )
                  )}
                </Select>
              </FormControl>
            </Box>
          </Col>{" "}
          <Col>
            <Box sx={{ maxWidth: 220 }}>
              <FormControl fullWidth className="profile-email-input">
                <InputLabel id="select-label-trang-thai">Năm học</InputLabel>
                <Select
                  labelId="select-label-trang-thai"
                  id="trang-thai-select"
                  name="TENCHUCDANH"
                  label="Chức danh"
                  value={selectNamHoc}
                  // defaultValue={selectNamHoc}
                  // disabled={isDisableNamHoc}
                  onChange={(e) => setSelectNamhoc(e.target.value)}
                  variant="outlined"
                >
                  <MenuItem value="Tất cả">Tất cả</MenuItem>
                  {dataListNamHoc && dataListNamHoc.length > 0 ? (
                    dataListNamHoc.map((namhoc, index) => (
                      <MenuItem key={index} value={namhoc.TENNAMHOC}>
                        {namhoc.TENNAMHOC}
                      </MenuItem>
                    ))
                  ) : (
                    <MenuItem value="" disabled>
                      Không có năm học nào
                    </MenuItem>
                  )}
                </Select>
              </FormControl>
            </Box>
          </Col>
          {isOpenButtonSelectKhung ? (
            <>
              {" "}
              {SelectKhungGioChuan ? (
                <>
                  <Col>
                    <Button
                      variant="outlined"
                      className="button-selectKhung"
                      color="secondary"
                      onClick={handleCancelSelectKhungGioChuan}
                    >
                      Bạn đang chọn {SelectKhungGioChuan.TENKHUNGCHUAN}{" "}
                      <i className="fas fa-times"></i>
                    </Button>
                  </Col>
                </>
              ) : (
                <>
                  <Col>
                    <Button variant="outlined" color="secondary" disabled>
                      Bạn chưa chọn khung giờ chuẩn
                    </Button>
                  </Col>
                </>
              )}
            </>
          ) : (
            <>
              {" "}
              <Col></Col>
              <Col></Col>
            </>
          )}
        </Row>
        <Row className="mt-4">
          <TableContainer
            component={Paper}
            sx={{ width: "100%" }}
            className="render-data-conatinerTable"
          >
            <Table aria-label="simple table">
              <TableHead>
                <TableRow>
                  <TableCell align="center">Tên khung chuẩn</TableCell>
                  <TableCell align="center">Giờ giảng dạy hành chinh</TableCell>
                  <TableCell align="center">Giờ giảng dạy chuẩn</TableCell>
                  <TableCell align="center">
                    Giờ nghiên cứu khoa học hành chính
                  </TableCell>
                  <TableCell align="center">
                    Giờ nghiên cứu khoa học chuẩn
                  </TableCell>
                  <TableCell align="center">
                    Giờ phục vụ cộng đồng hành chính
                  </TableCell>
                  <TableCell align="center">
                    Giờ phục vụ cộng đồng chuẩn
                  </TableCell>
                  <TableCell align="center">Năm Học</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {dataRenderKhungChuan && dataRenderKhungChuan.length > 0 ? (
                  dataRenderKhungChuan.map((khungChuan, index) => (
                    <TableRow
                      className={`table-row ${selectedRow === index ? "selected" : ""
                        }`}
                      key={index}
                      onClick={() => handleRowClick(index, khungChuan)}
                      sx={{
                        "&:hover": {
                          backgroundColor: "#f5f5f5",
                        },
                      }}
                    >
                      <TableCell align="center" className="text-info">
                        {khungChuan.TENKHUNGCHUAN ?? ""}
                      </TableCell>
                      <TableCell align="center">
                        {khungChuan.GIOGIANGDAY_HANHCHINH ?? ""}
                      </TableCell>
                      <TableCell align="center" className="text-info">
                        {khungChuan.GIOGIANGDAY_CHUAN ?? ""}
                      </TableCell>
                      <TableCell align="center">
                        {khungChuan.GIONGHIENCUUKHOAHOC_HANHCHINH ?? ""}
                      </TableCell>
                      <TableCell align="center" className="text-info">
                        {khungChuan.GIONGHIENCUUKHOAHOC_CHUAN ?? ""}
                      </TableCell>
                      <TableCell align="center">
                        {khungChuan.GIOPHUCVUCONGDONG_HANHCHINH ?? ""}
                      </TableCell>
                      <TableCell align="center" className="text-info">
                        {khungChuan.GIOPHUCVUCONGDONG_CHUAN ?? ""}
                      </TableCell>
                      <TableCell align="center">
                        {khungChuan.TENNAMHOC ?? ""}
                      </TableCell>
                    </TableRow>
                  ))
                ) : (
                  <TableRow>
                    <TableCell colSpan={8} align="center">
                      Không có dữ liệu để hiển thị
                    </TableCell>
                  </TableRow>
                )}
              </TableBody>
            </Table>
          </TableContainer>
        </Row>
        <Row>
          {isOpenButtonSelectKhung ? (
            <>
              {" "}
              {SelectKhungGioChuan ? (
                <>
                  <Col></Col>
                  <Col></Col>
                  <Col style={{ textAlign: "right" }}>
                    <Button
                      variant="contained"
                      onClick={handleSelectKhungGioChuan}
                    >
                      Xác Nhận
                    </Button>
                  </Col>
                </>
              ) : (
                <>
                  <Col style={{ textAlign: "right" }}>
                    <Button variant="contained" disabled>
                      Xác Nhận
                    </Button>
                  </Col>
                </>
              )}
            </>
          ) : (
            <>
              {" "}
              <Col></Col>
              <Col></Col>
            </>
          )}
        </Row>
      </Container>{" "}
    </>
  );
};

export default RenderData;
