Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4667BDC237
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADEAEC56616;
	Wed, 15 Oct 2025 02:18:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 229BFC56615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqyOnkADH+9ig5sjHllKcfTzHj6YgjLV8BpaWaZ3D3Fp8z4Hd8bPmVFCkUq8v93BHCKuG5zzRqzl80l4hOgsrzSCim1dFbnIKDMV2+cWkIfrm7V1W8N8m2Ti8b8eDz2X1stHl3lkJgUTLlPraxj+dGwRcM5IIkJYXYs+VEeL0A5Ttg1nmPDx6dw3nuYSi3KnsJv5fW8vzHI4CSThCTLJNdbt4rxZ00qovEQVlNg8x9kJ6vYXmJ9w02z3cA27R2pMvqe0Lio44R53s7Uc12YoZPZfg4MkQjWiSLKaHZFEo49bIVb5AEsJbrzyLhZs8xbtJdqPFwKsSe1+njeNN1nP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEJaL8rJXuRuaSMNZio/1rEWwmQ/2xxdBrh1zroz+uw=;
 b=fYTB7PA3bB2IysxfGWzl2zVRaR6fp6GLx7SVB6uxGGc7Keg+60Uhod07hx49aQPYi2Q6l5d9R4vFVuFsbxr9iPHK3Ne3Hge1b3alxtG2RQ4d6r2mrH+nWNSxoM3nGoopUorXgjiA1B0ljFw8QH5oZBDxL163MK2MR0Sb4+zsvu4so2KbWQrR+NKDVALRmQPvKXTKUBUqD0PmHSAPjDyHTUMRzpJiYJxWKFbVYYRMr7Uyq73vPCJVZdhQfZBHqyz8r8BPHvbgAsEBk9KAyHh8O2KNHqiQGPsriLIo1+mAZg09ngm0rF/diQwzv5gBqU4R3WCN8+PvzVs9xvWByZ0ixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEJaL8rJXuRuaSMNZio/1rEWwmQ/2xxdBrh1zroz+uw=;
 b=OBCJscBdQOsHGd9rEHrzgd6kLqJUKmfQZnWWBCeSlyfdtYy7y1oQDPCULCJF9Nu4KsKHGrU8Fj8+WU3cb0pv8u+2YaD/OnLw4KQuMwi8ofzqoR9GB0EaO+KKtY0T4eglsSzBeVGPWZEs30QA0l7LWuTUBcREc8DDT+S9pgvYt/+GtdBLjEmNjMCYOdGoVldETKGboOppzHbpQtQuxpuzY1aBLpjS/HOXLnfC+RaFbc1WEek8qljBgUpIPJmmCGDIcsf0xV+wO6flktCow0/rKbhuILHs8MyGt+AbApOpD2PfsOVsCfq9rVkmsbyfygrtbaMStU+KnS9iGyZo6NJKqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:33 +0800
