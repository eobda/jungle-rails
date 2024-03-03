describe("Product details page tests", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("navigates to a product partial", () => {
    cy.get('.products article').first().click();
    cy.get('.product-detail div h1').should('contain.text', 'Scented Blade');
  });
});