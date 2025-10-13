Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D33BD7E4F
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EE53C05858;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C687FC36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzPbn3ykbIxciYbL0MIblt4pQKhXmjNDV5DKb92OC7yr2DgtDL6vhFBy0qAgq/4M/zFW5jC1WEzuO73s49pRbT39Kahm2tmu7jMKjiiFEPkmfEZwWCNRget1OLCXM26cekYE3tQwCHPrANUC12momVu5pd2HUXPAzSzJk2XzSUmruCRqfbsHnWYX7x8Sl0Cvp+2L2wGwMAqAis4TWQHmSzryai4rle7Ith54SFeO+JDd5N8cFo51rEyxd/BL5ayf8AsUkhwJM6RUZLvM9r50lG0f9SYtn19zVL205Ydvp1lFJuwevANFElR3DO5UYgPyV7CN8Rl/oCwqoKkQVW1vSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1/EtXtahmSutqi0loBKiv5vtiwYmvK/d6VozCeXPl0=;
 b=yeu+hdGznyBSX556PcMhoJ/0j/H8Jrt/lpwUyXgc9f+SzN/yYdDHvappJLS4SCg8voUWTbxFfB2EkhUHYq0ECpA3jV5+6RkFW30+BEuWXKvLt3tDcQ4JLu/OxtcoMl6VWSOUs17ZggnsTFDytylimZw7vYnhi0+NKSKs1FAV/aXM/sWddRNCZm43x5NARQhITML/wBsa9ylUIO+rRB5MkCdmy6BfG59+TrbchLjhmULwfO/SOttEOXcXUG12juWkgoit4AEwnfRx7kWHC+H2lQjwJcrdCy1Q+iBx1R2zorWXLez2bDlTQ5/F15nHuHhCOzgkNESfLnVgCo7NEMNmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1/EtXtahmSutqi0loBKiv5vtiwYmvK/d6VozCeXPl0=;
 b=sW7truiUCWb/LTd4gtazJj3BLkL6tc3pkDOnAMHOo80FwlRrJyQ70eR+tqfp1eSE4fwnYRSgWl7YDyAFJ/hbiooHYeWUK9KQ/qYvV3DsJsIdRDozWH8SmBpuBhSX9US93htaPWOnSwfJh65qvveEN8Q4BuBYpfNrPE4Xsvl4MkvQ8HlEBzo04S3WTqWtDUF42xmEG9/3fIJbE3mfImHIwoQ57L/12H28hOndxYH2PHr4Y/vfk8SP/M7+migaiEwhqHmtUAXt7qMChGxZKm6P9yfa5I/EGFXENADfPCXLf1o2WSaxVPsySBr/CXpp0tKKWb2JkP0CIZvqrT8vbjJuqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:23 +0800
