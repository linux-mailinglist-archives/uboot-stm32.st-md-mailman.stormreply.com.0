Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25EBF986E
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 524E6C5E2C3;
	Wed, 22 Oct 2025 00:49:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3D33C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O88Hg3DNba0wXrpsJTZ+tp416PUypiClD9OCXQUW5XIBlb+xx3EzXJKxtNFvGyegkj7U1zpT7apsPVnK92DYB4i4G6O0OgpXv7UN1zMQ3Y6/RYZhJ5gWP3eTaQcjWUl9W1ko589q31icPP/Hxeq7GPgk20hCXhhSSdoBVQajQJxWCqJdt9uziE5WEAlwTz9TajycfdoIoQBdKJcKXAKrh6v4m1Ig0Qj2sVwFcprD2fdnYf9kON75uxjIbB/6xt/JUgx1+o2/EJW0wFeDLHbDZPaMJdZRXWmKwJ60Go1tsb4e6zHi5B7Rd0ofoU+v9NrwVc48RZqDbG2zG9SOBRtr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OW/cRKiktSL/h+uqc5lbUScLOFkhCGqWAHNZsU+ATuU=;
 b=IT+Hpo8m2kim/7OzyNUyGi8TG/6f1CEvPZhNiWKIrDDyIGilFCwg1iKG72PqWhVPbUYaUUm1ms5gLGsdzWtduS19bdeSYY0lMfrL+2T8AsNCsH3dRhgCI2uUoPkjMYLg08vWkmFkiYsLfWBT8uJZpxTcJ76vF91GCJ+ESIVapzf3WDSbupw2Pq/3OGrWWLCMZ+JtygZL6LWz9i1hluNoCaQLQmkinB8vxF5dM6pDS0Yb+87BRqfyjGHdn3UYZF9Jn68t+5zlZxP+/BYvqufh+GV78K3Z/c82ulIsQvxkRFfbfKL47S+Qv4uTj2du98tdsrI2RLlCY/AIw9aM249lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW/cRKiktSL/h+uqc5lbUScLOFkhCGqWAHNZsU+ATuU=;
 b=QFUNVHDGVLsM+QTr89pGzRWk73RZUmmwbrGmCLkPXklTxoEzzW2Grb5aSuR0hhARVUmI52b+2XocoaB+4/kzPEa6vgcRawtmlc7JNvtMkq3toaUom6EEZ22/qYRz02auvORkuKwaqDPwwtaFsmeqUqJd+DxiKTsE7h71L0cDUGRJHbRmy1Daq/zrPellzi4Dsvcc38wC8usE7JSvOU70iAMb7RLNlOUO7SvrIwON06VVHEiNhjijnupM51kN/7X3JGUSc0pzXko4LrUU/pEOsSkOrHsOkMIY2H8aTdHQAWDltfwHuY1oIPwWwGjYbWT6cwitr6WOfUoCNh7F94ncdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:49 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:37 +0800
