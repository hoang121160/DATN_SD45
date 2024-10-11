package org.example.datn.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import org.example.datn.entity.User;
import org.example.datn.model.enums.UserStatus;
import org.example.datn.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author hoangKhong
 */
@Service
public class UserService {
    private final UserRepository repo;
    private final PasswordEncoder passwordEncoder;
    private final EntityManager entityManager;

    @Autowired
    public UserService(UserRepository repo, EntityManager entityManager) {
        this.repo = repo;
        this.passwordEncoder = new BCryptPasswordEncoder();
        this.entityManager = entityManager;
    }

    public String notFoundMessage() {
        return "not.found";
    }

    public String encodePassword(String raw) {
        return passwordEncoder.encode(raw);
    }

    public boolean passwordMatched(String password, User user) {
        return passwordEncoder.matches(password, user.getPassword());
    }
    public List<User> findAll() {
        return repo.findAll();
    }

    public Optional<User> findByUsername(String userName) {
        return repo.findByUsername(userName);
    }

    public Optional<User> getActive(String username) {
        return repo.findByUsernameAndStatus(username, UserStatus.ACTIVE);
    }

    public Optional<User> getActive(Long id) {
        return repo.findByIdAndStatus(id, UserStatus.ACTIVE);
    }

    public void update(Long id, UserStatus status) throws EntityNotFoundException {
        var user = repo.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("not.found"));
        user.setStatus(status);
        repo.save(user);
    }

    public void update(Long id, String password) throws EntityNotFoundException {
        var user = repo.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("not.found"));
        user.setPassword(encodePassword(password));
        repo.save(user);
    }



}