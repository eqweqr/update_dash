package password

import (
	"math/rand"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"golang.org/x/crypto/bcrypt"
)

func RandomString(value int) string {
	src := rand.NewSource(time.Now().Unix())
	bytes := make([]byte, 0)
	for i := 0; i < value; i++ {
		bytes = append(bytes, byte(50+src.Int63()%50))
	}
	return (string(bytes))

}

func TestPassword(t *testing.T) {
	password := "Helloewqr"
	hashedPassword, err := HashPassword(password)
	require.NoError(t, err)
	require.NotEmpty(t, hashedPassword)

	err = CheckPasswords(password, hashedPassword)
	require.NoError(t, err)

	wrongPassword := "awayfas"
	err = CheckPasswords(wrongPassword, hashedPassword)
	require.EqualError(t, err, bcrypt.ErrMismatchedHashAndPassword.Error())
}