Message-Id: <20251022-imx-rproc-v3-v3-11-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=2980;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=L5QXfkmgv529WLT08enPOsmXl/OhWm4EYKd4UsdTxD0=;
 b=YRIVgkIPqUMwQirlcpsr3pvszJe0kL144pBCxTl0u/fxYUFwMeTanYhf4/nWK8z6sLF0phu3O
 jz9RWiefKf2AsF/Qo+JBVNYVTkNv14P+IEpHQAbzB5q16ovPrHckgoB
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2c20c7-c383-4e33-23bd-08de1104e78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDl2bmtkdWtsWTRlVWJoZkM5alpRb2FmQm90a3crdzNERjJEdzR1VEpCM3RX?=
 =?utf-8?B?ZzNmVkRYNDdWNjV6M2U1cDJENit4djkwSDlYWW9OL0doVDRyUXdPTVFRU3ZL?=
 =?utf-8?B?TWEzWXo4VkdNamxIR01JVnM1US90K2dyZS9zd1k4WXRDOHpGQlV6OHArbEJT?=
 =?utf-8?B?YzhyOFFJRVNSekxpd3hkaEZwd0VoYTY1eDMxcTV2eDhiSWpMQTJONlZJdWNu?=
 =?utf-8?B?YWpBMDlUWE9ic0tJdUlZNWw2UmZaYzNHRW14NEUyclZxZHprQTErRkVjYWxz?=
 =?utf-8?B?RVpNTEhxS1B2WG1tSnhNQzJtVmJrM21jVHRYQSs4aHV1NWh3ZXVCdytseUtE?=
 =?utf-8?B?RkJ3SnJOUVBTeVJnd0tFMWtpNU5RbTdRUk1YUUhBOHgzU2Mxb2M5R29aY2JB?=
 =?utf-8?B?TFFyT3FZQnIvZWN5OTZCZGlxU1BvOVREbDdobzE5MXRGVk0wZFh3elNQcTQy?=
 =?utf-8?B?ZTNjL2ZOV1V2TnJ5TWNBdWVIM00vR0NsUFc5dS9SQkZIQml3ekxJWElONVI4?=
 =?utf-8?B?Uzd2MWxlMkh5VGRHMUtLSCtmVWF0SDVURzFlTDU0YzB1YzI1YW52RkNJVGZY?=
 =?utf-8?B?a0hIZnZyaWgzVk1rUkdwd0hoMC82K0NlYU4yc2swV3locFUwT1dNZ25XSGhn?=
 =?utf-8?B?NTJ6U3k3TkdIdVRTM2wzcVhETEFNQVQ3My9vOUJ1S1VQUWhsVXBOaXpMYUpy?=
 =?utf-8?B?OFUyaS9QWEdZOW9peWJ0NnRSL0UvZFp3RFRKMlVQUnNSUzMzUXpOWHdYWmhi?=
 =?utf-8?B?WUQ4L2tyYVJTNGE1dFAxSVVKK0tGM3hhejBMS1UxSlJNWmVZREtGWXFPMlUy?=
 =?utf-8?B?eTg3M3NzRnNVTmV5SHErTktqSklpejhBbFBsTit5SU9ZUTBLa2hxaFdPSFg5?=
 =?utf-8?B?MzNTVEwxOHpqazVhSkVuajRicHkzTVBiOVNFRUx0SUR4ZzIvNndJRDBrdEZY?=
 =?utf-8?B?TzlqNCtKWUVjZVRrSzBXNTl6dElOY3JQNjRTRE9rZWt0L1N1TlA4Q1V5ZXZT?=
 =?utf-8?B?dW9NeEdzMEtSVkVBU1dldVhuMGNVNmNxaTlNVmdPMUlCYThxcDB6RWZPdDBK?=
 =?utf-8?B?VmJ1UGh2ekF2ZmRZb2ZseUMwZFBRMEx2dGk3RTNhTXZ5aUszYjNYdGN6YjlL?=
 =?utf-8?B?UWlBU1BxSC9sYk5BWUQyUjg5TXBuMnBWVUVJdEZReGIzY3BLNm8yNk5QVGtY?=
 =?utf-8?B?MjlMekwxOFMxWjJOWVp3ZWkyYXNRcFJMZlE4UGg1WmR4dnJrc0RnQ1F6ZVM4?=
 =?utf-8?B?Q3RCcDYrMXZuSU9MNjNnQTM4S2pidnpLdEFHNXYyQzVNZ3J4bk1mUEUySGlw?=
 =?utf-8?B?aUR6bm00cUdIdXMrNndpWHJPUXRQUzhKQjBpTUxGcGJyKzdROERTcnFrZ296?=
 =?utf-8?B?bEpOWk96bWZEL3dPRFFEOUZhNE9uTVpGUm8wMTJ6NTROWmwyL2VidGo4UDlW?=
 =?utf-8?B?bmFWMHFiK09yWXpzNXlPVGdxTUJJVitZRTNRUGlEckMvb3hXcHhSTlR1RWlY?=
 =?utf-8?B?cFdMaFI4STN2ekdLaWltMWdwYkl1WVNoSTV3cTFuampjZkl6SzBuTVNXM2xI?=
 =?utf-8?B?UHhjaUxlejUrQ3NuaTk3ZmwvWjRzemQzbmxOaWw5SFI2NUZxbVhScTdRU0ZU?=
 =?utf-8?B?WjhhajZMKzc0SG1pMjJzNXZGcXdFTExtY1BGTzNCVmhhYlY1RGc0dUZnTWwx?=
 =?utf-8?B?blNJMDIxSVZyU2YwZkl5cGdKQVBTcTZianlqU240c3ZpQ2NQUkRQUEFQd0tB?=
 =?utf-8?B?Z3hiSmtxS1FXc1dVZ3V6ZTVrZzY4TlhqdXlKNnhRcUJpazVUeTR5WEJ4Nlcr?=
 =?utf-8?B?RGh5VjFsTllINnQwTWErQnF0ck5xNlNYTS9sVGpsUEVUQWZhdldNYjZzVVh4?=
 =?utf-8?B?NGNURHN0ejRnSEJrdXhtYW1hclVyNlFiU05ya3FwQTFuV09kMWtGVDhKY0pE?=
 =?utf-8?B?SlZGQ3hFRUVkYVFkNU10a0R4OUlSd2hQcTdycDhKeDVENkdUZWdzNVlvbU9H?=
 =?utf-8?B?Zi9zN3Q0eU1OUkM1QUNyb3V6aTdRMElKQTc4YjdnZ0tVMlpmT05ySVUzYUVG?=
 =?utf-8?Q?DyVtWQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qms4d3Z3ZWk5cUhhTmtVbDNZdjNERC9lSHMxU0JHMndDalRZNzkrQU5XQnp4?=
 =?utf-8?B?K0wyQzVhREx1WVUyN2NWaEhDK00yTUo2blZHcXZucko0QTkycm1WaXp5OE90?=
 =?utf-8?B?T09xcnFCU2RPeWJrTFhpclVDN0J1NVptb245VE4xVmRZYmViNEFNbDVZT1hE?=
 =?utf-8?B?UVk5ZDN0Nm5Ia3plY2hTeGhIVENKUzZPU3E4RldXbW93YVM4dTRCd1JoWlpU?=
 =?utf-8?B?TlhDSWZOazVhcTdaZExTb2NNN3I1OEROaGJNaGxzVml0WFNMYWIyZ0xEaUtX?=
 =?utf-8?B?aXJ5S2RyaFVnL25vQlB3U3ZFblBVbGY4K2dXS2JuVHZneXJhODE3dHBiemNF?=
 =?utf-8?B?NWl5bGE3aU5ERU05eEJGMEcwcWQ5Q29jNW8vWm5vbzNFYU9wbDI2eldQRGwx?=
 =?utf-8?B?ZlA0L2tOVTFENFQyMFNsbmFNUHlYaEx6eDhSNGhQSFNiR0R5cTJXN3RIaGUx?=
 =?utf-8?B?L2JmUW14TFp6bitLK2NadUhwd0s4bWJwSVdYYnBYNk5XV0ZOeExGdDJ3RmVm?=
 =?utf-8?B?Vml1RW9Ob09LbFk3c3FHQlNwNXpkZWY4cWRNbGZ5NzVLdGNHV01TTVRIRFFo?=
 =?utf-8?B?bU84L2p1NWFnbzdSTFpxWGZNd1A5NWN6QW1KZ1U3VHFoS0xPcmw4anU1cFIv?=
 =?utf-8?B?NkRaTC84cko5RmphOHlFSmVxcndHOGxDQXZvSXN5WklmcW5IS2JCbjBIWUQ0?=
 =?utf-8?B?VnpEV25yRE5iWU42LzFxMUJzSUJCQkM0UDFxZ01mOW4zS1pMWVFyZXFwTTh1?=
 =?utf-8?B?bXRqMjltR1lzQThFMTQxQ3V1eEdsdTVZa0lETzQrY3Rpd2JDZ2pFUnRiSlBo?=
 =?utf-8?B?RDI0Uk5laGJJLzJqWkJzTXpBQ0p4WFR2TW9xckgxdVAvVUl2U2NrdlhrN3BE?=
 =?utf-8?B?b0lDdlp4VTBUaUdOemlWSy9VRWtHbGpYOVZkd0pnOHFYRFFvSGtBVTNON1Nu?=
 =?utf-8?B?OGx1SXdkNWljSVpLZ1BxYXRwSStVYVFRaEZFVmRyUkxUL0p4eHIxM2tsWEpB?=
 =?utf-8?B?VDVhRllUaHF5elgxSnhBVWdQcGxsdzdIQ3pldG1XbjVSNUxKTXA1YXJKWTJT?=
 =?utf-8?B?ajcvUXZIcGNmQ3B2TER0bWVPUzBNa1gwbVdDRGYvZnZwYlA2Mm84KzNIRzdu?=
 =?utf-8?B?SUlDZ1AyWmdwS1NUR2xzS1NKOTg0UDVOQklMVW0yK3UvUlBjcVgrcUc2MjQ3?=
 =?utf-8?B?eUNaY21SZDJReE51TjBMa1llRVF1SGNqUGlDZG5aKzBVOWVVVitxcENQcXpU?=
 =?utf-8?B?V2VJWXBDYVI0TGJxMDVia0dxZnJDcDdaaXZCZWdVcitld2pOQ3hNeXphV2pP?=
 =?utf-8?B?emNqdE1mWnRMVk1UQ05jVThPMTVXRmdvajIxWGJidzZGaWk5NHIxUmN5aDFu?=
 =?utf-8?B?VWx2cmcxbGhqSklvejhjMHc1U0xYeTk4RkowamNQU1JQeEVZN0lPRHl1LzRj?=
 =?utf-8?B?bHFsWC9aS0VQQlRyVko2L3JCZWozRzhOQi9yc0lzcmNsL1U2VXB3ZTNKOS9E?=
 =?utf-8?B?MnlWb2J5Y3ZoaHdzbUgxLzczRi9CK0FUTDBFU3JQZFBGNnVYU2Rpci9acS85?=
 =?utf-8?B?WmRncFk1NUlCbDUzYUYvRWtzTW84ZDBZbjRoUE5jbSt0TGtQUnRuTlJ4MUEz?=
 =?utf-8?B?dzhwdGgwR211RSt3YlpDUGhMb1BUb0phWHhuNmtxTkoxRHdJSDFGTUM4cEVl?=
 =?utf-8?B?RGlIb3krOXZocUkzRmgxMStRK3pXdDBRY2dUYnNscHZwd3JZWEppWlZSSFBz?=
 =?utf-8?B?UTFhaGw2T0JEdDZvN2crRDFJUlpsVmgyaTNoQTNyQzhNcVlQbFVURUVpTkxV?=
 =?utf-8?B?QjlHOXlVSmlxd1dpZ0U4RVhnYlpsUlJjRk5KZ1k0OGxtM0t3L3p6RG9vRjlJ?=
 =?utf-8?B?cGRreFpZdmlYWDE1QVQ2Y2RReG5hYy9kZWkrVDVmTXRFcXh5VmpkbVY5TzJF?=
 =?utf-8?B?MXlhRjNxNE8ycGhuRkF0UjNzUHNsNVBROGxTNGk3SjFzcUl0SHVMcGJXc1JI?=
 =?utf-8?B?OU1xOFE3RzFBKzFsRFcvZVBpQjlzckFDQ0tKVmhSNzRYSlJTdWZJZ1pZd0sw?=
 =?utf-8?B?cENnclo3cWlqWHBpM0U0dzBjT3lmdmRDTTUwT0piZzhicU41Qm1BUHl1WDBl?=
 =?utf-8?Q?Pu28kKylEs7v8GIZolFrI8jCx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2c20c7-c383-4e33-23bd-08de1104e78a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:49.7942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sSUo1xyJ6avzFpy5spzSPsx3osjRUM2yApIrZkRnHW+Dv5qwc78RoU6V4zwvJHiI6SHl0w/CoqA8ZB6z8cghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 11/12] doc: board: nxp: Add remoteproc guide
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

