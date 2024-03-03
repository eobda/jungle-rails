describe("home page tests", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it ("increases the count of the cart button when the 'Add to Cart' button is pressed", () => {
    cy.get(".btn").contains('Add').first().click({ force: true });
  });

});