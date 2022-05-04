package com.boots.service;

import com.boots.entity.Roles;
import com.boots.entity.RegisteredUsers;
import com.boots.repository.RolesRepository;
import com.boots.repository.RegisteredUsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class RegisteredUsersService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    RegisteredUsersRepository registeredUsersRepository;
    @Autowired
    RolesRepository rolesRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        RegisteredUsers user = registeredUsersRepository.findByMail(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return (UserDetails) user;
    }

    public RegisteredUsers findUserById(Long userId) {
        Optional<RegisteredUsers> userFromDb = registeredUsersRepository.findById(userId);
        return userFromDb.orElse(new RegisteredUsers());
    }

    public List<RegisteredUsers> allUsers() {
        return registeredUsersRepository.findAll();
    }

    public boolean saveUser(RegisteredUsers user) {
        RegisteredUsers userFromDB = registeredUsersRepository.findByMail(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Roles(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        registeredUsersRepository.save(user);
        return true;
    }

    public boolean deleteUser(Long userId) {
        if (registeredUsersRepository.findById(userId).isPresent()) {
            registeredUsersRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<RegisteredUsers> usergtList(Long idMin) {
        return em.createQuery("SELECT u FROM RegisteredUsers u WHERE u.registered_user_id > :paramId", RegisteredUsers.class)
                .setParameter("paramId", idMin).getResultList();
    }
}