Add guide on how to use the Remote Processors on i.MX8M and i.MX93.

Update MAINTAINERS to include doc/board/nxp.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS             |  1 +
 doc/board/nxp/index.rst |  1 +
 doc/board/nxp/rproc.rst | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9070df85335919ab2db73bb0668869d64051f964..081f3ce2278213acef61353e03f66a26b4f17734 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -317,6 +317,7 @@ F:	arch/arm/include/asm/mach-imx/
 F:	board/freescale/*mx*/
 F:	board/freescale/common/
 F:	common/spl/spl_imx_container.c
+F:	doc/board/nxp/
 F:	doc/imx/
 F:	drivers/mailbox/imx-mailbox.c
 F:	drivers/remoteproc/imx*
diff --git a/doc/board/nxp/index.rst b/doc/board/nxp/index.rst
index 670501164b5c11f64dc1dab03b6f90e2fba0163d..7b881961b65d4b481b018761cdedb7efb4d208c7 100644
--- a/doc/board/nxp/index.rst
+++ b/doc/board/nxp/index.rst
@@ -26,4 +26,5 @@ NXP Semiconductors
    mx6sabresd
    mx6ul_14x14_evk
    mx6ullevk
+   rproc
    psb
diff --git a/doc/board/nxp/rproc.rst b/doc/board/nxp/rproc.rst
new file mode 100644
index 0000000000000000000000000000000000000000..b023c1fadf6253438158b46a9ca1cc9a4e3dd757
--- /dev/null
+++ b/doc/board/nxp/rproc.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0+
+   Copyright 2025 NXP
+   Written by Peng Fan <peng.fan@nxp.com>
+
+i.MX remoteproc usage guide
+===========================
+
+Introduction
+------------
+
+This guide is for giving user how to use the Remote Processors found on
+various i.MX Chips. The term remote processor is indicating the Cortex-M
+[4,7,33] cores inside i.MX family.
+
+i.MX8MM-EVK
+-----------
+
+Steps to start the Cortex-M4 core
+
+    load mmc 2:2 0x90000000 /lib/firmware/imx8mm_m4_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX8MN-EVK
+-----------
+
+Steps to start the Cortex-M7 core
+
+    load mmc 2:2 0x90000000 /lib/firmware/imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX8MQ-EVK
+-----------
+
+Steps to start the Cortex-M4 core
+
+    load mmc 0:2 0x90000000 /lib/firmware/imx8mq_m4_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX8MP-EVK
+-----------
+
+Steps to start the Cortex-M7 core
+
+    load mmc 2:2 0x90000000 /lib/firmware/imx8mp_m7_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX93-FRDM/QSB/EVK
+-------------------
+
+Steps to start the Cortex-M33 core, need to choose the correct file for
+corresponding board.
+
+    load mmc 0:2 0x90000000 /lib/firmware/imx93-11x11-evk_m33_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
