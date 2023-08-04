import { Pact } from '@kadena/client';

// store the builder in a variable
const transactionBuilder =
    // basic call results in Pact code `(coin.transfer "k:your-pubkey" "k:receiver-pubkey" 231.0)`
    Pact.modules.coin
        .transfer('k:930490eb1b081262265f80b247318835f493a88cd3f605661cefc8371fae084f', 'k:receiver-pubkey', 231)

        // add necessary coin.GAS capability (this defines who pays the gas)
        .addCap('coin.GAS', 'k:930490eb1b081262265f80b247318835f493a88cd3f605661cefc8371fae084f')

        // add necessary coin.TRANSFER capability
        .addCap(
            'coin.TRANSFER',
            '930490eb1b081262265f80b247318835f493a88cd3f605661cefc8371fae084f',
            'k:930490eb1b081262265f80b247318835f493a88cd3f605661cefc8371fae084f',
            'k:receiver-pubkey',
            231,
        )

        // the minimum you NEED to add is the sender of this transaction
        .setMeta({
            sender: '930490eb1b081262265f80b247318835f493a88cd3f605661cefc8371fae084f',
        });