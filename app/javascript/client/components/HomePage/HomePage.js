import React from 'react';
import { Link } from 'react-router-dom';

import LogoImg from '../../images/sos.png';
import SirenImg from '../../images/siren.png';
import GivingImg from '../../images/giving.png';

const HomePage = () => {
  return (
    <div className="container" style={{ marginBottom: '50px' }}>
      <div className="has-text-centered" style={{ marginTop: '15px' }}>
        <img src={LogoImg} alt="SOS Angola" style={{ width: '180px' }} />
        <h1 className="title">SOS Angola</h1>
        <p>Comunidade angolana de entreajuda!</p>
        <h2 className="subtitle">#SOSAngola</h2>
      </div>

      <div className="columns" style={{ marginTop: '30px' }}>
        <div className="column is-half is-offset-one-quarter">
          <div className="tile is-ancestor">
            <Link to="/preciso-de-ajuda" role="button" className="tile">
              <div className="tile notification is-danger box">
                <img
                  src={SirenImg}
                  alt="Preciso de ajuda"
                  style={{ width: '200px', margin: 'auto' }}
                />

                <h2
                  className="subtitle has-text-centered"
                  style={{
                    position: 'absolute',
                    bottom: '5px',
                    left: '0px',
                    width: '100%',
                  }}
                >
                  <strong>Preciso</strong> de ajuda
                </h2>
              </div>
            </Link>

            <div style={{ width: '15px' }}></div>

            <Link to="/quero-ajudar" role="button" className="tile">
              <div className="tile notification is-success">
                <img
                  src={GivingImg}
                  alt="Quero ajudar"
                  style={{ width: '200px', margin: 'auto' }}
                />
                <h2
                  className="subtitle has-text-centered"
                  style={{
                    position: 'absolute',
                    bottom: '5px',
                    left: '0px',
                    width: '100%',
                  }}
                >
                  <strong>Quero</strong> ajudar
                </h2>
              </div>
            </Link>
          </div>
        </div>
      </div>

      <div className="has-text-centered" style={{ marginTop: '30px' }}>
        <Link to="/como-funciona" className="button is-large is-info">
          Como funciona?
        </Link>
      </div>
    </div>
  );
};

export default HomePage;
