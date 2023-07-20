<br>

<h3>Report an address</h3>
<p>Please visit the <a href="/submit/index">address reporting page</a> to submit a new address.</p>
<p>If you submit an address while logged in, then it will be associated with your account and you can manage/remove it at a later date if you wish.</p>

<br>
<hr>
<br>

<h3>Your reported addresses</h3>
<p>Here is a list of the addresses you have submitted.</p>

<div class="alert alert-warning" role="alert">
  *You cannot edit an address once it is submitted, but you can disable/remove it and then add another one. 
</div>

<table class="table text-center">
  <thead>
    <tr>
      <th scope="col">Address</th>
      <th scope="col">Blockchain</th>
      <th scope="col">Last Updated</th>
      <th scope="col">Reason</th>
      <th scope="col">URL <br><span style="color:red;font-size:10px;">(*Careful before clicking)</span></th>
      <th scope="col">View All Reports</th>
      <th scope="col">Blockchain Explorer</th>
      <th scope="col">Remove</th>
    </tr>
  </thead>
  <tbody>
    {% for address in addresses %}
    <tr>
      <td scope="row"><input type="text" style="max-width:300px;cursor: pointer;" class="form-control" value="{{ address.address }}" onclick="this.select()" /></td>
      <td>{{ address.blockchain }}</td>
      <td>{{ address.last_update }}</td>
      <td>
        {%- if address.reason -%}
        {{ address.reason }}
        {%- else -%}
        Not available
        {%- endif -%}
      </td>
      <td>
        {%- if address.url -%}
        <a href="{{ address.url }}" target="_blank"><img src="/web.png" alt="Visit URL" style="padding-top: 10px;" /></a>
        {%- else -%}
        N/A
        {%- endif -%}
      </td>
      <td>

        {%- if address.blockchain === 'Bitcoin (BTC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Bitcoin+%28BTC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Bitcoin Cash (BCH)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Bitcoin+Cash+%28BCH%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Ethereum (ETH)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Ethereum+%28ETH%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Axie Infinity Shards (AXS)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Axie+Infinity+Shards+%28AXS%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Terra (LUNA)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Terra+%28LUNA%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Polygon (MATIC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Polygon+%28MATIC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Cardano (ADA)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Cardano+%28ADA%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Ripple (XRP)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Ripple+%28XRP%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Dogecoin (DOGE)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Dogecoin+%28DOGE%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Solana (SOL)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Solana+%28SOL%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Binance Coin (BNB)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Binance+Coin+%28BNB%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Theta (THETA)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Theta+%28THETA%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Litecoin (LTC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Litecoin+%28LTC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Ethereum Classic (ETC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Ethereum+Classic+%28ETC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'USD Coin (USDC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=USD+Coin+%28USDC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- elseif address.blockchain === 'Shiba Inu (SHIB)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Shiba+Inu+%28SHIB%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View All Reports"/></a>

        {%- else -%}

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

        {%- else -%}

        {%- endif -%}

      </td>
      <td>
        <form action="/products/index" role="form" method="post" id="productsForm">
          <input type="hidden" name="address_id" id="address_id" value="{{ address.address_id }}">
          <input type="hidden" name="blockchain" id="blockchain" value="{{ address.blockchain }}">
          <input type="hidden" name="address" id="address" value="{{ address.address }}">
          <input type="hidden" name="type" id="type" value="removeAddress">
          <button class="btn btn-outline-danger" value="Submit" type="submit">X</button>
        </form>
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>

<br><br>
<p style="font-size:10px;color:red;">*This URL has been reported by the public using our reporting mechanism. It may contain innappropriate content, phishing links, or other malicious or inappropriate content.</p>
<br><br>