<br>

<h3>API Documentation</h3>

<p>On this page you will find documentation for the ScanBlocks REST API. The ScanBlocks API allows you to programmatically interface with the ScanBlocks dataset. Note that you must already be paying for an API Plan to leverage this information.</p> 

<br>

<div class="alert alert-warning" role="alert">
  *We are currently only allowing GET requests for SEARCHES for addresses. This means that we will not allow programmatic access to add or remove addresses from our dataset. This is in an effort to protect our dataset and encourage use of our existing reporting tools online.
</div>

<div class="alert alert-warning" role="alert">
  *In order to access the API, you must be granted a valid API Key from the ScanBlocks Dev Team. Please email us at <a href="mailto:support@scanblocks.io">support@scanblocks.io</a> to request access. We will ask you some questions, such as how many requests/volumes per day, and learn about your use case a bit more. We are approving initial requests for the most impactful projects that could scale.
</div>

<br>

<h4>Requirements</h4>
<p><ul>
  <li><b>API Key</b> - An alphanumeric API key is required to authenticate with our API. This must be provided with your request.</li>
  <li><b>Blockchain Code</b> - This is a 2 to 5 digit code that references the blockchain that you are searching.</li>
  <li><b>Address</b> - You must submit a cryptocurrency address that you are searching for to determine if there are any flags/reports against it.</li>
</ul></p>

<br>