Message-Id: <20251013-imx-rproc-v1-4-fb43a3fafcd0@nxp.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
In-Reply-To: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 433caa00-6e86-4746-d724-08de09f911ae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZCtmZG4vRjFnK09rUExsZUdsTnpjb3h4Yi80WEtEOWVhM0hqdVYvTFNTeW9w?=
 =?utf-8?B?emlIcnJCWklUbW1ucHZYMkFuNXBWKzJDYjJUOTl6by94aUlWUUYzeGM1aE51?=
 =?utf-8?B?MnBrQWN0VnVOQkpMUmxMbllpUG01U3JsS29vbEFvQlRlbk5ST29wRHJOS3Uw?=
 =?utf-8?B?ZUFHMkxmblFiS2c4V0FnSElDUmlESkF5U2NvYmZJWkJvWHBVdWlkTUVrbXJW?=
 =?utf-8?B?bVlvM2Q2MXZsOXNYbFQwbDNqSks0TzRESkpBQ1ZxVHR1WHhoM3FuZUFZbUla?=
 =?utf-8?B?REIwSnFqMXZmUndPMlBFZWFNd0ZmeUpuWDBnaVpOTmVsU0RwbmN5QnJib1BT?=
 =?utf-8?B?N3pYWkdUWjNyOHEzV3puVkhkRlhoRE91Y1RJOVhBc24yNitWQWd4UUJLWlRC?=
 =?utf-8?B?amJkV2gvbnM4cEdhYmtKODBpUjRVMENlMkJHUXpnZC96NXg4Z2o3c1RJZGRE?=
 =?utf-8?B?blkzODZtZXVtM1RsQlZBWFlxTllyemh5cGp3eUJHd2s4bTNDYW9HWnZSeEtn?=
 =?utf-8?B?dHRMN2ZWL3RsSTJpdlJGMGc2U2Fjb2h3RzRtaEY1TUg4TWlrbVJNSDc1cHVo?=
 =?utf-8?B?NyswMkJGZkVEWEthUVM3M1c1TkpwbllDcC9ZYm9vS2xRSWgweGl1YUdrZWZR?=
 =?utf-8?B?QlZDcFR2c3Foc3RPYng3SnFtdEx6WnIxT0dScjk4OHFCcnY2V3c0MUl3Ymt5?=
 =?utf-8?B?cXlmWnBmL2dsOUxiUGdqWGh5MmZha1pTRTFaVktoVUtFRmN6enNkeGdOd2w4?=
 =?utf-8?B?Y3ZlNDBSQkx2S3NwUXc2aUVjVzdPZEFNMnVLV0lvKzlaSnV5OFVZZzlNWk5V?=
 =?utf-8?B?TnJsVmtOR1ZHUkN6LzRPOVRXSnU4c1lvNWNOS3dkSVV2MHoxMW15Titkem01?=
 =?utf-8?B?Yng5eEpOcUFnK1d2MGl5Q05INHZqcjhvemRXYzNsQnFrU0tvcUNXVzdkbXh6?=
 =?utf-8?B?OFhCU2NkVVZZSXZqT21KMURPbHlvRWJLWThVeWRQV1d6V0Z5clRsaE56YUh2?=
 =?utf-8?B?QmhRMDRuRkFTa3RTZ2ZyQytNa0gzVjhJV3RmWldMZmdBdmFiUFJQZzc0eUhh?=
 =?utf-8?B?bHdENDlpNGlOTFdXVGplZElsV2haK1ZFTm5SUzFOR05Lajc1ejVTbDFEVlhT?=
 =?utf-8?B?MWsza0tvMGFoTHpqRnFmNlBzQ28zUVc3ZTI1RlQvTm5aYWRKWmRvdlJFVG16?=
 =?utf-8?B?ME9ubzVuRzdiS3dLM1NoOVAwQWx5aE00UTJLbFV4THUvZUY1UjhhR0V4VC9S?=
 =?utf-8?B?V3FobDAycWdHamFoOVBPNTRuU0dMemkzL1ZOQTJoRVVsdGtsWHFrUnZEaDhY?=
 =?utf-8?B?UWF2dnVjMm9uRy9FdDU5aC9BNkw2eTcwRVZ5RWZFd0ZpVjFGalpISU1US0Jo?=
 =?utf-8?B?UThYdEY3MVgyMkpFTHlZVEFyN2lYUmRDQ292a0JwZlFRc0RZY1VyTGFJbVBr?=
 =?utf-8?B?dERJdzh6OE05Kyt1aFJiaWxMSTF3MDVwVXRlNHBLUzc1ZzRZQXFzTEllbEs4?=
 =?utf-8?B?bThvU3VkUGhUZWdPeDZlK2hxdUp2ajgxa1JTVFhVdGRPdXJHK2VUVEo0bEw4?=
 =?utf-8?B?bmdaRXArWThCdGtwek1Ra3ZSTEJaeUJEL1FtTWxaZVdyQ0ZvUDJmMlF4OVU5?=
 =?utf-8?B?Ull1bWhuWkJ4MVgwbHNycjdYQ3lqaXZPN2J2OVUyK0ZvRkNCR0pCTGVScGVI?=
 =?utf-8?B?UTR4RGhKUStOdDhCR040QldiQ3FabTUySDE2VzhWdlRZejRhQnJodEc0RnZK?=
 =?utf-8?B?SUdVeUtxclA3Rit1UDM1U3VLTFRRbytYSVRDSFhHOHdveEl5VDZCcEQvQTE3?=
 =?utf-8?B?WVAyakhHTkdkeERObVBXd1k4dVFCbEgvSk1MdVRLV1RsZ1NWbk1YSE55REds?=
 =?utf-8?B?MEFxajQ3M2htWWFGTU42Y1JNLzBIRjJOeW9PYXQxdFdQeVRrRDFTVlJCVVJJ?=
 =?utf-8?B?SWJqYnhndk80cWxjcnkzcnRaVXd3ejgwdVZtSkJXRG1uR2FJTi8zblJDNTBk?=
 =?utf-8?B?SmMzUU5ia2RRUnBxejUyaWovd283SVBlVDlrc0huTkIzTFVJZlJrNUd6Qlds?=
 =?utf-8?Q?ZTHBkF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGFCZGZXU0dqbHY1U3NIdEVva3FWWlZIU3A0UkxiK1c2REV3QmU4NVZWRmIr?=
 =?utf-8?B?ckUyR3NFWGFNVkFnU0w0amUxWWpjeDJRTlE5Uk5LUG5taTV3V0xmU3d1b0Ji?=
 =?utf-8?B?WS9tcmljQS9DZCs0MW5UbzcwM3VPbkZJeHhtbUhncWJYL3plUkdqdDJ5ampo?=
 =?utf-8?B?cjgwUml2bGozSHU1d1JBamhycy9VdnNZZjVRVldPNkE5Mm1YcG5MU3BNL3BZ?=
 =?utf-8?B?S2ROYXdPYXpCWXlHRkxyYlBhYUl4S0VnOEw0VXNIN3lqaDJaU1Uyc2ZLdkVr?=
 =?utf-8?B?VUgvRUM1MlRSaWZBK0JtbG1mM2Vka1VhTWY1V0lTb3V5NC9EdGFTS3JKdHVP?=
 =?utf-8?B?TE94NEV1Z2pjbndLaTFTZVhaMDBqRVBGcXBYWWc2ZVgwamVTMVd5cUcwaUNE?=
 =?utf-8?B?a0d6MkM4WjMxQVh5MEFnMkFsdmF0V3MvTnFURnk2RDRoL3M3UGd5ZzRTQ1cv?=
 =?utf-8?B?dE1PSXpmV3A2a0tWaFhKc0JUSHFkNTFpbDRFOXp6bGNJZDhKclloaDVyNFN1?=
 =?utf-8?B?WDhpS3hmWndyOEM4TDhRVUd1VHFQYTZaOFB2YURPZVhabXY1M1hXY1dVbTJE?=
 =?utf-8?B?QXdjUzJUdmlJMXh4a3c0MzcwZnBDZTVVWjJnaFBqb3dWVG1CKy9UUGx4RzBO?=
 =?utf-8?B?Z2VadFUyMTYvTGcwYkQwdnBISy90OEw5cjdjd01nRy8vZGk0QTZQUGpSeXZk?=
 =?utf-8?B?aEV6NlVsTnY3SC80U1ZXVkNHejRMUkhKTkhNSFVVZ0NxK1BZNHhJRjRHV01q?=
 =?utf-8?B?dzBkYW9ERy9QTWtNUTNxbGxlZkFGenlycWRyMERzZFVFK2MzWTZnYkM0MUlR?=
 =?utf-8?B?c1FxYy9xQlRVL2xFbUJqZnFGeW84ZllMSHJmWk5udEpxQ1grc3hxeVdHS1kz?=
 =?utf-8?B?SzFUWXF4WW02Unhwai9WWkxYK21Zck5FYlM5ODFxUVliZ1UxQkxKSDRzRHNW?=
 =?utf-8?B?blNPNmhTNWszV21rMG1MOFdCOERkRFd5YmJqdzhERkN5Z084c05scHJhSlRO?=
 =?utf-8?B?T2xuQmlCWXNNc1VaQUVzMnhqWGNTaTRma1o5MEtZa1NOMDdoQ1M1UlpRVWE2?=
 =?utf-8?B?RDZjRnk4NFA0RDUvSGg1anFKb0grSnBsMG1Temg1UDFLOGpOVU9jQnU0SEl1?=
 =?utf-8?B?ZkwrN1p3Z2c3TldmTFRveGpUcWMvMXYyOXEwbm1qYzFJeHRoTFRuTHdjQWF2?=
 =?utf-8?B?UTd6MDlGYS8zdUVReE0zeXA2bmVLYXZQRWxKTDFuSWFiRlBQb1J6elFQcElF?=
 =?utf-8?B?bzBQOUVrVW1OY0lSdTBXUmVxNnczYXltZjh3WTk3cm81L2VsdFZZSGxMaVAz?=
 =?utf-8?B?bEp3cFlDVHpEMmZPQzYxa29PQWxTVVBlU3FVNzA2NDRxc0FPeXVDclFMTzhD?=
 =?utf-8?B?L0c3Sk1QNWE3bEhGUG15VlNSaU5LSkRqSkNhWHVKVUpKYjhyY0tEQ1llOTg0?=
 =?utf-8?B?aDlRN3I1Rm9lcXVFVTV2S2Q2Y0dQUmFxVGx4V0U5TlVTOVEvR3R0a0dFOVY4?=
 =?utf-8?B?NURRTzBnb3B0Y1U5c1hjSHRDbHpiaytlZTNVbFFnWTRHZ0VBYjJ3RE91Mklx?=
 =?utf-8?B?ZWFGUG5kZE1VRmk0Si9DSlk5MjZSN0NiQ2JEQjhNakdVWmN6VHRsMC9hd0Nq?=
 =?utf-8?B?dmR3dVVHeFd2UVR4V2wrelZpQWtnMnRPWng3dk5xZzhuYnA5K0w2dGIzZWsw?=
 =?utf-8?B?bGl1M0dCV3g1cWpJY1FsSTh4OTlvb3p3SjNVZkdSMDVUUWlEdE10cm5iNllr?=
 =?utf-8?B?U0tOalIzRDcvVFdXQXMvdEFtSUcrcmo2NmJ6T2QvMmNudFlkU1MvcXNEaWNr?=
 =?utf-8?B?U0VJblp4bjA4ZjZwMElhaHBINEFnMkJsV3FCRWdsRGZqelJrajY2MGlxTEpU?=
 =?utf-8?B?R1lzV1BxdktjclRVUVNOUmJNUlJsYnVXb2JhNFA5ek5yeTIzVmFRQ0I1WXk1?=
 =?utf-8?B?UlRYMUxyVC9zNThjSXZ2RHZhcjQrMDVxTEFBRVVxa25FTkIrSWFrUlpRbFJQ?=
 =?utf-8?B?M2hPYXViZWZ4Ui9NNW5ZTzFHaG1hdXp3ME4rYjJKRnRaeCtSMXFWaGRtTzB4?=
 =?utf-8?B?Sk1uSjF5dE5TQjlXbVBLTVRJSWxYcktkYk9tU3B0YXFnU2pJV0VaV29xanFS?=
 =?utf-8?Q?+5/RsoPdCxRRJ/Sihj7QBG1Nm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433caa00-6e86-4746-d724-08de09f911ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:28.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y6lQX1GOuwIxz2vjIZZUfYDqlIWvt72owA48S5O2IsO3rSP1DdZpRgZcSbMzJJjWt58fSRGBwrMC5Uw6KQA6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 04/11] remoteproc: imx_rproc: Support i.MX8MQ/M
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

