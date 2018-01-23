package com.kkcvs.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 14437 on 2017/5/24.
 */
public class POIUtil {
    public static List<String[]> readExcel(MultipartFile file) throws IOException {
        Workbook workbook = getWorkBook(file);
        List<String[]> context = new ArrayList<String[]>();
        if(workbook != null){
            for(int sheetNum = 0;sheetNum < workbook.getNumberOfSheets();sheetNum++){
                Sheet sheet = workbook.getSheetAt(sheetNum);
                int fistRowNumber = sheet.getFirstRowNum();
                int lastRowNumber = sheet.getLastRowNum();
                for(int rowNumber=fistRowNumber+1;rowNumber<= lastRowNumber;rowNumber++){
                    Row row = sheet.getRow(rowNumber);
                    if(row==null)
                        continue;
                    int fistCellNumber = row.getFirstCellNum();
                    int lastCellNumber = row.getLastCellNum();
                    String[] cells = new String[row.getPhysicalNumberOfCells()];
                    for(int cellNumber = fistCellNumber;cellNumber<lastCellNumber;cellNumber++){
                        Cell cell = row.getCell(cellNumber);
                        cells[cellNumber] = getCellValue(cell);
                    }
                    context.add(cells);
                }

            }
            workbook.close();
        }
        return context;
    }

    private static Workbook getWorkBook(MultipartFile file) {
        Workbook workbook = null;
        try {
            InputStream is = file.getInputStream();
            workbook = new XSSFWorkbook(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }

    private static String getCellValue(Cell cell){
        String cellValue = "";
        if(cell == null){
            return cellValue;
        }
        if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
            cell.setCellType(Cell.CELL_TYPE_STRING);
        }
        switch (cell.getCellType()){
            case Cell.CELL_TYPE_NUMERIC:
                cellValue = String.valueOf(cell.getNumericCellValue());
                break;
            case Cell.CELL_TYPE_STRING:
                cellValue = String.valueOf(cell.getStringCellValue());
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue());
                break;
            case Cell.CELL_TYPE_BLANK:
                cellValue = "";
                break;
            case Cell.CELL_TYPE_ERROR:
                cellValue = "非法字符";
                break;
            default:
                cellValue = "未知类型";
                break;
        }
        return cellValue;
    }
}
