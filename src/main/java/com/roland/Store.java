    package com.roland;
    import org.hibernate.Session;
    import org.hibernate.SessionFactory;
    import org.hibernate.Transaction;
    import org.hibernate.boot.Metadata;
    import org.hibernate.boot.MetadataSources;
    import org.hibernate.boot.registry.StandardServiceRegistry;
    import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

    import javax.persistence.Query;
    import java.util.List;

    public class Store {
        private Session session;
        private SessionFactory factory;
        public void close(){
            factory.close();
            session.close();
        }
        public Session getSession(){
            return this.session;
        }
        public Store(){
            StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
            Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
            this.factory = meta.getSessionFactoryBuilder().build();
            this.session = factory.openSession();
        }

        public void insertField(int id, String FirstName, String SecondName){
            Transaction t = session.beginTransaction();
            Employee e1=new Employee();
            e1.setId(id);
            e1.setFirstName(FirstName);
            e1.setSecondname(SecondName);
            session.save(e1);
            t.commit();
            System.out.println("successfully saved");
        };

        public void clear (){
            Transaction t = session.beginTransaction();
            Query query = session.createQuery("delete Employee where id > -1");
            int result = query.executeUpdate();
            t.commit();
        }

        List findAllEmployee(){
            return session.createQuery("SELECT a FROM Employee a", Employee.class).getResultList();
        }

        public static void main(String[] args) {
            Store store = new Store();
            List a = store.findAllEmployee();
            System.out.println(a.size());
        //    store.clear();
        //   for (int i=0; i<5000; i++)
        //       store.insertField(i, "Roman", "Pastushkov");
            store.close();
        }
    }
