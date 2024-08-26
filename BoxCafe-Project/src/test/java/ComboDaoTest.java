import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.boxcf.dao.ComboDao;
import com.boxcf.models.Combo;

public class ComboDaoTest {
	private ComboDao dao;
	private Combo combo;

	@BeforeTest
	public void setUp() {

		dao = new ComboDao();
		combo = new Combo();
		combo.setMaCB("CB007XL");
		combo.setTenCB("Combo 1");
		combo.setGia(300000);
		combo.setMaLoaiBox("XL");
		combo.setSoLuongDoUong(2);
		combo.setSoLuongDoAn(2);
		combo.setMoTa("abc");
	}

	@Test(priority = 1)
	public void TestInsertSuccessfuly() throws Exception {
		dao.insertTest(combo);

	}

	@Test(priority = 2, expectedExceptions = Error.class)
	public void TestInsertFalure() throws Exception {
		dao.insertTest(combo);

	}

	@Test(priority = 3)
	public void TestGet() {
		Combo comboGeted = dao.selectById(combo.getMaCB());
		Assert.assertTrue(comboGeted != null);
	}

	@Test(priority = 4)
	public void TestUpdate() {
		String expected = "Combo Update";

		combo.setTenCB(expected);

		dao.update(combo);

		Combo comboGeted = dao.selectById(combo.getMaCB());
		Assert.assertEquals(expected, comboGeted.getTenCB());
	}

	@Test(priority = 5)
	public void TestDelete() {

		dao.delete(combo.getMaCB());

		Combo comboGeted = dao.selectById(combo.getMaCB());
		Assert.assertEquals(true, comboGeted == null);
	}

}
