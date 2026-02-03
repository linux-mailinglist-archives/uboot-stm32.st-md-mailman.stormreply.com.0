Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A6YHyzSgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:47:08 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9EFD7EDE
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:47:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0720C87ECE;
	Tue,  3 Feb 2026 10:47:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35A27C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdO1aXXXSqP99okcz7KlO6/63BwGJt6MT5vh6AXMXn0UGId5ZppB8mtiv2dONSQPhqZf9jyK2oTtHMrAk+ZF+hAWs8bHW8y0TaYkeAbo/1PXW5PczrjFmjlxcctFnX65BryFK3MslK+Qzs6EkW5VAJ7iNCUCWU37ain3aKJNe+ngF554QvlFOkBdwSoecBOT2K4zIVQ/7EnQZ4zjbNyc0Grpfet1hkASo5sOAeJKLznCID0UksTvcPzfrvbW7Pd8Y6SNSRHOJKQ/A42JdEUAa95Q4+KnAL/zGzNtaSJ7FaO+9pViTOt5meSoO9m+QLAUw8ZS+uP3TDHBKfoVA1oi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v0xNatn2VRaEqixmv6b6Y0wkMotCYfBmo97xeZd3uw=;
 b=XNsXYKNdHfBDwbuUShQVSae/nJDzo0UyTJazOHknnweunPh7EdHvr954qKmWCGnJRaJFM7bb2BOYnOieQKoeUktegKM56h9ty3QCP7zYlQ5SltNyfA0adBf0ArFrT6GP3vxryu7eIwYd8ZfaSM2x/TYIKbjx9cBCRHb3iFwpGpqhz73oiS4TbU77NNtgZJoCmAOWZlkOAidUWRb2GlvVB93Rvc2Jrcj3g211PhEl97ptn08N04t+gymARurlK7TPcpqBYMiw04uMk8WNQKnbL8LFU/cELuMKtfqFgVWhDjPViE7D1CAt6779YP27QsiBCF5Rg98XRw88wT42KBtnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v0xNatn2VRaEqixmv6b6Y0wkMotCYfBmo97xeZd3uw=;
 b=FA+wotUfW4YAH02sBxzlT++c4VO1dpSIWQz3rVuMMvH6/uBTqJNxjhhFgxEtWMnGx6JKoec8gIXTQ5P2mWBrr7WYbhgqVUvoi4yz2h8ndaVFSvrc5mt0intdKc/hPDgqjrlbhj/WO26nlnZyBOPTeniwG2C6of3cy2OxHIgePJDYsvzizn+g9SE2KS9wKhjYbBgA6A3nHrLysV9xW7fk2Q1DlJ37MbwiUKijQEG7GOjHWZZR7OVml+Wk/QiqRXMGCBwjl21BvyEh2PeNKyOnWV51QhFMAWzZ/Xzvor/gmlLlC9h+YY/V1u+O/DpVn26U2skfMttS3CfCTj02H2CKQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6908.eurprd04.prod.outlook.com (2603:10a6:10:116::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:47:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:47:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:39 +0800
Message-Id: <20260203-cleanup-v1-8-4221c13e7558@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bd99d3-b0a7-4620-1f3a-08de63118fac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R043WEhNV0RSTys0V2JvdjVEaUdxZWl2WlpkdGd0YWJoanYrV0Z0cmFHaG1D?=
 =?utf-8?B?RGhLMlFQdXhSdVcyVGZWM0RZT2kyVzBJTTZhTllDRCtFTDYzR0RETEZ0ZkpM?=
 =?utf-8?B?Z2NrYzZNRVo0NE5lN3htTHNSK0FQMWt4bWFSenBybUZwMGhCMTk0ZWFuSXdh?=
 =?utf-8?B?dXhGbWVIMnQwVWlVb1RDamczUkI0ZGN3L3pIVDNZLytoa0NFU3Vmb2NKMi8x?=
 =?utf-8?B?QTdHR3JEdmxleHd6QlJETkswVXhOQkJleGYyZEdNU0l5WUo3OXJ4MVd6UFpz?=
 =?utf-8?B?dVVpS0xZVm95a3F5YlZIc1ZUQURPSE1qVkxuOWUyWm9HYWozaTBJTzhSK01Y?=
 =?utf-8?B?Z1RTWDRLL2kvWWRSVzZEM2FVbzV3bzhPbkhYYUpyQ0sxWjJwbkRPRndZbm5S?=
 =?utf-8?B?b0FJdndFajE2amxQOXhOZm10K0hwYnhDUnBPaEZYUjN3UFVwUHIxcXp2VGY4?=
 =?utf-8?B?YzRPZ3JGU2ZzaVEzZVdHVkxWQmhMeE5uUzZNNkxzQnZqNjJXeU53cDZzS3F1?=
 =?utf-8?B?aDU4MForbk1vTTlvdTdsK3VtUUphMHVKWUtKdkJvczdBMFh4dmN1cVZEUmlw?=
 =?utf-8?B?RzhVcmdVMUFWUlFJUHoydlluYzFwSFVYZnN2RXJrWHMvUC9iN3lJeWRmWWpX?=
 =?utf-8?B?a2ZkZkxMRzczclZwWnM4ekxoeXZ3Uy9IN1hFRmI0VGtsSGdBUDdpSGJtYmlp?=
 =?utf-8?B?Z3hsa1NMaDA3L1J1Z0JCMWdFcVljRmwvSmZGcVFzeEh5ZnNQcXVGalFHcjR0?=
 =?utf-8?B?STBGNjYxV2FjUkJmd29jVlBudGZaMGFkaGp3dXZwMW85VmJCbHVKS0VSaHN4?=
 =?utf-8?B?NXNLUUNlbXJxTlVVZHZMU2tRT0t3Qm9ZRFdRdzN2T1hXWUFFWGxoT2M5TWVJ?=
 =?utf-8?B?YlBWaHgzUExGMGF3WWErS2RsaUswVzhxZ0ZOSWZMbGxxL1JSaWhKRGliUGxT?=
 =?utf-8?B?bEJJeXpjYUFrTm45Q1p6SG4wYVdSL0hrNE16YmRVazRvKzhFSmNReGhXaGFH?=
 =?utf-8?B?eVBYRktFb1daeU5qeHRHdjdoWTVtbjZzOVNUczJJQ24rQlMyenBzMWd0cjhI?=
 =?utf-8?B?Q0xCYm1yYW56R1ZpeTBKR2t2SmJZNUtkb095TDZDVEZzazBnRlZqUmRYMnVk?=
 =?utf-8?B?cG45VGZIc0FReXJBK0QyTzExM0xVaER1QXZiZG01ZzhGK3FLRDlvbDVhZ2Vh?=
 =?utf-8?B?a0ZrZXVTMlExaTJqUkVyUHlSZ1gzalBMaHVsL01kU0Z2Y3Zvb3RXY0xabmpt?=
 =?utf-8?B?cVE1SFpYOExIalVMNTdxdU1GYVBScFFYWWFiRkFqdmFtOFNJc0t3K1hJS3VZ?=
 =?utf-8?B?U3lTQVprSVlvaFdiMTR4cjhrdHoxSDhmL2ZKa1M2cVo5SFphZjF4SXc5NHZ1?=
 =?utf-8?B?VFdKZ2lWUzVYcEtTcmhNUFB4Q243bjd6RUM2M3cxUytYZ3VoSzliWDNQWHhQ?=
 =?utf-8?B?L0NSRGxaZThyalRwTmxYa2U1ZWxOSlZXMmY4TlJwWFNWUTNCdCt4TUQ3YUJm?=
 =?utf-8?B?MlhhZnc5cnMxRWZpV0xSK1ZxN3lQVGI4TkxtNmw4VGY0Mm00U3BDeFY4TURv?=
 =?utf-8?B?VHpPdkJGUElYMkNVVE8rVFUxK2ZLQ0I1enVrSE40OThOQ0JLcWtkcjhhWHNs?=
 =?utf-8?B?RUVnTFIxbGRld2tPanVqbnZkRUQyZDBWbWwzNkRaYkE3VWsrRXdyVUpPVjFP?=
 =?utf-8?B?YjhOUnU0c1Bucmx4VHhiYTRHQjF6OGt4VWFGZDRidzdKNjlJK2NwRHEvZnVk?=
 =?utf-8?B?QWtlTURNVnVvRFlZOGZyVDJYNzdMbGF3NW5iN3lHWmxTdDJHMEJLSzlhV0Vn?=
 =?utf-8?B?MFp3cTBGdFMyUnJCYnVSZkIvRXRPVjVIU256TWY3WjBWU01UeGFRaGJybWxo?=
 =?utf-8?B?UUpWL1FRdVdJMmJOZkthdSs1UGpQM1Y4ODVHSjdLSWZGNlA5a1FEQzdhMzRG?=
 =?utf-8?B?Vm8yQ3pXU3hYQ1cxd3MySXdVR2VDRnp0TVg4eUt3bzhPTE5ydHJDOEFQT2Jo?=
 =?utf-8?B?VzZ5elgwVTVMMU1EdGpLQURoSkFEMG05WW1LcFBRckNjdytFWDh5d2g0aWpS?=
 =?utf-8?B?Y1lMSDRuU1IxUml2S2tSNDZHK3VjQzQ4d3Z2TVIwS0hyNTlUSFNyTG0vRW82?=
 =?utf-8?B?aUI4c1R4UlltYmlENHY4cE1OZGM5YnNHOTA2QWpibkhoL01lTnVicVBtQWFT?=
 =?utf-8?Q?CvTgdYvDXkeuqCgUmL+XFhPmrfX43MHgI4k6LIZdXOnL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmpOdHlOSnpZUTlNWDJsZkg1NDBKUjJMdkNSem0vbTRtL2pYdUxMRUpQS3J3?=
 =?utf-8?B?dmpTRm1Xd05yOTIwU0NMMHpvelkzcWl2THZuajg4VUxJajJHSEU2YlVtTWNl?=
 =?utf-8?B?eG1SSlNtZXFzRWFFVnAwcENmQmxQOTRBei9QeWRDckFVWXVkY3pXak1zempu?=
 =?utf-8?B?SXc3aXdqeUplQzRjMERnMThtTU01YkE2dk02ZXB0ejVnOXhzR0dxTjc0WGhU?=
 =?utf-8?B?bEZua0tsZGdZMGppUFdQQkdMNkRmOHh6VGQ4dVBSTlJuemdydGxxRzBKZjFU?=
 =?utf-8?B?Z2ZkU3piR3V2QmpiYkNPeUpmUjlkbXlNdnkrTW9DOVROZkc5QUM2cDQ0NElI?=
 =?utf-8?B?UWhIcHhOZzRYb1lRczF4cmIzc052RUpwQkRHbzVVY1UrK056S1JIbVFVY0w1?=
 =?utf-8?B?R0lETkZPdDVuak5paGxoOHJ5SlRxeEpsK2hPdU1BK2ZSV1duclBuUkYrUnR1?=
 =?utf-8?B?aUFpMFJJTC9FTTZiUEVxOFpicGQ0eTNGblRJdXVxZDNJR0krMjc4N1ZKeStj?=
 =?utf-8?B?SXhKbmdMSnRKTGIxclk0TVc3TUQ3WlJyUUFXVUlHMERDN3ZXODhzWlU0ZFJI?=
 =?utf-8?B?UThkd00xdGQzMm1YcE9mZXQwUXl0WStyb3BzQ0NkTHFUa2RhQ25IZVRsaUZX?=
 =?utf-8?B?V3dvODhpODJ2TUNOMHlFWkpPMUlZS2FlTnFCdndaak5KUUw3dTBGTkZwNmtW?=
 =?utf-8?B?YmsycDZQREJmenkrT0VBeHNhWHdOVGdsdFptekpCTHNIeGEwSGhrRHVMS051?=
 =?utf-8?B?cWV1YmNDZndVYXA1QUVxNUFPaVJzcXh3eldWZmZFSCtEMDdYbHA1MDZKT0ov?=
 =?utf-8?B?eTd5N2FQZytONlgrQzYzaEdJZmxrdFpsNHluWVRZSzlKUndrYVk5cnFQVGJ1?=
 =?utf-8?B?d2l2M0lhMThoVmsyRUNnalp3ZzFCL3kvT1RXWERMR04wYUdMR2pwbGV3a28z?=
 =?utf-8?B?Rkp5eWdYOXYzbkloWmZYTGJuS0xnOG53RjZLUkFmTEhkcXpsSkJ4SVhRY1RC?=
 =?utf-8?B?blVSQUZ4SXQ2Q3pleUhIUkFqVFZNVDMyZFVvcUNCSVB2eHdWMjZtREc4TGRz?=
 =?utf-8?B?eFlqWmhnOUZ0SXcyUk91aVVhNmFTQmFiRzFWTlROYjNObUJPVnlaMksxZ051?=
 =?utf-8?B?SWlmV2JDblY4eHB2MVVCNDFyZHFTWUd6YVJBb1lTL3JWdGVSTHRTblBHVWh5?=
 =?utf-8?B?eXhHakNoRVhxc1U4NFFoZExITEt0VFh6MVJMK1ZSTjVVeUs2cGh6QkY3Sklu?=
 =?utf-8?B?bDVKZHlwTTVmUXlCRnBBUGowWVI2Q0ViQzJ1c09VSlJBQmdkbCt5c1lnQnBU?=
 =?utf-8?B?QWNPMGQ1eThpTHpPVFNiVmxMcmgxbUtWbVBiamkvem5uaWE5UVlQZ0d3VUFR?=
 =?utf-8?B?M2I3dzlIdGlERmJPQWx0cFJZamxvZkIzVlJlRHhlaGNlZ1VsZkVOQVBJdXRJ?=
 =?utf-8?B?R1ZLcVJmOVJKbjZBcnNCRE9JV1dvN04rdmY4K1I5SlF2V3ZoZkU5MmdCU1Qr?=
 =?utf-8?B?QU5ZK0tCamxXMDNBdWo2TVVQZzBvR2hqNkhRZG9udklYZEE4cURBR0YvMHg2?=
 =?utf-8?B?bFpPa1lTckhGTWJ4aThhWGlOZ1JrenlnSVJLeFFQVmJKcTBsMEt4V3hZYUgz?=
 =?utf-8?B?YzdrL1R4M21TMGFuV0Z0WDFza0JGQzIvcnNyeFIwclY4Mi8rZlJTaHQwdnJJ?=
 =?utf-8?B?UVpEUWtCK3k3VllMc1YxeVJPdVJ3SFg0RlM5ZWxnY2planVpUkdyZFVZVm8z?=
 =?utf-8?B?RGhTUjhlODBKVjl1MGxGTDM2ZXlXL0w5L0F0MVU5Z2tvamFvRUxhY1N3SEdJ?=
 =?utf-8?B?a2FJaFRTcWc5ZmhXc0VvZi82YjVub0N0YXNmWnVKL3BSZ2o5NzJkbE9EUnBP?=
 =?utf-8?B?WnZ2LzlEVHJmQnhrWEZ1TXFWbGlpam1yM2poRGViRTh0czBrMlVJenRpUkQ1?=
 =?utf-8?B?VXBIUk83WHF5blFBYTF6UjRBWVFiUUliS3hFdFllaDZKNWVTK0FXMkpka3c5?=
 =?utf-8?B?b2hyajlMQ1h2Y0dTYStQNjA4YTEzemlzOXVVME0xSW1JUTdwM2thNGsvMFR4?=
 =?utf-8?B?SllHckdoUHhlUGRabTZ3bUJhNEo4ckhaYng1K2dLSFh2VGx1bHhWQmhYNGYy?=
 =?utf-8?B?MHVSL1MvQUVNcFhQUVNZVmJpQ2RyUXZKcDErTkNaTm5wZGlReXVoZnRkUUdP?=
 =?utf-8?B?ZWtONG4vd2RVLzVyOGJRUmV4WjlBMkV6NXZuN3BYZHRDSTRGSHVZT2xucFE4?=
 =?utf-8?B?UmNKN0NFWGdxYTJiU0J4STNPZlJ1NEpQNytXMDVXbEJpaDVJUUF4QkFtMlpB?=
 =?utf-8?B?dTlKaUVSNGFKQ2ZjOFhrV0VxaElvYzRHOG5GUVVFTElORUphbnVVZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bd99d3-b0a7-4620-1f3a-08de63118fac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:47:01.4707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf+PYHNqd6W79bJ5cYcm1mVGQZZU9n41v/icsZc+vjoQog0edZJ6z645oJhIQAJryQ5uOVkIbVAhooOpPkFaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6908
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
Subject: [Uboot-stm32] [PATCH 08/14] tegra: pmc: Cleanup headers
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmai
 l.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@for
 issier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,nxp.com:mid,nxp.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2E9EFD7EDE
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

No gd users, so remove DECLARE_GLOBAL_DATA_PTR and the including of
"asm/global_data.h". And include "asm/arch-tegra/tegra.h" to avoid
build error.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-tegra/pmc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
index 3f968d4aeae862053dc4e7f26335ebbe1bbb9aa5..019c4b0b21f3b6712d2f577181fd6815ad826e09 100644
--- a/arch/arm/mach-tegra/pmc.c
+++ b/arch/arm/mach-tegra/pmc.c
@@ -5,14 +5,12 @@
 
 #include <cpu_func.h>
 #include <log.h>
-#include <asm/global_data.h>
 
 #include <linux/arm-smccc.h>
 
 #include <asm/io.h>
 #include <asm/arch-tegra/pmc.h>
-
-DECLARE_GLOBAL_DATA_PTR;
+#include <asm/arch-tegra/tegra.h>
 
 #if IS_ENABLED(CONFIG_TEGRA_PMC_SECURE)
 static bool tegra_pmc_detect_tz_only(void)

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
