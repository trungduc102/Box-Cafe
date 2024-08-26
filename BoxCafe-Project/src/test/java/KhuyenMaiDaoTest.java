import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.box.utils.XDate;
import com.boxcf.dao.HoaDonDao;
import com.boxcf.dao.KhuyenMaiDao;
import com.boxcf.models.HoaDon;
import com.boxcf.models.KhuyenMai;

public class KhuyenMaiDaoTest {
	private KhuyenMaiDao dao;
	private KhuyenMai km;

	@BeforeTest
	public void setUp() {

		dao = new KhuyenMaiDao();
		km = new KhuyenMai("KM05", "Khuyen Mai Tri An", XDate.toDate("12/2/2023", "MM/dd/yyyy"),
				XDate.toDate("12/3/2023", "MM/dd/yyyy"), 10, 10, 20000);

	}

	@Test(priority = 1)
	public void TestInsertSuccessfuly() throws Exception {
		dao.insertTest(km);
	}
	
	@Test(priority = 2, expectedExceptions = Error.class)
	public void TestInsertFailure() throws Exception {
		dao.insertTest(km);
	}

	@Test(priority = 3)
	public void TestGet() {
		KhuyenMai kmGeted = dao.selectById(km.getMaKM());
		Assert.assertTrue(kmGeted != null);
	}
	
	@Test(priority = 4)
	public void TestGetEqua() {
		KhuyenMai kmGeted = dao.selectById(km.getMaKM());
		Assert.assertTrue(kmGeted.equals(km));
	}

	@Test(priority = 5)
	public void TestUpdate() {
		String expected = "Khuyen Mai Update";

		km.setTenKM(expected);

		dao.update(km);

		KhuyenMai kmGeted = dao.selectById(km.getMaKM());
		Assert.assertEquals(expected, kmGeted.getTenKM());
	}

	@Test(priority = 6)
	public void TestDelete() {

		dao.delete(km.getMaKM());

		KhuyenMai kmGeted = dao.selectById(km.getMaKM());
		Assert.assertEquals(true, kmGeted == null);
	}
	
	@AfterClass
	public void clear() {
		dao.destroy(km.getMaKM());
	}
}
