<br><br>

<div class="row text-center">
    <div class="col-md-12">

        <h2>Search Results</h2>

        <p class="text-center">You searched the <span class="badge bg-primary text-light">{{ blockchain }}</span> blockchain for address <input type="text" style="max-width:400px;cursor: pointer;" value="{{ address }}" onclick="this.select()" />.<br>
        There are a total of <span class="badge bg-primary text-light">{{ addressCount }}</span> reports.</p>

        <br><br>

        <table class="table">
          <thead>
            <tr>
              <th scope="col">Address</th>
              <th scope="col">Blockchain</th>
              <th scope="col">Last Updated</th>
              <th scope="col">Reason</th>
              <th scope="col">URL {% if addressCount >= '1' %}<br><span style="color:red;font-size:10px;">(*Careful before clicking)</span>{%- else -%} {%- endif -%}</th>
              <th scope="col">Blockchain Explorer</th>
            </tr>
          </thead>
          <tbody>
            {% for address in addresses %}
            <tr>
              <td scope="row"><input type="text" style="max-width:400px;cursor: pointer;" class="form-control" value="{{ address.address }}" onclick="this.select()" /></td>
              <td>{{ address.blockchain }}</td>
              <td>
              {% if address.last_update === '0000-00-00 00:00:00' %}
                N/A
                {%- else -%}
                {{ address.last_update }}
                {%- endif -%}
              </td>
              <td>
              {%- if address.reason -%}
                {{ address.reason }}
                {%- else -%}
                N/A
                {%- endif -%}
              </td>
              <td>
              {%- if address.url -%}
                <a href="{{ address.url }}" target="_blank"><img src="/link.png" alt="Visit URL" style="padding-top: 10px;" /></a>
                {%- else -%}
                N/A
                {%- endif -%}
              </td>
              <td>

                {%- if address.blockchain === 'Bitcoin (BTC)' -%}
                <a href="https://www.blockchain.com/btc/address/{{ address.address }}" alt="Bitcoin Explorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Bitcoin Cash (BCH)' -%}
                <a href="https://www.blockchain.com/bch/address/{{ address.address }}" alt="Bitcoin Cash Explorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Ethereum (ETH)' -%}
                <a href="https://etherscan.io/address/{{ address.address }}" alt="EtherScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Axie Infinity Shards (AXS)' -%}
                <a href="https://etherscan.io/token/{{ address.address }}" alt="EtherScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Terra (LUNA)' -%}
                <a href="https://etherscan.io/address/{{ address.address }}" alt="EtherScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Polygon (MATIC)' -%}
                <a href="https://polygonscan.com/address/{{ address.address }}" alt="PolygonScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Cardano (ADA)' -%}
                <a href="https://cardanoscan.io/address/{{ address.address }}" alt="CardanoScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Tron (TRX)' -%}
                <a href="https://tronscan.org/#/address/{{ address.address }}" alt="TronScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Ripple (XRP)' -%}
                <a href="https://xrpscan.com/account/{{ address.address }}" alt="XRPScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Dogecoin (DOGE)' -%}
                <a href="https://dogechain.info/address/{{ address.address }}" alt="DogeChain" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Solana (SOL)' -%}
                <a href="https://explorer.solana.com/address/{{ address.address }}" alt="Solana Explorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Binance Coin (BNB)' -%}
                <a href="https://bscscan.com/address/{{ address.address }}" alt="BscScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Litecoin (LTC)' -%}
                <a href="https://litecoinblockexplorer.net/address/{{ address.address }}" alt="LitecoinBlockExplorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Ethereum Classic (ETC)' -%}
                <a href="https://etcblockexplorer.com/address/{{ address.address }}" alt="ETCBlockExplorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Tether (USDT)' -%}
                <a href="https://ethplorer.io/address/{{ address.address }}" alt="Ethplorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Uniswap (UNI)' -%}
                <a href="https://ethplorer.io/address/{{ address.address }}" alt="Ethplorer" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'Stellar (XLM)' -%}
                <a href="https://stellarchain.io/address/{{ address.address }}" alt="Stellarchain.io" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- elseif address.blockchain === 'USD Coin (USDC)' -%}
                <a href="https://etherscan.io/address/{{ address.address }}" alt="EtherScan" target="_blank"><img src="/blocks.png" alt="Link"/></a>

                {%- else -%}

                {%- endif -%}

              </td>
            </tr>
            {% endfor %}
          </tbody>
        </table>

        {% if addressCount >= '1' %}
        <br><br>
        <p style="font-size:10px;color:red;">*This URL has been reported by the public using our reporting mechanism. It may contain innappropriate content, phishing links, or other malicious or inappropriate content.</p>
        {%- else -%}
        <p>There are currently no reports to display for this address.</p>
        {%- endif -%}

        <br><br>

        <hr>

        <p>
        <br>
        If you would like to dispute a report, please <a href="/dispute/index">complete this form</a>. 
        </p>

        <br><br><br>

    </div>
</div>