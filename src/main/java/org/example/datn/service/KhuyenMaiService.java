package org.example.datn.service;

import org.example.datn.entity.ChatLieu;
import org.example.datn.entity.KhuyenMai;
import org.example.datn.entity.Size;
import org.example.datn.repository.ChatLieuRepository;
import org.example.datn.repository.KhuyenMaiRepository;
import org.example.datn.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class KhuyenMaiService {

    @Autowired
    private KhuyenMaiRepository repo;

    public Optional<KhuyenMai> findById(Long id) {
        return repo.findById(id);
    }

    public List<KhuyenMai> findAll() {
        return repo.findAll();
    }

    public void save(KhuyenMai chatLieu) {
        repo.save(chatLieu);
    }

    public void deleteById(Long id) {
        repo.deleteById(id);
    }
}
