/// <reference types="cypress" />

describe("jungle-rails-app", () => {
	beforeEach(() => {
		cy.visit("http://localhost:3000");
	});

	it("There should be a visible list of products", () => {
		cy.get(".products article").should("have.length", 12);
	});

	it("When a product is clicked it should load the product detail page", () => {
		cy.get(".products article").first().click();
		cy.get(".products-show").should("be.visible");
	});

	it("When a product is clicked it should load the matching product detail page", () => {
		cy.get(".products article").contains("Scented Blade").click();
		cy.get(".products-show").should("be.visible");
		cy.get(".products-show .product-detail").contains("Scented Blade");
	});
});