<h4>Blockchain Codes</h4>
<p>To specify the blockchain you are searching, please provide the corresponding 2 to 5 digit CODE for the blockchain with your request. Please reference the table below:</p>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Code</th>
      <th scope="col">Blockchain</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="color:red;">all</td>
      <td style="color:red;">Searches across all blockchains</td>
    </tr>
    <tr>
      <td>1inch</td>
      <td>1inch (1INCH)</td>
    </tr>
    <tr>
      <td>aave</td>
      <td>Aave (AAVE)</td>
    </tr>
    <tr>
      <td>algo</td>
      <td>Algorand (ALGO)</td>
    </tr>
    <tr>
      <td>amp</td>
      <td>Amp (AMP)</td>
    </tr>
    <tr>
      <td>ar</td>
      <td>Arweave (AR)</td>
    </tr>
    <tr>
      <td>audio</td>
      <td>Audius (AUDIO)</td>
    </tr>
    <tr>
      <td>axs</td>
      <td>Axie Infinity Shards (AXS)</td>
    </tr>
    <tr>
      <td>bat</td>
      <td>Basic Attention Token (BAT)</td>
    </tr>
    <tr>
      <td>bnb</td>
      <td>Binance Coin (BNB)</td>
    </tr>
    <tr>
      <td>btc</td>
      <td>Bitcoin (BTC)</td>
    </tr>
    <tr>
      <td>bch</td>
      <td>Bitcoin Cash (BCH)</td>
    </tr>
    <tr>
      <td>btg</td>
      <td>Bitcoin Gold (BTG)</td>
    </tr>
    <tr>
      <td>btcb</td>
      <td>Bitcoin BEP2 (BTCB)</td>
    </tr>
    <tr>
      <td>bsv</td>
      <td>Bitcoin SV (BSV)</td>
    </tr>
    <tr>
      <td>btt</td>
      <td>BitTorrent (BTT)</td>
    </tr>
    <tr>
      <td>ada</td>
      <td>Cardano (ADA)</td>
    </tr>
    <tr>
      <td>celo</td>
      <td>Celo (CELO)</td>
    </tr>
    <tr>
      <td>link</td>
      <td>Chainlink (LINK)</td>
    </tr>
    <tr>
      <td>chz</td>
      <td>Chiliz (CHZ)</td>
    </tr>
    <tr>
      <td>comp</td>
      <td>Compound (COMP)</td>
    </tr>
    <tr>
      <td>atom</td>
      <td>Cosmos (ATOM)</td>
    </tr>
    <tr>
      <td>cro</td>
      <td>Crypto.com Coin (CRO)</td>
    </tr>
    <tr>
      <td>crv</td>
      <td>Curve DAO Token (CRV)</td>
    </tr>
    <tr>
      <td>dash</td>
      <td>Dash (DASH)</td>
    </tr>
    <tr>
      <td>mana</td>
      <td>Decentraland (MANA)</td>
    </tr>
    <tr>
      <td>dai</td>
      <td>Dai (DAI)</td>
    </tr>
    <tr>
      <td>dcr</td>
      <td>Decred (DCR)</td>
    </tr>
    <tr>
      <td>doge</td>
      <td>Dogecoin (DOGE)</td>
    </tr>
    <tr>
      <td>xec</td>
      <td>eCash (XEC)</td>
    </tr>
    <tr>
      <td>enj</td>
      <td>Enjin Coin (ENJ)</td>
    </tr>
    <tr>
      <td>egld</td>
      <td>Elrond (EGLD)</td>
    </tr>
    <tr>
      <td>eos</td>
      <td>EOS (EOS)</td>
    </tr>
    <tr>
      <td>eth</td>
      <td>Ethereum (ETH)</td>
    </tr>
    <tr>
      <td>etc</td>
      <td>Ethereum Classic (ETC)</td>
    </tr>
    <tr>
      <td>ftm</td>
      <td>Fantom (FTM)</td>
    </tr>
    <tr>
      <td>flow</td>
      <td>Flow (FLOW)</td>
    </tr>
    <tr>
      <td>fil</td>
      <td>Filecoin (FIL)</td>
    </tr>
    <tr>
      <td>ftt</td>
      <td>FTX Token (FTT)</td>
    </tr>
    <tr>
      <td>one</td>
      <td>Harmony (ONE)</td>
    </tr>
    <tr>
      <td>hbar</td>
      <td>Hedera (HBAR)</td>
    </tr>
    <tr>
      <td>hnt</td>
      <td>Helium (HNT)</td>
    </tr>
    <tr>
      <td>hot</td>
      <td>Holo (HOT)</td>
    </tr>
    <tr>
      <td>ht</td>
      <td>Huobi Token (HT)</td>
    </tr>
    <tr>
      <td>icx</td>
      <td>ICON (ICX)</td>
    </tr>
    <tr>
      <td>miota</td>
      <td>IOTA (MIOTA)</td>
    </tr>
    <tr>
      <td>iotx</td>
      <td>IoTeX (IOTX)</td>
    </tr>
    <tr>
      <td>icp</td>
      <td>Internet Computer (ICP)</td>
    </tr>
    <tr>
      <td>kda</td>
      <td>Kadena (KDA)</td>
    </tr>
    <tr>
      <td>klay</td>
      <td>Klaytn (KLAY)</td>
    </tr>
    <tr>
      <td>kcs</td>
      <td>KuCoin Token (KCS)</td>
    </tr>
    <tr>
      <td>ksm</td>
      <td>Kusama (KSM)</td>
    </tr>
    <tr>
      <td>ltc</td>
      <td>Litecoin (LTC)</td>
    </tr>
    <tr>
      <td>lpt</td>
      <td>Livepeer (LPT)</td>
    </tr>
    <tr>
      <td>lrc</td>
      <td>Loopring (LRC)</td>
    </tr>
    <tr>
      <td>mina</td>
      <td>Mina (MINA)</td>
    </tr>
    <tr>
      <td>xmr</td>
      <td>Monero (XMR)</td>
    </tr>
    <tr>
      <td>near</td>
      <td>NEAR Protocol (NEAR)</td>
    </tr>
    <tr>
      <td>neo</td>
      <td>Neo (NEO)</td>
    </tr>
    <tr>
      <td>xem</td>
      <td>NEM (XEM)</td>
    </tr>
    <tr>
      <td>nexo</td>
      <td>Nexo (NEXO)</td>
    </tr>
    <tr>
      <td>okb</td>
      <td>OKB (OKB)</td>
    </tr>
    <tr>
      <td>omg</td>
      <td>OMG Network (OMG)</td>
    </tr>
    <tr>
      <td>leo</td>
      <td>ONUS SED LEO (LEO)</td>
    </tr>
    <tr>
      <td>dot</td>
      <td>Polkadot (DOT)</td>
    </tr>
    <tr>
      <td>qtum</td>
      <td>Qtum (QTUM)</td>
    </tr>
    <tr>
      <td>qnt</td>
      <td>Quant (QNT)</td>
    </tr>
    <tr>
      <td>cake</td>
      <td>PancakeSwap (CAKE)</td>
    </tr>
    <tr>
      <td>mkr</td>
      <td>Maker (MKR)</td>
    </tr>
    <tr>
      <td>matic</td>
      <td>Polygon (MATIC)</td>
    </tr>
    <tr>
      <td>rvn</td>
      <td>Ravencoin (RVN)</td>
    </tr>
    <tr>
      <td>rev</td>
      <td>Revain (REV)</td>
    </tr>
    <tr>
      <td>xrp</td>
      <td>Ripple (XRP)</td>
    </tr>
    <tr>
      <td>shib</td>
      <td>Shiba Inu (SHIB)</td>
    </tr>
    <tr>
      <td>sol</td>
      <td>Solana (SOL)</td>
    </tr>
    <tr>
      <td>stx</td>
      <td>Stacks (STX)</td>
    </tr>
    <tr>
      <td>xlm</td>
      <td>Stellar (XLM)</td>
    </tr>
    <tr>
      <td>sushi</td>
      <td>SushiSwap (SUSHI)</td>
    </tr>
    <tr>
      <td>xtz</td>
      <td>Tezos (XTZ)</td>
    </tr>
    <tr>
      <td>grt</td>
      <td>The Graph (GRT)</td>
    </tr>
    <tr>
      <td>sand</td>
      <td>The Sandbox (SAND)</td>
    </tr>
    <tr>
      <td>luna</td>
      <td>Terra (LUNA)</td>
    </tr>
    <tr>
      <td>ust</td>
      <td>TerraUSD (UST)</td>
    </tr>
    <tr>
      <td>luna2</td>
      <td>Terra 2.0 (LUNA2)</td>
    </tr>
    <tr>
      <td>theta</td>
      <td>Theta (THETA)</td>
    </tr>
    <tr>
      <td>trx</td>
      <td>Tron (TRX)</td>
    </tr>
    <tr>
      <td>tusd</td>
      <td>TrueUSD (TUSD)</td>
    </tr>
    <tr>
      <td>uma</td>
      <td>UMA (UMA)</td>
    </tr>
    <tr>
      <td>uni</td>
      <td>Uniswap (UNI)</td>
    </tr>
    <tr>
      <td>velo</td>
      <td>Velo (VELO)</td>
    </tr>
    <tr>
      <td>vet</td>
      <td>VeChain (VET)</td>
    </tr>
    <tr>
      <td>waves</td>
      <td>Waves (WAVES)</td>
    </tr>
    <tr>
      <td>waxp</td>
      <td>WAX (WAXP)</td>
    </tr>
    <tr>
      <td>wbtc</td>
      <td>Wrapped Bitcoin (WBTC)</td>
    </tr>
    <tr>
      <td>xdc</td>
      <td>XDC Network (XDC)</td>
    </tr>
    <tr>
      <td>yfi</td>
      <td>yearn.finance (YFI)</td>
    </tr>
    <tr>
      <td>zec</td>
      <td>Zcash (ZEC)</td>
    </tr>
    <tr>
      <td>zil</td>
      <td>Zilliqa (ZIL)</td>
    </tr>
  </tbody>