i.MX8MQ/M use MMIO based method to directly configure SRC registers
to start/stop M4.

Add mmio ops to start/stop/is_running.
Add i.MX8MQ cfg data, i.MX8MN reuses i.MX8MQ data.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 107 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a..c71e409a00a55179b06434dfa190e8eb8ba559f1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -9,10 +9,27 @@
 #include <dm/device_compat.h>
 #include <linux/arm-smccc.h>
 #include <linux/types.h>
+#include <regmap.h>
 #include <remoteproc.h>
+#include <syscon.h>
 
 #include "imx_rproc.h"
 
+#define IMX7D_SRC_SCR			0x0C
+#define IMX7D_ENABLE_M4			BIT(3)
+#define IMX7D_SW_M4P_RST		BIT(2)
+#define IMX7D_SW_M4C_RST		BIT(1)
+#define IMX7D_SW_M4C_NON_SCLR_RST	BIT(0)
+
+#define IMX7D_M4_RST_MASK		(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST \
+					 | IMX7D_SW_M4C_NON_SCLR_RST)
+
+#define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST)
+#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
+					 IMX7D_SW_M4C_NON_SCLR_RST)
+
 #define IMX_RPROC_MEM_MAX		32
 
 #define IMX_SIP_RPROC			0xC2000005
