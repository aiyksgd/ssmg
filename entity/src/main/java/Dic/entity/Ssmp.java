package Dic.entity;


import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author ：aiyk
 * @date ：Created in 2022/8/20 16:05
 * @description：1
 * @modified By：
 */

@Data
@Component
public class Ssmp extends Model<Ssmp> {
    private Integer id;
    private String head;
    private String name;
    private int sex;
    private int age;
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;
}
