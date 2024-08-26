
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.box.utils.XDate;
import com.boxcf.dao.HoaDonDao;
import com.boxcf.models.HoaDon;

public class HoaDonDaoTest {
	private HoaDonDao dao;
	private HoaDon hd;

	@BeforeTest
	public void setUp() {

		dao = new HoaDonDao();
		hd = new HoaDon();
		hd.setNgayTao(XDate.toDate("12/2/2023", "dd/MM/yyyy"));
		hd.setTenKH("abc");
		hd.setMaNV("NV04");
		hd.setGhiChu("123");
		hd.setTONGTIEN(100000);
		hd.setMaKM(null);

	}

	@Test(priority = 1)
	public void TestInsert() throws Exception {
		try {
			dao.inserts(hd);
		} catch (Exception e) {
			Assert.assertTrue(false);
		}

	}
}