@@ -22,6 +39,7 @@
 
 struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
+	struct regmap *regmap;
 };
 
 /* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
@@ -38,6 +56,14 @@ static int imx_rproc_arm_smc_start(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 static int imx_rproc_start(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -65,6 +91,14 @@ static int imx_rproc_arm_smc_stop(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 static int imx_rproc_stop(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -92,6 +126,25 @@ static int imx_rproc_arm_smc_is_running(struct udevice *dev)
 	return 1;
 }
 
+static int imx_rproc_mmio_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
+		return 0;
+
+	return 1;
+}
+
 static int imx_rproc_is_running(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -171,6 +224,15 @@ static int imx_rproc_probe(struct udevice *dev)
 
 	priv->dcfg = dcfg;
 
+	if (dcfg->method != IMX_RPROC_MMIO)
+		return 0;
+
+	priv->regmap = syscon_regmap_lookup_by_phandle(dev, "syscon");
+	if (IS_ERR(priv->regmap)) {
+		dev_err(dev, "No syscon: %ld\n", PTR_ERR(priv->regmap));
+		return PTR_ERR(priv->regmap);
+	}
+
 	return 0;
 }
 
@@ -217,9 +279,54 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.ops		= &imx_rproc_ops_arm_smc,
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCML - alias */
+	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00008000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* TCML/U */
+	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
+	.start		= imx_rproc_mmio_start,
+	.stop		= imx_rproc_mmio_stop,
+	.is_running	= imx_rproc_mmio_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
+};
+
 static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mm-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
 	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mq-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{}
 };
 

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
