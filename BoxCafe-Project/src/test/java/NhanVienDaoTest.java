import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.box.utils.XDate;
import com.boxcf.dao.NhanVienDao;
import com.boxcf.models.NhanVien;

public class NhanVienDaoTest {
	private NhanVienDao dao;
	private NhanVien nv;

	@BeforeTest
	public void setUp() {
		dao = new NhanVienDao();
		nv = new NhanVien();
		nv.setMaNV("NV09");
		nv.setTenNV("Phan Thanh Phương Nhã");
		nv.setSDT("0344507491");
		nv.setNgaySinh(XDate.toDate("12/2/2002", "MM/dd/yyyy"));
		nv.setGioiTinh(true);
		nv.setVaiTro("Admin");
		nv.setNgayVaoLam(XDate.toDate("12/2/2023", "MM/dd/yyyy"));
		nv.setDiaChi("Chau Thanh, Hau Giang");
		nv.setMatKhau("123456789");
		nv.setHinhAnh("gondel.jpg");
	}

	@Test(priority = 1)
	public void TestInsertSuccessfuly() throws Exception {
		dao.insertTest(nv);
	}

	@Test(priority = 2, expectedExceptions = Error.class)
	public void TestInsertFailure() throws Exception {
		dao.insertTest(nv);
	}

	@Test(priority = 3)
	public void TestGet() {
		NhanVien nvGeted = dao.selectById(nv.getMaNV());
		Assert.assertTrue(nvGeted != null);
	}

	@Test(priority = 4)
	public void TestGetEqua() {
		NhanVien nvGeted = dao.selectById(nv.getMaNV());
		Assert.assertTrue(nvGeted.equals(nv));
	}
	
	@Test(priority = 5)
	public void TestLogin() {
		NhanVien nvLogined = dao.login(nv.getMaNV(), nv.getMatKhau());
		Assert.assertTrue(nvLogined != null);
	}

	@Test(priority = 6)
	public void TestUpdate() {
		String expected = "0987061406";
		nv.setSDT(expected);
		dao.update(nv);

		NhanVien nvGeted = dao.selectById(nv.getMaNV());

		Assert.assertEquals(expected, nvGeted.getSDT());
	}

	@Test(priority = 7)
	public void TestDelete() {
		dao.delete(nv.getMaNV());

		NhanVien nvGeted = dao.selectByIdActive(nv.getMaNV());

		Assert.assertEquals(true, nvGeted == null);
	}

	@AfterClass
	public void clear() {
		dao.destroy(nv.getMaNV());
	}
	

}