Message-Id: <20251015-imx-rproc-v2-8-26c6b3d16c35@nxp.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: becc3f9e-299a-4230-fc22-08de0b912f12
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3N2V2VMbGxRVHF6WTNpVzVzRUlBZ0hUbTBKMEF1R3FtM0RDNTZuaFR3VWI2?=
 =?utf-8?B?ZGpDbFk4bHdZbHQybmxmMUFVeXByQkJ1WkV5ZDZBakRCVlFOcG9FaTRyb0ZS?=
 =?utf-8?B?VnZQRzNhME5yUHoyZWxYckdldytWRUY4dUpxdnQ1OHdHVFYxMHlRaHNBSlgy?=
 =?utf-8?B?QldCT0R1MWVpOHRIV2R2SndVRGI1b2xUeXEySTMrakVJeUlqT0IxWTBqSGhn?=
 =?utf-8?B?ZlcyWEFMT0grTHhjcG1wSXRYbkhVS3F3dXovaStleWo3cU54N2tNWTdqeHhl?=
 =?utf-8?B?S0RWRlpEUzRFZGRYdjNVY1p5WUpSSjFOT2tBcXVudlFldHExWmZzb0lrSzBp?=
 =?utf-8?B?MzBnOUoxNFMwVER4aWRkQ0lqS2V1bG1WSmZBZ2JXeU9Ta1lxWXozaVhKRHB0?=
 =?utf-8?B?QmFPK0ZqU3h0a2F1L1BqdjlZTG1uaUpiVkxzZW53WDB4SlRLMmI1T3FYVVRn?=
 =?utf-8?B?M0lMUUI4d2pJUVp2SGw5Zkk3MjhPNUQveWR2QkVKa2M2ZFU3dGRtcEFvSStw?=
 =?utf-8?B?Q050ZkRtZFl2RUFEeTIrL0hqT0NCa2MvQUZiZVdJMFN1K041TDRXQmllWGVG?=
 =?utf-8?B?V1A3MHpwU2RMWHVDV3d3Y285RlJSWWpVZFdJb2dlQXBLQmtVaXJHZkUrN1Fo?=
 =?utf-8?B?UTZQRE4wNFp4dEFuMkZ6TEtCRkxpa3hnSGhxQmxERGtpdHVYcE5UUnF4dFRP?=
 =?utf-8?B?YWhnRlIwNWZXcUFoMm5oempLbHRhblJKZGNMdWd0Q3BFNGxKbloxUUJWSlpy?=
 =?utf-8?B?ZUVWZVNBbXB1d3FmcUZrMjUrSVMzSWVwY2pseGdmUmZ5OFd3TDc3ZWM0Z2dU?=
 =?utf-8?B?NzFva1RtRzBrVGtIcXU0OFhBV0sxd1RJTWF2aittTWZKN2E2TXVScGdxVmpO?=
 =?utf-8?B?MHZ5dHg2WmhDaDdDSmFwNzdCT0VHNG9ReHNMWU51ajhHTkcyakR1TXczZFRM?=
 =?utf-8?B?UERkUVM1M3R2ZkVINFRtSzBMVkJBYVN0RC85Sy9TYXZWaXhnd1dCNjdFLzJV?=
 =?utf-8?B?MDJuRFU4aDhjaFRnMGJ5WVBPQkFJY213QUM0VHlEcXlleGdlTG9qbWhBenNi?=
 =?utf-8?B?eHY5UDJBK0o3RXVqeXdlbWVrTEwxclNsaFRmK3RDUFlhL3Zkb0p2aGR5N3No?=
 =?utf-8?B?UFQ5RGJWa3BtZHFkQXdGZFpUL3h5N2xKdjM4RExGOGVSZU8yYXMrQnVzejMv?=
 =?utf-8?B?UEtPTFlzZUdDbm5FYnZJYU9SWTUyamN0Z2F3NW1oZ3dFR0ZBUWhleVJKRWlu?=
 =?utf-8?B?aWptWlBwejM1NWk3WGJURmFvaXMrOUhJMlI1WGJpbXhUQSthSDR4Um5mbVV3?=
 =?utf-8?B?K0tSYUxpS2JtZWM1MzE0N1c4TmRhZHQwNmQ5dHEvcWgva2N4L0tMaEI5d0Rw?=
 =?utf-8?B?YjB2dExQL0szQ1hHUnYzc0hxNE9GSTF3blFqd2R3eWVGb2o2RTNGRllQWVB5?=
 =?utf-8?B?cS9oemFWb1Zva21BNGp1YmtJNzRpaXVrdDYxV1JlOGd0M3ROb2QwVXpqNVlB?=
 =?utf-8?B?UEJ2QmtGb1pNQk5hcWNHWDhvUnVTeWVicGEvdUpNR2ZoQ01lYmJUa1IxS25R?=
 =?utf-8?B?a2MvcE9ZSTJRVUVaWFpNQzA5ZG5hY3BmOS81UHZZZ1BMU0lmbmlMc2hMNlVz?=
 =?utf-8?B?c3Y2Vkh6cHlLMW1HdklvWHRIYkgrM0ZYNUhYZjllQXlUZkMrWk94eXBWc2w1?=
 =?utf-8?B?QmlhUU5UaHVTbmRySm45MjdOOW5SbEo0SXcrc2p4QW9GcWhvVVNjcjNnZHZB?=
 =?utf-8?B?ZXhzcnUvYnd2RU9MWm9nbHowUHJhS3JpUFhJeEFWMms3L3pzVm81SzRVOUJQ?=
 =?utf-8?B?QkVaTFpVTitxaGd3a2xHa2kyY2VFQkJHZVZSMFlMR0ZVUU1WZ01iV1FpemQ1?=
 =?utf-8?B?TkZOenM5Z3NEYzA0djZTTVdrZ3h0U0NKOFEvd3Q5eE5xWGhTRFhrTnpVdkxL?=
 =?utf-8?B?TnBhRnVMQVZwb0M3ZndVZ0dEZXlkcys3NmlDenZhSXRiU0g3bFJVYlZRSzk0?=
 =?utf-8?B?ckE3M1VzTWZ4YWQva2xycDEwRjlsc1R1SGFZL0ViN2VjTm1zL0g5MnRzamda?=
 =?utf-8?Q?cZ3aoo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE45YlBnaEdXbFZMK3JNT0wwWVBRdTBzS1J0cVlNRnRXNEJWVFhRRnBoNmlH?=
 =?utf-8?B?MjMzNDdIeFdWUFlsajhJQ05hakxDUmpBOGV0dUNxODliMHhKMTB0TW9kVnZt?=
 =?utf-8?B?OUpBTkRMWFdWcngvSEU5RHk0Sm1hekZ2SjZ2VStCTE9XeEsxR3grVkJRZTJT?=
 =?utf-8?B?cXc4UFpPbFRqVVpUTHhrSzJabFJ6Um5kMlczNVZ5M3FmK3kvWDAwMklCUjFr?=
 =?utf-8?B?b0hVZHVZRE5McS81bFNLNGJNVFlBSmJNbURDTm1LZkhSSmNoazdqSlJmL2Jh?=
 =?utf-8?B?b3NaMjBhajhONVpPaW1OR0tyQ0lpTVJ3QnRERjBJUjMzOS9Da2cwQ3JtSmo4?=
 =?utf-8?B?eGFnYzZENHE1NDIvUHpKdU9hdThwTDBwbXZqZzBxNmtXU21Ua1Z1Mis0cDQz?=
 =?utf-8?B?azdXeWVnZm9Ed2grNHhsSnNmcmdVMlQyNGlTOTRCVG44QmJFRlVUb2xWTkpa?=
 =?utf-8?B?UkY3cDltVjQ0NnFTTXNVaXVya0pWTE5QZHdQblZZSnNKdjZqbmNSa0dQeVhj?=
 =?utf-8?B?dzJ6Yy9BVFE0elVDMllmZmFuM3cwMW1NQjlXbnI2bStBVlYvRUc4M3NBdW9h?=
 =?utf-8?B?YzZCQ1ZXVVZFZkpEMUk1U2laY1Z5QjF3M0xNd3lERWZ0bG5Ta0VFNXMvZE1n?=
 =?utf-8?B?Z3Z1WmN0eDZCeXBUWDVxRCtFQkxqRjRIRndvbWsxSlN6VzZvcTFIb0hLcUpY?=
 =?utf-8?B?c3VETldGY0RtNEZhUzRaUm5PUzAxbTdhSWNyZWpFR3JOQjZxN0VwQUVkcnhN?=
 =?utf-8?B?MkxYcUJ6QlgzdnYyaXZqblQ4Ykx1SzhseUVZUkczVU9FVWZpeUZ6RTBGZXNy?=
 =?utf-8?B?NzJKOFAzamNZNEJYdGN3enZSS0llNTQyN3dicHhoaDV5TXlQd0NVQW43VWZu?=
 =?utf-8?B?Ti9iMWhMczFuditpWTR5dTRZWi9pN2hIQ1lMZmMyQmY0citNNWlJRUd3N210?=
 =?utf-8?B?dW9yZWRMRC8xV3NiSVg4NngvWjFEWVBWOThlSlZPUDZFSGc4NXQ2VVNXR0NU?=
 =?utf-8?B?eER6M1dkT0ZqejBNNFIrajNjVXJRODZNVzk4aWpvZHJxUm5RanlkMXUxSWI0?=
 =?utf-8?B?amJCaEdldVh5aHJOcmVHQmpYQUM4aXI2bG5ZYkRuRGNoNU5vQ3FFN3FuYjQy?=
 =?utf-8?B?aVIvQkpWYmNqVWUyT3BQUTR4WUFIekpzNGJ5U3lGcE5BVGJYajJESW50OGFT?=
 =?utf-8?B?eGgvSU5lVGJtZ0gzcEdLNHhGdHNVWnZscWdFYlN2ZloyLy9sTWNXMm84dnNj?=
 =?utf-8?B?WnZzQ3ZMYVNNNmNTdXY1ckozS3VGbGt2WlFjZ2NCenNmOXI2eXQ1azd3TzY1?=
 =?utf-8?B?RzU3YU1NY0ZaLzdIQ2h5cmFQLzNCQzJsWTFYdkxHa1d0eHdqbWNvcDdQemtn?=
 =?utf-8?B?bHFxYkRaLzhoeEw1M1ROd1hJVHpYM1FEMkdhdWFVcmpJVzVmdW1nbUNxbGY0?=
 =?utf-8?B?a2gvUDRyWWNRenVjU3U3Y2NPN20zVzRLc0NvU29TeXd6UlBpUUZxaWRBTjBP?=
 =?utf-8?B?QVVEYmRQMEoreDVXajZnZm1CNjJtVEx0MXAzWThHOFB4QmV0VkQvQ3BGcmUy?=
 =?utf-8?B?MFg0R0RSazE4NlV2MGx6Z0E4Yjl4ZU40eHpkQkYveTBKY3lFaklBVThLUTli?=
 =?utf-8?B?Yk5RNFNnUSt4a0Nnc0pBNlpYQmNVUW5iZ1BaWFRCaHIzY3ZidHFRZnF5c0pz?=
 =?utf-8?B?bElGTzdZTFhpYW5IekNRRHJnbndKMDNCR0c5OVp1a1RxdERDZC9HMVB2a2hh?=
 =?utf-8?B?eGFzS0RVUmw1RW9Ya1pOS0x0cS91am9oOG9vMWJsVW5jcFZjdU44V043WGM0?=
 =?utf-8?B?WUhHaGVSZW1KQzc0eStKVUJFc2poTDBuelFvQWhOblhZTmJNL0IrZmtqR1gx?=
 =?utf-8?B?dEFzbFkxNU5TcXJXWlFLMXhaaWVlVGFScGQ5RCtKZmM3WGxOZWdHSGliaWtY?=
 =?utf-8?B?a3FFaHphMnVVcVBQZUp0NHEvU2dTbjNaU1JoYW5ueDlYTE1scUhkdVk1QmpV?=
 =?utf-8?B?QVlNUFN3QmNNbXZMelNsNXc3ck5UOGcxZmVubllkTnRIZERaUTE4bStIUUVq?=
 =?utf-8?B?SHNub3Y0TXFxMGdGc3RGWkw0MGlweGw2aXArWmk1Tm0yQ1IrNTFOM0xreENv?=
 =?utf-8?Q?9Yc45r0yMKHMIP67+tvpvvYi+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becc3f9e-299a-4230-fc22-08de0b912f12
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:52.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1s5PcgzisWxseU3WSXE7b4e+bBKV6lFrqxpxkXruCRxmtFlLoKJn+S5WZGnoLM0lHD0sXdPH/ktcLSkT5wQAzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 08/10] imx8mn: Enable remoteproc for
	i.MX8MN EVK
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

From: Peng Fan <peng.fan@nxp.com>

Select configs to enable remoteproc for NXP i.MX8MN EVK boards

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 35da05e93f5300ccbc77eeb3ad07050768900b94..0584dcb580fd4b25582b26b899c70f3cb78a3858 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -175,6 +175,10 @@ config TARGET_IMX8MN_EVK
 	select IMX8M_LPDDR4
 	select FSL_CAAM
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
@@ -186,6 +190,10 @@ config TARGET_IMX8MN_DDR4_EVK
 	select IMX8M_DDR4
 	select FSL_CAAM
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
