
import com.ibm.db2.jcc.t4.h;


import java.sql.* ;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Scanner;

public class GoBabbyApp {
    private static String exit = "E";
    private static String reviewNotes = "1";
    private static String reviewTests = "2";
    private static String addNote = "3";
    private static String prescribeTest = "4";
    private static String goBackApp = "5";
    private static String goBackDate = "D";
    // We build here our private String we will use as our options

    private static int practionerid;
    private static boolean present = false;
    private static Scanner scan = new Scanner(System.in);
    private static String text;
    private static ArrayList<Integer> primary = new ArrayList<>();
    private static ArrayList<Integer> techid = new ArrayList<>();
    // those arraylist will be kept in order to see the status of the practioner towards its appointment

    private static String type = "";

    private static Date date;
    private static java.sql.ResultSet rs;
    private static Integer maximumLength = 50;
    private static int milli = 1000;
    private static int timeinmin = 60;


    private static String adate;
    private static String ahour;
    private static String mname;
    private static String mramqid;
    private static int pregnancyid;

    private static String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";
    //REMEMBER to remove your user id and password before submitting your code!!
    private static String your_userid = "";
    private static String your_password = "";
    private static Connection con;
    private static Statement statement;


    public static void main(String[] args) throws SQLException {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode = 0;      // Variable to hold SQLCODE
        String sqlState = "00000";  // Variable to hold SQLSTATE

        if (args.length > 0)
            tableName += args[0];
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.

        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }

        con = DriverManager.getConnection(url, your_userid, your_password);
        statement = con.createStatement();

        // Creating a table


