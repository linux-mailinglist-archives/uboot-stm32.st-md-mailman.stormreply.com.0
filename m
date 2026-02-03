Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMB7G0vdgWnWLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:34:35 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B1D86E0
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:34:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD175C87EC6;
	Tue,  3 Feb 2026 11:34:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013029.outbound.protection.outlook.com
 [52.101.83.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F5EDC32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:34:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRfgmZS8nSbpM7w78dLBGgeyEwdDq0Eo+lgx8XNOvo/W+3cD8E55sicQN9ptUl7nV+s0f6bnadzXZckCIT6K2WKpQpo0Hh2smvKcCZESDk0OT+n2sA9eEB294uCwKiAFvOlH/bDyABiwcCV6n7yrOw9ra7I3sJwTZMo+yx8mO1R+LdThg4fr4aUYOPwfw1DfC+qTogMvB24bjKOto/VVYGSyLGNtdWXCzismgZf8JlaJ8IgwPaEqbLDt4yDSTJyDtUNIh5GwXxhHrGoH/kyQLQGxkd+Td0MsvY8vErH97W2Fm6+YtjOi1ptKmDxkfWRP0oaXn8IbHz7cgayAWhSW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfNIjXlzFleMlM5Sbj+07/Y7FJm025AMJVxfxnXJVNc=;
 b=dtQjPHqWxKl7gj79MLakq5lqazcmvpdc24Wj5qbsk9dWrjK2wzSaPLX01Cwjl65bTV7UbghQFFd+lbFrXR7f1xgPErFJ/BAmBtgUDReDIc6dVgjip5D6EzOaSDKrw+kd0n+RsSCPMQ5JddbSIelUfyGcyn93ifEo92O/Ud6KJTv0ytG2xrHOgbEYIwQPmgNKHrK0ph7YCrsMuPUhOHLdPX5DZe8750kMtR8zbogQz7Brsa9aGIV9EhLMhTfJG9tLlJUqvK18zPJBtMnoJ/K7U95M8xule2mJumyx2zCgOJCmjv2OYZAzuGl/zr/IwGdMlu50t4+viu6wk2fyJ0fMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfNIjXlzFleMlM5Sbj+07/Y7FJm025AMJVxfxnXJVNc=;
 b=R1i783MXFDCSq9Xu/k++BhoqgINdUK9s/6+S4xAmEsysmFjczxGAnjxZZzMQkdrB8AjZVYTNiY4UsgfUDQF4fc6I7up9odJqNE4OSOoQlMd/nq0CLVyj1gmPui6kchADyylz3nLbwp1LpKaYD/r3ARwPx+7062hklVW9b4Tyue4hTU6/DUOYJNSLiaQG9KeND8SBgSXtEPBXWdDH69qLbdfmgr2lB9zMTxP+i5fenTNpCQg0BXiY7uDFU5h0+sTNHTqcdkrphoHhWXrPDfiddP+7YVM7mvR3ZmoKxqyAH6RFugc/4gSDgSprwSVLVnimEOuW7zMyv8o3y2sAvVsmew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9125.eurprd04.prod.outlook.com (2603:10a6:20b:448::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:34:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:34:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:08 +0800
Message-Id: <20260203-cleanup-v1-4-732e986039cd@nxp.com>
References: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 691f8642-2d06-4415-9a3e-08de63182f5c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFYvK0RZUXRnMVNKWWhQZnVEMTd6YUtqNFd2VjEvaHAyRldVMkFleWxVL3Jh?=
 =?utf-8?B?Z0ZudU5aNkdpamNHUm9DV1JkR0dZSG9OWjlNL0ttdFJ6eDBKeC8waXo4cVB0?=
 =?utf-8?B?Y1pLbkRsRTQwOVdaeDU2ei9XK0JBa2pTR2hwRkpVanF6UXNYdmk3WVU0Z2Mx?=
 =?utf-8?B?ZEVSaUY1YWlSNVRqTzVBR2NBVUFnNEw4bnA2cXNxYitESmEySmdPU3M4S0FO?=
 =?utf-8?B?eWp3blQyV3pySXBKaEtOazhUWWMvN1pSN1p3bUp4d3hzRmNCNS93ampWRWhv?=
 =?utf-8?B?Y0ZMa2YyLzdsdjAxNVZSTXFlek45VUxDKzVDeDV1dXVlWlRjK1VVOE9vTUVU?=
 =?utf-8?B?Q01LVkthb1VDa3Q4bFdpdjdxRmtmTnB5dXpEOG1LcVNtRXBQQmRrdFFSWS9o?=
 =?utf-8?B?aVNOTC9YRDIwREF2VFJ6ZjNzRTJ5bDhabGQ1SHVrMXE0MG1uSlNDVDg4eThC?=
 =?utf-8?B?aFFmbTZLaVRmbzdrcmFZVmdNbnk1MjNrWDgwZ0Q5Y00wcWlmL2cwZzFTQi9X?=
 =?utf-8?B?UloyVlhralMrVGFhU0pibFBDRC9zVHpIN1dvSzJjVmdzZDlWeGlQTmZZTzRz?=
 =?utf-8?B?ZE1vcjAxdU5QVjg0blg3bys4RVdnS0QzTFBHOXZVOXltekgzaHNpVDFLUkFs?=
 =?utf-8?B?K3pzOUpjTWptb3Uyd2lZdXBEcUc0Z2NmN3ZBdjdGV0M3aWtZMnNBSUVUVGJs?=
 =?utf-8?B?SXNMaDEvVHE5VnZOTTFpUXhoa2dpYnVSUVhVWGhwOGJJUy9nSFBQVnVaSUIr?=
 =?utf-8?B?b2w3d29iWGd2bnVoa2Vqai9WQkdSR1o4aTZTQUxCczRlVm5zSW9oUnp6bUdr?=
 =?utf-8?B?Sm9LQWV5YUhjTDlrWXlyNURUK3ZJd01CSmpFMW1KdnUzU0VHcDNQdmVMS21X?=
 =?utf-8?B?bHBKSXl6M2R5ZHpxeTdnVlJ6anlEcmJ4SVBMcWZxYndKRVE4bHVTSi85VDVw?=
 =?utf-8?B?Sy9EQk9FV0s4aUsxUFdhclZhbkhQeW1rUko3azZ5MDR5TzdCNFdIODkyUElm?=
 =?utf-8?B?enpUdlJMREp5YWpTVm5RZXpidFMzbDVzZkxuSzlITGpvb2E1SnZjalB3Vmxt?=
 =?utf-8?B?OU01a2lUYUFQNVMrWHl1OFlxNUVhbU1rS3VCc2F5QThNckVNNm5wSFhSV2hp?=
 =?utf-8?B?WVpFZFYwTlAzMmw3dEszSjVjWnR4UEJaeXg0TjU2RmVDb1VQYkd5aFpkS1Rw?=
 =?utf-8?B?YVFNYlRwRVZWVFhkRGJrcUpCamtUUUZWSDZjWTYyZ2NpbnBOWnFNZ1liWDVS?=
 =?utf-8?B?VjN3cEo5MmVRdWlWVGhrZytVUW1xSVF1WFR0QjVIUy81YXc0Yjc3c0Y1eVpr?=
 =?utf-8?B?djcyVlZuSmtFV0hRRThLZ0xOSlliMHFkeUdwbXVHU0hpenl2QkVPOGsxcTd4?=
 =?utf-8?B?RU12QitJdmZmWTNNTTczQ29SVWRuM01mamhjdlZORE4yM2FLQmFMVzVweThO?=
 =?utf-8?B?UkluTk01eCtNOHUzZ3Znb05ScUFwWjdPOGYwV3IwVktNaFNFcSt6T1M2RlJX?=
 =?utf-8?B?MC9kODlPZFZnVUhyL29IWkhvbHJuREY4ck9yWHZXb0RIUkw3d3VxTE1HSjBF?=
 =?utf-8?B?elVMV0FMOW5VRW5UQjUvQnhCY2NzMG1BODI4cTlkOFEwbG56cVdaR0liNmNT?=
 =?utf-8?B?ZDI5VWdWZjBFVDVEVDNtR1dXVUZPZWRabHVLY1RqSzEzREh3dXUrUVlFMFpG?=
 =?utf-8?B?WktFQkJxcm1wVG5WTDNXUkptS3VrU0dGTzNCNW9wblROWWYwSnBhR0pMQURo?=
 =?utf-8?B?anNhcnE2T2NyVDJVdmFSeGZDaEpnNVNIc3o2T2tFS0tZemJzVUpwMVpzckxK?=
 =?utf-8?B?T0tmK0N1UzBqM0d1K0FOcjBWa3IwaWgzZWhoR1hIKzVkMXR6NEQ2TkNubDRL?=
 =?utf-8?B?aXB4TEJtNlRTc2o2amQyM2xxbTRRWk1QZVJqN09NWjlXbEREZTQwNW9UU1FL?=
 =?utf-8?B?djhoaUhLa3NMb0FOQkU4VEtrSzArSnNWd2RsQUZ4RitBV1FrOUpLU2lDZGp3?=
 =?utf-8?B?bUszb1BYUVpZTXl5a25PNENQSkxPa05qaE5rRWRhRnJ4TDBOWnFlMXAzWmw0?=
 =?utf-8?B?bkFqaDF5V3lmV0dhNUUwUzRiZ2ZUWWlHWGhBMVdJZmx4WnkwOW5ZMlBNSnYv?=
 =?utf-8?B?RXgzM095R0RsTmdRaEVaNDdHUUw0V3V0RXNwc0NWWVV3bllraThuUmpWaHB5?=
 =?utf-8?Q?HkTZwJTeCwPzfMcyPZ3XwA16HyNnL/89nTvmgrgPaYGe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkJ2WDBJS0lGR1VmdGM1SnF5WDUyNFlGVUFFM21tVjRYUHhYSjVxOEZva1Bq?=
 =?utf-8?B?bkRKOUs0RFFpRk1mYlkvcEVkaGE0L0Q3T1o1VWN2VXFDbDAxZi9wZFJrQmpM?=
 =?utf-8?B?ZVRQV3ZSVnp5UDBjcWlMM0xIVkJtaGNkWmFUbmlwTUdIemhvQ2tEOHp2dlMz?=
 =?utf-8?B?Wjh6SGx1L056NzVvNDdXN1FpVTdoS0J4aVg5MkRqcFRRU3ZGbXFKZW5uM3RS?=
 =?utf-8?B?VDBkUlk3V2kzb1cyY0ZlWWFuMmtnT2hZQXRmZjkrK1UyUmdDbDBjNUI3NjNE?=
 =?utf-8?B?Q1dPU1JsV3prcitDLzM5SmR1SU1IMXNiSlhCSEhIcG1oMzFGdUtsbTEva1Zp?=
 =?utf-8?B?Wmp2cE1KWWZTSVk2ZDg2bWJ0M2txa1BobjVnT0JLY1hvelJRUkMyKzFyWkdV?=
 =?utf-8?B?SnpOeUxKVkVQcDVFcmpSQlRLdWFnVHZhUmF0QzhhSURSYnZHY0dvMjMzMXhS?=
 =?utf-8?B?L2kvM0RDN3BqbXVUTkJaNDRnQVBUKzdzalMrWDhvUDg4aU9SZ2ZZNkRybFVQ?=
 =?utf-8?B?OVR6V1pQem1UQzFaV1FYT1dpQzB1bmx5a01TNVBpMXFOV1VZOXdBWnh6N1ZV?=
 =?utf-8?B?N2lZUnlwVEFYZnFNamdCc0pDOWdSU2xYUE9XdFpmWXdJZ0NIOVlJblJjbzFm?=
 =?utf-8?B?dnVpR24vUWRqMHZ3V0MvcHNtZUYzclp4NHFNSHRZOEV2UHRVRVR4QVlRU3FP?=
 =?utf-8?B?VnBVa2hLdS80ZWNyVjhVZDd4REJYamoraDUvRS9WU211ZjIxcnlBaHhUM2lQ?=
 =?utf-8?B?SWF1b294M2YveHVmTEtrWEZndFBDYmx2R2RKd3gvbG5ZOFJ6SW9UYnUvNTR1?=
 =?utf-8?B?bGZZYlFIVm9Kd0kxdm5PRFV5YnpQQUhzcHN5Zk5kTnVGMEdGeHdZN3ZiUFVT?=
 =?utf-8?B?c0dtak5qTW9ZUytEOWh2NGdGZTVXTTQrZ2RwTkxUeGZNK0xNODU0QlU3VS9P?=
 =?utf-8?B?Y0FWNE5aWUlKb0lnYVgwOGV5MVphNDFSZER2Y0F1aWxRRkZ3WE5aRUMxbXpn?=
 =?utf-8?B?R3MxSDJ6azdLdmt0NnBMdzByVCttSDVWZHc4VW9yTlV1YS9hNnNoUTB5QjNs?=
 =?utf-8?B?RWU5T212dFNPa05jZ0VxczdaWlJiU1VEWjFieWFVcjBlaUJnNEEwaEg4ZElD?=
 =?utf-8?B?TmtrRGVBd2NDc2xUMVhwRE5ZTiswQTVkM1IyNHFpUWE2R004SWdrbkQxYzhl?=
 =?utf-8?B?ZDlyMkcvVWczbjU4eVdTV1B3OHhiMW1VSE9GSWJkRTM2UnFuTUw0RGlpWEs1?=
 =?utf-8?B?b3dJTUtCamQ2T1J1UXg1eUR4TzNINFlqb2pqT1pYZjJiWEhHYStWejMvZUNR?=
 =?utf-8?B?cEVveDVHVXRwV013d1A3L0pOUUV1R245bFFmV0I3RjNnUDl2NEdQTy9SYzV2?=
 =?utf-8?B?ZHlDVm9nZ1Vucm9XY3ZBbHcrei9kaHhiZDhpQmRlVVNFbXhMZnVXMy8zNEZO?=
 =?utf-8?B?b0xzZTVMb0FiNEhmMHVIejB0SGVjU0VwbDR2L01YcmNIRWVPY3Z2dWQwY1VK?=
 =?utf-8?B?SGxEZ1ZhbjA0enFwcTB6K3NJZjJpNW1hRElyQmUxTzhDUlhCMXo2OVpYVGFG?=
 =?utf-8?B?cG5HR1lCRE95VHZnVS9iZTVFeVNpUjFzTHhpRWtJVzNPeWs3YTNLblVkcTlt?=
 =?utf-8?B?ZEtYaFpxS1VJT1lRb2Q5bERDK3ZLQS9GaWhpRThvYmJHTm5QdE5sMUxLVXlD?=
 =?utf-8?B?aHAxcnQ1MlV5YmtQcHd4WUJtK1VPcDhwMy9Hd3p5WUJDS2JZQVl2d25mNmVZ?=
 =?utf-8?B?VXZUSzFoRWNhY2xVT1c1MGl2SzlYd2ZleFBGOWE4aW0wSlA2Q0g5RERzMm1o?=
 =?utf-8?B?Y09FR0hNcGkxb3FKMEd4VzQ5K1hreTVROUw5N2h2UTRXbFdQckdwVjk1c2l3?=
 =?utf-8?B?akt2KzI5SHluWXhqdUYrUTR4d3FkMXRFMUZGY3ZuSmRwSGxCaDJOQ0VGWjkx?=
 =?utf-8?B?UkFoeS9sVjBaRkM4YkpydW5iN3ZhNVdqL0ZoZ2dZaFgxd0JrbnUvUUdFaVh0?=
 =?utf-8?B?Vkgyd0ZDcVUwL1BSRllGTXRsZXFabXF4dGxVSFJZQXVmd0JFcmFhTzhSQnNY?=
 =?utf-8?B?TXBldU53eTRnM0VCVG1GV0dyRDZRMzlvSTRLQjVaV0tJQjlNQlF1MUNNT1Ni?=
 =?utf-8?B?WS80ZjVOazdsMC9NcHMrcExlOFhpOHV1WW5FZlFCNGpqNjlveTE0QW9KVDdB?=
 =?utf-8?B?SVc1U3h4MXJqVC9URzQ3NGdLTnRrQVdzRjl1K2VPcFpnK2FNMkFSdVNjWjE0?=
 =?utf-8?B?N0FGbnF2OTNHcjVIQUVJMmhCZjVxNkVPRHRqZUoyUmU2aXRUbC91NHZjWFVL?=
 =?utf-8?B?SnBTNWxEVDhWV1FGaGpNYmhFMkhYVmJldWszcnB6WDZrSDJjOURZZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691f8642-2d06-4415-9a3e-08de63182f5c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:34:26.0257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9jugryXPHxmbjlsUbJ5wWdUpRaO6RDS3nbfG9oPyQ/8QFP8HfyYzCmFEHtY0LUfc8rtFv9fZdasEbGVwqAouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9125
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
 Ilko Iliev <iliev@ronetix.at>, Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
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
Subject: [Uboot-stm32] [PATCH RESEND 04/14] cmd: mem: Include vsprintf.h
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmail.com,m:n-francis@ti.com
 ,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Hua
 ng@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,m:michal.simek@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[195];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarketos.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 302B1D86E0
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

hextoul is used in this file, so include header file vsprintf.h.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 cmd/mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cmd/mem.c b/cmd/mem.c
index d5d7ca2790bdf2d100606963c0c2d48b1c6b6978..8690fc1e4e6b93d78b48cf4c080c7f52bf2504c8 100644
--- a/cmd/mem.c
+++ b/cmd/mem.c
@@ -26,6 +26,7 @@
 #include <mapmem.h>
 #include <rand.h>
 #include <time.h>
+#include <vsprintf.h>
 #include <watchdog.h>
 #include <asm/global_data.h>
 #include <asm/io.h>

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
