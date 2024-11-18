package org.example.datn.repository;

import feign.Param;
import org.example.datn.entity.ChatLieu;
import org.example.datn.entity.HoaDon;
import org.example.datn.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {
    HoaDon findTopByOrderByNgayTaoDesc();

    List<HoaDon> findByIdNguoiDung(Long idNguoiDung);

    Optional<HoaDon> findByMa(String ma);

    List<HoaDon> findByTrangThai(Integer trangThai);

    @Query("SELECT h FROM HoaDon h WHERE h.idNguoiDung IN :idNguoiDung" +
            " AND (:trangThai IS NULL OR h.trangThai = :trangThai)")
    List<HoaDon> findByIdNguoiDungAndTrangThai(@Param("idHoaDons") Long idNguoiDung,
                                                      @Param("trangThai") Integer trangThai);
}
