<br>

<h3>Report an address</h3>
<p>Use this form to report a blockchain address of a known scammer, ransomware, blackmailer or fraudster. This will create a record in our dataset to help prevent others from being scammed/conned out of their hard earned cryptocurrency.</p>

<div class="alert alert-warning" role="alert">
  *Ensure you copy and paste all addresses (for accuracy) and select the correct blockchain/cryptocurrency.<br>
  *Please also consider registering for an account if you'd like greater flexibility over addresses you report.<br>
  *All fields below are required. 
</div>

<div class="alert alert-danger" role="alert">
  *Do NOT report Transaction ID's or URL's in the Address field. Only submit the address of the malicious actor (i.e. hacker, scammer, etc).
</div>

<form action="/submit/index" role="form" method="post" id="submitForm">

    <div class="input-group mb-3" style="max-width:900px;">

      <select class="form-select" id="blockchain" name="blockchain" style="max-width:134px; border-radius: 5px 0px 0px 5px;" required>
          <option value="" selected>Select crypto</option>
          <optgroup label="Most popular">

              <option value="Binance Coin (BNB)">Binance Coin (BNB)</option>
              <option value="Bitcoin (BTC)">Bitcoin (BTC)</option>
              <option value="Cardano (ADA)">Cardano (ADA)</option>
              <option value="Dogecoin (DOGE)">Dogecoin (DOGE)</option>
              <option value="Ethereum (ETH)">Ethereum (ETH)</option>
              <option value="Ethereum Classic (ETC)">Ethereum Classic (ETC)</option>
              <option value="Ripple (XRP)">Ripple (XRP)</option>

          </optgroup>
          <optgroup label="Others">

              <option value="1inch (1INCH)">1inch (1INCH)</option>

              <option value="Aave (AAVE)">Aave (AAVE)</option>
              <option value="Algorand (ALGO)">Algorand (ALGO)</option>
              <option value="Amp (AMP)">Amp (AMP)</option>
              <option value="Arweave (AR)">Arweave (AR)</option>
              <option value="Audius (AUDIO)">Audius (AUDIO)</option>
              <option value="Avalanche (AVAX)">Avalanche (AVAX)</option>
              <option value="Axie Infinity Shards (AXS)">Axie Infinity Shards (AXS)</option>

              <option value="Basic Attention Token (BAT)">Basic Attention Token (BAT)</option>
              <option value="Binance USD (BUSD)">Binance USD (BUSD)</option>
              <option value="Bitcoin Gold (BTG)">Bitcoin Gold (BTG)</option>
              <option value="Bitcoin Cash (BCH)">Bitcoin Cash (BCH)</option>
              <option value="Bitcoin BEP2 (BTCB)">Bitcoin BEP2 (BTCB)</option>
              <option value="Bitcoin SV (BSV)">Bitcoin SV (BSV)</option>
              <option value="BitTorrent (BTT)">BitTorrent (BTT)</option>
              
              <option value="Celo (CELO)">Celo (CELO)</option>
              <option value="Chainlink (LINK)">Chainlink (LINK)</option>
              <option value="Cosmos (ATOM)">Cosmos (ATOM)</option>
              <option value="Crypto.com Coin (CRO)">Crypto.com Coin (CRO)</option>
              <option value="Chiliz (CHZ)">Chiliz (CHZ)</option>
              <option value="Compound (COMP)">Compound (COMP)</option>
              <option value="Curve DAO Token (CRV)">Curve DAO Token (CRV)</option>

              <option value="Dai (DAI)">Dai (DAI)</option>
              <option value="Dash (DASH)">Dash (DASH)</option>
              <option value="Decentraland (MANA)">Decentraland (MANA)</option>
              <option value="Decred (DCR)">Decred (DCR)</option>

              <option value="EOS (EOS)">EOS (EOS)</option>
              <option value="Elrond (EGLD)">Elrond (EGLD)</option>
              <option value="eCash (XEC)">eCash (XEC)</option>
              <option value="Enjin Coin (ENJ)">Enjin Coin (ENJ)</option>

              <option value="Filecoin (FIL)">Filecoin (FIL)</option>
              <option value="FTX Token (FTT)">FTX Token (FTT)</option>
              <option value="Fantom (FTM)">Fantom (FTM)</option>
              <option value="Flow (FLOW)">Flow (FLOW)</option>

              <option value="Harmony (ONE)">Harmony (ONE)</option>
              <option value="Hedera (HBAR)">Hedera (HBAR)</option>
              <option value="Helium (HNT)">Helium (HNT)</option>
              <option value="Holo (HOT)">Holo (HOT)</option>
              <option value="Huobi Token (HT)">Huobi Token (HT)</option>

              <option value="IOTA (MIOTA)">IOTA (MIOTA)</option>

              <option value="Kadena (KDA)">Kadena (KDA)</option>
              <option value="Klaytn (KLAY)">Klaytn (KLAY)</option>
              <option value="KuCoin Token (KCS)">KuCoin Token (KCS)</option>
              <option value="Kusama (KSM)">Kusama (KSM)</option>

              <option value="Mina (MINA)">Mina (MINA)</option>

              <option value="NEAR Protocol (NEAR)">NEAR Protocol (NEAR)</option>

              <option value="Polygon (MATIC)">Polygon (MATIC)</option>
              <option value="Polkadot (DOT)">Polkadot (DOT)</option>
              
              <option value="ICON (ICX)">ICON (ICX)</option>
              <option value="IoTeX (IOTX)">IoTeX (IOTX)</option>
              <option value="Internet Computer (ICP)">Internet Computer (ICP)</option>

              <option value="Litecoin (LTC)">Litecoin (LTC)</option>
              <option value="Livepeer (LPT)">Livepeer (LPT)</option>
              <option value="Loopring (LRC)">Loopring (LRC)</option>

              <option value="Quant (QNT)">Quant (QNT)</option>

              <option value="Maker (MKR)">Maker (MKR)</option>
              <option value="Monero (XMR)">Monero (XMR)</option>
              
              <option value="NEM (XEM)">NEM (XEM)</option>
              <option value="Neo (NEO)">Neo (NEO)</option>
              <option value="Nexo (NEXO)">Nexo (NEXO)</option>

              <option value="OKB (OKB)">OKB (OKB)</option>
              <option value="OMG Network (OMG)">OMG Network (OMG)</option>
              <option value="ONUS SED LEO (LEO)">ONUS SED LEO (LEO)</option>

              <option value="PancakeSwap (CAKE)">PancakeSwap (CAKE)</option>

              <option value="Qtum (QTUM)">Qtum (QTUM)</option>

              <option value="Ravencoin (RVN)">Ravencoin (RVN)</option>
              <option value="Revain (REV)">Revain (REV)</option>

              <option value="Shiba Inu (SHIB)">Shiba Inu (SHIB)</option>
              <option value="Solana (SOL)">Solana (SOL)</option>
              <option value="Stacks (STX)">Stacks (STX)</option>
              <option value="Stellar (XLM)">Stellar (XLM)</option>
              <option value="SushiSwap (SUSHI)">SushiSwap (SUSHI)</option>

              <option value="Tezos (XTZ)">Tezos (XTZ)</option>
              <option value="The Graph (GRT)">The Graph (GRT)</option>
              <option value="The Sandbox (SAND)">The Sandbox (SAND)</option>
              <option value="Theta (THETA)">Theta (THETA)</option>
              <option value="Tether (USDT)">Tether (USDT)</option>
              <option value="Terra (LUNA)">Terra (LUNA)</option>
              <option value="TerraUSD (UST)">TerraUSD (UST)</option>
              <option value="Terra 2.0 (LUNA2)">Terra 2.0 (LUNA2)</option>
              <option value="THORChain (RUNE)">THORChain (RUNE)</option>
              <option value="Tron (TRX)">Tron (TRX)</option>
              <option value="TrueUSD (TUSD)">TrueUSD (TUSD)</option>
              
              <option value="UMA (UMA)">UMA (UMA)</option>
              <option value="Uniswap (UNI)">Uniswap (UNI)</option>
              <option value="USD Coin (USDC)">USD Coin (USDC)</option>

              <option value="VeChain (VET)">VeChain (VET)</option>
              <option value="Velo (VELO)">Velo (VELO)</option>
              
              <option value="Waves (WAVES)">Waves (WAVES)</option>
              <option value="WAX (WAXP)">WAX (WAXP)</option>
              <option value="Wrapped Bitcoin (WBTC)">Wrapped Bitcoin (WBTC)</option>
              
              <option value="XDC Network (XDC)">XDC Network (XDC)</option>

              <option value="yearn.finance (YFI)">yearn.finance (YFI)</option>
              
              <option value="Zcash (ZEC)">Zcash (ZEC)</option>
              <option value="Zilliqa (ZIL)">Zilliqa (ZIL)</option>
              
          </optgroup> 
      </select>

      <input type="text" name="address" id="address" size="2083" class="form-control form-control-lg" placeholder="Enter wallet address here" aria-label="Enter wallet address here" required>
    </div>

    <div class="input-group mb-3 form-control-lg" style="max-width:900px;padding:0px;">
      <select class="form-select" id="reason" name="reason" style="max-width:600px;" required>
          <option value="" selected>Select a reason for report</option>
          <option value="scammer">Scammer</option>
          <option value="ransomware">Ransomware</option>
          <option value="blackmail">Blackmail</option>
          <option value="spammer">Spammer</option>
          <option value="phisher">Phisher</option>
          <option value="fake ico">Fake ICO</option>
          <option value="hacker">Hacker</option>
          <option value="darknet market">Darknet market</option>
          <option value="nft dispute">NFT dispute</option>
          <option value="money laundering">Money laundering</option>
          <option value="forum reported">Forum reported</option>
          <option value="fraudster">Fruadster</option>
          <option value="other">Other</option>
      </select>
    </div>

    <div class="form-group">
      <p>Is there a URL/Website associated with this address? For example, a phishing or other malicious website that is tricking users - i.e. www.scam.com</p>
      <input type="text" name="url" id="url" size="500" class="form-control form-control-lg" placeholder="Add URL/website here" aria-label="Add URL/website here">
    </div>

    <div class="form-group">
      <p>Describe the reason for your report.</p>
      <textarea class="form-control" id="describe_report" name="describe_report" rows="5" required></textarea>
    </div>

    <img src="/recaptcha.png" class="img-fluid" alt="Protected by Google reCaptcha" style="max-width:140px;margin-bottom:6px;" />

    <div class="form-group">
      <input type="hidden" name="type" id="type" value="submitAddress">
      <button class="btn btn-primary g-recaptcha" value="Submit" type="submit" data-sitekey="6Lc5CMEcAAAAAJ7nIPUpjVDgB_YyfIl1RzEHYwF_" data-callback='onSubmit' data-action='submit'>Submit Address</button>
    </div>

</form>

<br><br><br>