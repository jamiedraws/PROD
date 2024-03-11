import PriceCounter from "shared/ts/components/price-counter";
import Nav from "shared/ts/components/nav";
import Carousel from "shared/ts/components/carousel";
import FingerPrintNav from "shared/ts/components/fingerprint-nav";

// nav
new Nav("nav");

// price
new PriceCounter("[data-count-price-up]");

// carousel
const carousel = new Carousel(document.querySelectorAll(".slide"));
carousel.enablePrevNextPlayback();

// fingerprint nav
const fp = new FingerPrintNav();
fp.hideWhenElementsInView("form");
