Table table9;
Table table18;

class Score
{
  //Sort(by time) and Save Tables
  void update9()
  {
    table9 = loadTable("table9.csv", "header");
  
    for (TableRow row : table9.rows())
    {
      String name = row.getString("name");
      float time = row.getFloat("time");
    }
    
    table9.sort("time");  
    saveTable(table9, "data/table9.csv");
  }
  
  void update18()
  {
    table18 = loadTable("table18.csv", "header");
  
    for (TableRow row : table18.rows())
    {
      String name = row.getString("name");
      float time = row.getFloat("time");
    }
    
    table18.sort("time");  
    saveTable(table18, "data/table18.csv");
  }
  
  //Add new entries to tables and call for updates
  void add9(String name, Float time)
  {
    table9 = loadTable("table9.csv", "header");
    
    TableRow newRow = table9.addRow();
    newRow.setString("name", name);
    newRow.setFloat("time", time);
    saveTable(table9, "data/table9.csv");
    
    update9();
  }
  
  void add18(String name, Float time)
  {
    table18 = loadTable("table18.csv", "header");
    
    TableRow newRow = table18.addRow();
    newRow.setString("name", name);
    newRow.setFloat("time", time);
    saveTable(table18, "data/table18.csv");
    
    update18();
  }
}
