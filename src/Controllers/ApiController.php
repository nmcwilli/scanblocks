<?php

declare(strict_types=1);

namespace Invo\Controllers;

use Phalcon\Http\Response;
use Phalcon\Http\Request;
use Invo\Forms\ProductsForm;
use Invo\Models\Api;
use Invo\Models\Products;
use Invo\Models\Users;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Manager;
use Phalcon\Mvc\Model\Query;

/**
 * API Request Controller for ScanBlocks
 *
 * Created by Neil McWilliam
 */

class ApiController extends ControllerBase
{

    // Set public variables
    public $blockchain;
    public $address;
    public $api_id;
    public $apikey;
    public $user_id;
    public $date_submit;
    public $url;

    /**
     * Products initializer
    */
    public function initialize()
    {
        $this->tag->setTitle('API for Scanblocks.io');

        parent::initialize();
    }

    /**
     * Simple GET API Request
     * 
     * @method GET
     * @link /api/get
     */
    public function getAction() 
    {
        // Disable View File Content
        $this->view->disable();

        // Getting a response instance
        // https://docs.phalcon.io/4.0/en/response.html
        $response = new Response();

        // Getting a request instance
        // https://docs.phalcon.io/4.0/en/request
        $request = new Request();

        // Check whether the request was made with Ajax ( $request->isAjax() )

        // Grab the data from the GET variables
        $blockchain = $this->request->get('blockchain', 'string');
        $address = $this->request->get('address', ['string', 'striptags', 'trim']);
        $apikey = $this->request->get('apikey', 'string');
        $url = $this->request->get('apikey', 'url');

        // Check whether they are using a valid API key
        $user = Users::find(
            [
                'conditions' => 'apikey = :apikey: AND active = :active:',
                'bind'       => [
                    'apikey' => $apikey,
                    'active' => 1,
                ],
                'order' => 'id desc',
            ]
        );
        $userCount = count($user); 

        // If the API key is valid, then proceed: 
        if ($userCount>=1){ 

            // Map simple codes for the types of currencies 
            if($blockchain){ $blockchain = strtolower($blockchain); }
            if ($blockchain=="bnb"){
                $blockchainFull = "Binance Coin (BNB)";
            }
            if ($blockchain=="btc"){
                $blockchainFull = "Bitcoin (BTC)";
            }
            if ($blockchain=="eth"){
                $blockchainFull = "Ethereum (ETH)";
            }
            if ($blockchain=="etc"){
                $blockchainFull = "Ethereum Classic (ETC)";
            }
            if ($blockchain=="xlm"){
                $blockchainFull = "Stellar (XLM)";
            }
            if ($blockchain=="doge"){
                $blockchainFull = "Dogecoin (DOGE)";
            }
            if ($blockchain=="busd"){
                $blockchainFull = "Binance USD (BUSD)";
            }
            if ($blockchain=="trx"){
                $blockchainFull = "Tron (TRX)";
            }
            if ($blockchain=="ltc"){
                $blockchainFull = "Litecoin (LTC)";
            }
            if ($blockchain=="trx"){
                $blockchainFull = "Tron (TRX)";
            }
            if ($blockchain=="sol"){
                $blockchainFull = "Solana (SOL)";
            }
            if ($blockchain=="link"){
                $blockchainFull = "Chainlink (LINK)";
            }
            if ($blockchain=="ada"){
                $blockchainFull = "Cardano (ADA)";
            }
            if ($blockchain=="xrp"){
                $blockchainFull = "Ripple (XRP)";
            }
            if ($blockchain=="theta"){
                $blockchainFull = "Theta (THETA)";
            }
            if ($blockchain=="matic"){
                $blockchainFull = "Polygon (MATIC)";
            }
            if ($blockchain=="dot"){
                $blockchainFull = "Polkadot (DOT)";
            }
            if ($blockchain=="axs"){
                $blockchainFull = "Axie Infinity Shards (AXS)";
            }
            if ($blockchain=="icp"){
                $blockchainFull = "Internet Computer (ICP)";
            }
            if ($blockchain=="algo"){
                $blockchainFull = "Algorand (ALGO)";
            }
            if ($blockchain=="qnt"){
                $blockchainFull = "Quant (QNT)";
            }
            if ($blockchain=="bch"){
                $blockchainFull = "Bitcoin Cash (BCH)";
            }
            if ($blockchain=="atom"){
                $blockchainFull = "Cosmos (ATOM)";
            }
            if ($blockchain=="vet"){
                $blockchainFull = "VeChain (VET)";
            }
            if ($blockchain=="fil"){
                $blockchainFull = "Filecoin (FIL)";
            }
            if ($blockchain=="velo"){
                $blockchainFull = "Velo (VELO)";
            }
            if ($blockchain=="shib"){
                $blockchainFull = "Shiba Inu (SHIB)";
            }
            if ($blockchain=="xtz"){
                $blockchainFull = "Tezos (XTZ)";
            }
            if ($blockchain=="dai"){
                $blockchainFull = "Dai (DAI)";
            }
            if ($blockchain=="eos"){
                $blockchainFull = "EOS (EOS)";
            }
            if ($blockchain=="aave"){
                $blockchainFull = "Aave (AAVE)";
            }
            if ($blockchain=="xmr"){
                $blockchainFull = "Monero (XMR)";
            }
            if ($blockchain=="1inch"){
                $blockchainFull = "1inch (1INCH)";
            }
            if ($blockchain=="neo"){
                $blockchainFull = "Neo (NEO)";
            }
            if ($blockchain=="dash"){
                $blockchainFull = "Dash (DASH)";
            }
            if ($blockchain=="wbtc"){
                $blockchainFull = "Wrapped Bitcoin (WBTC)";
            }
            if ($blockchain=="uni"){
                $blockchainFull = "Uniswap (UNI)";
            }
            if ($blockchain=="cro"){
                $blockchainFull = "Crypto.com Coin (CRO)";
            }
            if ($blockchain=="btcb"){
                $blockchainFull = "Bitcoin BEP2 (BTCB)";
            }
            if ($blockchain=="ftt"){
                $blockchainFull = "FTX Token (FTT)";
            }
            if ($blockchain=="egld"){
                $blockchainFull = "Elrond (EGLD)";
            }
            if ($blockchain=="hbar"){
                $blockchainFull = "Hedera (HBAR)";
            }
            if ($blockchain=="ftm"){
                $blockchainFull = "Fantom (FTM)";
            }
            if ($blockchain=="mana"){
                $blockchainFull = "Decentraland (MANA)";
            }
            if ($blockchain=="near"){
                $blockchainFull = "NEAR Protocol (NEAR)";
            }
            if ($blockchain=="hnt"){
                $blockchainFull = "Helium (HNT)";
            }
            if ($blockchain=="grt"){
                $blockchainFull = "The Graph (GRT)";
            }
            if ($blockchain=="cake"){
                $blockchainFull = "PancakeSwap (CAKE)";
            }
            if ($blockchain=="flow"){
                $blockchainFull = "Flow (FLOW)";
            }
            if ($blockchain=="klay"){
                $blockchainFull = "Klaytn (KLAY)";
            }
            if ($blockchain=="lrc"){
                $blockchainFull = "Loopring (LRC)";
            }
            if ($blockchain=="xec"){
                $blockchainFull = "eCash (XEC)";
            }
            if ($blockchain=="miota"){
                $blockchainFull = "IOTA (MIOTA)";
            }
            if ($blockchain=="ksm"){
                $blockchainFull = "Kusama (KSM)";
            }
            if ($blockchain=="bsv"){
                $blockchainFull = "Bitcoin SV (BSV)";
            }
            if ($blockchain=="kda"){
                $blockchainFull = "Kadena (KDA)";
            }
            if ($blockchain=="leo"){
                $blockchainFull = "ONUS SED LEO (LEO)";
            }
            if ($blockchain=="rune"){
                $blockchainFull = "THORChain (RUNE)";
            }
            if ($blockchain=="chz"){
                $blockchainFull = "Chiliz (CHZ)";
            }
            if ($blockchain=="stx"){
                $blockchainFull = "Stacks (STX)";
            }
            if ($blockchain=="mkr"){
                $blockchainFull = "Maker (MKR)";
            }
            if ($blockchain=="one"){
                $blockchainFull = "Harmony (ONE)";
            }
            if ($blockchain=="sand"){
                $blockchainFull = "The Sandbox (SAND)";
            }
            if ($blockchain=="btt"){
                $blockchainFull = "BitTorrent (BTT)";
            }
            if ($blockchain=="enj"){
                $blockchainFull = "Enjin Coin (ENJ)";
            }
            if ($blockchain=="waves"){
                $blockchainFull = "Waves (WAVES)";
            }
            if ($blockchain=="zec"){
                $blockchainFull = "Zcash (ZEC)";
            }
            if ($blockchain=="amp"){
                $blockchainFull = "Amp (AMP)";
            }
            if ($blockchain=="hot"){
                $blockchainFull = "Holo (HOT)";
            }
            if ($blockchain=="ar"){
                $blockchainFull = "Arweave (AR)";
            }
            if ($blockchain=="comp"){
                $blockchainFull = "Compound (COMP)";
            }
            if ($blockchain=="iotx"){
                $blockchainFull = "IoTeX (IOTX)";
            }
            if ($blockchain=="kcs"){
                $blockchainFull = "KuCoin Token (KCS)";
            }
            if ($blockchain=="nexo"){
                $blockchainFull = "Nexo (NEXO)";
            }
            if ($blockchain=="celo"){
                $blockchainFull = "Celo (CELO)";
            }
            if ($blockchain=="ht"){
                $blockchainFull = "Huobi Token (HT)";
            }
            if ($blockchain=="xem"){
                $blockchainFull = "NEM (XEM)";
            }
            if ($blockchain=="icx"){
                $blockchainFull = "ICON (ICX)";
            }
            if ($blockchain=="bat"){
                $blockchainFull = "Basic Attention Token (BAT)";
            }
            if ($blockchain=="qtum"){
                $blockchainFull = "Qtum (QTUM)";
            }
            if ($blockchain=="okb"){
                $blockchainFull = "OKB (OKB)";
            }
            if ($blockchain=="crv"){
                $blockchainFull = "Curve DAO Token (CRV)";
            }
            if ($blockchain=="dcr"){
                $blockchainFull = "Decred (DCR)";
            }
            if ($blockchain=="omg"){
                $blockchainFull = "OMG Network (OMG)";
            }
            if ($blockchain=="mina"){
                $blockchainFull = "Mina (MINA)";
            }
            if ($blockchain=="waxp"){
                $blockchainFull = "WAX (WAXP)";
            }
            if ($blockchain=="lpt"){
                $blockchainFull = "Livepeer (LPT)";
            }
            if ($blockchain=="uma"){
                $blockchainFull = "UMA (UMA)";
            }
            if ($blockchain=="rev"){
                $blockchainFull = "Revain (REV)";
            }
            if ($blockchain=="tusd"){
                $blockchainFull = "TrueUSD (TUSD)";
            }
            if ($blockchain=="sushi"){
                $blockchainFull = "SushiSwap (SUSHI)";
            }
            if ($blockchain=="rvn"){
                $blockchainFull = "Ravencoin (RVN)";
            }
            if ($blockchain=="yfi"){
                $blockchainFull = "yearn.finance (YFI)";
            }
            if ($blockchain=="zil"){
                $blockchainFull = "Zilliqa (ZIL)";
            }
            if ($blockchain=="audio"){
                $blockchainFull = "Audius (AUDIO)";
            }
            if ($blockchain=="xdc"){
                $blockchainFull = "XDC Network (XDC)";
            }
            if ($blockchain=="btg"){
                $blockchainFull = "Bitcoin Gold (BTG)";
            }
            if ($blockchain=="luna"){
                $blockchainFull = "Terra (LUNA)";
            }
            if ($blockchain=="ust"){
                $blockchainFull = "TerraUSD (UST)";
            }
            if ($blockchain=="luna2"){
                $blockchainFull = "Terra 2.0 (LUNA2)";
            }
            if ($blockchain=="all"){
                $blockchainFull = "all";
            }

            // Track their search request
            $api = new Api(); 
            $api->apikey = $apikey; 
            $api->date_submit = new RawValue('now()'); 
            $api->address = $address; 
            $api->blockchain = $blockchainFull; 

            // Render error if one occurs
            if (!$api->save()) {

                foreach ($api->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }

            // Otherwise show results
            } else {

                // $this->flash->success('We have updated the API tracking table');
            }

            // Detect if they've searched all blockchains, or just 1
            if ($blockchainFull=="all"){

                // Search for the corresponding address data 
                $products = Products::find(
                    [
                        'conditions' => 'address = :address: AND active = :active:',
                        'bind'       => [
                            'address' => $address,
                            'active' => 1,
                        ],
                        'order' => 'address_id desc',
                    ]
                );

                $data = [];

                foreach ($products as $product) {
                    $data[] = [
                        'address_id'   => $product->address_id,
                        'address' => $product->address,
                        'blockchain' => $product->blockchain,
                        'reason' => $product->reason,
                        'describe_report' => $product->describe_report,
                        'url' => $product->url,
                    ];
                }

            // Search that specific blockchain
            } else {

                // Search for the corresponding wallet data 
                $products = Products::find(
                    [
                        'conditions' => 'address = :address: AND blockchain = :blockchain: AND active = :active:',
                        'bind'       => [
                            'address' => $address,
                            'blockchain' => $blockchainFull,
                            'active' => 1,
                        ],
                        'order' => 'address_id desc',
                    ]
                );

                $data = [];

                foreach ($products as $product) {
                    $data[] = [
                        'address_id'   => $product->address_id,
                        'address' => $product->address,
                        'blockchain' => $product->blockchain,
                        'reason' => $product->reason,
                        'describe_report' => $product->describe_report,
                        'url' => $product->url,
                    ];
                }
            } 

            /* If there is nothing in the data, then render a message 
            if (!$data){
                // Set status code
                $response->setStatusCode(200, 'OK');

                // Set the content of the response
                $response->setJsonContent(["status" => true, "error" => "There were no results.", "data" => $returnData ]);

            // If there is data, then encode it as json 
            } else {
                echo json_encode($data); 
            } */

        // The API key is invalid 
        } else {

            // Set status code
            $response->setStatusCode(405, 'The API Key was invalid or method not allowed using blockchain: '.$blockchain.' and API Key: '.$apikey);

            // Set the content of the response
            // $response->setContent("Sorry, the page doesn't exist");
            $response->setJsonContent(["status" => false, "error" => "The API Key was invalid or method not allowed using blockchain: ".$blockchain." , API key: ".$apikey." and Address: ".$address]);
        } 

        // Send response to the client as json content type 
        $response
            ->setJsonContent($data)
            ->send();
    }