        while (present == false) {

            // we get the practionerid here
            practionerid = Start();

            try {
                // we verify it to be valid
                String querySQL = "SELECT COUNT(*) as numpid FROM midwife WHERE practionerid = " + practionerid;
                java.sql.ResultSet rsMid = statement.executeQuery(querySQL);
                // we verify whether the practionerid is present in the database
                while (rsMid.next()) {
                    int numpid = rsMid.getInt("numpid");
                    // we get the number of midwife with this practioner id
                    // it can either return 1 or 0
                    if (numpid == 0) {
                        // if it's 0 then the practioner id entered is invalid
                        present = false;
                        // we return the error message
                        System.out.println("ERROR: INVALID PRACTIONER ID");
                    } else {
                        present = true;
                    }
                }

            } catch (SQLException e) {
                sqlCode = e.getErrorCode(); // Get SQLCODE
                sqlState = e.getSQLState(); // Get SQLSTATE

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }

        try {
            // we get the pregnancies for which the practioner is the primary midwife
            String querySQL2 = "SELECT pregnancyid, midwife1id, midwife2id FROM assignedat WHERE midwife1id = " + practionerid + " OR midwife2id = " + practionerid;
            java.sql.ResultSet rsMidStatus = statement.executeQuery(querySQL2);


            while (rsMidStatus.next()) {
                // we get the status of the midwife towards all the associated appointments
                int pregnancyid = rsMidStatus.getInt("pregnancyid");
                int midwife1 = rsMidStatus.getInt("midwife1id");
                if (practionerid == midwife1) {
                    primary.add(pregnancyid);
                    // if it's the primary midwife it is added here
                }
            }
        } catch (SQLException e) {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        setDate();
        // Querying a table
        try {
            while (true) {
                java.sql.ResultSet rsApp = getResultSet();
                // we get the value of the appointment
                getResultSetApp(rsApp);


                //while text not a num loop!
                int appNum = getAppointment();
                rs = getResultSet();

                // we get the result of the avaialable appointments
                rsApp = getResultSetAppDetails(rs, appNum);

                // we get the value by column Label
                adate = rsApp.getString("adate");
                ahour = rsApp.getString("ahour");
                mname = rsApp.getString("mname");
                mramqid = rsApp.getString("mramqid");
                pregnancyid = rsApp.getInt("pregnancyid");
                if (primary.contains(pregnancyid)) {
                    type = "P";
                } else {
                    type = "B";
                    // this describes the status of the midwife given the appointments (Backup or Primary)
                }

                while (true) {
                    // we print the values associated with the appointments of the midwife
                    System.out.print("\n"+adate);
                    System.out.print("  " + ahour + " " + type);
                    System.out.print("  " + mname);
                    System.out.print("  " + mramqid + "\n");
                    String action = currentAction();
                    // we get the actions
                    // and the String associated with those value
                    if (action.equals(goBackApp)) {
                        break;
                    } else if (action.equals(reviewNotes)) {
                        reviewNotes();
                    } else if (action.equals(addNote)) {
                        addANote();
                    } else if (action.equals(reviewTests)) {
                        reviewTests();
                    } else if (action.equals(prescribeTest)) {
                        addATest();
                        // we have all of the different options
                    } else {
                        System.out.println("The command is not a valid action.");
                        // error terms
                    }
                }
                System.out.println("DONE");
            }
        } catch (SQLException e) {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        // Finally but importantly close the statement and connection
        statement.close();
        con.close();
    }

    private static int Start() throws SQLException {
        // we get the practioner id of the midwife
        int practionerid = 0;
        while(true) {
            // we build a loop until we get the proper format
            try {
                System.out.println("Please enter your practioner id [E] to exit: \n");
                text= scan.nextLine();
                practionerid = Integer.parseInt(text);
                break;
                //we try to get the value of the action
            } catch (NumberFormatException e) {
                // else we verify if the value entered may be used to change date or exit the application
                if (text.equals(exit)) {
                    finish();
                }
                // we build the loop to valid the format of the practionerid
                System.out.println("ERROR: INVALID PRACTIONER ID : FORMAT INVALID");

            }
        }
        return practionerid;
    }

    private static String getDate() {
        // we get the 1 st date here
        System.out.println("Please enter the date for appointment list [E] to exit: \n");
        return scan.nextLine();
    }

    private static int getAppointment() throws SQLException {

        int intValue;
        while (true) {
            // we build an ifinite loop until we get the proper format
            // we fetch the appointment number here
            System.out.println("Enter the appointment number that you would like to work on.\n\t\t\t [E] to exit [D] to go back to another date:");
            text = scan.nextLine();
            try {
                intValue = Integer.parseInt(text);
                //we try to get the value of the action
                break;
            } catch (NumberFormatException e) {
                // else we verify if the value entered may be used to change date or exit the application
                if (text.equals(exit)) {
                    finish();
                }
                // we consider the options depending on what the client wants
                if (text.equals(goBackDate)) {
                    // we reset the date here
                    setDate();
                    rs = getResultSet();
                    // we get the value for the appointments here
                    getResultSetApp(rs);
                }
            }
        }
        return intValue;
    }

    private static String currentAction() {
        // we get the options and the return the one chosen
        System.out.println(" 1. Review notes\n 2. Review tests\n 3. Add a note\n 4. Prescribe a test\n 5. Go back to the appointments\n\n Enter your choice: ");
        return scan.nextLine();
    }

    private static String getAddNote() {
        // we get the note we want committed to the database
        System.out.println("Please type your observation: \n");
        return scan.nextLine();
    }

    private static void addANote() throws ParseException {
        // we add a note and get it
        String content = getAddNote();

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = dateFormat.parse(adate);
        // the date returned for the time stamp is the one of the appointment
        LocalTime localtime = LocalTime.now();
        // we use our current localtime to create a time stamp
        System.out.println(date);
        long time = date.getTime() + localtime.getSecond() * milli + localtime.getMinute() * milli * timeinmin + localtime.getHour() * milli * timeinmin * timeinmin;
        Timestamp sqlTimestamp = new Timestamp(time);

        try {
            // we addd the note here
            String insertSQL = "INSERT INTO notes VALUES (\'" + adate + "\' , \'" + ahour + "\' , " + pregnancyid + " , \'" + sqlTimestamp + "\', \'" + content + "\' ) ";
            System.out.println(insertSQL);
            statement.executeUpdate(insertSQL);


        } catch (SQLException e) {
            int sqlCode = e.getErrorCode(); // Get SQLCODE
            String sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
    }

    private static String getAddTest() {
        // we enter the name of the test
        System.out.println("Please enter the type of test: \n");
        return scan.nextLine();
    }

    private static void addATest() throws SQLException {
        // we get the available technicians if a test is needed
        fetchTechid();

        String content = getAddTest();
        try {
            // we insert into the test appointment
            String insertSQL = "INSERT INTO testapp VALUES (\'" + adate + "\' , \'" + ahour + "\' , " + pregnancyid + " , \'" + content + "\', \'" + adate + "\', \'" + adate + "\' , " + null + " ) ";
            System.out.println(insertSQL);
            statement.executeUpdate(insertSQL);

            // we get a random value among the technician

            // we create the labwork and insert into the database

            insertSQL = "INSERT INTO labwork VALUES (\'" + adate + "\' , \'" + ahour + "\' , " + pregnancyid + " , \'" + content + "\', \'" + adate + "\', \'" + getTechid() + "\' , " + null + " ) ";
            System.out.println(insertSQL);
            statement.executeUpdate(insertSQL);


            // we consider the type of type of the test appointment we are considering
            if (content.toLowerCase().contains("expected") || content.toLowerCase().contains("ultrasound")) {
                String method = "last menstrual period";
                if (content.toLowerCase().contains("ultrasound")) {
                    method = "dating ultrasound";
                }
                // we try to predict of test appointment depending on key works
                insertSQL = "INSERT INTO expectedmeeting VALUES (\'" + adate + "\' , \'" + ahour + "\' , " + pregnancyid + " , \'" + content + "\', \'" + adate + "\', \'" + method + "\' , " + null + " ) ";
                System.out.println(insertSQL);
                statement.executeUpdate(insertSQL);
            } else {
                // depending on the name of the test we try to predict the sample
                // the base case is for blood
                String sample = "Blood";
                if (content.toLowerCase().contains("hormone")) {
                    sample = "Saliva";
                } else if (content.toLowerCase().contains("dr")) {
                    sample = "Urine";
                }
                // this is in the case of a sampling test appointment
                insertSQL = "INSERT INTO samplingtestapp VALUES (\'" + adate + "\' , \'" + ahour + "\' , " + pregnancyid + " , \'" + content + "\', \'" + adate + "\', \'" + sample + "\' ) ";
                System.out.println(insertSQL);
                statement.executeUpdate(insertSQL);
            }


        } catch (SQLException e) {
            int sqlCode = e.getErrorCode(); // Get SQLCODE
            String sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
    }


    private static void getResultSetApp(ResultSet rsA) throws SQLException {
        int i = 1;
        String type = "";
        while (rsA.next()) {
            // we print the Results when fetching a ResultSet
            adate = rsA.getString(1);
            ahour = rsA.getString(2);
            mname = rsA.getString(3);
            mramqid = rsA.getString(4);
            pregnancyid = rsA.getInt(5);
            if (primary.contains(pregnancyid)) {
                type = "P";
            } else {
                type = "B";
            }
            // We print the values associated with each appointment
            System.out.print(i + ": " + adate);
            System.out.print("  " + ahour + " " + type);
            System.out.print("  " + mname);
            System.out.print("  " + mramqid + "\n");

            i++;

        }
    }

    private static com.ibm.db2.jcc.t4.h getResultSetAppDetails(ResultSet rs, int row) throws SQLException {
        // we return the proper appointment
        int i = 1;
        while (rs.next()) {
            if (i == row) {
                break;
            }
            i++;
            // we return here a particular appointment for a mother depending on the appointment selected
        }
        return (h) rs;
    }

    private static ResultSet getResultSet() throws SQLException {
        // we return the Result Set for the query depending on a certain pregnancy and the chosen date
        String querySQL3 = "SELECT a.adate, a.ahour, m.mname, m.mramqid, a.pregnancyid FROM appointment a, mother m, conceive c WHERE a.midwifeid = " + practionerid
                + " AND a.pregnancyid = c.pregnancyid AND a.adate = \'" + date + "\' AND c.motherramq = m.mramqid ORDER BY a.adate, a.ahour";
        return statement.executeQuery(querySQL3);

    }

    private static int getTechid() throws SQLException {
        // we randomly fetch a techid here
        int index = (int) (Math.random() * techid.size());
        return techid.get(index);
    }

    private static void fetchTechid() throws SQLException {
        // we get all of the technician if we need a test
        String querySQL = "SELECT techid from technician";
        ResultSet rs = statement.executeQuery(querySQL);
        while (rs.next()) {
            // we add all the techid to the Arraylist containing them
            int tech = rs.getInt("techid");
            techid.add(tech);
        }
    }

    //private static void
    private static void finish() throws SQLException {
        // we have here the code terminating the application
        statement.close();
        con.close();
        System.out.println("SYSTEM EXIT");
        System.exit(0);
    }

    private static void reviewNotes() throws SQLException {

        try {
            // we fetch here the timestamp and the content from the notes relevant to a certain pregnancy
            String querySQL2 = "SELECT ntimestamp, ncontent FROM notes WHERE npregnancyid = " + pregnancyid + " ORDER BY ntimestamp";
            java.sql.ResultSet rs2 = statement.executeQuery(querySQL2);


            while (rs2.next()) {
                // we obtain the contents and the timestamp
                String ntimestamp = rs2.getString("ntimestamp");
                String ncontent = rs2.getString("ncontent");
                if (ncontent.length() > maximumLength) {
                    // we limit the length of the content of the notes
                    ncontent = ncontent.substring(0, maximumLength);
                }
                // we print the content and time here
                System.out.println(ntimestamp + " " + ncontent);
            }
        } catch (SQLException e) {
            int sqlCode = e.getErrorCode(); // Get SQLCODE
            String sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

    }

    private static void setDate() throws SQLException {
        // we get the date here
        while(true) {
            try {
                System.out.println("Date Format: YYYY-MM-DD");
                text = getDate();

                if (text.equals(exit)) {
                    finish();
                }
                date = java.sql.Date.valueOf(text);
                break;
            } catch (IllegalArgumentException e) {
                System.out.println("FORMAT OF DATE IS INVALID");

            }
        }
    }

    private static void reviewTests() throws SQLException {

        try {
            // we get here the proper query to retrieve the information relevant to a test
            String querySQL3 = "SELECT tadate, taname, result FROM labwork WHERE tapregnancyid=" + pregnancyid;

            java.sql.ResultSet rs2 = statement.executeQuery(querySQL3);

            while (rs2.next()) {
                // we obtain the values of the tests by columnLabel
                String tadate = rs2.getString("tadate");
                String taname = rs2.getString("taname");
                String result = rs2.getString("result");


                if (result == null) {
                    // if the result is not available yet, we return PENDING
                    result = "PENDING";
                }

                if (result.length() > maximumLength) {
                    // we fix the maximum Length to 50 Characters
                    result = result.substring(0, maximumLength);
                }
                // we return the results here
                System.out.println(tadate + " [" + taname + "] " + result);
            }
        } catch (SQLException e) {
            int sqlCode = e.getErrorCode(); // Get SQLCODE
            String sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
    }
}
