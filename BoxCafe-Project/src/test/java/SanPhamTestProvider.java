import java.util.Date;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.boxcf.dao.SanPhamDao;
import com.boxcf.models.SanPham;

public class SanPhamTestProvider {
	private SanPhamDao dao;
	private SanPham sp;

	@BeforeTest
	public void setUp() {
		dao = new SanPhamDao();
		sp = new SanPham();

	}

	@Test(priority = 1, dataProvider = "db")
	public void TestInsert(String id, String name, Long price, String categoryId, String image, String des)
			throws Exception {
		
		sp.setMaSP(id);
		sp.setTenSP(name);
		sp.setGia(price);
		sp.setMaLoai(categoryId);
		sp.setHinhAnh(image);
		sp.setMoTa(des);
		dao.insertTest(sp);
	}

	// check rong
	@DataProvider(name = "db")
	private Object[][] db() {
		return new Object[][] { 
				{ "TS004", "Rau Má Đậu Xanh", 25000, "LSP07", "nho.jpg", "abc" }, };

	}

//	@AfterClass
//	public void clear() {
//		dao.destroy(sp.getMaSP());
//	}
}