    /**
     * Simple POST API Request with Param Data
     * 
     */
    public function postAction()
    {
        // Disable View File Content
        $this->view->disable();

        // Getting a response instance
        // https://docs.phalcon.io/4.0/en/response.html
        $response = new Response();

        // Getting a request instance
        // https://docs.phalcon.io/4.0/en/request
        $request = new Request();

        // Check whether the request was made with method POST ( $this->request->isPost() )
        if ($request->isPost()) {

            // Check whether the request was made with Ajax ( $request->isAjax() )

            // Grab the data submitted
            $blockchain = $this->request->post('blockchain', 'string');
            $address = $this->request->post('address', ['string', 'striptags', 'trim']);
            $apikey = $this->request->post('apikey', 'string');

            // Check whether they are using a valid API key
            $user = Users::find(
                [
                    'conditions' => 'apikey = :apikey: AND active = :active:',
                    'bind'       => [
                        'apikey' => $apikey,
                        'active' => 1,
                    ],
                    'order' => 'id desc',
                ]
            );
            $userCount = count($user); 

            // If the API key is valid, then proceed: 
            if ($userCount>=1){ 

                // Map simple codes for the types of currencies 
                if($blockchain){ $blockchain = strtolower($blockchain); }
                if ($blockchain=="bnb"){
                    $blockchainFull = "Binance Coin (BNB)";
                }
                if ($blockchain=="btc"){
                    $blockchainFull = "Bitcoin (BTC)";
                }
                if ($blockchain=="eth"){
                    $blockchainFull = "Ethereum (ETH)";
                }
                if ($blockchain=="etc"){
                    $blockchainFull = "Ethereum Classic (ETC)";
                }
                if ($blockchain=="xlm"){
                    $blockchainFull = "Stellar (XLM)";
                }
                if ($blockchain=="xlm"){
                    $blockchainFull = "Stellar (XLM)";
                }
                if ($blockchain=="doge"){
                    $blockchainFull = "Dogecoin (DOGE)";
                }
                if ($blockchain=="busd"){
                    $blockchainFull = "Binance USD (BUSD)";
                }
                if ($blockchain=="trx"){
                    $blockchainFull = "Tron (TRX)";
                }
                if ($blockchain=="ltc"){
                    $blockchainFull = "Litecoin (LTC)";
                }
                if ($blockchain=="trx"){
                    $blockchainFull = "Tron (TRX)";
                }
                if ($blockchain=="sol"){
                    $blockchainFull = "Solana (SOL)";
                }
                if ($blockchain=="link"){
                    $blockchainFull = "Chainlink (LINK)";
                }
                if ($blockchain=="ada"){
                    $blockchainFull = "Cardano (ADA)";
                }
                if ($blockchain=="xrp"){
                    $blockchainFull = "Ripple (XRP)";
                }
                if ($blockchain=="theta"){
                    $blockchainFull = "Theta (THETA)";
                }
                if ($blockchain=="matic"){
                    $blockchainFull = "Polygon (MATIC)";
                }
                if ($blockchain=="dot"){
                    $blockchainFull = "Polkadot (DOT)";
                }
                if ($blockchain=="axs"){
                    $blockchainFull = "Axie Infinity Shards (AXS)";
                }
                if ($blockchain=="icp"){
                    $blockchainFull = "Internet Computer (ICP)";
                }
                if ($blockchain=="algo"){
                    $blockchainFull = "Algorand (ALGO)";
                }
                if ($blockchain=="qnt"){
                    $blockchainFull = "Quant (QNT)";
                }
                if ($blockchain=="bch"){
                    $blockchainFull = "Bitcoin Cash (BCH)";
                }
                if ($blockchain=="atom"){
                    $blockchainFull = "Cosmos (ATOM)";
                }
                if ($blockchain=="vet"){
                    $blockchainFull = "VeChain (VET)";
                }
                if ($blockchain=="fil"){
                    $blockchainFull = "Filecoin (FIL)";
                }
                if ($blockchain=="velo"){
                    $blockchainFull = "Velo (VELO)";
                }
                if ($blockchain=="shib"){
                    $blockchainFull = "Shiba Inu (SHIB)";
                }
                if ($blockchain=="xtz"){
                    $blockchainFull = "Tezos (XTZ)";
                }
                if ($blockchain=="dai"){
                    $blockchainFull = "Dai (DAI)";
                }
                if ($blockchain=="eos"){
                    $blockchainFull = "EOS (EOS)";
                }
                if ($blockchain=="aave"){
                    $blockchainFull = "Aave (AAVE)";
                }
                if ($blockchain=="xmr"){
                    $blockchainFull = "Monero (XMR)";
                }
                if ($blockchain=="1inch"){
                    $blockchainFull = "1inch (1INCH)";
                }
                if ($blockchain=="neo"){
                    $blockchainFull = "Neo (NEO)";
                }
                if ($blockchain=="dash"){
                    $blockchainFull = "Dash (DASH)";
                }
                if ($blockchain=="wbtc"){
                    $blockchainFull = "Wrapped Bitcoin (WBTC)";
                }
                if ($blockchain=="uni"){
                    $blockchainFull = "Uniswap (UNI)";
                }
                if ($blockchain=="cro"){
                    $blockchainFull = "Crypto.com Coin (CRO)";
                }
                if ($blockchain=="btcb"){
                    $blockchainFull = "Bitcoin BEP2 (BTCB)";
                }
                if ($blockchain=="ftt"){
                    $blockchainFull = "FTX Token (FTT)";
                }
                if ($blockchain=="egld"){
                    $blockchainFull = "Elrond (EGLD)";
                }
                if ($blockchain=="hbar"){
                    $blockchainFull = "Hedera (HBAR)";
                }
                if ($blockchain=="ftm"){
                    $blockchainFull = "Fantom (FTM)";
                }
                if ($blockchain=="mana"){
                    $blockchainFull = "Decentraland (MANA)";
                }
                if ($blockchain=="near"){
                    $blockchainFull = "NEAR Protocol (NEAR)";
                }
                if ($blockchain=="hnt"){
                    $blockchainFull = "Helium (HNT)";
                }
                if ($blockchain=="grt"){
                    $blockchainFull = "The Graph (GRT)";
                }
                if ($blockchain=="cake"){
                    $blockchainFull = "PancakeSwap (CAKE)";
                }
                if ($blockchain=="flow"){
                    $blockchainFull = "Flow (FLOW)";
                }
                if ($blockchain=="klay"){
                    $blockchainFull = "Klaytn (KLAY)";
                }
                if ($blockchain=="lrc"){
                    $blockchainFull = "Loopring (LRC)";
                }
                if ($blockchain=="xec"){
                    $blockchainFull = "eCash (XEC)";
                }
                if ($blockchain=="miota"){
                    $blockchainFull = "IOTA (MIOTA)";
                }
                if ($blockchain=="ksm"){
                    $blockchainFull = "Kusama (KSM)";
                }
                if ($blockchain=="bsv"){
                    $blockchainFull = "Bitcoin SV (BSV)";
                }
                if ($blockchain=="kda"){
                    $blockchainFull = "Kadena (KDA)";
                }
                if ($blockchain=="leo"){
                    $blockchainFull = "ONUS SED LEO (LEO)";
                }
                if ($blockchain=="rune"){
                    $blockchainFull = "THORChain (RUNE)";
                }
                if ($blockchain=="chz"){
                    $blockchainFull = "Chiliz (CHZ)";
                }
                if ($blockchain=="stx"){
                    $blockchainFull = "Stacks (STX)";
                }
                if ($blockchain=="mkr"){
                    $blockchainFull = "Maker (MKR)";
                }
                if ($blockchain=="one"){
                    $blockchainFull = "Harmony (ONE)";
                }
                if ($blockchain=="sand"){
                    $blockchainFull = "The Sandbox (SAND)";
                }
                if ($blockchain=="btt"){
                    $blockchainFull = "BitTorrent (BTT)";
                }
                if ($blockchain=="enj"){
                    $blockchainFull = "Enjin Coin (ENJ)";
                }
                if ($blockchain=="waves"){
                    $blockchainFull = "Waves (WAVES)";
                }
                if ($blockchain=="zec"){
                    $blockchainFull = "Zcash (ZEC)";
                }
                if ($blockchain=="amp"){
                    $blockchainFull = "Amp (AMP)";
                }
                if ($blockchain=="hot"){
                    $blockchainFull = "Holo (HOT)";
                }
                if ($blockchain=="ar"){
                    $blockchainFull = "Arweave (AR)";
                }
                if ($blockchain=="comp"){
                    $blockchainFull = "Compound (COMP)";
                }
                if ($blockchain=="iotx"){
                    $blockchainFull = "IoTeX (IOTX)";
                }
                if ($blockchain=="kcs"){
                    $blockchainFull = "KuCoin Token (KCS)";
                }
                if ($blockchain=="nexo"){
                    $blockchainFull = "Nexo (NEXO)";
                }
                if ($blockchain=="celo"){
                    $blockchainFull = "Celo (CELO)";
                }
                if ($blockchain=="ht"){
                    $blockchainFull = "Huobi Token (HT)";
                }
                if ($blockchain=="xem"){
                    $blockchainFull = "NEM (XEM)";
                }
                if ($blockchain=="icx"){
                    $blockchainFull = "ICON (ICX)";
                }
                if ($blockchain=="bat"){
                    $blockchainFull = "Basic Attention Token (BAT)";
                }
                if ($blockchain=="qtum"){
                    $blockchainFull = "Qtum (QTUM)";
                }
                if ($blockchain=="okb"){
                    $blockchainFull = "OKB (OKB)";
                }
                if ($blockchain=="crv"){
                    $blockchainFull = "Curve DAO Token (CRV)";
                }
                if ($blockchain=="dcr"){
                    $blockchainFull = "Decred (DCR)";
                }
                if ($blockchain=="omg"){
                    $blockchainFull = "OMG Network (OMG)";
                }
                if ($blockchain=="mina"){
                    $blockchainFull = "Mina (MINA)";
                }
                if ($blockchain=="waxp"){
                    $blockchainFull = "WAX (WAXP)";
                }
                if ($blockchain=="lpt"){
                    $blockchainFull = "Livepeer (LPT)";
                }
                if ($blockchain=="uma"){
                    $blockchainFull = "UMA (UMA)";
                }
                if ($blockchain=="rev"){
                    $blockchainFull = "Revain (REV)";
                }
                if ($blockchain=="tusd"){
                    $blockchainFull = "TrueUSD (TUSD)";
                }
                if ($blockchain=="sushi"){
                    $blockchainFull = "SushiSwap (SUSHI)";
                }
                if ($blockchain=="rvn"){
                    $blockchainFull = "Ravencoin (RVN)";
                }
                if ($blockchain=="yfi"){
                    $blockchainFull = "yearn.finance (YFI)";
                }
                if ($blockchain=="zil"){
                    $blockchainFull = "Zilliqa (ZIL)";
                }
                if ($blockchain=="audio"){
                    $blockchainFull = "Audius (AUDIO)";
                }
                if ($blockchain=="xdc"){
                    $blockchainFull = "XDC Network (XDC)";
                }
                if ($blockchain=="btg"){
                    $blockchainFull = "Bitcoin Gold (BTG)";
                }
                if ($blockchain=="luna"){
                    $blockchainFull = "Terra (LUNA)";
                }
                if ($blockchain=="ust"){
                    $blockchainFull = "TerraUSD (UST)";
                }
                if ($blockchain=="luna2"){
                    $blockchainFull = "Terra 2.0 (LUNA2)";
                }
                if ($blockchain=="all"){
                    $blockchainFull = "all";
                }

                // Track their search request
                $api = new Api(); 
                $api->apikey = $apikey; 
                $api->date_submit = new RawValue('now()'); 
                $api->address = $address; 
                $api->blockchain = $blockchainFull; 

                // Render error if one occurs
                if (!$api->save()) {

                    foreach ($api->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }

                // Otherwise show results
                } else {

                    // $this->flash->success('We have updated the API tracking table');
                }

                // Detect if they've searched all blockchains, or just 1
                if ($blockchainFull=="all"){

                    // Search for the corresponding wallet data 
                    $products = Products::find(
                        [
                            'conditions' => 'address = :address: AND active = :active:',
                            'bind'       => [
                                'address' => $address,
                                'active' => 1,
                            ],
                            'order' => 'address_id desc',
                        ]
                    );

                    $data = [];

                    foreach ($products as $product) {
                        $data[] = [
                            'address_id'   => $product->address_id,
                            'address' => $product->address,
                            'blockchain' => $product->blockchain,
                            'reason' => $product->reason,
                            'describe_report' => $product->describe_report,
                            'url' => $product->url,
                        ];
                    }

                // Search that specific blockchain
                } else {

                    // Search for the corresponding wallet data 
                    $products = Products::find(
                        [
                            'conditions' => 'address = :address: AND blockchain = :blockchain: AND active = :active:',
                            'bind'       => [
                                'address' => $address,
                                'blockchain' => $blockchainFull,
                                'active' => 1,
                            ],
                            'order' => 'address_id desc',
                        ]
                    );

                    $data = [];

                    foreach ($products as $product) {
                        $data[] = [
                            'address_id'   => $product->address_id,
                            'address' => $product->address,
                            'blockchain' => $product->blockchain,
                            'reason' => $product->reason,
                            'describe_report' => $product->describe_report,
                            'url' => $product->url,
                        ];
                    }
                }

                /* 
                if (json_encode($data)){
                    // Set status code
                    $response->setStatusCode(200, 'OK');

                    // Set the content of the response
                    $response->setJsonContent(["status" => true, "error" => "There were no results.", "data" => $returnData ]);
                    echo json_encode($data); 
                } else {
                    $response->setJsonContent(["status" => true, "error" => "There were no results.", "data" => $returnData ]);
                } */

            // The API key is invalid 
            } else {

                // Set status code
                $response->setStatusCode(405, 'The API Key was invalid or method not allowed using API Key: '.$apikey);

                // Set the content of the response
                // $response->setContent("Sorry, the page doesn't exist");
                $response->setJsonContent(["status" => false, "error" => "The API Key was invalid or method not allowed using API Key: ".$apikey]);
            }

        } else {

            // Set status code
            $response->setStatusCode(405, 'Method Not Allowed');

            // Set the content of the response
            // $response->setContent("Sorry, the page doesn't exist");
            $response->setJsonContent(["status" => false, "error" => "Method Not Allowed"]);
        }

        // Send response to the client as json content type 
        $response
            ->setJsonContent($data)
            ->send();
    }

    /**
     * Main page action 
     */
    public function indexAction() : void
    {  
        // nada here 
    }

}
