describe("Product details page tests", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("navigates to a product partial", () => {
    cy.get('.products article').first().click();
  });
});