package orm;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;

import java.io.*;
import java.math.BigDecimal;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by vincent on 2016/1/8.
 */
public class EmployeeCSVDAO implements EmployeeDAO {

    private Path employeeCSVPath(){
        URL url = getClass().getResource("");
        Path path = null;
        try {
            path = Paths.get(url.toURI());
            path = path.resolve("../../src/orm/Employee.csv");
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        return path;
    }

    private InputStreamReader readEmployeeCSV() throws IOException {

        Path path = employeeCSVPath();
        InputStream is = Files.newInputStream(path);
        return new InputStreamReader(is, "MS950");
    }

    public List<Employee> listEmployees() {

        List<Employee> employees = new ArrayList<>();
        try {
            InputStreamReader reader = readEmployeeCSV();
            CSVParser parser = CSVFormat.EXCEL.withHeader().parse(reader);
            List<CSVRecord> results = parser.getRecords();
            for (int i = 0; i < results.size(); i++) {
                CSVRecord record = results.get(i);
                Employee employee = new Employee();
                employee.setEmpNO(Integer.parseInt(record.get("EMPNO")));
                employee.setCommission(new BigDecimal(record.get("COMMISSION")));
                employee.setSalary(new BigDecimal(record.get("SALARY")));
                employee.setJob(record.get("JOB"));
                employee.setName(record.get("ENAME"));
                employee.setVersion(Integer.parseInt(record.get("Version")));
                employees.add(employee);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public void updateEmployee(Employee employee) {

        try {
            InputStreamReader reader = readEmployeeCSV();
            CSVParser parser = CSVFormat.EXCEL.withHeader().parse(reader);
            List<CSVRecord> results = parser.getRecords();

            Path path = this.employeeCSVPath();
            OutputStream os = Files.newOutputStream(path);
            OutputStreamWriter fos = new OutputStreamWriter(os, "MS950");
            Map<Integer, String> colum = new HashMap<>();
            parser.getHeaderMap().forEach((column, index) -> {
                colum.put(index, column);
            });
            List<String> columns = new ArrayList<>();
            for (int i = 0; i < colum.size(); i++) {
                columns.add(colum.get(i));
            }
            CSVPrinter csvPrinter = CSVFormat.EXCEL.withHeader(columns.toArray(new String[]{})).print(fos);
            for (CSVRecord record : results) {
                int empno = Integer.parseInt(record.get("EMPNO"));
                if (empno == employee.getEmpNO()) {
                    for (String columnName : columns) {
                        if ( columnName.equals("EMPNO")){
                            csvPrinter.print(record.get(columnName));
                        }else if ( columnName.equals("COMMISSION")){
                            csvPrinter.print(employee.getCommission());
                        }else if ( columnName.equals("SALARY") ){
                            csvPrinter.print(employee.getSalary());
                        }else if ( columnName.equals("JOB")){
                            csvPrinter.print(employee.getJob());
                        }else if ( columnName.equals("ENAME") ){
                            csvPrinter.print(employee.getName());
                        }else if ( columnName.equals("Version") ){
                            csvPrinter.print(employee.getVersion()+1);
                        }else if ( columnName.equals("DEPTNO") || columnName.equals("HIREDATE")){
                            csvPrinter.print(record.get(columnName));
                        }
                    }
                    csvPrinter.println();
                } else {
                    for (String columnName : columns) {
                        csvPrinter.print(record.get(columnName));
                    }
                    csvPrinter.println();
                }
            }
            csvPrinter.flush();
            fos.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
