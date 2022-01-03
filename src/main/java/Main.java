import Model.AirlineCompany;
import Repository.DAO.RepositoryFacade;

public class Main {

    public static void main(String[] args) {

        RepositoryFacade.getInstance()
                .findAll(AirlineCompany.class)
                .forEach(System.out::println);
    }
}
