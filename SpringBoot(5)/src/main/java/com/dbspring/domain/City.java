package com.dbspring.domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "city")
public class City {
    @Id  @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id", nullable = false)
    private Long id;
    @Column(name = "city", nullable = false, length = 25)
    private String city;
    @OneToMany(mappedBy = "city")
    private List<FastFoodMarket> fastFoodMarkets;

    City(){}
    City(String city){
        this.city=city;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long idCity) {
        this.id = idCity;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public List<FastFoodMarket> getFastFoodMarkets() {
        return fastFoodMarkets;
    }
    public void setFastFoodMarkets(List<FastFoodMarket> persons) {
        this.fastFoodMarkets = fastFoodMarkets;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        City that = (City) o;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (city != null ? !city.equals(that.city) : that.city != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (city != null ? city.hashCode() : 0);
        return result;
    }
}
