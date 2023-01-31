/// <reference types="cypress" />

describe("jungle-rails-app", () => {
	beforeEach(() => {
		cy.visit("http://localhost:3000");
	});

	it("There should be a visible list of products", () => {
		cy.get(".products article").should("have.length", 12);
	});

	it("There should be an 'Add' button on the first product", () => {
		cy.get(".products article").first().contains("form", "Add");
	});

	it("When the 'Add' button is pressed, it should change the cart count", () => {
		cy.get(".products article").first().contains("form", "Add").submit();
		cy.get('[data-test-id="nav-cart"]')
			.invoke("attr", "data-cart-size")
			.should("equal", "1");
	});
});
