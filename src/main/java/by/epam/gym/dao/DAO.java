package by.epam.gym.dao;

import by.epam.gym.entities.Entity;
import by.epam.gym.exceptions.DAOException;

import java.util.List;

/**
 * DAO interface has all main methods to work with entity.
 *
 * @param <T> The entity.
 */
public interface DAO <T extends Entity> {

    /**
     * This method finds all entities.
     *
     * @return List of found objects.
     * @throws DAOException object if execution of query is failed.
     */
    List<T> findAll() throws DAOException;

    /**
     * This method finds entity from database by id.
     *
     * @param id the entity's id.
     * @return the entity.
     * @throws DAOException object if execution of query is failed.
     */
    T findEntityById(int id) throws DAOException;

    /**
     * This method deletes entity from database by id.
     *
     * @param id entity id.
     * @throws DAOException object if execution of query is failed.
     */
    void deleteById(int id) throws DAOException;

    /**
     * This method insert entity in database.
     *
     * @param entity the entity.
     * @return boolean true if entity created successfully, otherwise false.
     * @throws DAOException object if execution of query is failed.
     */
    void insert(T entity) throws DAOException;

    /**
     * This method update entity in database.
     *
     * @param entity the entity.
     * @throws DAOException object if execution of query is failed.
     */
    void update(T entity) throws DAOException;

}