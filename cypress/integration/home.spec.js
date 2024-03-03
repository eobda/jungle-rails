describe("home page tests", () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });

  it("shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

});