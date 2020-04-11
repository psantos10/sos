import React from 'react';

const Footer = () => {
  return (
    <footer className="footer">
      <div className="content has-text-centered">
        <p>
          <strong>SOS Angola</strong> v1.0.0.alpha.2
          <br />
          Projecto baseado na versão Portuguesa:{' '}
          <a
            href=" https://app.queroajudar.org/"
            title="Quero Ajudar"
            target="_blank"
          >
            https://app.queroajudar.org
          </a>
          <br />
          Icons from{' '}
          <a href="https://www.flaticon.com/" title="Flaticon" target="_blank">
            www.flaticon.com
          </a>
        </p>
        <p>Política de privacidade | Termos de serviço</p>
      </div>
    </footer>
  );
};

export default Footer;
