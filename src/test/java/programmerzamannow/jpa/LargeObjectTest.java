package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Image;
import programmerzamannow.jpa.util.JpaUtil;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class LargeObjectTest {

    @Test
    void largeObject() throws IOException {
        EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();

        Image image = new Image();
        image.setName("Contoh image");
        image.setDescription("Contoh Description Image");

        byte[] bytes = Files.readAllBytes(Path.of("src/main/resources/images/sample.jpg"));
        image.setImage(bytes);

        entityManager.persist(image);

        entityTransaction.commit();
        entityManager.close();
    }
}
