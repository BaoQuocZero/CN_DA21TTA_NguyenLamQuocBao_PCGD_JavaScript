import React, { useEffect, useState } from "react";
import Cookies from "js-cookie";
import { jwtDecode } from "jwt-decode";
import {
    Bar,
    Line,
    Pie,
    Doughnut,
    Radar,
    Bubble,
    Scatter,
    Chart,
    PolarArea,
} from "react-chartjs-2";
import "chart.js/auto"; // Đăng ký tự động
import { Select, MenuItem, FormControl, InputLabel } from '@mui/material';

import {
    fetchDataGV,
    fetch_Lay_BoMon_Thuoc_KhoaChuan,
    fetch_Lay_NamHoc_HocKyNienKhoaController,

    fetch_Lay_BieuDo_GioDay_KhungChuan,
    fetch_Lay_BieuDo_Theo_BoMon_NamHoc,
} from "./Services/ThongKeServces";

const ThongKe = () => {
    const auth = Cookies.get("accessToken");
    const [giangVien, setGiangVien] = useState(null);
    const [boMon, setBoMon] = useState([]);
    const [NamHoc_HocKynienKhoa, setNamHoc_HocKynienKhoa] = useState([]);
    const [SelectBoMon, setSelectBoMon] = useState([]);
    const [SelectNamHoc_HocKynienKhoa, setSelectNamHoc_HocKynienKhoa] = useState([]);
    // Biểu đồ hỗn hợp (Mixed Chart)
    const [mixedData, setMixedData] = useState({
        labels: ["January", "February", "March", "April"],
        datasets: [
            {
                label: "Sales",
                type: "bar",
                data: [30, 20, 50, 80],
                backgroundColor: "#FF6384",
            },
            {
                label: "Revenue",
                type: "line",
                data: [20, 35, 40, 60],
                borderColor: "#36A2EB",
                fill: false,
            },
        ],
    });
    const [polarData, setPolarData] = useState({
        labels: ["Red", "Blue", "Yellow", "Green"],
        datasets: [
            {
                data: [300, 50, 100, 75],
                backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0"],
            },
        ],
    })

    useEffect(() => {
        const decodeAuth = jwtDecode(auth);

        // Gọi API lấy dữ liệu giảng viên
        const getGiangVien = async () => {
            try {
                const gv = await fetchDataGV(decodeAuth.taikhoan);
                setGiangVien(gv);
            } catch (error) {
                console.error("Lỗi khi lấy giảng viên:", error);
            }
        };
        getGiangVien();

        const getNamHoc_HocKynienKhoa = async () => {
            try {
                const nh_hknk = await fetch_Lay_NamHoc_HocKyNienKhoaController();
                setNamHoc_HocKynienKhoa(nh_hknk);
            } catch (error) {
                console.error("Lỗi khi lấy giảng viên:", error);
            }
        };
        getNamHoc_HocKynienKhoa();

    }, [auth]);

    useEffect(() => {
        const getBoMon = async () => {
            try {
                const bm = await fetch_Lay_BoMon_Thuoc_KhoaChuan(giangVien.MAGV);
                setBoMon(bm);
            } catch (error) {
                console.error("Lỗi khi lấy giảng viên:", error);
            }
        };
        getBoMon();
        // Gọi API lấy dữ liệu biểu đồ khi có thông tin giảng viên
        const Lay_BieuDo_GioDay_KhungChuan = async () => {
            try {
                const data = await fetch_Lay_BieuDo_GioDay_KhungChuan(giangVien.MAGV); // Giả sử bạn đã có hàm fetch dữ liệu

                // Khởi tạo các mảng chứa các giá trị cần thiết
                const label = []; // chứa TENNAMHOC
                const TONG_GIO_HANH_CHINH = []; // chứa TONG_GIO_HANH_CHINH
                const TONG_SO_GIO = []; // chứa TONG_SO_GIO

                // Duyệt qua dữ liệu và lấy các trường cần thiết
                data.forEach(item => {
                    label.push(item.TENNAMHOC); // Thêm TENNAMHOC vào mảng label
                    TONG_GIO_HANH_CHINH.push(parseInt(item.TONG_GIO_HANH_CHINH)); // Chuyển đổi TONG_GIO_HANH_CHINH thành số và thêm vào mảng
                    TONG_SO_GIO.push(parseInt(item.TONG_SO_GIO)); // Chuyển đổi TONG_SO_GIO thành số và thêm vào mảng
                });

                // Cập nhật dữ liệu vào state để vẽ biểu đồ
                setMixedData({
                    labels: label, // Gán nhãn là mảng 'label' chứa TENNAMHOC
                    datasets: [
                        {
                            label: "Khung chuẩn", // Tiêu đề của bộ dữ liệu
                            type: "bar",
                            data: TONG_GIO_HANH_CHINH, // Dữ liệu cho TONG_GIO_HANH_CHINH
                            backgroundColor: "#FF6384", // Màu cho cột "Tổng Giờ Hành Chính"
                        },
                        {
                            label: "Tổng Số Giờ Dạy", // Tiêu đề của bộ dữ liệu
                            type: "bar",
                            data: TONG_SO_GIO, // Dữ liệu cho TONG_SO_GIO
                            backgroundColor: "#36A2EB", // Màu cho cột "Tổng Số Giờ"
                        },
                    ],
                });

            } catch (error) {
                console.error("Lỗi khi lấy dữ liệu biểu đồ:", error);
            }
        };
        Lay_BieuDo_GioDay_KhungChuan();

    }, [giangVien]); // Giả sử giangVien có thể thay đổi, nếu không thì có thể bỏ nó khỏi dependency      

    useEffect(() => {

        const getLay_BieuDo_Theo_BoMon_NamHoc = async () => {
            try {
                const data = await fetch_Lay_BieuDo_Theo_BoMon_NamHoc(SelectBoMon, SelectNamHoc_HocKynienKhoa);
                setPolarData({
                    labels: ["Số giờ dạy", "Khung chuẩn"],
                    datasets: [
                        {
                            data: [data[0].TONG_SO_GIO, data[0].GIOGIANGDAY_HANHCHINH],
                            backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0"],
                        },
                    ],
                })
            } catch (error) {
                console.error("Lỗi khi lấy giảng viên:", error);
            }
        };
        getLay_BieuDo_Theo_BoMon_NamHoc();

    }, [SelectBoMon, SelectNamHoc_HocKynienKhoa]);

    const handleBoMonChange = (event) => {
        setSelectBoMon(event.target.value);
    };

    const handleNamHocChange = (event) => {
        setSelectNamHoc_HocKynienKhoa(event.target.value);
    };

    return (
        <div className="row">
            <div className="col-md-8">
                <h2>Biểu đồ Khung Chuẩn / Giờ Dạy Thực</h2>
                <Chart type="bar" data={mixedData} />
            </div>

            <div className="col-md-4">
                <h2>Biểu đồ theo bộ môn</h2>
                <FormControl fullWidth style={{ marginBottom: '20px' }}>
                    <InputLabel id="bo-mon-label">Bộ môn</InputLabel>
                    <Select
                        labelId="bo-mon-label"
                        value={SelectBoMon}
                        onChange={handleBoMonChange}
                    >
                        {boMon.map((item, index) => (
                            <MenuItem key={index} value={item.MABOMON}>
                                {item.TENBOMON}
                            </MenuItem>
                        ))}
                    </Select>
                </FormControl>
                <FormControl fullWidth style={{ marginBottom: '20px' }}>
                    <InputLabel id="nam-hoc-label">Năm học</InputLabel>
                    <Select
                        labelId="nam-hoc-label"
                        value={SelectNamHoc_HocKynienKhoa}
                        onChange={handleNamHocChange}
                    >
                        {NamHoc_HocKynienKhoa.map((item, index) => (
                            <MenuItem key={index} value={item.MAHKNK}>
                                {item.TENHKNK} - {item.TEN_NAM_HOC}
                            </MenuItem>
                        ))}
                    </Select>
                </FormControl>
                <PolarArea data={polarData} />
            </div>
        </div>
    );
};

export default ThongKe;
