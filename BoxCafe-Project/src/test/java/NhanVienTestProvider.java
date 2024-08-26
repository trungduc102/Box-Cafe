import java.util.Date;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.box.utils.XDate;
import com.boxcf.dao.NhanVienDao;
import com.boxcf.models.NhanVien;

public class NhanVienTestProvider {

	private NhanVienDao dao;
	private NhanVien nv;

	@BeforeTest
	public void setUp() {
		dao = new NhanVienDao();

	}

	@Test(priority = 1, dataProvider = "db")
	public void TestInsert(String id, String name, String phone, Date birth, boolean genther, String role, Date starDay,
			String adress, String passsword, String image) throws Exception {
		nv = new NhanVien();
		nv.setMaNV(id);
		nv.setTenNV(name);
		nv.setSDT(phone);
		nv.setNgaySinh(birth);
		nv.setGioiTinh(genther);
		nv.setVaiTro(role);
		nv.setNgayVaoLam(starDay);
		nv.setDiaChi(adress);
		nv.setMatKhau(passsword);
		nv.setHinhAnh(image);
		dao.insertTest(nv);
	}

	// check rong
	@DataProvider(name = "db")
	private Object[][] db() {
		return new Object[][] {
				{ "NV09", null, "0987654321", XDate.toDate("12/2/2002", "MM/dd/yyyy"), false, "User", // trong ten
						XDate.toDate("12/2/2023", "MM/dd/yyyy"), "Can Tho", "khang123", "gondel.jpg" },
				{ "NV09", "Phan Thanh Phương Nhã", null, XDate.toDate("12/2/2002", "MM/dd/yyyy"), false, "User", //trong role
						XDate.toDate("12/2/2023", "MM/dd/yyyy"), "Can Tho", "khang123", "gondel.jpg" },
				{ "NV09", "Phan Thanh Phương Nhã", "0987654321", XDate.toDate("12/2/2002", "MM/dd/yyyy"), false, "User", // trong pass
						XDate.toDate("12/2/2023", "MM/dd/yyyy"), "Can Tho", null, "gondel.jpg" },
				{ "NV09", "Phan Thanh Phương Nhã", "0987654321", null, false, "User", // trong ngay vao lam
						XDate.toDate("12/2/2023", "MM/dd/yyyy"), "Can Tho", "khang123", "gondel.jpg" },
				{ "NV09", "Phan Thanh Phương Nhã", "0987654321", XDate.toDate("12/2/2002", "MM/dd/yyyy"), false, "User", // day du thong tin
						XDate.toDate("12/2/2023", "MM/dd/yyyy"), "Can Tho", "khang123", "gondel.jpg" } };

	}

	@AfterClass
	public void clear() {
		dao.destroy("NV09");
	}
}
