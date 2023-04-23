package main

import (
	"context"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/jackc/pgx/v5"
)

func createDBConnection() (*pgx.Conn, error) {
	return pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
}

func ping(c *gin.Context) {
	ret := gin.H{"message": "PONG"}
	c.JSON(http.StatusOK, ret)
}

func deepPing(c *gin.Context) {
	// Connect to the DB
	conn, connErr := createDBConnection()
	if connErr != nil {
		c.Error(connErr)
		c.AbortWithStatus(http.StatusInternalServerError)
		return
	} else {
		defer conn.Close(context.Background())
	}

	// Attempt to make a query
	var result string
	err := conn.QueryRow(context.Background(), "SELECT version();").Scan(&result)
	if err != nil {
		c.Error(err)
		c.AbortWithStatus(http.StatusInternalServerError)
		return
	}

	// Query succeeded
	ret := gin.H{"message": "DEEP-PONG"}
	c.JSON(http.StatusOK, ret)
}

func setupRoutes(r *gin.Engine) {
	r.GET("/ping", ping)
	r.GET("/deep-ping", deepPing)
}
