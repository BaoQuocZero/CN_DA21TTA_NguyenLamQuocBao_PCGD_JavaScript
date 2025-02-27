import { useEffect, useState } from "react";
import axios from "axios";
import { jwtDecode } from "jwt-decode";
import Cookies from "js-cookie";

import GV_ChucDanh from "./page/GV_ChucDanh";

import { Button, Typography } from "@mui/material";
import moment from "moment";
import { useNavigate } from "react-router-dom";
import CookiesAxios from "../CookiesAxios";
const DangKyGioChuan = () => {
  const [giangVien, setGiangVien] = useState(null);
  const [loading, setLoading] = useState(true);

  const [ChucDanhGiangVien, setChucDanhGiangVien] = useState(null);
  const [isGVChucDanh, setIsGVChucDanh] = useState(false);

  const [IsOpenCheckKhoa, setIsOpenCheckKhoa] = useState(false);
  const [OpenChucNangtheokhungthoigian, setOpenChucNangtheokhungthoigian] =
    useState({ XemKhungGioChuan: null, ChonKhungGio: null });

  const [MaGV, setMaGV] = useState(null);

  const navigate = useNavigate();
  const [startTime, setStartTime] = useState(null);
  const [endTime, setEndTime] = useState(null);
  useEffect(() => {
    const auth = Cookies.get("accessToken");
    const decodeAuth = jwtDecode(auth);
    fetchDataGV(decodeAuth.taikhoan);
  }, []);

  const formatDate = (dateString) => {
    if (!dateString) return ""; // Trả về chuỗi rỗng nếu ngày không có giá trị

    const date = moment(dateString);
    if (!date.isValid()) return ""; // Trả về chuỗi rỗng nếu định dạng không đúng

    return date.format("YYYY-MM-DD"); // Định dạng ngày theo yêu cầu
  };

  const fetchDataGV = async (taikhoan) => {
    setLoading(true); // Đặt loading thành true khi bắt đầu lấy dữ liệu
    try {
      const response = await CookiesAxios.get(
        `${process.env.REACT_APP_URL_SERVER}/api/v1/admin/giangvien/only/xemprofile/${taikhoan}`
      );
      const response_XemTimeKhungGioChuan = await CookiesAxios.get(
        `${process.env.REACT_APP_URL_SERVER}/api/v1/quyengiangvien/giangvien/xem/thoigianxacnhan`
      );

      if (
        response_XemTimeKhungGioChuan.data.EC === 1 &&
        response_XemTimeKhungGioChuan.data.DT.length > 0
      ) {
        // Tìm phần tử có TEN_KHOA trùng khớp
        const matchedKhoa = response_XemTimeKhungGioChuan.data.DT.find(
          (item) =>
            item.TEN_KHOA === response.data.DT.TENKHOA &&
            item.GHICHU === "CHONKHUNG"
        );

        if (matchedKhoa) {
          const startTime = matchedKhoa.THOIGIANBATDAU;
          const endTime = matchedKhoa.THOIGIANKETTHUC;
          // Định dạng startTime và endTime chỉ lấy ngày
          const formattedStartDate = formatDate(startTime);
          const formattedEndDate = formatDate(endTime);

          setStartTime(moment(startTime).format("DD-MM-YYYY"));
          setEndTime(moment(endTime).format("DD-MM-YYYY"));
          // Lấy thời gian hiện tại và định dạng chỉ có ngày
          const currentDate = formatDate(moment().format()); // Định dạng ngày hiện tại

          // So sánh currentDate với startMoment và endMoment
          if (
            moment(currentDate, "YYYY-MM-DD").isBetween(
              moment(formattedStartDate, "YYYY-MM-DD"),
              moment(formattedEndDate, "YYYY-MM-DD"),
              null,
              "[)"
            )
          ) {
            setOpenChucNangtheokhungthoigian({
              XemKhungGio: "Xem Khung Giờ",
              ChonKhungGio: "Chọn Khung Giờ",
            });
            setIsOpenCheckKhoa(true);
          } else {
            setOpenChucNangtheokhungthoigian({
              XemKhungGio: "Xem Khung Giờ",
            });
          }
        } else {
          setOpenChucNangtheokhungthoigian({
            XemKhungGio: "Xem Khung Giờ",
          });
        }
      } else {
        setOpenChucNangtheokhungthoigian({
          XemKhungGio: "Xem Khung Giờ",
        });
      }

      if (response.data.EC === 1) {
        setGiangVien(response.data.DT);
        setChucDanhGiangVien(response.data.DT.TENCHUCDANH);
        setMaGV(response.data.DT.MAGV);
        if (response.data.DT.TENCHUCDANH) {
          setIsGVChucDanh(true);
        } else {
          setIsGVChucDanh(false);
        }
      }
    } catch (error) {
      console.error("Lỗi khi lấy dữ liệu bộ môn:", error);
    } finally {
      setLoading(false); // Đặt loading thành false sau khi lấy dữ liệu xong
    }
  };

  const handleMoveProfileGV = () => {
    if (!loading) {
      navigate("/admin/");
    }
  };

  if (loading) {
    return <Typography>Đang tải dữ liệu, vui lòng đợi...</Typography>; // Hiển thị thông báo tải dữ liệu
  }

  if (isGVChucDanh) {
    return (
      <GV_ChucDanh
        IsOpenCheckKhoa={IsOpenCheckKhoa}
        OpenChucNangtheokhungthoigian={OpenChucNangtheokhungthoigian}
        ChucDanhGiangVien={ChucDanhGiangVien}
        MaGV={MaGV}
        fetchDataGV={fetchDataGV}
        startTime={startTime}
        endTime={endTime}
      />
    );
  }

  return (
    <Typography>
      Hãy Cập Nhật Chức Danh Để Đăng Ký Khung Giờ Chuẩn{" "}
      <Button variant="outlined" onClick={handleMoveProfileGV}>
        Cập Nhật Chức Danh <i className="fa-solid fa-right-long ml-4"></i>
      </Button>{" "}
    </Typography>
  );
};

export default DangKyGioChuan;
