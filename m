Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CBC306AB
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 324FBC62ED6;
	Tue,  4 Nov 2025 10:06:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013033.outbound.protection.outlook.com
 [40.107.162.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FE3DC62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNQWMBEDMozhWXh4HSNWg3Iu1duDI3RM3Q8vkTOmve9yXmn3NRHPQbnKuruyj6+JwmixadHkEavXQ/9G5lF5pVIj9bl3yKXWQr7FSDbqDiUPdBdc0bT1Nn9dJQEosYNDZKtl45cmOWKc5anFO3yqv4WS4XStAW376C8ZOgKdtoC/nEAaiwez1V3jZqzS7qNTf0ZVN5RTNUwI09cEK/qX5QAVt0nCkDp0Duu146IsZdp0u2bdhoxGbKZ4NhuHOgOWDyptZ/EyV/a+nghY7lHMbg0+IMUDr71vaErLpQdrNsjWm84vur6eXoN2fHpuBvOLiz/bd/CDDulAbJfhR2NYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRNwx87QJ2PyOA7st9LXNleHrCXtzwk5cTwnRfw1iIA=;
 b=YJ02llSZUig2xaXC4gfIt+uReLwawQf+p4jrR14Q9cfRJTT0Rsfl+eMDPaB9XR/5WZHJjEMNg7jsTaAKiQQulbxIpkg29sIyhobVE7zID3SZDJq4xGi3e7vKE4MYUGpfo714qPd1EGnBeYfca8iPYTj0ifuNDXw4KNual4JjygF2+JPnfMgZyaMYepW+CUoekvAi8X9YqRlMTvRlYkI8ONeYd52xtKySicFj1RT6wISa5Pay21jEPN++/4IdB/reMuZq6mR762wOzZpb4mzvT5hjPNzDoqFL3GHvqfgE/QO9ezpNtS3ZD3RH1LYVZ8YcggpKi/TQ9rmd739wJ+ZoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRNwx87QJ2PyOA7st9LXNleHrCXtzwk5cTwnRfw1iIA=;
 b=Oz0sC+SdGqlv9U3kih6Jr0r1+PSrIZBvjX/XQq+Zlwxe9+9kjxXbYDKJBOMu1US1tj8nsQ4r8p8QM0rm4C40EtNHWM32AtPRuBGGOYAyPamiJKcpxLWE9ppF6leA6eHBXHrXFB4VYRzyu1aDhpNyoW3JY5/g7oweAesMIF9amNSHQb85BRPEuTerHXdfnBQuEqDQ045PcKB2a1H/0sNNS9bnx3IB2RyrBCSf0Jlt6Xq2k8yOgofIY7YzaW9Bg51lOLwLP5cVI5skCmZMOjpcfNl3AQwfFIOxMfAj/RZS/IL1wspLHaPRhNMpEI0R6l5rXTHlxuztE0cQviAe4N2FBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:44 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:55 +0800
Message-Id: <20251104-imx-rproc-v4-v4-6-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=768;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=AgxJJoH9e19HaqesXgQu6Wgn9SdqPUMsK5Gp89CdqHA=;
 b=e7w++yYLNTytQb+DZoOthe27O8WcanrdaPVerpav9UZSdWYXdDbq34BJ2dwNdqrFk36NSCgbA
 rTz+NpiKgQYA/hzJby0ZZObg3R1lg6+Ipw8E1xqRiUPi4910t1k22Xd
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b37bfb-d32a-48da-048d-08de1b89dbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdSb3pwaDU3WnJGMS84eVJFWU5FNjBYTXUwd1lzeksycHBibGMyeExzSFhE?=
 =?utf-8?B?bUhyc1g4RVBMNFMyNWhTUWQyL0MyU09iNktOcTNZM2dZL2x0Yk1TMjI0OVRQ?=
 =?utf-8?B?U3RocE1iN3ErZEVqOXFmWWM1cW9EL3lhNjVGb3dkWjUzR1FDMFVCSjZLUml5?=
 =?utf-8?B?dlhEbDNLejRDRnB3Wk40RjR1WmlpRmkxblBJS1hNalZzWldpRWx5ZnFHZlZm?=
 =?utf-8?B?bHZKcXRtYTVFdkZ6Zk1QNno4TFA4RWxEdkxBQUM5WnNQeUlHaTR3OWhyR2tF?=
 =?utf-8?B?NEZZbmF6d3lNaGpvYVo0NFZCajI1SnlxZVQyeTU1S2crd1krZXA2eHdkeE5I?=
 =?utf-8?B?d05FeUJHK1lZQ3VRZVRKdEIyTkFSMHo3aDNESXR5QkI5VGhQQXRrMHlYRGdI?=
 =?utf-8?B?Z0E0Q1YzOHFSMmVzYXJ5SVVSYlBKTG9uZkxCSHViOHBFbkduai9uRnRHbVFI?=
 =?utf-8?B?b09NS21PcWUvekJwNlNpVlpZc2dhOW9hMVdXVjJEVVdKRmNMcFFGNTBDbXlM?=
 =?utf-8?B?ZHpqWmVjWFJtSDBGeDZXYk1kYitOQTloaVZIajRzUmxCQjNsa21ZV0JQYUVF?=
 =?utf-8?B?L0xFdzhlNFdMbllyMGhSQjVjT2x1b2dOVTM2Z1djckNxTVhsUmhZQ1RwR25I?=
 =?utf-8?B?a3YzN0k0V21BRldkeHV4U0Mya1RPWGpVSHA1aGw1Smt0dDZYU1BNVVhLT0ZB?=
 =?utf-8?B?ZFczZVExanZtbkkxKzc3cFlxWDBPZWhvblZORXNpZjYvUVNXVkNPWmVEejlr?=
 =?utf-8?B?Y0pMVjc3Z1I3Q0xKMTJ1MW5GUndIL3JBVU5mY3ByVHhobGRjSDdML2NSY0JU?=
 =?utf-8?B?QlNnbk9iMU1WdVJZWFZudzl1K3dFNzZUL1dTay9Ecm5MbE9PVk16N2hPVjZr?=
 =?utf-8?B?T0xnUHg4K0RlZjNCdXZjdk52KytEZUxEM0ZlUDY0YTVJSjJnMXZPd0VIL1pL?=
 =?utf-8?B?TmF4M0VWMmk3K0U5Lzl5MkFoWVlKVW1SRHFaUmVkZUJuMG5vMmNNMUVWMDlu?=
 =?utf-8?B?dVY1TmhTb2xnaDY0VkJsNVZIbjlGQjNpSUZ6QUhmZ2Q4YktReSs3Z3ArazlH?=
 =?utf-8?B?dkVyc0x5blBJaWRsNHlGRWszbUdrWENmZU81aXpMZFFNWkJkNk5vQkdLZ2xj?=
 =?utf-8?B?TVpHdWxNYnlVanBJZGJlc0xZVFgrcmJqYjlaT0ZkdnpvaHV3Y0hUZm9zaE0z?=
 =?utf-8?B?bGsyU3c4M2tSMmlMbVFaL2tvdXNxMWNxTFYvdEhQc0xLRGxDcHc5TExlSGRW?=
 =?utf-8?B?TFJhN2F1SFE1WUdkT2Y1YnVQQ21NZThuaFl2T3EvZC93Sk00WTVrbzk1dHJr?=
 =?utf-8?B?OHpOK2VkSEtmWTdidFluVEpSTjcyZUg0ejNSclJiNVJhMjNoQkNhNUR2QkdQ?=
 =?utf-8?B?RGF4ZGtsc1NaVVMzdmc2dTBBVWlBN2t0RWZWOEdBV2F3RWxVLy90MHV3RExW?=
 =?utf-8?B?eDczek1kZFNqVU5BT3gxRHUwUnJTN1IyRE8xcTN3YnN5emZJVHhaS3llWkZo?=
 =?utf-8?B?azdJM1hZQ3VKY0grUmJiVzcwVmpwWHNvb2lkMEMxYXk0YkN5WkQ5Z3RBOWpN?=
 =?utf-8?B?L3hzc1NUdS9TTFBTbUJYQlNzcGhvMWRrdFIraENMamg5T1VIRVlKdytxV3lM?=
 =?utf-8?B?bEZTR0ZGNWZ5azhtNHN1QWM4TDlwb2tONGVBTVBNWHl0d0dIMWRGeU53U0NZ?=
 =?utf-8?B?VFFlc0FEak9PM2x4VjdteStKcU9KT0JhRjZON2R2MlJZUTQzUkZEWXJiTW5T?=
 =?utf-8?B?NTQzeDFHZHlCTkNxMFZrZVdKTktMNVB2MkpBUzVTTTA3VFBNZ1hqT2hHa1dJ?=
 =?utf-8?B?OFdTTkVBVi9QTG5RdENnamZ1UGdqNS9lbUc3TlErUXpIUXRabXNLc00xS2Rt?=
 =?utf-8?B?ZWdxNjhjdzZESmVGaTJqSWRwN2xWVGMzNEZTWC9mcWU4cTE1Y216YjcvZUU0?=
 =?utf-8?B?eFBTOG85MFpDaVpKUWJodmNzWWwza0xMK2NsTmlXR0lJWHdWemJ6cHZKUkp2?=
 =?utf-8?B?b2pOc0QycFBxR1ZwNlB0YmV4Z2d4L09lWitMQlhMZWJDc3NSMkVHSS9Kb3ly?=
 =?utf-8?Q?I/bO2B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0VRd3FCWXRwcER5cWVKRmRnR3hONlJuS3NTVmVJYnhuT0Jnc2NFam16c0xW?=
 =?utf-8?B?amE5SDlWSGlLOFBic3MwUDk0b3FWUkdCOTJqR3NmMUl6aVFsU29FZU56Y3JX?=
 =?utf-8?B?SlFabW1JTTFzS0tQL1l0NlhDR05RcHhhR3VpT3FkMm9sUFhDbmFhOVg3MUlk?=
 =?utf-8?B?OG5NRGtGcVJWa2R1YTBCTGNwUHlkUVNDVzBoT2xxdStMZTJ1ZC82S05NTU1l?=
 =?utf-8?B?dld1V1NBRVdDVGVsYjBTK01NOUhpSVRJVjVJbVJHK3gyUThQWDJKSTV1WTh5?=
 =?utf-8?B?elp2c3U2QTQ3TGV0QnFxNzNpM1R0Yi9OeHh5eHJLdjcySGZCRElKY0dtMHRp?=
 =?utf-8?B?N0Z3TWJkeVdvMG1TOEt2ekE2c1BTZ25yNEdtRDBOV2VPWnd0LzNPTHJLdlpP?=
 =?utf-8?B?UWNmcFMrUGZPL2JQMkkxMVZJR21YK0dRSFRaM1VGVVFrTkVlMnp4ckVTWUVh?=
 =?utf-8?B?ZzNISytvOGdHU0hEMlF5L2JPdUV2bDhvSDcwbm5lN0hHNXZEdThaczFHczZ3?=
 =?utf-8?B?VkRpNW1XbE81N083ejlKSGlZQStybjlsMjNEOFlxUGtJekR2U3dDMVV2TUh3?=
 =?utf-8?B?NnVNbUVRQlpQL25SM0U1MTBMTVpnTXZNMGRyVG5oQWtQWWVzOURHV2hLb2tW?=
 =?utf-8?B?THE4SFRVSWpxamlSQXppbXVENzkxRDlndUljNFBTdnRPelpQYm1odzhaVDN3?=
 =?utf-8?B?eDJpZWRxS2hFZUpYOTdaczNXa1J5a2l1TTFkRHg1N2o1d1d1b3UyQ0QxRHBO?=
 =?utf-8?B?Vk05bEVZeWZ4TTR3SUt5UktZQkZZYjYxT3YrUDR0NDNpVlIvdVl6R0NleCtn?=
 =?utf-8?B?aytJbWdBMml3ZkVWd3FrcHIvektGZTZONjZESGU0em10UXlaWEhLZjFFL3JV?=
 =?utf-8?B?Zk96T1ErVkJySlJ1V2hqQWduMWpicFNuQXZMOFNZekFuWmloY3JyYThBMHJr?=
 =?utf-8?B?T0UxWS8zenlydEFOMENBSW1BQWljWUw0SkhqYzJmRlYzMjJPVnRWMGlNdmFp?=
 =?utf-8?B?VVBJSnV1aHNHQ3pnL2U0Q05JSEVUZmVqZ2RXYWFFSjFFbldJY1pQaGZmWDA3?=
 =?utf-8?B?WjR6Zms2UUhjd2JJQjd4SUl3QlFMQ2xXakhFWWxnUE9hekFmQi9QVU91elVO?=
 =?utf-8?B?L0pnMEpnM2c0UUJ3RWlJWVVLUGxza2JiWVplczhhWFFPMWlGemlSQmh6bnIz?=
 =?utf-8?B?NzFMTjNBOG0vR0FkVGRGYXZ3ZGpRNVN5Sk9GSzFYTzRRZkEvYVh3K3RJaGwx?=
 =?utf-8?B?TjJGdzNGY2d0MXllam02U3lQdlgyM1owanFneVN0cHEvc05QV1VYMkd0aHVF?=
 =?utf-8?B?eDJVaHpuanNyMWRkc1pUZjVnanpHd1EwYkJKTFBsbUdrQTBMOFdaVTB3SVFJ?=
 =?utf-8?B?ODZ2cFFCQVdGZzg0a0k0THY1aXJvYjRXRit5VElYZlB2Mzh4UUQzWGludnJB?=
 =?utf-8?B?emFaTUxjVzRuaWJtRy9xYWVSMDRkbjl4RlhWSXBJbWh3MUlDa1FCOWRaa1kw?=
 =?utf-8?B?TXJzNXY5TjdCZmI1NlQzSDJVT2RUaFpJVUFKOVRIYW8wdmVjS2M5dzJIeUxS?=
 =?utf-8?B?b2RPN2ZDL1hraEVlMlZIWnAvSlNpb0xlZG01YUxidVl3dWhvcGpkNTVzL0k3?=
 =?utf-8?B?SDFQYkNPcnBnSCthVHkwM0ZnSFUxS3QzWnVWb3RSTUlxQTNJMkRUZm9pS1hV?=
 =?utf-8?B?Vyt2RW5Ya1kzQzVyOGhEdStQWElUeS9seThXOGgvbi81ZWsybTJNQ1o2d1d3?=
 =?utf-8?B?eFp0TXhmcmxONElXU3NlcmNhR28yRHRqOE9FUC9QSDRYWko3NHpLM3FVUzQ5?=
 =?utf-8?B?WlJIQTR0VmV4Vi9PWURacUY3Z240SUNnajd0N1JMWUJWT2kvbW5nQUxBRFFo?=
 =?utf-8?B?ZWw4Z1oxY0t6YjNwNzJjS29Hd1A3QUJEeUVmRnBPalZQZzJyQUdZV2g0Zlkz?=
 =?utf-8?B?eWlBSGdCK2NpN0R3dzB2dU00aE81NHRGVHhibDNSWUNaT1UwcWpNL2JyVStt?=
 =?utf-8?B?ZTVlTWd6SGJQZ3RkcDhJUDlGYnMreDNVQTcrRk12eHNZV2Q0NzdTL1c1VThY?=
 =?utf-8?B?U2Z2c2VTMGRWZStucmNDVkJKRk55VmlmRTVFRTNqUy82YWd2c01NcWRJdUIz?=
 =?utf-8?Q?mbvPNDtdRae2QP+Yc6D5rd2RW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b37bfb-d32a-48da-048d-08de1b89dbed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:44.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9Kz4Z4p5kwZDtZin4jAvlH3v8PZuuumIrp0tKLp8eLfgobYo/bADDF8/b+4zUwXH0WF7EMcUtDqDBKZGnJTYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 06/12] imx8mp: Enable remoteproc for
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
