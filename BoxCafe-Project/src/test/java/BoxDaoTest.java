import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.boxcf.dao.BoxDao;
import com.boxcf.models.Box;

public class BoxDaoTest {

	private BoxDao dao;
	private Box box;

	@BeforeTest
	public void setUp() {

		dao = new BoxDao();
		box = new Box();
		box.setMaBox("B013XL");
		box.setMaLoaiBox("XL");
		box.setTenBox("Box 13");
		box.setHinhAnh(null);
		box.setMoTa("abc");
	}

	@Test(priority = 1)
	public void TestInsert() throws Exception {
		try {
			dao.insert(box);
		} catch (Exception e) {
			Assert.assertTrue(false);
		}

	}

	@Test(priority = 2)
	public void TestGet() {
		Box boxGeted = dao.selectById(box.getMaBox());
		Assert.assertTrue(boxGeted != null);
	}

	@Test(priority = 3)
	public void TestUpdate() {
		String expected = "Box Update";

		box.setTenBox(expected);

		dao.update(box);

		Box boxGeted = dao.selectById(box.getMaBox());
		Assert.assertEquals(expected, boxGeted.getTenBox());
	}

	@Test(priority = 4)
	public void TestDelete() {

		dao.delete(box.getMaBox());

		Box boxGeted = dao.selectById(box.getMaBox());
		Assert.assertEquals(true, boxGeted == null);
	}
}
