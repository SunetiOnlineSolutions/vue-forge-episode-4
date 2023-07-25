import { getClient, IPactCommand, Pact } from '@kadena/client'

import { Ref } from 'vue'

const initialized = ref(false)
const balance = ref<Ref<string | null>>(null)
const networkId = ref('testnet04')
const chain = ref<Ref<IPactCommand['meta']['chainId']>>('0')
const instance = ref(null)
const publicKey = ref(null)
const account = ref('')
const connectedSites = ref([])
const isInstalled = ref(false)

export function useWallet () {
	watch(isInstalled, (value) => {
		if (!value) {
			console.warn('Kadena Wallet is not installed')
		}
	})
	const checkIdWalletIsInstalled = () => {
		if (initialized.value) return
		const { kadena } = window
		isInstalled.value = Boolean(kadena && kadena.isKadena)
		instance.value = kadena
		initialized.value = true
	}
	
	const initialize = async () => {
		checkIdWalletIsInstalled()
		if (isInstalled.value) {
			// You will start here
		}
	}
	
	const connect = async () => {
		if (isInstalled.value && instance.value) {
			const { account: accountResponse } = await instance?.value.request({
				method: 'kda_connect',
				networkId: networkId.value
			})
			account.value = accountResponse.account
			publicKey.value = accountResponse.publicKey
			connectedSites.value = accountResponse.connectedSites
			return accountResponse
		}
	}
	
	const requestAccount = async () => {
		if (isInstalled.value && instance.value) {
			const response = await instance?.value.request({ method: 'kda_requestAccount', networkId: networkId.value })
			console.log('kda_requestAccount', response)
			return response
		}
	}
	
	const checkStatus = async () => {
		if (isInstalled.value && instance.value) {
			const response = await instance?.value.request({ method: 'kda_checkStatus', networkId: networkId.value })
			console.log('kda_checkStatus', response)
			return response
		}
	}
	
	const testMethod = async () => {
		const client = getClient()
		const transaction = Pact.builder
			.execution((Pact.modules as any).coin['get-balance'](account.value))
			.setMeta({ sender: account.value, chainId: chain.value })
			.setNetworkId(networkId.value)
			.createTransaction()
		
		return client.dirtyRead(transaction)
	}
	
	const disconnect = async () => {
		if (isInstalled.value && instance.value) {
			const response = await instance?.value.request({ method: 'kda_disconnect', networkId: networkId.value })
			console.log('disconnect response', response)
			return response
		}
	}
	
	const getBalance = async () => {
		if(account.value) {
			const client = getClient()
			const transaction = Pact.builder
				.execution((Pact.modules as any).coin['get-balance'](account.value))
				.setMeta({ sender: account.value, chainId: chain.value })
				.setNetworkId(networkId.value)
				.createTransaction()
			
			const { result: { data } } = await client.dirtyRead(transaction)
			
			balance.value = data
		}
		return
	}
	
	const sign = async (parsedTransaction: any) => {
		console.log(parsedTransaction)
		const signingRequest: any = {
			code: parsedTransaction.payload.exec.code ?? '',
			data: parsedTransaction.payload.exec.data as { [key: string]: unknown },
			caps: parsedTransaction.signers.flatMap((signer) => {
				if (signer.clist === undefined) {
					return [];
				}
				return signer.clist.map(({ name, args }) => {
					const nameArr = name.split('.');

					return {
						role: nameArr[nameArr.length - 1],
						description: `Description for ${name}`,
						cap: {
							name,
							args,
						},
					};
				});
			}),
			nonce: parsedTransaction.nonce,
			chainId: parsedTransaction.meta.chainId,
			gasLimit: parsedTransaction.meta.gasLimit,
			gasPrice: parsedTransaction.meta.gasPrice,
			sender: parsedTransaction.meta.sender,
			ttl: parsedTransaction.meta.ttl,
		};
		// console.log(signingRequest)
		console.log(parsedTransaction)
		try {
			const response = await instance.value?.request({
				method: 'kda_requestQuickSign',
				data: {
					networkId: networkId.value,
					signingCmd: signingRequest,
					// cmdSigDatas: [
					// 	{
					// 		sigs: [],
					// 		cmd: parsedTransaction,
					// 	}]
				}
			});
			
			return response?.signedCmd
		} catch (e) {
			console.log(e)
		}
		
	}
	
	
	watch(account, async (value) => {
		console.log('account watcher', value)
		if (value) {
			await getBalance()
		}
	})
	
	initialize()
	
	return {
		initialize,
		sign,
		connect,
		disconnect,
		requestAccount,
		checkStatus,
		checkIdWalletIsInstalled,
		getBalance,
		balance: computed(() => balance.value),
		initialized: computed(() => initialized.value),
		account: computed(() => account.value),
		publicKey: computed(() => publicKey.value),
		connectedSites: computed(() => connectedSites.value),
		chain: computed(() => chain.value),
		networkId: computed(() => networkId.value),
		instance: computed(() => instance.value),
		isXWalletInstalled: computed(() => isInstalled.value)
	}
}
