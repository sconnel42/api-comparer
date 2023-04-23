package main

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// Log errors that occur
func ErrorHandler(logger *zap.Logger) gin.HandlerFunc {
	return func(c *gin.Context) {
		for _, err := range c.Errors {
			logger.Error(err.Error())
		}
	}
}

func main() {
	// Set up server
	router := gin.Default()
	logger, _ := zap.NewDevelopment()
	router.Use(ErrorHandler(logger))

	// Attach routes (defined in routes.go)
	setupRoutes(router)

	// Run server
	router.Run()
}
