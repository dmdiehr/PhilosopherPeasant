using PhilosopherPeasant.Models;
using Xunit;

namespace PhilosopherPeasant.Tests
{
    public class ContributorTest
    {
        [Fact]
        public void GetNameTest()
        {
            //Arrange
            var contributor = new Contributor();
            contributor.Name = "David Diehr";
            //Act
            var result = contributor.Name;

            //Assert
            Assert.Equal("David Diehr", result);
        }
    }
}