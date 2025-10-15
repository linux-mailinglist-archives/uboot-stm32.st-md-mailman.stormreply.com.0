Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF302BDC231
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98D9EC56616;
	Wed, 15 Oct 2025 02:18:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3177EC56616
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkzpW1Nd3nw8UtTE9715FMY4r1RskUL3rIKF2jsDZGhBroicA/AeHrXAM0Tn8io+EBF1ggOnp4gK8M8dUKgx2c31Px0cTvanfgC5SEHTuzNdaK1JP2sxjywgFO3mkcJe4wDuSABr52GWD/iaSJTcV3jRA8LSKm1gq72noWPNYCyGWU/M/KqwIniFWMrtrPAPfkaNylBaMZ6e9r/vJ4EZGwZGYfPymTc+NlRq8jSHNIhTReaW7OLgzPRkAHj+oww5GA0mFw7gy48D+CqHFTOKXa7lLVN8Gqw6znjyLXmDraHMNVKx7q5Rbj59eiev/07caIOcaMw0R5Htu68JCPnThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u3MVsYUS3KcpzStjz3hDy15NHdXBIWbzAKvOaXwrWA=;
 b=X4Ye40YOucisROsNgvjsvxdOwYdCA7nISiUgw0ukseVm6aTDz3kl3eCpFGKNfEc9Dy9ETVGqH9d4CQxfI4TyPYu5PKhdV/+Xlv2dHfrSxEtC7MnsQorZfQ/woJ0m3tAfIO5on4zA2hfQLNDeZZkhLcig4d+t1hN+shm0iukFsXiNNwR0pM12vRTlObBNCZWezWYYcr4XB3LRsohJ9XWV3f+jDn6ZoCwqEHKPYjQdSjtXC6Th9yOHUgABgBQuj77vkFYE6WmZwu4afolWDg5vqSCJApy968EqhsqSNEaHCwqj/QgZrRAuyH69i9FyfWmGlDvoscSRFqhtNoZ0wiqn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u3MVsYUS3KcpzStjz3hDy15NHdXBIWbzAKvOaXwrWA=;
 b=fjEbrefHIfVo093W1i6qTpy5b5QMazS3JbhNm5WrDbHGs9tCTSc2mMccmDr/bcx36028lOqWIEE+5iU9mnYTxRKysv0Oi4vgk/rhElYFcvoWxDVMM1TjaGPVquGTW2O1O4FnFL/Y74OQRdHBs4n7JygU6KuN7so2gNch6Oj9HLHkAiLbTwpgzhSHSY6AgIPYC6RwGg7SRiCMZcNwiRjMIuQsgpRgXkWaWy6pE7QCyGSTe1eltSjPjkoOpV1lsOWH9LgKt4A7S14v8k9oUv/NEdF6edCuUdXkcQkUQ1OtpvpVUySLk4jQAQRncWzuI/RQ0tO5nMHOaxEYNb69v2uZuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:30 +0800
