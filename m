Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C784AC306C3
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:07:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90AE6C62ED6;
	Tue,  4 Nov 2025 10:07:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D65C6C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnklWUqeNqNOZR+eYq5uEAtwlyPRNLQF/mavf6RjtWo7C5bXby/2PFlur+8sFRntdBBC/PupOy+hPc/Eyc306MKzzKA3J89CvSFjBH7yYHAVxRS0Xs3Q82oHdqLomGXqTqeWIfgxMVP+Q2HVr1MYZeCyoXR3CTMiDlsVQug3ja7t5YtJcc4zTFwEc18+dJ1ZPOQxnHpPma5aJstmwB6tQXtUQqm+D0uzbYgY1agzuFEg1b7OKZYisWkQ/rok3SzT4eDu5PwtQjRgp53pzcGeTd3cIj9Y4sEf/W6V8ufXAXYaCSsdA+4jlZjwDHirA2SHlBOpoAT+Hv+utiv5LrkUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQNyns+ITVuv1A1slA2i8y+KF74A5/4SwRXZg8B5SPM=;
 b=A3KgaCyBsYEshaPj/88l8QBPWmZqIllObEPGDSkfYfrRfzqwF3foqQim1oKF5eCRg60i+hyAVcaCMAbIuWJNgdFaKxDkW4ht/eULQCN+IHMPeEMyPNzVFlFlMSuuBVQTgS3lBCPvclNYPQ/Ao9zTK4Qmp0ecqSct8q/ZXenQ6EhW+1pvSRSq50v7K5GnAAGFdVUG+1QMhUOJE9AG7JLb/koFQ6f/BPjRlcoCxY6mzCFhycwpgDwh6/oaiNRrr7LIpCY39Evmesy/Mi1kkoXXqjZWJGGHdT0rrkgDMZIgzIprm3f4nqcp1McLiJZpEtixJ73xGGxUjGZcZMWmQ+01yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQNyns+ITVuv1A1slA2i8y+KF74A5/4SwRXZg8B5SPM=;
 b=jIxFORxGIAG5Pj4OZZqvIr69npra3QYPR57gMf/tm0ly0xWsY7QZ7tLtT3QeIVlHQbnPfkhO4wcKJiKibGzCgXtrjVZZKgVWyXp040+s6Qyy9Xwr4vNfWAlA9702zBUoVbGItdVNlZzDh5R/7ppqckeVTmNALPrc+SsE0snadmSVOHO+O44A4WY8s5wcTh0cI+BQ1lhuS+xTVNaEGEWcBukULhmGZdclEMIFQ40/ugfjTUZzd4ssq4G1F81bVphZ1bxWnmaojX4JI+pOqA1NhTzj4TuVgDIQ5rNxQzvIo14g3GMkQ/Taghh9zuOPW08mi+sBBLposNtQSh4g96X2GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10955.eurprd04.prod.outlook.com (2603:10a6:800:27c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 10:07:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:07:13 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:06:01 +0800
Message-Id: <20251104-imx-rproc-v4-v4-12-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250766; l=2112;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=QUtYuEyCK+LtTWmNuIpASwT6uP9qn4hv3/8N2BHEVOQ=;
 b=USv5RjvupAQnz2tRikxg5UwWArfDDZIMutUJHTYxYHp59dlPKJyDGFkVtNU/cYLC8Wz60ntpL
 WrBhQwvePZ9DZeNfU7/KLLhcVrRTVjm469z2NV+LNM9kQEmaNFxmh8Q
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc60185-9d39-47e0-b39f-08de1b89ecff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHdjS0ora3FNMFIrRW9tdVB6aU1pRzFXcEZ4WTI5N1ZXRTJtaEhURVFxRVBI?=
 =?utf-8?B?MXEreFpjVkpiUEY5Z0VBT0RBUGVwcjlKTTRVdU0vRjRLOGFraHZZaTVyYWFn?=
 =?utf-8?B?b3Y4L3BzbjhCemRDQ2tERGt3TGp3VERHY1l6YVBvcGVWVDRlWmh1VWQxVHNM?=
 =?utf-8?B?bEVoRVdZTjVRT2VXNXEzNk04YzRNOGl5bVVWU0RQcGx3Qnk5ZXVQYm8zMHpN?=
 =?utf-8?B?K0pXRWZPN2preWwvb0NDUnBNNXRyMm02dmxtd280NktDMEdtditIRVN5THo1?=
 =?utf-8?B?MlhldGhWTEhodkhJaitWLzdNbnJGL0hFcnFxUkNMZEVkYjdXQWswdmJHcEZZ?=
 =?utf-8?B?a2VvYlNoYmhhZTJCRVBINnM2QWVVdnZHS0xVSTlPbVlSdmc3SnpYcE1jZTNT?=
 =?utf-8?B?Z21XR2dQcVRYQXJFTEtGbTg2UFJkRzFnSDc5QmptWkZ3MUJ5eGpsSTNVeUE4?=
 =?utf-8?B?RU9LYnZWUVhNMklOZFRRR3FMZUI0clliQ0VqWXFtUzJUWC9weENZcUVmM0Rl?=
 =?utf-8?B?bjRlbUY1dGVZMWZUVjhZN3dPdWpYU3FuOWl5M2h5QmVjcjBiZkIvd1p0QWpI?=
 =?utf-8?B?STRGMUhOaktENWZjNXV6TUtKanpkcFVJSUtRa3RCU2h0Q1hVZ0VpNlBTQVZG?=
 =?utf-8?B?WmhiaXFYemFaRUxHRmVDK3lieTNlL05NZnExYWlvSk1Yc0t0NUVkaTJHU0dw?=
 =?utf-8?B?bTdYcmN3emI1SDhwYit1THNJeXo5UEdGN2JjZW9VMGFGSXhPQlFhRmQvKzZB?=
 =?utf-8?B?V0N2Sm0wNHVVKzNqRkZPWFFmVGl1M1kwaUlJRTF2Z2g0QktRMXowa2Z4SzV0?=
 =?utf-8?B?djZWTytHeXZ6TDg3eEhtdlFzZUFPM3U3KzlBU0RwejlXWEpIdTVDR0p2dGNm?=
 =?utf-8?B?cGkrdWp4MGt1T2Q1ajhJMXdRWW50aWR2WW14N084VFN0cXBrTVA2NmFWbmZ0?=
 =?utf-8?B?bldnWTBEUTE5YnA4STVtQ01mR3licmRnOTVJY3EzQ3hESy9Pck9PKys0WlpD?=
 =?utf-8?B?VUhCZU15YzZXRm1rN0g3bUxwd0FPbFUvbGJDR2d5NmsrS0VvRm9rS3NSOFBt?=
 =?utf-8?B?cEo2eDFrT0Nrd1ZVaDdBRThWSlVNYzg0L3NYZWFQVVdEQjNNMXBZaC9oNDFT?=
 =?utf-8?B?eTE0djducDlGMERJOTR1QlYvN3gzTU1ydzBkMjdLbXBaLzFkYTl4cTIwK0ZQ?=
 =?utf-8?B?emlxRlBPYWxvc1dDb040aERmUWdabEdPWmFQTEtNdDVsL0ZQWWE3NEIvUTg3?=
 =?utf-8?B?KzVWdmRrWm5zdlR2bTdJUEFKSWNLOHFaNWpmS0dXUDBFQUhOaitWTUJXdXAx?=
 =?utf-8?B?T0F4Y2lHeFRSSW50N04yK0VtWlZDV0JHZnEybzEzdDBwK1BWbzA5Yzl2bEhX?=
 =?utf-8?B?MlVEM2pZMFNxQWgralJLdUdEVDkyWkpqbWFkZDA5c05zUmQyWEMwaXRucjZU?=
 =?utf-8?B?K0RBOTUzYjVsemQ0aW9WekRmdTllZ2VYZk5mcDhTbHlYRDdkb2d1UEw2OHJR?=
 =?utf-8?B?UzR4ZERQRmM2MExvajdETXNCcUlaK2xLQmgzR0ZYaDYyUjhIVytTUDRObERy?=
 =?utf-8?B?QklVMW9rM2UvUms1SGdFZHRuU2M0TDZSYmhWcE4xckg5YncvbFhldkYxeUNh?=
 =?utf-8?B?QWQrbWxFQjFCSk0rellQVnBZYStVcDlrcUE2K3JiSG9SUDI0OWVkTjRnc2FU?=
 =?utf-8?B?b1FNYWlpdDJZZ1lQMUFETXdKRUJmNDV3Wi9tRDAvWXhNalBvZnRKaXF2MVY5?=
 =?utf-8?B?bVJNaXd5bWFHRFhwelBiaDVSbmxON3F0TlpEQTdNN1gzNTZ1VDl4M0NKR0Nv?=
 =?utf-8?B?UWtXN3Q5cmZCQk1vNVhnL0J4eFk2S0gzR1N0R3BZeXZiZGJCVG5mRU52bTVn?=
 =?utf-8?B?elNpbnBuZTdNeTEwL2JsdTl5dVkybWNybnA2dlQxZGhVcnRFZCtkb01Pb2F3?=
 =?utf-8?B?WlM3dmZydHVSVG9VVSsrWDFTRlVLUnVWelFVdThTeW9qWlJnWml0RzFkKzRI?=
 =?utf-8?B?LzkyS3lMSUNIU0sySjdjMnI4cDJndE45VzNRd2IzanRzVjNWbDJuenZSekM2?=
 =?utf-8?Q?lw06uw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWpiTWFPYVFmMmxiTkVvWE9mMGYzdUFZWkJVQldCQ2JnREcyU2tPKzB2WHlv?=
 =?utf-8?B?VXhpdDlJVmJtWFRERjUxUVRsbjgxc0JFaGV4TUc0dVFDTzRoaGZZa2ZscUYv?=
 =?utf-8?B?VFFiTXRRMUtqbFhQTzEwR2Nqb3J4V01oVytaNzBFVjBoOE9yRStoTjRtUmlm?=
 =?utf-8?B?UzFING94aGwzZTRSMWVwbnhnSktSMVpmUmlkTTNjODlqOUlsRmErTGxkUE5x?=
 =?utf-8?B?RWFNa0s1VXRYRnkwK1hxdG13NmhvdURKcSsxKzFiU3NnM1VKNVNLS2pvbGV6?=
 =?utf-8?B?S1p2S3FZQktpTm5UYkl1V1J6UUFBSnd2Z0ZkRGNMOVpJaGs0OUNTanIrVk5n?=
 =?utf-8?B?SE5pMEttdU96VzBYYTZkZlR3UTVBSjZtSmw5TXIrVjN2elNMTXZuam9ySHpp?=
 =?utf-8?B?K2VkdVdhOHdBMFdZc1R5UXBvRlp1T0EzdEdlQmswNnVDaEZ1ZjhuMGVKKzlQ?=
 =?utf-8?B?a2dmRVIwQlErbnFWM2NlNkgvTWtTVlFlNXY0TENPT1d3U05RWVVKMndNRThJ?=
 =?utf-8?B?bmlyRmJFbjRhazBRVDgrOWl4dUNnMEduOGRUVm9jd0hBdnYyamZZWWxRMHdz?=
 =?utf-8?B?dUJTQUF2aEhZcFcvQlpjS20xUW81UmVzQURDbnBKcnhjUm81UTlVY2hXT2pR?=
 =?utf-8?B?OExDZVJEa1RlTG1aZk5Idjdod3N0VWwxRlF2RXNFYWlJaXJtMy9yYnBKdGlE?=
 =?utf-8?B?aDRRMm9SNjlhcjA1amVJampXUVRvc0YzRUlvaGdHc2hyNE5lQ1hvK1ZncHJn?=
 =?utf-8?B?b3BUY2VBTzUzOHIzL2x6VG0xOU01d3l6VElhMXlMUmNLSUJsT24rdGpjQ1lk?=
 =?utf-8?B?Y016Ny9RQ093QUVWeEFIa0pJY0g1OW81Z2RxUGJxaVFOVlFXNWRlYWdiR1lX?=
 =?utf-8?B?TEgvL3hEVElxUThxbzcrSzZSTzYwYkhLYXR2U2U3MFNocmpLUjFVOVJUbThK?=
 =?utf-8?B?R0dlM1phVGJOQWRqVlNMVFRqSGpla2IxQzd2bzh2dzFSaUZoSzdqOWduSUto?=
 =?utf-8?B?NmdrNlh4TlRNRVZYOFpCellheiswbm9BbmpHQWZOOXNlSzQ3akg2WGc3RTB2?=
 =?utf-8?B?L1R5U3FnNm5Id1o5eTBLMVczOEdiWVJhZTYyVlA5STV1czNSS2M1WkttdXpW?=
 =?utf-8?B?WUQrcG9EL0Q5SlU4VW1PSWZMK005NzI5eUwvV1RMemJQK1NwekhibEdFekJN?=
 =?utf-8?B?d1lnVkVmWWFJUlFiVTA0UXoyVDZCbkdFbE1GR3BDeHg1eUljU1pzdzVnc2h2?=
 =?utf-8?B?R3pnM285VE15bHVQODN4Z2hlUU9YZWlXcEU3S2dvS0I1K1VCYk1FOGRNSTRu?=
 =?utf-8?B?OStzUGtwc2pJbXgwaG4vMmsvUmltR3F5akI3Q2I0Q0NrNjFnK3BzWVpvVU1m?=
 =?utf-8?B?c080dUpwSGxPdWZrUFJhV1YzNFlrTm8xbXJWdEJKNHh6Q0MyY1hGcXUvYVFw?=
 =?utf-8?B?U0RId2dxdUwycnBZc0JSWlhPUGhpOWVHaWZtUVZhZGE4cC84cGp4MDhEc3VD?=
 =?utf-8?B?UEpqZzNtYlp6UDUxbVRnUlhBRFdtSHRXUFJrYVBjeXF3am5oR21wd051Qi9a?=
 =?utf-8?B?SUhmVVRDRkgrbFJXUmRkNzdkQytsQXFJRW1VYm1sV0JDdEcwV3pOelZPUU1m?=
 =?utf-8?B?OEhKUHpjSUI2Q0kzMzloRnRQUFhFTStmYVpiZ2hsUmZScHcvUTA2eGtramFa?=
 =?utf-8?B?cnoyRnhwYnBGNzgvb3Bpd3BCZDIxUGJwM29Xbll3L1htVWw3M2lWMTVremZa?=
 =?utf-8?B?TzRGYVhscm0wSGY0TG02WWdjTjUxNEx6WlEyVDRsUWY5aUhZK0ZGKzlyNi91?=
 =?utf-8?B?WGtSTDZ0WFVzOWtkY256WDNLTUFTQnFlZ2dWZ2tObk9BMU00OEU4ZWt2WEM0?=
 =?utf-8?B?b0JCZGhaK1pOM0NMWHNVNEpmT21PNTN0NGh2ZGpoTHBTemFkaklFWlVhQTls?=
 =?utf-8?B?UGVIWVlhcElJTURsZWpxMTZ0VUhQc0N1aFBQWEFHTjNpb09uVHYxWWZYWkU4?=
 =?utf-8?B?VzdRdmdvdFYrNlBMbzdDaUVTOUlKN2tOSm9XakdyaXJYS09ESGdJdnY3SGZM?=
 =?utf-8?B?VHVlckhTeCtzK3hPa243c0VhT2diQUN2WFozLzkwRmJoci9oVWNrQ1Nqa2lk?=
 =?utf-8?Q?FhXELA3tYKkXnsj6REf1kvw3j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc60185-9d39-47e0-b39f-08de1b89ecff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:07:13.5399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8Vf0hLHcxMpkj0SYrXkPBfa1AvhnYtktVSTaRWoAkn7P6FghieDYsgkqvfq/Q4az+S8J9+pxIPMHnbArPtMww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10955
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 12/12] doc: cmd: Document remoteproc usage
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

