package com.t2t.tss.entity;

class User {
	private var userID: Int = 0
	private var userName: String = null
	private var password: String = null
	private var status: Int = 0

	def getUserID: Int = {
		return userID
	}

	def setUserID(userID: Int) {
		this.userID = userID
	}

	def getUserName: String = {
		return userName
	}

	def setUserName(userName: String) {
		this.userName = userName
	}

	def getPassword: String = {
		return password
	}

	def setPassword(password: String) {
		this.password = password
	}

	def getStatus: Int = {
		return status
	}

	def setStatus(status: Int) {
		this.status = status
	}
}