Message-Id: <20251015-imx-rproc-v2-5-26c6b3d16c35@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ffe874f0-bb72-4a57-75ce-08de0b9125d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0k5aEprc285ZS85ZTdyVXZ3RCtPUjhxWEl4Sk5NVUk0MDFQenB4S0ZsUnd0?=
 =?utf-8?B?cmNoeHREaUhpdFdpeDZ4MlE1ZExLOFR0MExOMXVNL0NndWc3ZlpnZVdXd0RK?=
 =?utf-8?B?a0hkUWZtUDlmcXpqaWFKVUxNcW9ZMzNBZUVIQ1FlOUtVZlBmMzJUaUNPQ0tu?=
 =?utf-8?B?NXhBam9aUTQ0QkdRd081YUgvRldLS3FSV2c5bjd4a1UxMmZWM042WXBjYXVr?=
 =?utf-8?B?a3pZUVFsWDVJZW1HUkU0cUIxT1lURnJUNnYrNVBweUozeFNJc1pDSUZRTzE2?=
 =?utf-8?B?RDA0dEpPNnRiY09hZmN4aTdVWUpVdHh5SHZTMWhnMXZWTC9mNjVrOFZDVDJX?=
 =?utf-8?B?VnlLZ1ZsbUU5Y2IxNENjYnVRUkxEQXRQeFFxbUkxeUE0U0N4V1JMZWRlV1Nx?=
 =?utf-8?B?QlkzcWhLZkttUmNROWZ6Q0RkN1lvQlhmdTI4ZG1rOTNZRU04SWZXWjE0alBO?=
 =?utf-8?B?cENhbzU4UXNzaXJoeXVReG1JTW1nQUNBMlgyeWFCRVBycm9EWEs3MllTWUJM?=
 =?utf-8?B?ZTF2SlhyQzd0Q291RlluK1BoSWZlcnEyLzh6TXIxbDhPMzY4VlBxSmV1bkNi?=
 =?utf-8?B?SmRqalBtS0ljZFJUU2RaTmFNVFhHQjlkU2xyeUVpUVlqVmtoc3A1QjlYc2s3?=
 =?utf-8?B?M1VWZTZMcDFVUWxqRkJMWjQ2QmE0cGl5TkNTWEsvM3Naa0pTQ0V6ODhhRWtq?=
 =?utf-8?B?NVAzYUpLa0xrQ0srdExkdng4MzBZZDZyMWM1anVDZHBxNTZUUmdUQU1jS1dP?=
 =?utf-8?B?ZXhkZkRVZFJRWmUvZ3NqZzZyeGtpSmFSVldMcGVZcGZOM3F5dGl5dGJOUXcz?=
 =?utf-8?B?WVpmRE1VRnc0ZkkrQ0pvcmtIMVUrWjlDYnhkQkpQRWFQUmRnbEN4ZklRQUl2?=
 =?utf-8?B?YWFSTjRDcDhaQ2ViL08zZ3ZkWExIZ3hQL1hHRFZQOVhST1BhSEZhRXZCbW13?=
 =?utf-8?B?SU5qUEY3SXZCZlcrdUVnOXFiYjJDRFNMUXdVd0dzSy93Um5zRHVUeEthYVdu?=
 =?utf-8?B?bmVsVUhGK0o4K0VRM05iRXVUbWRZZGFjeVd0TVJOT2I2c0k2YndiV0FNb1l1?=
 =?utf-8?B?MUswZUJIczQyajhCd2hXcTV5Q0ovbGkvRXdMdWQxMHNZZ0d1UkdrMUZCNzB5?=
 =?utf-8?B?SFlzVVZJb3R1NmNHMXFwaWxGZVo0a041Z05IUHMySFhKM0VkZU5LTnVkNUpE?=
 =?utf-8?B?VE5TajJLYnRyL01sVUNUMjV1d1VYMjdHVTFGVEovcHllb282NVFxbnQvVlRQ?=
 =?utf-8?B?eFhOSE5qZ0NOblVhbVJtRGJvdUZtck9EZFN3ZHYxaFRBRTJMTnpHN00veHpB?=
 =?utf-8?B?MDFBVlI5aTRIaFBZTXcwK3dEVFBJbjg5TFhJb2l2S2x1U3NRKzBCajl2dTBK?=
 =?utf-8?B?aU9vaG5VdE1mNFdkUlpmckVTbGEzcC9XMWppTmVqcjhXRmhDcmtCeG1IMzBx?=
 =?utf-8?B?d3NSVGYvRWlkS0tYMml4YUg0K2VwRDQzd2tlMVBRN1lMdlF6a2thRlBoVklQ?=
 =?utf-8?B?YmdPdkI2OXBOSU1hY0t5ekxOWXJ6T1ErUzY5Q3dqOFhkUElGUXNrSDArWFFN?=
 =?utf-8?B?UEZlSzlzRjZZajJHVjF1UURRektISkxERlZFeTc1ZlN0UDV5WGNJUXpNbEtv?=
 =?utf-8?B?YW83OGQ5NFYxNkY5Zit0bHU2TlpYTUFsbFBvdDF3UDc5RVNRSEE3cUdQOWpT?=
 =?utf-8?B?cE9aYXY2Zy9xT3NRZno4RWpka3NsNGwyNEViOTgvblhsZnBRU0V3MklMaHNL?=
 =?utf-8?B?Mzk2aUJEbzdqUmw5ek5yZVVSRlk4OFNOM0w1d3JPNTVOZWk5a0ZYQTh4a0w5?=
 =?utf-8?B?K1ZQOE5lZ1VVd3Q4ckdxbTJTN0ZYN1hDSTJjRDZZWjJsSVpVNlRDM1ovYVov?=
 =?utf-8?B?M1g0OG1ZOWR5RkFkbXNrdllVYmZzRnpLSmZVWThqOEdTNXRWNnhkazJ5NC9V?=
 =?utf-8?B?T1NlZWNrTlJIakRvd1E4M25nR1d4Q1U3N2RIS3JvQWRqNjR6ajdEN1I5SVhC?=
 =?utf-8?B?bjEvckcwTzhUUnNXRHk1a3AxQXRxaHBxNGdaNzBTRHNVKy9pV0pTTlFDZjRy?=
 =?utf-8?Q?cg8W5T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVSdndZNUpZKzZJNHBIcExqQW5EaWhQSUJ5bWFBanRoeHJBRXB4Q1VIMWhB?=
 =?utf-8?B?aDFkL0ZnbWcyMWZ6N3lQRHl6Ujh6aXh4S0xBdE1EdnZ5NUxOV1d6bm9wdXBE?=
 =?utf-8?B?QmNhcSt6djFRME8yTmltYzVNVXZka3ZRdEJVekFienpmNk1WRmRpMVdZUU1P?=
 =?utf-8?B?TFdWdHNRdWNocmJLR0x2T0xucmgzdDJIWC9iWUxpZDZONElxMmdLWTV1VnJM?=
 =?utf-8?B?MVFTVnV4UzdmVUErQ205cFJoNlNJdTFOWWVkdTZtQTNmTEJMRUFWZnFIK3lW?=
 =?utf-8?B?MjJQWFM3bTBlcnJZZk04eVQ1TFFxNDhyODVYcFZZT2xpY1RMZXkrdVpBc0hS?=
 =?utf-8?B?RU9RV25MWXdESVFUSWZ2ZDYvc09kTEhuVzYrRzRBVUZxUmZTMXBMbENFKzd1?=
 =?utf-8?B?UHZIMTRNWkJzMWJXY1ZDRFZkZUtrQkZrSmVVZGIweXM0aGJUVW1jOUZFN21y?=
 =?utf-8?B?bWUyS1RES3RBODl3S3I2cFBQV2hXK1RKWUJIUmFmenlJMHF1NkkxWnkra25X?=
 =?utf-8?B?ZzZ3QXRGZHcwNXZRc3luNWNnM0N6SG40UHdLSmh5eWxLL2E4R3hhUGFsZ3I2?=
 =?utf-8?B?Mm0xK3Ztdm5nVURTU2JiQkNUNExkWEVPTzRCWTlXOGZiSjJlK1gzYXIwbko4?=
 =?utf-8?B?RzQzVlVzaG1BRWZYOFIzcUFHRVpYakl3QkpXeXhCa0xQczFrVDJ0b0orQTJY?=
 =?utf-8?B?bUhvcjkrUEU1Q1RaM2pVMmt5RUpyQ29HOEdVajV2OC9FVDFvQnJMSDJhSFFU?=
 =?utf-8?B?dE9nMm5ieVhieDkrcnZXRllGckVOQlFxK0IyM1piazJYUzlHWkFkUnFOZnI1?=
 =?utf-8?B?MG90OEsyekRxY2JYRTRhUDhxeDc0RnlHaWNKbVhWdDRzOVhoUmxYcU10dE1v?=
 =?utf-8?B?bG9Jd0Yra1BZM004NkRoRkRuZnRNNUNXcDI5YWVaaG1iVllFeE5qR0VUUGpq?=
 =?utf-8?B?YS9qNTFvZTYrV3NjeEdOb0hPODhTQ1RDeHhIZGZSaStTaUJ4Q2NPbmJhSXBH?=
 =?utf-8?B?cUJqSlZtcUxJZkpnTG85dE9iMWRyNmFVL2VzNGtjdXVvNlU3K2NVK3NidS81?=
 =?utf-8?B?b084MmVnQldVRGxDM3RjaHdRSi84ditjME1uMXU1OE5ROWRvN2lnRDdwNW85?=
 =?utf-8?B?WFlDdFYwZC9rb1M0MEorRHBlNEVJaUk2Y3lMcnlyYTlNMURzMFRqQ01XU0RV?=
 =?utf-8?B?RHNoblJhcVp6NllqMXRoUFpsVncxZkZyeDdYMzJqQjV4R24xN2Ywa1VqeVBK?=
 =?utf-8?B?b005Y1pOdkEwN09TZnp6WTZ3VVFDdFZZdzA0c2YzL2RQNmR2b29McnB5blZU?=
 =?utf-8?B?L0t6VkdkR1ZqZ1dMbGN2dmJ0Y2dWbDR2WW1RMnZIaitQK0hpSWszRnJKS2Z5?=
 =?utf-8?B?NEQxdVVNVHNFSHJDTStjSkw0SVBVajVXSEUyWEQ5V3FKVDluSHIrNEhzV2JY?=
 =?utf-8?B?SDF6dUxsb3Z6SjRrbmxXejJYMjQvTlM5TnJNTnhOenFIOTBOTmZ5ckJQUzhF?=
 =?utf-8?B?cU0wampOSy9jb2ZBYVZkTEZ1SUpyVEhkbnZ2ZUc2SUY4K2RYTGNSaC9sTjEx?=
 =?utf-8?B?cVZTWHZHazdpdEYwa0ZYVWNhYTBQN3hURVVyTEJTT3ZidG1SNkY5NVVtbnU5?=
 =?utf-8?B?VjRHUnBhemJCanpDQTBsZlNDRjFpQWlKSXg5QVF5VWVNK0FxVGdta05BR0tv?=
 =?utf-8?B?MUZJWlpDNEtoOXk1UjdQZlhUdWpnWmlZb2xUNStONlltSzU5dldZUUk0bU1h?=
 =?utf-8?B?dGJ6aWEzWmtTWHJvYmM2KzRDcWx5MU41WjVQSHl3eEQ4cVpEQWFBU3ExQXJa?=
 =?utf-8?B?cGxCSHRhcG1ZS2YxUHV1U0JUclEwL3lNMGNRQk9HYUJOeTdOeVRpS1ExWjZh?=
 =?utf-8?B?d1greTJESGJZb0NveldDaE9xb3BIQ0pnQ2xwQ2w1RU1zaUZmNVVtNVJUR0xC?=
 =?utf-8?B?KzB4K1pWNDFVQ2RRakg1VmdTQjRCMFhnOUc3bkluejNSZVJJaE1PUzVNVk84?=
 =?utf-8?B?eFZIZTVKVkJISTRBMHlOajRnUExabVZYSGVERXFQTDBSZlZtdkI0S3V6L0o1?=
 =?utf-8?B?RzNNd2pNSkJmc3BvK3Y0M1d0YUExRWMvdXBla1BEb3pyS2xHdmxhbXdMK1hn?=
 =?utf-8?Q?JlFMerLH9oVn8Sj2Ng73fth76?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe874f0-bb72-4a57-75ce-08de0b9125d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:36.8014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHWZla2cotDWirD1RJH9aT+9J75Xk4m1XHkXaVZTdH55AZMm7q0PoVFItbWFS1VW26RXedfbupXjSCw8Hsk9Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 05/10] arm: dts: imx8m: Add remoteproc node
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

