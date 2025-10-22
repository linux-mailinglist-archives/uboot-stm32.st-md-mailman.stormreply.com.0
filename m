Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E4BF985F
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3E1DC5E2C4;
	Wed, 22 Oct 2025 00:49:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2278CC5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE3MZeNkbp9FO6JWp+P+0KrAPKM2TYF1Wf9pohuN51bqZOOt9J7WzqbttYfJOwH1fVxjlDdvA0gaDlKTPLcusFEooyyxWHDDu4FN23Wk9NPR60wIWNAQ9j5Qw/o0IJDUieUSeiJ9yik/75yd7Q+13awB3MXoDzRpm69THWDA6LM0G9Ms7TtUare/66Q4g9z7EGKnK+jFsRrkWAtbM1CjS2LtMnD1EE0bT2UzdfLTOgRrMrSoNbEQo9gyl6OgT7l7gDsjoGRkNpVrYEMhu2drTIIvzSy1fLiTL82qCd1bw6VpcvAHx9yyPDrXbvpp5UGL3EgXzv6YZTtUFE6/NDE0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRNwx87QJ2PyOA7st9LXNleHrCXtzwk5cTwnRfw1iIA=;
 b=nrsPxUzntBbbXiczxV22RwMCeHgI0GqnS6H1j0w4lvPzKTrT9wVCgvcEXhBRLxVw2sy+Vw/WghdazTZKmOJtWtbtCJzX/EIV2wBkRiBe91tDVc+6Hjxbxdprn+jmP6j1240r3quj9ZbgEwEu14jyY8kjbjUpBDEC5U34Yhb9riJEfgysvWMdFKvCLn3uHT40udfdR+yS71UhUnt8QCDIDXkvr0bmbskUp7tzrtqI0oX+l3X4Urfg9BFkIs0fH8MMcz03tArliynDR+BOsLizzM5uhSeZu5tOmUJ1fJDqpU8zqfbEAcleWAvEdLemsdXYxXoIdpXxWOI4vvyHU7rbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRNwx87QJ2PyOA7st9LXNleHrCXtzwk5cTwnRfw1iIA=;
 b=YSkIhPdUR1mRHBwhuVuUlbCPx7YtBHsXXOXCP371LXeNu2z3yKBNbQSXo2uAPBjNL+3u25r9CHxKPfbq/jo6dA5BowgNk9BG5giBmnbl5QmQJS3x2v5tx31BaD2bj1nqiVN0WJeGPA56t9V3Zf2jcUbOhMe4h77AdLgCTDjrF61WTUFG6zAYz2EAPJRJCcBsp9aJCAos3F4zch5TwnM171ALuNrqF/Cb9fGd5gKoFqH+iDq5Xv9VeIWTb3Xe/h+9WgrhQQ2vViQ5ybnZQLZEaA17o4PKgeJyV68LdX9qNChvlCDe5oHXbUofrlj2GxSN7xwA3S1KUiI3LR1pa41fkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:24 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:32 +0800
