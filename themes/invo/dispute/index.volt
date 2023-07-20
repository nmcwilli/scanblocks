<br>

<h3>Dispute a Reported Address</h3>
<p>If you would like to dispute an address reported to get it removed from our dataset, please complete and submit the form below. The ScanBlocks team will review your request and make a decision on whether to remove the address.</p>

<div class="alert alert-warning" role="alert">
  *Ensure that you fill out the report with as much detail as possible to help our team make an appropriate decision.
</div>

<form action="/dispute/index" role="form" method="post" id="disputeForm">

    <div class="input-group mb-3" style="max-width:900px;">

      <select class="form-select" id="blockchain" name="blockchain" style="max-width:134px;" required>
          <option value="" selected>Select crypto</option>
          <option value="Bitcoin (BTC)">Bitcoin (BTC)</option>
          <option value="Bitcoin Cash (BCH)">Bitcoin Cash (BCH)</option>
          <option value="Ethereum (ETH)">Ethereum (ETH)</option>
          <option value="Ethereum Classic (ETC)">Ethereum Classic (ETC)</option>
          <option value="Cardano (ADA)">Cardano (ADA)</option>
          <option value="Polkadot (DOT)">Polkadot (DOT)</option>
          <option value="Dogecoin (DOGE)">Dogecoin (DOGE)</option>
          <option value="Ripple (XRP)">Ripple (XRP)</option>
          <option value="Solana (SOL)">Solana (SOL)</option>
          <option value="Binance Coin (BNB)">Binance Coin (BNB)</option>
          <option value="Terra (LUNA)">Terra (LUNA)</option>
          <option value="Axie Infinity Shards (AXS)">Axie Infinity Shards (AXS)</option>
          <option value="Chainlink (LINK)">Chainlink (LINK)</option>
          <option value="Avalanche (AVAX)">Avalanche (AVAX)</option>
          <option value="Internet Computer (ICP)">Internet Computer (ICP)</option>
          <option value="Stellar (XLM)">Stellar (XLM)</option>
          <option value="Algorand (ALGO)">Algorand (ALGO)</option>
          <option value="Polygon (MATIC)">Polygon (MATIC)</option>
          <option value="Litecoin (LTC)">Litecoin (LTC)</option>
          <option value="Quant (QNT)">Quant (QNT)</option>
          <option value="Cosmos (ATOM)">Cosmos (ATOM)</option>
          <option value="VeChain (VET)">VeChain (VET)</option>
          <option value="Tron (TRX)">Tron (TRX)</option>
          <option value="Filecoin (FIL)">Filecoin (FIL)</option>
          <option value="Velo (VELO)">Velo (VELO)</option>
          <option value="Shiba Inu (SHIB)">Shiba Inu (SHIB)</option>
          <option value="Tezos (XTZ)">Tezos (XTZ)</option>
          <option value="Dai (DAI)">Dai (DAI)</option>
          <option value="Theta (THETA)">Theta (THETA)</option>
          <option value="EOS (EOS)">EOS (EOS)</option>
          <option value="Aave (AAVE)">Aave (AAVE)</option>
          <option value="Monero (XMR)">Monero (XMR)</option>
          <option value="1inch (1INCH)">1inch (1INCH)</option>
          <option value="Neo (NEO)">Neo (NEO)</option>
          <option value="Dash (DASH)">Dash (DASH)</option>
          <option value="Wrapped Bitcoin (WBTC)">Wrapped Bitcoin (WBTC)</option>
          <option value="Uniswap (UNI)">Uniswap (UNI)</option>
          <option value="Binance USD (BUSD)">Binance USD (BUSD)</option>
          <option value="Crypto.com Coin (CRO)">Crypto.com Coin (CRO)</option>
          <option value="Bitcoin BEP2 (BTCB)">Bitcoin BEP2 (BTCB)</option>
          <option value="FTX Token (FTT)">FTX Token (FTT)</option>
          <option value="Elrond (EGLD)">Elrond (EGLD)</option>
          <option value="Hedera (HBAR)">Hedera (HBAR)</option>
          <option value="Fantom (FTM)">Fantom (FTM)</option>
          <option value="TerraUSD (UST)">TerraUSD (UST)</option>
          <option value="Decentraland (MANA)">Decentraland (MANA)</option>
          <option value="NEAR Protocol (NEAR)">NEAR Protocol (NEAR)</option>
          <option value="Helium (HNT)">Helium (HNT)</option>
          <option value="The Graph (GRT)">The Graph (GRT)</option>
          <option value="PancakeSwap (CAKE)">PancakeSwap (CAKE)</option>
          <option value="Flow (FLOW)">Flow (FLOW)</option>
          <option value="Klaytn (KLAY)">Klaytn (KLAY)</option>
          <option value="Loopring (LRC)">Loopring (LRC)</option>
          <option value="eCash (XEC)">eCash (XEC)</option>
          <option value="IOTA (MIOTA)">IOTA (MIOTA)</option>
          <option value="Kusama (KSM)">Kusama (KSM)</option>
          <option value="Bitcoin SV (BSV)">Bitcoin SV (BSV)</option>
          <option value="Kadena (KDA)">Kadena (KDA)</option>
          <option value="ONUS SED LEO (LEO)">ONUS SED LEO (LEO)</option>
          <option value="THORChain (RUNE)">THORChain (RUNE)</option>
          <option value="Chiliz (CHZ)">Chiliz (CHZ)</option>
          <option value="Stacks (STX)">Stacks (STX)</option>
          <option value="Maker (MKR)">Maker (MKR)</option>
          <option value="Harmony (ONE)">Harmony (ONE)</option>
          <option value="The Sandbox (SAND)">The Sandbox (SAND)</option>
          <option value="BitTorrent (BTT)">BitTorrent (BTT)</option>
          <option value="Enjin Coin (ENJ)">Enjin Coin (ENJ)</option>
          <option value="Waves (WAVES)">Waves (WAVES)</option>
          <option value="Zcash (ZEC)">Zcash (ZEC)</option>
          <option value="Amp (AMP)">Amp (AMP)</option>
          <option value="Holo (HOT)">Holo (HOT)</option>
          <option value="Arweave (AR)">Arweave (AR)</option>
          <option value="Compound (COMP)">Compound (COMP)</option>
          <option value="IoTeX (IOTX)">IoTeX (IOTX)</option>
          <option value="KuCoin Token (KCS)">KuCoin Token (KCS)</option>
          <option value="Nexo (NEXO)">Nexo (NEXO)</option>
          <option value="Celo (CELO)">Celo (CELO)</option>
          <option value="Huobi Token (HT)">Huobi Token (HT)</option>
          <option value="NEM (XEM)">NEM (XEM)</option>
          <option value="ICON (ICX)">ICON (ICX)</option>
          <option value="Basic Attention Token (BAT)">Basic Attention Token (BAT)</option>
          <option value="Qtum (QTUM)">Qtum (QTUM)</option>
          <option value="OKB (OKB)">OKB (OKB)</option>
          <option value="Curve DAO Token (CRV)">Curve DAO Token (CRV)</option>
          <option value="Decred (DCR)">Decred (DCR)</option>
          <option value="OMG Network (OMG)">OMG Network (OMG)</option>
          <option value="Mina (MINA)">Mina (MINA)</option>
          <option value="WAX (WAXP)">WAX (WAXP)</option>
          <option value="Livepeer (LPT)">Livepeer (LPT)</option>
          <option value="UMA (UMA)">UMA (UMA)</option>
          <option value="Revain (REV)">Revain (REV)</option>
          <option value="TrueUSD (TUSD)">TrueUSD (TUSD)</option>
          <option value="SushiSwap (SUSHI)">SushiSwap (SUSHI)</option>
          <option value="Ravencoin (RVN)">Ravencoin (RVN)</option>
          <option value="yearn.finance (YFI)">yearn.finance (YFI)</option>
          <option value="Zilliqa (ZIL)">Zilliqa (ZIL)</option>
          <option value="Audius (AUDIO)">Audius (AUDIO)</option>
          <option value="XDC Network (XDC)">XDC Network (XDC)</option>
          <option value="Bitcoin Gold (BTG)">Bitcoin Gold (BTG)</option>
      </select>

      <input type="text" name="address" id="address" size="2083" class="form-control form-control-lg" placeholder="Copy and paste the address here" aria-label="Copy and paste the address here" required>
    </div>

    <div class="input-group mb-3 form-control-lg" style="max-width:900px;padding:0px;">
      <select class="form-select" id="reason" name="reason" required>
          <option value="" selected>Select the reason for your dispute</option>
          <option value="inaccurate">Inaccurate report</option>
          <option value="lying">Report is not true</option>
          <option value="hurt feelings">Hurt over a transaction</option>
          <option value="not a spammer">Not a spammer</option>
          <option value="not a phisher">Not a Phisher</option>
          <option value="not a fake ico">Not a fake ICO</option>
          <option value="not hacker">Not a hacker</option>
          <option value="not related to darknet market">Not related to darknet market</option>
          <option value="nft dispute upset">Someone upset over NFT dispute</option>
          <option value="no money laundering">Not related to money laundering</option>
          <option value="incorrect forum reported">Incorrectly reported in a forum</option>
          <option value="not a fraudster">Not a fruadster</option>
          <option value="other reason">Other reason</option>
      </select>
    </div>

    <div class="form-group">
      <p>Describe the reason for your dispute <b>in detail</b>.</p>
      <textarea class="form-control" id="describe_dispute" name="describe_dispute" rows="5" required></textarea>
    </div>

    <img src="/recaptcha.png" class="img-fluid" alt="Protected by Google reCaptcha" style="max-width:140px;margin-bottom:6px;" />

    <div class="form-group">
      <input type="hidden" name="type" id="type" value="disputeAddress">
      <button class="btn btn-primary g-recaptcha" value="Submit" type="submit" data-sitekey="6Lc5CMEcAAAAAJ7nIPUpjVDgB_YyfIl1RzEHYwF_" data-callback='onSubmit' data-action='submit'>Submit</button>
    </div>

</form>

<br><br>