package com.t2t.tss.entity

;

class Product {
  private var productID: String = null
  private var serialNumber: String = null
  private var name: String = null
  private var brand: String = null
  private var price: Double = .0
  private var picture: String = null
  private var description: String = null
  private var model: String = null

  def getSerialNumber: String = {
    return serialNumber
  }

  def setSerialNumber(serialNumber: String) {
    this.serialNumber = serialNumber
  }

  def getName: String = {
    return name
  }

  def setName(name: String) {
    this.name = name
  }

  def getBrand: String = {
    return brand
  }

  def setBrand(brand: String) {
    this.brand = brand
  }

  def getPicture: String = {
    return picture
  }

  def setPicture(picture: String) {
    this.picture = picture
  }

  def getDescription: String = {
    return description
  }

  def setDescription(description: String) {
    this.description = description
  }

  def getModel: String = {
    return model
  }

  def setModel(model: String) {
    this.model = model
  }

  def getProductID: String = {
    return productID
  }

  def setProductID(productID: String) {
    this.productID = productID
  }

  def getPrice: Double = {
    return price
  }

  def setPrice(price: Double) {
    this.price = price
  }
}
