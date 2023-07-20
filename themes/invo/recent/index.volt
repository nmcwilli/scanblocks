<br>

<h3>Recent addresses submitted</h3>
<p>Here are some of the recent blockchain addresses reported/flagged.</p>

<div class="alert alert-danger" role="alert">
  Warning: This recent reports page is now behind by the last 10 reported addresses. Note that our platform is free for public usage using the search functionality, but now in order to view the last 10 recent reports, you must have an API plan. Please check our pricing on the <a href="https://scanblocks.io/pricing/index">API Plans</a> page. Unfortunately we have had too many organizations scraping our recently submitted page and have had to implement this measure. 
</div>

<br>

<table class="table text-center">
  <thead>
    <tr>
      <th scope="col">Address</th>
      <th scope="col">Blockchain</th>
      <th scope="col">Last Updated</th>
      <th scope="col">Reason</th>
      <th scope="col">URL <br><span style="color:red;font-size:10px;line-height:auto;">(*Careful before clicking)</span></th>
      <th scope="col">View All Reports</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
    <tr>
      <td scope="row">
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
      <td>
        HIDDEN
      </td>
    </tr>
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
        <a href="{{ address.url }}" target="_blank"><img src="/link.png" alt="Visit URL" style="padding-top: 10px;" /></a>
        {%- else -%}
        N/A
        {%- endif -%}
      </td>
      <td>

        {%- if address.blockchain === 'Bitcoin (BTC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Bitcoin+%28BTC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Bitcoin Cash (BCH)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Bitcoin+Cash+%28BCH%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Ethereum (ETH)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Ethereum+%28ETH%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Axie Infinity Shards (AXS)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Axie+Infinity+Shards+%28AXS%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Terra (LUNA)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Terra+%28LUNA%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Polygon (MATIC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Polygon+%28MATIC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Cardano (ADA)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Cardano+%28ADA%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Tron (TRX)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Tron+%28TRX%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Ripple (XRP)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Ripple+%28XRP%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Dogecoin (DOGE)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Dogecoin+%28DOGE%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Solana (SOL)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Solana+%28SOL%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Binance Coin (BNB)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Binance+Coin+%28BNB%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Theta (THETA)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Theta+%28THETA%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Litecoin (LTC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Litecoin+%28LTC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Ethereum Classic (ETC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Ethereum+Classic+%28ETC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Tether (USDT)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Tether+%28USDT%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Uniswap (UNI)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Uniswap+%28UNI%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Stellar (XLM)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Stellar+%28XLM%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'USD Coin (USDC)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=USD+Coin+%28USDC%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- elseif address.blockchain === 'Shiba Inu (SHIB)' -%}
        <a href="https://scanblocks.io/search/index?blockchain=Shiba+Inu+%28SHIB%29&address={{ address.address }}" alt="View Details"><img src="/search.png" alt="View"/></a>

        {%- else -%}

        {%- endif -%}

      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>

<br><br>
<p style="font-size:10px;color:red;">*This URL has been reported by the public using our reporting mechanism. It may contain innappropriate content, phishing links, or other malicious or inappropriate content.</p>
<br><br>