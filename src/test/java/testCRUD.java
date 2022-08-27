import com.kai.dao.DepartmentMapper;
import com.kai.dao.EmployeeMapper;
import com.kai.pojo.Department;
import com.kai.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.UUID;

/**
 * @Author :wk
 * @Description
 * @Date: Created in 15:36 2022/8/22
 * @modified By:
 */
public class testCRUD {
    /**
     * 测试DepartmentMapper
     */
     @Test
    public void testMapper(){
     //1.创建SpringIOC容器
       ApplicationContext ioc = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
         //2.从容器中获取mapper
//         DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
//         System.out.println(bean);
         EmployeeMapper employeeMapper = ioc.getBean(EmployeeMapper.class);
         //1.插入几个部门
//         bean.insertSelective(new Department(null,"开发部"));
//         bean.insertSelective(new Department(null,"测试部"));
         //2.生成员工数据，测试员工插入
//         employeeMapper.insertSelective(new Employee(null,"tt","M","123@qq.com",2));
         //3.批量插入多个员工
         for(int i = 0;i<1000;i++){
             String substring = UUID.randomUUID().toString().substring(0, 5)+i;
             employeeMapper.insertSelective(new Employee(null,substring,"M",substring+"@qq.com",2));
         }
         System.out.println("批量插入完成");
     }
}
