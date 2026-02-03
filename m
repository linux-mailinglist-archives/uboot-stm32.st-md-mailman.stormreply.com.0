Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IwQ8OmfTgWmnKQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A20D7F62
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09DE0C87EC9;
	Tue,  3 Feb 2026 10:42:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013060.outbound.protection.outlook.com
 [52.101.83.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A954FC0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=us89UZqLld7WKovXc0I1ss8b10p6meaceuwn2Q9AHqJzT+UiBSXOewwG69wS7O4z6Ng9vzskI3nf1WixdqcfA62mzDCePL1+iMQAZt81vQlkeVwrJ2g49sME8QcNTANEBhA02Cnl2v/TdG1RwpHEKOxeU9CTrcNhFWx/QvP5mjws86KjmWEGGvFs32IkTSFlbgDBFsjS1OU0n6zN3iTWe8wr63I/bOD7iJMjjy4al8yUhe9Bm0aE8lhfJdy8+uCs71vE37YTgjZcnfu+JFjE8BcLwJjtRr7xaRAXYt0OrZYNzSUWSv2valL+fCQpcbRinYdDjmbkcrVGv2wCWmtQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNZEjv4XeyFjVnflGVu4jur+/eBQa6VRS5f+9Ri8EII=;
 b=YgRtFcVis2JNKHrsbturFXs1x2phx0C8ZiJN3QTvoEblj5eLShwQ52YrAlXC5unTxkJb+ncTiYGEkTWVrw0USYc9pFnuPZn59SKoy64165AVGan851tT/XlmYmUREdgQ7Nxueid81fohuZm/h0KY4SBr4hBC4mdqwaNFxoot0TJZ+jJj9K2hwGYZfx3Uam6MzIIgDLeYfCmNhsmB584qK7h4Ar6bdpsVO0o59+4Bks+1ZWWdLD2JQsBUxMjsrKfngZw0U0leieCADHybpLTvrge9KljLxUfyzSB9IeBThfK+fL5LCoj/AtQykrBnnvBiJxzx1qmb5P8oOvzhbi+pVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNZEjv4XeyFjVnflGVu4jur+/eBQa6VRS5f+9Ri8EII=;
 b=hGlz0FaA2EZnbIIOSYQoBhcngBXWmTGu7lgyijk12zh83bcQ6rVcWaKVZsOo5Bc2UGmV5CgVrWfDMDXXTCvR2wlOby3vgaW7TZZ8hniBcPKMjiLMLNGM4tbWs/InzAeJaZjOV1dgBoYc85vE683bEQXlQvifbs39+Wv5AEsmOevIF/vWtCG8868Xi6EiUoHA2Np1JlqpNxkNtGvAxK7Bi/joB1DuqsTxQoz+dXEOQ1f0VIAsRPEAY99bIOAXKmfsStFFvWXWy7lHyQg+Caamp5pbubinxBy2sMakj7ZmMveFTA8HRFmFj89Zjjk4nXUpMyDe14gT9Z4tVp6+fEETMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11197.eurprd04.prod.outlook.com (2603:10a6:d10:170::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 10:42:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:42:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:33 +0800
Message-Id: <20260203-cleanup-v1-2-4221c13e7558@nxp.com>
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com, adsp-linux@analog.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0187.apcprd04.prod.outlook.com
 (2603:1096:4:14::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: c7397bc2-30eb-4479-a2c2-08de6310edef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXU4QndqMkJUa0NMNG84ZlRLbWJsd0tnRzJWcVdHWHhFVVl1YWtKRnVRb2tU?=
 =?utf-8?B?MHBqKzBWOWU2S0k4Y2E1ZG54ZjFvSkcwYitDWjZ1ZlBVN08wN0UxOVN2Rks4?=
 =?utf-8?B?UkdwSnNNczBMSlRRbEM4OHBNZVFMeUxYakxhVWw3RDZvNGdtVWQ1Vm9oVUpt?=
 =?utf-8?B?MGFVWnFLbmxtZUZnV0huaDc3dENFMmo2QlM2bEFBZ3JXZ0t0aUlKUzlsd3p5?=
 =?utf-8?B?ZWs4OGFMelFyK3EreWRLK05BUy9zWFM3NkxlbDdKQzIzLzBnK3pSVjlHQ2lO?=
 =?utf-8?B?TWJoN1Q3QUVCMGdLT09aUXNDRWkvRHNYZFdFYnd3TGxoYWFSemFXd3NqMWwr?=
 =?utf-8?B?b2I3RmpVM2lIS3M3R0czUy9laUFQNHo4V0tiRzRkNmo2N0hNRFJabnloeFpw?=
 =?utf-8?B?QTA2aXlTdk9hcWFHcDYyeFBzZVl0dmZSYWJkTDc5WGpSeFI5Q0JCRUxBMnZX?=
 =?utf-8?B?VVhnSFZrRVRXYmRkU1IzZ0ZFV1Byci9mYVdzMDJBenFKK3pjZHQ3bFJjamhq?=
 =?utf-8?B?cll2M2dlSjd4K2srWnpjUXhGUzc2bHpSaGRHUXFZUXk0bllVTWJYUm56QWhI?=
 =?utf-8?B?M28zZjNnalAvQThpZXlPZE82bEhhdVYvK2x6YktjN0ZiUzhsVTlMcGs5c01F?=
 =?utf-8?B?S2U0ajZMU1ZUUmd6aURvb2haZVNHRHRDVzVLMUgwL1paZm1IUUE0dmpldnZy?=
 =?utf-8?B?VCswdE9tL3pueWtwYzVIZmNacng1NEYrd0Z1aUI4eTFrbjFTVWZaRlBNRXJs?=
 =?utf-8?B?NlBVM2cxOUdIeDJkM1Z0MU9MTjlxKzBXWFFNbC9ENDVrMTJJYmJlcWkrdDh4?=
 =?utf-8?B?SzRtZlhFWjRMSjhXZTMyNVZEN1EvSVZaLzNJOXJhanBVWFRuZ3ZuaXp1YVdp?=
 =?utf-8?B?Y3NvMlZWdC8xaUJQa1JoNVJPSHBuQVd0UkZlbExFU21uaXBNMDFaMGtPRld4?=
 =?utf-8?B?cUtoN3RPNGhzWU1qL1VqbTFjTEJ2cnM2ZVdYbW9sMVl0cHZaN0w2dDQ2V1FW?=
 =?utf-8?B?RXhwc2lhbDBocWEzc3JuejQ4WHl1UktOaXhSYzQvRTJJQ1FBSFRBQ2JSK1N0?=
 =?utf-8?B?aVBEVXRNckN3YmlGZ3pYb3BVa1VkRGdkVEo3VjkrbHNMeGtrS1BEL05vbS9B?=
 =?utf-8?B?bytnS1IzU1JUU0hwNnVaZEFWa1kxMStqbUpZRlZ5TmdRQzlhZTJyT2c3Tndr?=
 =?utf-8?B?Z1hIY2IxUmRlVVdXeHA1ZWNob3MzOXRyRTRocG96TU5MSitLWTNFNXhMTDlQ?=
 =?utf-8?B?UmxzYVk0YVlJUEhOazNMRzg4dk83djkzdkF5QUthdExKOWFRM3Z2TDVlYi9l?=
 =?utf-8?B?emM2U3JUSlo2N1N2TFBXVXJwcTA5ZlFRL1VTeTIrVDQ4SFJaMm1mc2xCaGQ1?=
 =?utf-8?B?Zld2N25wMms5RWVSdnI1cDk2Y2NDdGRPR3FocW5HYkIxam13N1Zjd1NhUGhP?=
 =?utf-8?B?dGdmM0dDMlFPSGNvWUJZbjFxVjFFQnZQYXlnczRpQ0JPT2Y3QlZ1c2Uzb0lm?=
 =?utf-8?B?d2N2dktYb0FLMXYvRFExUjZubWVTSlhtYmh2bERlbDZqQmg2cDJEaHFhMTVP?=
 =?utf-8?B?WUE5S2NaUDhpM2pyMVRzSUVoUFptUFVKY1lJTXU5bFVhNW9xR1pWVFBzMnV5?=
 =?utf-8?B?L0hkYlMvVS82MDJvSDFwM0R5WWcwU1BBL1BNaHNYejVpN1dBaWp5YWpDSnlS?=
 =?utf-8?B?a2MweWJWeVlxN2RlZUFQUFY3RWNLVldyRU90U3FWMjlKMUsvOGNjc1o4WE1T?=
 =?utf-8?B?NnVDOFRya0hEOVUyNWRTNjdzV21jUlc3SkJkRGlZLy9uL3pOTnROUUpSVlhN?=
 =?utf-8?B?a1YzSG5RREVWdjdvTjRpQVZPZUZuSk5wZGIxRVB0TWxqZlFMck5DYU5zL01a?=
 =?utf-8?B?RWxrYlFRRGxxZzRiVk51WWFGbWVQL3hLQWdlcGVvbHFzclJkVEVTYVVrdnRI?=
 =?utf-8?B?QnF1aU5SVXh2b1dOMDhEKy8wMWNoT3RsYzVqWk1jZ1dQWkt3ckJ3S3U4VnJi?=
 =?utf-8?B?a1NFWU1oWUM3blBYbVlXUVFRWVprV0V2WWZWeVJNY2Vib3hnQmFIdm93bjVh?=
 =?utf-8?B?M2ZFRE5wMU1CanlNWFlYTEpPS3N6QWZ2YnRVbnpBbGdNZ3V4UmE2Wm5HSUJs?=
 =?utf-8?B?SkxBbVRzanBkMEdjT2xGWVBaY0xQMXhjalRGdHVJTlR0a3ErN3U3UkRLRDhi?=
 =?utf-8?Q?gpVUw2BoJ2T2TWXz/KviUjmqRxsEeP45onuCVJkzTAF2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmxreGFXMStFM2VWcEdTMnp1WkRsaFV2TzkwUUNIQmpobnpuZXY4aE43Rkxq?=
 =?utf-8?B?UHpVbC9ieVoxZHcxYm1neHpJQkpGQUNXSnh5cG5wZ0xadkFSNVZBcUJ0U0o3?=
 =?utf-8?B?bGFSRzFwYTJDNFdhdjdQYkZMTGlkdWVyZDl2MHlCM2dUaFp0TitFRTlUZXUw?=
 =?utf-8?B?RkJIWWNZWlVkT0ZJU05aSHVqM28zRVBORCtyL2dBOTFZaFVxRFhVa2xWUElm?=
 =?utf-8?B?amMzTlhjRUtndkFDdDRRQ2RNWDNoOWRjcy9xT1d6b3lmRThIWmZFWnRtSkJ0?=
 =?utf-8?B?L1ZiZE5zVXlPaEcvam9xbVNSa0s4c1FZbDFNNE95SlJFbE1wNy9XR1pNdkVw?=
 =?utf-8?B?WGIyRWJkZktNUDRITWgxVmxiVWx4RmVOWmFDWEJWWW56V2R4NjU0SEx6NTF4?=
 =?utf-8?B?QUQxZFduUXpVZnR1dmpIWTlaTGdjQ3JPRWl4Zzl2eEZGdGQvTjRndGRrSGdN?=
 =?utf-8?B?eVN0YjFiVU14S2Z5OGFEVGcwWkdZekltWmkyL1pHYithcjcyUFgrZXU4dWZQ?=
 =?utf-8?B?TVd6c1MyeGcxRW5LckdYV051WkdObU5SeUVxL3Z6WGJUL1oxSUphNWFhZUNa?=
 =?utf-8?B?bzA4bzNzNVBmaWtyYkY2U25pOGo5dDZBNWJJL0VxeUdMcGp6S3hzS3d6bThH?=
 =?utf-8?B?dWw4VHVQMG9UQXJteG9Ec3BSVXAxOGhhVlV0S0crWjhhSXlRQUFValQvYjZr?=
 =?utf-8?B?QVh0QkNmdU45TC9YQkFsbFJPNmhkZEl3dXZtUElJVWlmSUNObTVqUzBTMkc0?=
 =?utf-8?B?U3hYcWYvaHpwelRsd0EyN0tSYnFZS0hFVThDemptcWVPSXdtSFRLYlN5Z0FX?=
 =?utf-8?B?VXhMNlB0Uk5vY2puMGlCaGpBMTAydGtsZXJPcVF1K1dLQURTbldVTmxXVXRj?=
 =?utf-8?B?a0RPLzR3Wm5PNzkwMVZSTHdDV2VOclBpNVM1S1dRcWtYbXQ5VWlIakxMZEN3?=
 =?utf-8?B?bWxvNmIxSkVXTWMxQmxsaGRHWldSdVFJYUF6L1J2WWZQMW5OczFsRXpnd3RK?=
 =?utf-8?B?M0hYTy91T0RXRFJ0WU1tL2lMTDhBZitudGhROGJoT3lnVGd0L29WNzNRQzdw?=
 =?utf-8?B?TWM1OFlQZXZOdDFzRy9NN25HZ3NKVk5rMlRSOElGT1RxOU9Ed00vTm1xeld6?=
 =?utf-8?B?WklBVEpEV1pxZkNOUDdLaDl4WDlXYkV4TUlQQzAxL2JhYnNQMld3U1l1cmgv?=
 =?utf-8?B?WGwwcVV3a1QvaGRCdjVBL25tMjhMUmRJQVZhK3NJRS80ZGEvdVhBSm1MZnEy?=
 =?utf-8?B?N0R6N1YvSmpjdllpN005OXUzWDFkOGRiWEExQ1ZHNlpiMGs1Z2JMM1JVWVhi?=
 =?utf-8?B?bHc2SlZUbkYvcUNGQm05cExtRFNlcm9nN3ZJcmZXdVZrak5ZNEU2MmR1SkpJ?=
 =?utf-8?B?M09la0R4dmk0R2JCbWhCaVZuOGl2MG5GemJmbHNQSnhOMUxMNDRFcVFaanFE?=
 =?utf-8?B?bVdhbGdHc3lsN2NoTXhMd1RyMjVuUlMweGZyeHVYMDBjRWpMQXczVWUzcUcv?=
 =?utf-8?B?T0crMEZHcXRuV3ZnWUZZNFpiTkdWYnp6RlB4blhxczlkKzZxRDdOZDI0akUr?=
 =?utf-8?B?bHNMZGFYT2ljeE02RHpsOXJQZnA3WGVEalFXUXJLejlrViszSFFmVjFhNFln?=
 =?utf-8?B?eFVKUStQRHVhK2lkQjVoVXBsSXp5cEFBcUd6dktBaUtlSERUS2hvSSttUThh?=
 =?utf-8?B?a1B3c0hvMldKNWtnTGsyNUI1N0FrTWJHWmY5NW96VmFBdkJJd3pqYzlscDBP?=
 =?utf-8?B?Q2hhVFRLT00rWVNBeWJkNDNpN0tVUTdOVlNsbFVKaXYrQkxBdkUwamtBUXda?=
 =?utf-8?B?UzNsSHFQUDV1UFNIdmVzNDFpSDc5Z3Y1a082elRyMXluTllNYUFDakRoVEtx?=
 =?utf-8?B?RFdPNmtpeTVTc0ZteWxQaDdPN2tKN2dzV3AvQkJrVmFnVGpKdFlGczJsUjNG?=
 =?utf-8?B?K1RQOEdSajVYRzRKSXBhNC9zOWs5Vkd5R0JVclJmeE54OTBTRFVkR0loV2g4?=
 =?utf-8?B?dW9pMTJYZEEvMm50UDNyWHJ1MVR0c1JEeG1kYXV6UDZROWpIRlRhczN4aEgv?=
 =?utf-8?B?RGhubmt5ZVovZDFWUTlnSG52WDdIeERqOVdMa3NnTnFQNDJzMzdaQlBtek1U?=
 =?utf-8?B?YlJ2WHNmTitVVVdRNEtURWcwdnlEVG0yM1kvQTN3TU83c2dXVWt6VEJweWxC?=
 =?utf-8?B?eTlNa2tPL3RFbDhudjUrTTBCK3NwRFEyMFcyc3hCemFhR2FLejlyeUFQeDBT?=
 =?utf-8?B?UnJqRnNhTG9sZGliUUY0MGtoRDZacFZlc29NNHlkVUF2OTJoclErTUpvNnVS?=
 =?utf-8?B?R1BRdjNOa0crQyszUXNVTEdveHE3Z0RLa0FtSFM0QnAxLzNERFZYQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7397bc2-30eb-4479-a2c2-08de6310edef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:42:29.7996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs0uY55swVnJC+/AjPfBbyNs95lkULzj90Crp4Ux/jIZG7r01Lfq4UVkgeyRybgT3HkWkMtPl1qtljgJPDNf1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11197
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 David Feng <fenghua@phytium.com.cn>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 "Guillaume La Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>,
 Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: [Uboot-stm32] [PATCH 02/14] mediatek: mt7622: Drop useless board
	files
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmai
 l.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@for
 issier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[199];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,analog.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarke
 tos.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,nxp.com:mid,nxp.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mediatek.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 54A20D7F62
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

No functions except reserving gd in the board files. The files are
useless, remove them.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 board/mediatek/mt7622/Makefile     |  2 +-
 board/mediatek/mt7622/mt7622_rfb.c | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/board/mediatek/mt7622/Makefile b/board/mediatek/mt7622/Makefile
index 64f101337bf16620665cc5d7a308849ba127e107..35f3136e833b4d7f8a92233708e3e15765272b0f 100644
--- a/board/mediatek/mt7622/Makefile
+++ b/board/mediatek/mt7622/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier:	GPL-2.0
 
-obj-y	+= mt7622_rfb.o
+obj-y	+=
diff --git a/board/mediatek/mt7622/mt7622_rfb.c b/board/mediatek/mt7622/mt7622_rfb.c
deleted file mode 100644
index 405f393aade112356ef8422a6e9d4f271ed2e672..0000000000000000000000000000000000000000
--- a/board/mediatek/mt7622/mt7622_rfb.c
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2018 MediaTek Inc.
- * Author: Sam Shih <sam.shih@mediatek.com>
- */
-
-#include <config.h>
-#include <env.h>
-#include <init.h>
-#include <asm/global_data.h>
-
-DECLARE_GLOBAL_DATA_PTR;

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
