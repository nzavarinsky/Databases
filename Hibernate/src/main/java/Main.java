import com.my.KomisiyaEntity;
import com.my.UniversityEntity;
import com.my.KomisiyaEntity;
import com.my.StudikEntity;
import com.my.StudikEntity;
import com.my.UniversityEntity;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import java.util.Scanner;


public class Main {

    private static SessionFactory ourSessionFactory;
    static {
        try { // Create the SessionFactory from hibernate.cfg.xml
            ourSessionFactory =  new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) { throw new ExceptionInInitializerError(ex); }
    }
    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession(); //return opened session
    }
    //---------------------------------------------------------------------------
    public static void main(final String[] args) throws Exception {
        // get opened session
        Session session = getSession();
        try {

            ReadAllTable(session);

            ReadKomisiyaOfStudik(session);
            ReadUniversityTable(session);
            updateUniversity(session);
            ReadAllTable(session);
            ReadKomisiyaOfStudik(session);

            System.out.println("Finish work!");
        } finally { session.close(); System.exit(0); }
    }

    private static void ReadAllTable(Session session){

//region Read Studik
        Query query = session.createQuery("from " + "StudikEntity");

        System.out.format("\nTable Komisiya --------------------\n");
        System.out.format("%3s %-18s %-18s %s\n", "IDStudika", "Surname", "Name","Email");
        for (Object obj : query.list()) {
            StudikEntity studik = (StudikEntity) obj;
            System.out.format("%3d %-18s %-18s %s\n", studik.getIdStudika(), studik.getName(), studik.getSurname(),studik.getEmail());
        }
        //endregion

//region Read Komisiya
        query = session.createQuery("from " + "KomisiyaEntity ");
        System.out.format("\nTable Komisiya --------------------\n");
        System.out.format("%3s %-18s %-18s %s\n", "IDKomisiyi", "Name", "Student","Teacher");
        for (Object obj : query.list()) {
            KomisiyaEntity komisiya = (KomisiyaEntity) obj;
            System.out.format("%3d %-18s %-18s %s\n", komisiya.getIdKomisiyi(), komisiya.getName(), komisiya.getStudent(),komisiya.getIdKomisiyi());
        }
        //endregion

//region Read University
        query = session.createQuery("from " + "UniversityEntity ");
        System.out.format("\nTable University --------------------\n");
        for (Object obj : query.list()) {
            UniversityEntity university = (UniversityEntity) obj;
            System.out.format("%s\n", university.getUniversity());
        }
        //endregion

    }

    private static void ReadUniversityFilter(Session session){

        Scanner input = new Scanner(System.in);
        System.out.println("Input name university for Studik: ");
        String university_in = input.next();

        UniversityEntity universityEntity = (UniversityEntity ) session.load( UniversityEntity .class, university_in);
        if(universityEntity!=null){
            System.out.format("\n%s: %s\n", university_in, "Surname");
            for (StudikEntity obj : universityEntity.getStudikByUniversity())
                System.out.format("    %s\n", obj.getSurname());
        }
        else System.out.println("invalid name of city");
    }

    private static void ReadKomisiyaOfStudik(Session session){
        Query query = session.createQuery("from " + "StudikEntity ");
        System.out.format("\nTable Studik --------------------\n");
        System.out.format("%3s %-12s %-12s \n","ID", "Surname", "Name","NumOfKomisiy");
        for (Object obj : query.list()) {
            StudikEntity stduik = (StudikEntity) obj;
            System.out.format("%3s %-12s %-12s->\n", stduik.getIdStudika(), stduik.getSurname(), stduik.getName(),stduik.getKomisiys());
            for (KomisiyaEntity komisiy : stduik.getKomisiys()) {
                System.out.format("\t\t%s // %s\n", komisiy.getName(),komisiy.getTeacher());
            }
        }
    }

    private static void ReadUniversityTable(Session session){

        Query query = session.createQuery("from " + "UniversityEntity ");
        System.out.format("\nTable University --------------------\n");
        for (Object obj : query.list()) {
            UniversityEntity university = (UniversityEntity ) obj;
            System.out.format("%s\n", university.getUniversity());
        }
    }

    private static void insertUniversity(Session session){
        Scanner input = new Scanner(System.in);
        System.out.println("Input a new name University: ");
        String newuniversity = input.next();

        session.beginTransaction();
        UniversityEntity universityEntity=new UniversityEntity (newuniversity);
        session.save(universityEntity);
        session.getTransaction().commit();

        System.out.println("end insert university");
    }

    private static void insertStudik(Session session){
        Scanner input = new Scanner(System.in);
        System.out.println("Input new Studik Surname: ");
        String surname_new = input.next();
        System.out.println("Input new Studik Surname: ");
        String name_new = input.next();
        System.out.println("Input the University for Studik: ");
        String university = input.next();
        System.out.println("Input new Person Email: ");
        String email = input.next();

        session.beginTransaction();
        StudikEntity studikEntity=new StudikEntity(surname_new,name_new,university,email);
        session.save(studikEntity);
        session.getTransaction().commit();
        System.out.println("end insert studik");
    }

    private static void updateUniversity(Session session){
        Scanner input = new Scanner(System.in);
        System.out.println("\nInput a name university: ");
        String university = input.next();
        System.out.println("Input new name university: ");
        String newUniversity = input.next();

        UniversityEntity universityEntity = (UniversityEntity ) session.load( UniversityEntity .class, university);
        if(universityEntity!=null){
            session.beginTransaction();
            Query query = session.createQuery("update UniversityEntity set university=:code1  where university = :code2");
            query.setParameter("code1", newUniversity);
            query.setParameter("code2", university);
            int result = query.executeUpdate();
            session.getTransaction().commit();
            System.out.println("end update university: "+ result);
        }
        else System.out.println("There is no the university");
    }

    private static void AddKomisiyaForStudik(Session session){
        System.out.println("Give a komisiya to studik--------------");
        Scanner input = new Scanner(System.in);
        System.out.println("Choose Person Surname:");
        String surname_in = input.next();
        System.out.println("Choose Name Komisiyi:");
        String komisiya_in = input.next();

        Query query = session.createQuery("from " + "StudikEntity where surname = :code");
        query.setParameter("code", surname_in);

        if(!query.list().isEmpty()){
            //Give this person entity from query
            StudikEntity studikEntity = (StudikEntity) query.list().get(0);
            //search the book entity  from query
            query = session.createQuery("from " + "KomisiyaEntity where name = :code");
            query.setParameter("code", komisiya_in);
            if(!query.list().isEmpty()){
                //Give this book entity from query
                KomisiyaEntity komisiyaEntity = (KomisiyaEntity) query.list().get(0);
                session.beginTransaction();
                studikEntity.addBookEntity(komisiyaEntity);
                session.save(studikEntity);
                session.getTransaction().commit();
                System.out.println("end insert komisiya for studik");
            }
            else {System.out.println("There is no the komisiya");}
        }
        else {System.out.println("There is no this studik");}

    }


    private static void AddPairPersonBookWithProcedure(Session session){
        Scanner input = new Scanner(System.in);
        System.out.println("\nInput Surname for Studik: ");
        String surname = input.next();
        System.out.println("Input Name for Komisiya: ");
        String komisiya = input.next();

        //to JPA 2.0
//        Query query = session.createSQLQuery(
//                "CALL InsertPersonBook(:Person, :Book)")
//                .setParameter("Person", surname)
//                .setParameter("Book", book);
//        System.out.println(query.list().get(0));

        //from JPA 2.1
        StoredProcedureQuery query = session
                .createStoredProcedureQuery("InsertPersonBook")
                .registerStoredProcedureParameter("SurmanePersonIn", String.class, ParameterMode.IN)
                .registerStoredProcedureParameter("BookNameIN", String.class, ParameterMode.IN)
                .setParameter("SurmanePersonIn", surname)
                .setParameter("BookNameIN", komisiya);
        query.execute();
        String str = (String) query.getResultList().get(0);
        System.out.println(str);

        if(str.equals("OK")) {
            Query query2 = session.createQuery("from " + "StudikEntity ");
            for (Object obj : query2.list()) {
                session.refresh(obj);
            }
            query2 = session.createQuery("from " + "KomisiyaEntity ");
            for (Object obj : query2.list()) {
                session.refresh(obj);
            }
        }
    }

}