Message-Id: <20251022-imx-rproc-v3-v3-6-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=768;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=AgxJJoH9e19HaqesXgQu6Wgn9SdqPUMsK5Gp89CdqHA=;
 b=ehWUDeVj6Ac5136/c2FxQOciwdCIRXZqHnEAab1LihHLJtzac82LIhKzMa3D+ZxknYfHKS3eh
 QcIzjGlqNHpBKU8DMOv9fFTq0w3nyZF4HeTsawcY7kWXug/EEAamLIs
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 098ee4f9-4878-49d5-facf-08de1104d839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXFObnZKKzgxMnZNTHFCcEJUczBxK0tkbHVGQWY1VVhtMGFyN0NiZXA5Ui90?=
 =?utf-8?B?QWh0ZkJsaW04T0NwTEorT0pYWVMzc1RZdnc3ZE9XNldoNENJUWhNVklsRmlY?=
 =?utf-8?B?aU5XZTZUMjd6Rks2cjlNV2plZURiQ2NmRldmZjE0aE9tQ2lHd2FrU2VZV1J4?=
 =?utf-8?B?eVBReG9jZm9MR09uVlBHMWdoMkVidmdCRk1YNjNVMUtqVkpCWXNRd0xkd25C?=
 =?utf-8?B?TVk0SUM0YkhGMm1ib005MUhDcGlLWjZRUk4vS2VjUzZwdVRuMFFYajlKWkNl?=
 =?utf-8?B?c0NGWEtiWlhCYW93R3Rob08rYWVZUEJHOU1EaXhJdHM1bWhxQ0FIVTVpRVUy?=
 =?utf-8?B?eDdTL2pzMHhOS3ppM1ZBYVJucE5ybWNtcC82VXFQck5pTzI3dEJ5eDRtMzF2?=
 =?utf-8?B?RnpmaDlhSDNDbFhxVS9tNUd5QkMyTVBLdS92aklzMDl0aWlRSDN5dW5ta25q?=
 =?utf-8?B?V243Z0tjcVVKbis3b3NaS0c1ZlY2em55Q3Qxcm1DSFZiSTM2TnZnQjZxdFlX?=
 =?utf-8?B?WU1wWEFwNWFjUTBjUXc0WWdaNThiQXNYWVZxc0R6U1BmT3VHWHg0MW5xanZq?=
 =?utf-8?B?NE9wc290S1ZRRm1tczUzWk5pUkdWQmJZZjhTa1BIQzdKYU9ab1RvTGgwbzF2?=
 =?utf-8?B?K1NTY2xLWEs4MTE5dTNFbTJyWk82S0ZENFI1OWZqV2h2NTNuTGtudzJ6dUFh?=
 =?utf-8?B?cGl1OWszQ2pIYVl1aEorbCt6ZHc4RCtIV2l5b1NzT0syMGRKeS9HM0w2MkhD?=
 =?utf-8?B?cWJ6dUhPR2JpSmtXd28yQ2xUZXJEbHQrYWswc2w2cUVydENQZkZkZXIyOFdh?=
 =?utf-8?B?ZnVpejlIM2hpTjk1TlRLcmNxa0RUQTFTVVAvQTErcndxOTUvYUlvMDFKTTlW?=
 =?utf-8?B?UjA2M212emNVcDh6cm4xSHNJeWRHZ2EvU25XR0ttcW1JcnJ4akZFd0sybmVW?=
 =?utf-8?B?RklGOHp6R3lkcFdaa0I0Vi9TNDVhNmJPSklMdm5GT3UxTjA2TVZwSGpISzd6?=
 =?utf-8?B?QXhRSTd4UDVsenpabnIvclBlbnF5a2FSSlUvZ0hpdkk1NjVQUlJKVnMrNXBX?=
 =?utf-8?B?Ri81Rzc1QXZWOEhqWW1ZZWFONjBUVDFqbW1QcFZ5NktocHd2YWVKbkNUK2dV?=
 =?utf-8?B?N2NIM01PbUh6VlRReFduaWVTdTkvckMvd3NEeGlFZ0VvMnF0b0NwTldrVE9M?=
 =?utf-8?B?OGEzUmdLY0ZJbUxNWWg1aTF3cHVNVVdkemRGOUZsN0tKY1JIRXZiN2JvNTZS?=
 =?utf-8?B?SjNJRitvTXBla3JjMXU5ZzYxY2NNQ2szZHBMdXlKVE12NDNrQm1vT2U3Y2Q0?=
 =?utf-8?B?NFNWZGlGejFINmxla2dXYnQrdW9ScEh5RW05OHRiWUpESitZYTloYkpTZlY4?=
 =?utf-8?B?S2tPY0JmV2UxTFd3TFNJb2thQ3J6YzhrZmZvR1F3Zi8vS0NjbzE0RXZJNTFG?=
 =?utf-8?B?bXlKVTFRWkF5Y1Frc2w1cWhWOFZxejBmL0tNdkFrckYzUWxqUHRaNHlZajZM?=
 =?utf-8?B?RjMvUTJ0NWdWZjgxOHhuSnlUcXo5VHRraStBSGR1VFM5R2xBcHNHVTR4b2hv?=
 =?utf-8?B?ZW8xUXdidmg3R3ZXTmZQTnNzbmVoZFpkaHArS01nWmlOTmp4eGJidVZOb2xn?=
 =?utf-8?B?TkwvbUFOTnNpTDI0djRjUFQ2bnhQQ0VSaDJ0NnhVSlVLckt0VHowWUFhNmNy?=
 =?utf-8?B?dTJhOVNkOGJISTBrVUwyV0hjaUZNRFl4TzBUQnR4aUtHc1NzZzQrTmRPUU1H?=
 =?utf-8?B?T3Z1N2VSYmRMbUFuWEdSYUFSSVIxZTd5OHhoOXFhMlNDMjFVd0R0bk9INFRN?=
 =?utf-8?B?WFFtNk1LbVJNNklLcFBNakpwZ1diQUdjSC9tVUVabmI2MzhNSFl4L2lhQ1pO?=
 =?utf-8?B?d1J1SlMwSlRUL25VUUJkS0JEbHg3OExuUmk3Wm9YVU91WW5VOUZ4VFdLYzJE?=
 =?utf-8?B?ZUdVbnU0MUpuRFU3WlNJQXBaRzhITEtCeGw4aVVweGNZRk9rTWk2VFZVa1BE?=
 =?utf-8?B?OFlIbzFWNjdvcFlnWkpVa05SQUZYeE9YNkJTMlM1NkVSMHIyTGhlZGZkRXJP?=
 =?utf-8?Q?qYTCsp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vjg4aXRZaFRpZGE0Z296UmY2ZTJJM2xmMXVsOXpOakVZZmlGNm92bFo0ODg1?=
 =?utf-8?B?enpkeEFCUDNEWHpOQkJCUGhGZ3pmc2ZRbmFUcytqNjhQTWlUNExmZ2hhNTVk?=
 =?utf-8?B?clBQeGhFdjJrVDNqcDNCSjZFc3Jha2FzVjZmbXFtN0Z5VGNWS1dMc3lZclJF?=
 =?utf-8?B?RVAwTW8zblR5dTRsb1k2MWRRTnNxbEJFaC9tSFc2NW5GTXN2VXQ3MERsRkQz?=
 =?utf-8?B?SFdKbExySFVma0pRRjNUMGdyMGZIQ1VTOUdqU1JnYmxqbEduMk1zQTRyc2tx?=
 =?utf-8?B?M2c4d3FVcTVuZytvR0JxSXRUUGx0UDVPenhEWE1mdXczY0gyZjVGMWdkNjVQ?=
 =?utf-8?B?NE1SY0N2RWhJQlVvcDlLbDN2aXlyZmc3Vmt4RW0wdit0Qkt4bHRxcENMdEVY?=
 =?utf-8?B?OG53UUJ1VmR6UW9IbkdZY2paUnc2NEtSVmo1aTQzdnRGcm5ReTJJWC92VGNq?=
 =?utf-8?B?a1ptd0JmNHNwTEtXTlZScUU2d28vbTVjT0JSN3E1NEs0UGlvTzR1Vk9FVGd5?=
 =?utf-8?B?ZUJ4UGZmaDBlKzNILzJQdVBoUy90eThFaERtaGhhY2paemNpVlQydXFveVU4?=
 =?utf-8?B?bnJVYVpPdE9tWnhwR1dTWHJBMVI1Q0NHRjA3NHFvL1VPTG15N0dMUzFXQ04v?=
 =?utf-8?B?SGdFSitnZGxMOTdnWEhSZ2JsNmdIUkRZVENJMUIrNnc3SGNZcTQycFIwUDI4?=
 =?utf-8?B?ZVJWTmw5eUFMYkFYSWI5bFhnbHgwZ09wUWNSQXp3V2Q1Q1VNNUVlM0VpbGln?=
 =?utf-8?B?Y2NRcXpwdDhQbXRhTEwyTWNiVi9QU1NDcjZpTVh6VUp3UHVxanN1U3cvRmU4?=
 =?utf-8?B?R3VXeCtudGNrUkM3UWI5Tm1yZVUrM0llT1YxR0Q0d0JMUnhFYmVxQmdRU2V4?=
 =?utf-8?B?ZURmblJwUkZyQVdqZWNCWFBtOUtvZDdPK1ZGU3FQZEczcHBiaysvWWtEZGVH?=
 =?utf-8?B?UDBXMUE4S1cvRVVOckxsa2IvTVNxazFKc090TGdJaUJrT05HaCtwWTJicXkr?=
 =?utf-8?B?dmU5SXVuV1ltSDYwTDVwakpuM3E2UnI4M2RLV3NwNkZwbVJJaFJCRkh0akpj?=
 =?utf-8?B?WHFrVjFpZWNTMDBobjhCYThWZkMzZVo5TEdWR29SakNjckwwSmVEQnFmMU9y?=
 =?utf-8?B?L3Q4Ymtsckl1L0h1Qk1rc1lKaTNPVGNSbHdGZjZNeGpUOWJnYi9nL3NhMERh?=
 =?utf-8?B?RXVSdEJzMklhRU5Bd3FWM0dQZUdyNzVnRXVhZnlUL1JndXV4WTFrNmtyeGJH?=
 =?utf-8?B?YmEzajhIMnl4MDRJNmFUeFFEWTZpeEg2WmtGNk9wVm9RazBwMkNremE2YkZC?=
 =?utf-8?B?cjdpR0grSENtYThRVmdoQzVQdGlkTmxZWWFOL0pjUWY3YWdQdlNOOG9rWnZH?=
 =?utf-8?B?bkhOWlJ4dHZTdk92TDFLZE1NakpROUJTN3U0VUJId2tGd2diRzRTbW92VnFQ?=
 =?utf-8?B?d3RlZlRpU1lGOFJySTZ4SEQ4V3pTTGd1dVVhVFZZbkpBR0o2RVFIejhES1lL?=
 =?utf-8?B?VFBCRDN2R1dnaDNDWmVRYnN2MFprTjQ2MFVoZ2FwTmw0WVVFQU9yOWl0NlBr?=
 =?utf-8?B?SlNMSnd3bmVsMVRHWGpxaGV3STcrVEEyaUZYR3dMZDNhaG9TNy9iV0YwR1M2?=
 =?utf-8?B?VTUrT0dMcU95NE1ldFh5QXdRTjBJU3FUdFQ1SVZKdkFLRVRBOCtXQ0lrdlc3?=
 =?utf-8?B?YkV2Z2IxMFQ1Y2dZTGpleDNaZFN0S3RlVTAzN2Q5TVRXOHcremY2N1V2RE02?=
 =?utf-8?B?aUFVL2NnYXZ1Uzk2aVFweFBlZEhLeHAwRUpRKzhPdlg5cHdFb2NQQXRLcTh2?=
 =?utf-8?B?THZETWt4dFdJV0NIU2ozR1dUb1J4NkdlSFhMV04rdVkzVEFIcW5wb0Y1MWgy?=
 =?utf-8?B?a2FlZkxMT1NsYko1SUFCM20zN0VCVlc3ZEpETVNvYWVmVUx0YXFHTlZKaFNJ?=
 =?utf-8?B?QTBWbzNiQllJdzBDdGdJRkYvVTdkZmN1UDl3bWsxMVFjWjhTU05RSUVmMzNy?=
 =?utf-8?B?WmJ5N0xzUG5xQjU5NzFDQ2JGMjU5b3BLK2JMTUsxRHYrSElMWVBZSmZ2ZDd3?=
 =?utf-8?B?T2sxSHgwUmtVeTBKbWFHM1BtSDZUK3MwcmhndGpzdkNHTkFSbXNqbHM1RDNS?=
 =?utf-8?Q?HQ2hxWAEsVwT3hPkFLxluTz2D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098ee4f9-4878-49d5-facf-08de1104d839
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:24.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57zKAwB8PBuQfVUXQzzgYNUSUTOXkgdTX8GBRYMS2gnvnXaKVzARVHrvrz5rPVgfuCYV4hKLLgXUJatSdHBUSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 06/12] imx8mp: Enable remoteproc for
	i.MX8MP EVK
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

Select configs to enable remoteproc for NXP i.MX8MP EVK

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index f7b80f3178a98e71f89cca777de08987b9a0bd9d..75d2772617d23f8145e7627723218c0c3944a1b6 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -248,6 +248,10 @@ config TARGET_IMX8MP_EVK
 	select FSL_CAAM
 	select ARCH_MISC_INIT
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
