using System.Collections.Generic;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using PhilosopherPeasant.Controllers;
using PhilosopherPeasant.Models;
using Xunit;
using Moq;
using System.Linq;
using System;

namespace PhilosopherPeasant.Tests
{
    public class ContributorsControllerTest : IDisposable
    {
        EFContributorRepository db = new EFContributorRepository(new TestDbContext());
        Mock<IContributorRepository> mock = new Mock<IContributorRepository>();

        private void DbSetup()
        {
            mock.Setup(m => m.Contributors).Returns(new Contributor[]
            {
                new Contributor {ContributorId = 1, Name = "John Smith" },
                new Contributor {ContributorId = 2, Name = "John Doe" },
                new Contributor {ContributorId = 3, Name = "John Deere" }
            }.AsQueryable());
        }

        //[Fact]
        //public void Get_ViewResult_Index_Test()
        //{
        //    //Arrange
        //    DbSetup();
        //    ContributorsController controller = new ContributorsController(mock.Object);

        //    //Act
        //    var result = controller.Index();

        //    //Assert
        //    Assert.IsType<ViewResult>(result);
        //}

        //[Fact]
        //public void Mock_Get_ModelList_Index_Test()
        //{
        //    //Arrange
        //    DbSetup();
        //    ViewResult indexView = new ContributorsController(mock.Object).Index() as ViewResult;

        //    //Act
        //    var result = indexView.ViewData.Model;

        //    //Assert
        //    Assert.IsType<List<Contributor>>(result);
        //}

        //[Fact]
        //public void Mock_IndexListOfContributors_Test() //Confirms model as list of items
        //{
        //    // Arrange
        //    DbSetup();
        //    ViewResult indexView = new ContributorsController(mock.Object).Index() as ViewResult;

        //    // Act
        //    var result = indexView.ViewData.Model;

        //    // Assert
        //    Assert.IsType<List<Contributor>>(result);
        //}

        //[Fact]
        //public void Mock_ConfirmEntry_Test() //Confirms presence of known entry
        //{
        //    // Arrange
        //    DbSetup();
        //    ContributorsController controller = new ContributorsController(mock.Object);
        //    Contributor testContributor = new Contributor();
        //    testContributor.Name = "Wash the dog";
        //    testContributor.ContributorId = 1;

        //    // Act
        //    ViewResult indexView = controller.Index() as ViewResult;
        //    var collection = indexView.ViewData.Model as IEnumerable<Contributor>;

        //    // Assert
        //    Assert.Contains<Contributor>(testContributor, collection);
        //}
        //[Fact]
        //public void DB_CreateNewEntry_Test()
        //{
        //    // Arrange
        //    ContributorsController controller = new ContributorsController(db);
        //    Contributor testContributor = new Contributor();
        //    testContributor.Name = "TestDB Contributor";

        //    // Act
        //    controller.Create(testContributor);
        //    var collection = (controller.Index() as ViewResult).ViewData.Model as IEnumerable<Contributor>;

        //    // Assert
        //    Assert.Contains<Contributor>(testContributor, collection);
        //}
        public void Dispose()
        {
            db.DeleteAll();
        }
    }
}