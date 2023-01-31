/// <reference types="cypress" />

describe("jungle-rails-app", () => {
	beforeEach(() => {
		cy.visit("http://localhost:3000");
	});

	it("There should be a visible list of products", () => {
		cy.get(".products article").should("have.length", 12);
	});
});