</table>

<br>

<h4>Endpoint</h4>
<p>Our GET endpoint can be found here:</p>
<p><code>https://scanblocks.io/api/get</code></p>

<br>

<h4>Methods Supports</h4>
<p>GET only for the time being. POST will be available shortly.</p>

<br>

<h4>Sample CURL GET Request</h4>
<div class="alert alert-warning" role="alert">
  *All 3 data elements are required - API Key, Blockchain Code, and Address
</div>
<p>Here is an example CURL request that you can use to get started.</p>
<p><code>curl -i -X GET "https://scanblocks.io/api/get?apikey=<b>APIKEY</b>&blockchain=<b>BLOCKCHAINCODE</b>&address=<b>ADDRESSYOUSEARCH</b>"</code></p>

<br>

<h4>Sample CURL GET Request across all Blockchains</h4>
<p>Here is an example CURL request that scans for an address across all blockchains.</p>
<p><code>curl -i -X GET "https://scanblocks.io/api/get?apikey=<b>APIKEY</b>&blockchain=<b>all</b>&address=<b>ADDRESSYOUSEARCH</b>"</code></p>

<br>

<h4>Sample JSON Response</h4>
<p>Response data will be in JSON standard format.</p>
<p><code>[{"address_id":"300822","address":"0x2cfeeb33e723915436fb1c5fb0b5d6634782c48f","blockchain":"Binance Coin (BNB)","reason":"scammer","describe_report":"Funneling money from a stolen wallet","url":""}]</code></p>

<br><br>