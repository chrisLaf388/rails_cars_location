const navbarActiveClass = () => {
  const elems = Array.from(document.querySelectorAll('.navbar-nav mr-auto .nav-item'));
  console.log(elems);
  document.addEventListener('DOMContentLoaded', function () {

    const selector = '.nav__link';
    const elems = Array.from(document.querySelectorAll('.navbar-nav mr-auto .nav-item'));
    const navigation = document.querySelector('nav');

    function makeActive(evt) {
      const target = evt.target;

      if (!target || !target.matches(selector)) {
        return;
      }

      elems.forEach(elem => elem.classList.remove('active'));
      evt.target.classList.add('active');
    };

    navigation.addEventListener('mousedown', makeActive);

  });
};


export { navbarActiveClass }
