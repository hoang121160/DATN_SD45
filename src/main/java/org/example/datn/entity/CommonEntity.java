package org.example.datn.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author hoangKhong
 */
@MappedSuperclass
@Data
@EntityListeners(AuditingEntityListener.class)
@FieldDefaults(level = AccessLevel.PRIVATE)
public abstract class CommonEntity implements Serializable {

    @CreatedDate
    @Column(name = "ngay_tao")
    private LocalDateTime ngayTao;


    @LastModifiedDate
    @Column(name = "ngay_cap_nhat")
    private LocalDateTime ngayCapNhat;


    @CreatedBy
    @Column(name = "nguoi_tao")
    private Integer nguoiTao;


    @LastModifiedBy
    @Column(name = "nguoi_cap_nhat")
    private Integer nguoiCapNhat;

    @PrePersist
    public void preInsert() {
        this.nguoiCapNhat = getNguoiCapNhat();
        this.nguoiTao = getNguoiTao();
    }

    @PreUpdate
    public void preUpdate() {
        this.nguoiCapNhat = getNguoiCapNhat();
        this.nguoiTao = getNguoiTao();
    }
}