Add CM7/4 nodes for i.MX8MQ/M/N/P.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/dts/imx8mm-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mn-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mp-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mq-u-boot.dtsi | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm/dts/imx8mm-u-boot.dtsi b/arch/arm/dts/imx8mm-u-boot.dtsi
index eb5b95a1fda7c37f8911bf1732d20ee9ede4c198..d891e8062fe557d6855f07078918b56e23e4c053 100644
--- a/arch/arm/dts/imx8mm-u-boot.dtsi
+++ b/arch/arm/dts/imx8mm-u-boot.dtsi
@@ -15,6 +15,10 @@
 		};
 	};
 #endif
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		syscon = <&src>;
+	};
 };
 
 #ifdef CONFIG_FSL_CAAM
diff --git a/arch/arm/dts/imx8mn-u-boot.dtsi b/arch/arm/dts/imx8mn-u-boot.dtsi
index 4a4498b36b012eb7aa22a3feeb043013068e961f..29eecd6d70d9f6c9fef48cda9fb560841ebd4aa0 100644
--- a/arch/arm/dts/imx8mn-u-boot.dtsi
+++ b/arch/arm/dts/imx8mn-u-boot.dtsi
@@ -16,6 +16,10 @@
 	};
 #endif
 
+	imx8mn-cm7 {
+		compatible = "fsl,imx8mn-cm7";
+	};
+
 	wdt-reboot {
 		compatible = "wdt-reboot";
 		wdt = <&wdog1>;
diff --git a/arch/arm/dts/imx8mp-u-boot.dtsi b/arch/arm/dts/imx8mp-u-boot.dtsi
index 9ede98a11e42f6279d654443bbb2d7059ad53d81..d9d220c70db600a7be1d021a0c4e8927a2f2b17f 100644
--- a/arch/arm/dts/imx8mp-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-u-boot.dtsi
@@ -16,6 +16,10 @@
 		};
 	};
 #endif
+
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+	};
 };
 
 #ifdef CONFIG_FSL_CAAM
diff --git a/arch/arm/dts/imx8mq-u-boot.dtsi b/arch/arm/dts/imx8mq-u-boot.dtsi
index 93e2ef27f7ced9b3a471e1dc41be4b1861ed0b81..0687fcdbd68b210aa9cfb89e87713e9a5aff0754 100644
--- a/arch/arm/dts/imx8mq-u-boot.dtsi
+++ b/arch/arm/dts/imx8mq-u-boot.dtsi
@@ -7,6 +7,10 @@
 	binman: binman {
 	};
 
+	imx8mq-cm4 {
+		compatible = "fsl,imx8mq-cm4";
+		syscon = <&src>;
+	};
 };
 
 &soc {

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