Add documentation for rproc cmd usage.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 doc/usage/cmd/rproc.rst | 78 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/doc/usage/cmd/rproc.rst b/doc/usage/cmd/rproc.rst
new file mode 100644
index 0000000000000000000000000000000000000000..663c1e3d490baa429e77936dec5f54ac91091ed0
--- /dev/null
+++ b/doc/usage/cmd/rproc.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0+
+   Copyright 2025 NXP
+   Written by Peng Fan <peng.fan@nxp.com>
+
+remoteproc command
+==================
+
+Synopsis
+--------
+
+::
+
+    rproc init <id>
+    rproc list
+    rproc load <id> [addr] [size]
+    rproc start <id>
+    rproc stop <id>
+    rproc reset <id>
+    rproc is_running <id>
+    rproc ping <id>
+
+Description
+-----------
+
+The rproc command provides a generic U-Boot mechanism to manage the Remote
+Processors inside a SoC .
+
+The 'rproc init' command enumerate and initialize the remote processor.
+
+    id
+        remote processor id. if id is not passed, initialize all the
+        remote prcessors
+
+The 'rproc list' list available remote processors.
+
+The 'rproc load' load the remote processor with binary.
+
+    id
+        remote processor id.
+    addr
+        address that image is loaded at.
+    size
+        image size
+
+The 'rproc start' start the remote processor(must be loaded).
+
+    id
+        remote processor id.
+
+The 'rproc stop' stop the remote processor.
+
+    id
+        remote processor id.
+
+The 'rproc reset' reset the remote processor.
+
+    id
+        remote processor id.
+
+The 'rproc is_running' reports if the remote processor is running.
+
+    id
+        remote processor id.
+
+The 'rproc ping' ping the remote processor for communication.
+
+    id
+        remote processor id.
+
+Configuration
+-------------
+
+The rproc command is only available if CONFIG_CMD_REMOTEPROC=y.
+
+.. toctree::
+   :maxdepth: 2
+
+   ../../board/nxp/rproc.rst

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
