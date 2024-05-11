
package com.learn.mycart.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;
import java.util.*;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int CategoryId;
    private String categoryTitle;
    private String categoryDescription;
    @OneToMany(mappedBy="category")
    private List<Product> products=new ArrayList<>();
    
    
    public Category() {
    }

    public Category(int CategoryId, String categoryTitle, String categoryDescription) {
        this.CategoryId = CategoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTitle, String categoryDescription, List<Product> products) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }

    
    
    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    

    @Override
    public String toString() {
        return "Category{" + "CategoryId=" + CategoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription=" + categoryDescription + '}';
    }

    
}
