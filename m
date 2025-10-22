Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C32BF9871
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F684C5E2C3;
	Wed, 22 Oct 2025 00:49:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36982C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfUZ6RO/soyvQF+I6f14U9VL24ef+y83I1FOxTq5j6TV0kJpIAFeXY1HEcZUdx77DgjMPmPexqLJLy5lq12JGM+lPsYdfOGMWXNP762KOdbe9NyWrWQVvDcPY9m4VPua2ZDpzlPIERuMSF4u3p5D6Fk37LiZC41jMyVgAMRMe27Mx4NMcBqkCumq85vHjvn6BFzUkYWax0UFHnocePmGQ7R/IrNhJ7KmBjHzMDsANIlo7TDypvd5jq23ZPS/8yEpr9jatgiPYFFRpoIiu52O2XArOvlc0+PWUOO7BYrEP9JSatf2m4F3Kpj8AetAzBek2T6+o7qg8oleU63kE5Z6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t25jAouyfSVcNNy4hrN8kilkjpSnqLfJiZb7+HUERME=;
 b=NFMXkbfuTW/P6QOMzhB/HnfYYusD3pzh5jahZSQ6oY91DGbhJoEcvsWTusMUzozKiZeHVBdI8UMO9vtYv9wO8dbsZF/tCXwaoZ+vuP8TGP3tr7cu0z0rdfogH79amaoBzRsJEiDX9ngIrNL3TNKnPs8QX9DutXB5ECWtJS+hO+t4Slbq/Bf71PZW9sD6taOC1tPN+0hdYVpgXuq6+SkWWTjnbrdyXjVo57ookr1r/UUxoFGZW6RSpkAe4BmRC7yw+J2dQ1DcrJNt02Oz6shm88KTRmj91+F6PH8sObSY/Tg2hsrerOZpc3sVRx4Vc8Wl4HORMDub4Uqz1axpkKxp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t25jAouyfSVcNNy4hrN8kilkjpSnqLfJiZb7+HUERME=;
 b=cl1JHtAXg4wlivAJjfMznThROdpZ1tFDCVHfRyXWbl2RK5J85qYLi2wAaDvi1wYKUVDaRv4xlO+e4IgMZl6G+MgvGd5AbA6s74www2npiFtBA5xOx74OuFugZfas/3k6NDbwg6R9pKcs26O7qF4Xcb5eCZFCRNYOTpDYhGT7p0ifheAGFhGnvYslIBJUxZroEfRD+d80EoTJyo4OSYihAhp/jmrFfbDVjTrOJQGDnIxti2U7S5+43I6VfAEjuRdcXZQH9uIjyjIb978ldY5Xyod6IsxmW/j17DKMBNrO++59vtl9yA0a50Ej2OCTIxLkK/+KMTfxmtacoYpsp+iT4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:55 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:38 +0800
Message-Id: <20251022-imx-rproc-v3-v3-12-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=2486;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=SMmhmBcPgDUXFxwW5G+E32JP+4FwQOAl+zP/PtXzQBE=;
 b=1APnzanc9Tz5mqotKHBknAN8x5sPOciOSFE34+XrE7xq/jtYNQky8/D6ok8WH+OEcsYdK5hOX
 R4vZvY/2o/2DDnhBIBpb0bpGWbcaY8cL9RQBn6J72urkhEvGjOhPfHb
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d98758-fc13-4f3a-87e0-08de1104ea97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dldhZW1rWlhNb3J1RjZ5dTg4dDFtYTVnUldZd2xxVHNnVkUwLzdiM1h2ZFo3?=
 =?utf-8?B?UVd0MnltNE9DUHNsWkNncEJ4cWdrTEtBS21uWGIvanV5bEhiTmwyZDlSNGNj?=
 =?utf-8?B?RUVtaDVoU0YzTElSRlRtODBRblJMcFdMZkVVWXFBVDR2eG5DcS9ZSGw4Z3Ay?=
 =?utf-8?B?V3ZtYjRVcllKdEtMWUFEdWU1Q0NtNFVSZnBLdGJWT0xCdFVSRXYvdnNuMjN0?=
 =?utf-8?B?cDVUMGoyeTBrL1dJRzNGc2VCTzk4eDZKSmUxMnlpMHlpNzZWYVpWVUJFNmNV?=
 =?utf-8?B?ekhJZ2JSYlU1UnUxdUhacTdwSmkzOVc0VzRQdlM1M2QrOUFVUTc1SHNxbnB1?=
 =?utf-8?B?TXh4ZkdQdnNTTFJNNDYzaGFTazJyV3owRHlvMkRYRFE0K3BQaXVnOGhQemZz?=
 =?utf-8?B?WGhyeHIyNERORnVXRGdyYkVBUmIxOFlrTmpKRDUvcU1RQzVSMFRZaWErTHVj?=
 =?utf-8?B?OVpCZk5zQjhaSlEzVjJNWEcvRFJIR3Q5NU45Q25hVnE5Nk9vQU5zRmx3bXJu?=
 =?utf-8?B?dEFEaGtzM3RmQWNaMlVjRDM0UkxST0JkM3cycUdUWVhWSzdhTURBdStma0d3?=
 =?utf-8?B?U1l3U3QyNG0vNTYrMXl5M0F3RXNvaGxpWkdqM0NOT1dzQnNaWm9VNUZqYUg4?=
 =?utf-8?B?cGVuU09SSEd3ZGZ5YVFNODlxazRudE12c1lPOFJtei9vUnNndUpzQ21iNnha?=
 =?utf-8?B?R3YzcEdONklVWkpqaVZYMlE2SDJaTWEwMk9uWmpSTlN5aFR1V1QyR2NPWk9B?=
 =?utf-8?B?M3FCSnZZdzRrcCtDZUNoUVM5WCs2eUd6OUE1WjI2VDRWMmc4RjRrNEV2ZCs0?=
 =?utf-8?B?UmtJWWpyWWJiTFlxYklUS2R1Ly9zVUtLaG11RzYxME1SQTdGNXZ3UU16T1dX?=
 =?utf-8?B?VHE2WjY4YUlIUmVYeW12WExlbzE5YzZhL0RiSm1PVVNvMm1oYUUxTHg2S3Bs?=
 =?utf-8?B?M1dleGFBbTFuN0VNNVFaMEhjWFBSS1dSMUxrQlJWV0pWdDUxWVFySjZLYTRG?=
 =?utf-8?B?VFE5UnFvN0NNYS9JYno3Mk9Cd0JEekxGRytxSVJOdUowR0R0aytITFBZZUdB?=
 =?utf-8?B?NE4yYjJLamxPb2M3S0dUb25UeEM0Y3BDMlJUVWw3YkQxMWw2MVBldng1QU5x?=
 =?utf-8?B?MG9NbUh1b0V3SWVOeFFCQk1CNzdPUUZaZlJaUjBWRStOTko2Y1MzOWQ5ZnpN?=
 =?utf-8?B?ZVJHSVRYTUlsTXorayswNGhURmJSMDZoZU9kVm9tcEI4ZExsOGtRV0RZdVZk?=
 =?utf-8?B?alJ5bGNPamJtY0R2T1VIWWZvM0d1OVZYbnBOaFdYTlVOYXdkcm5hRVBlUCtt?=
 =?utf-8?B?SEpoV3JxU3U4OExUbFFkaVZaaHo3d2hVSzhnYjRkd0lQL0YzdVNMT21tZ08x?=
 =?utf-8?B?T205cG94UzJsT0lSWTJXMnF2WG5yUWFUbU1kbXN0MzN4RHB2L1BFcFhMRFNT?=
 =?utf-8?B?dFVSUURkMGZrcG0xTENhMTRsbFZPTG0vYlp1Nk5lODdIMlF4QXNLcGZ5L1Bq?=
 =?utf-8?B?YnhrUVFremVCWm81TFB6NWFwOEN0Uk5Kc24vQytDVjA4OUNIZWIxOUJURGQz?=
 =?utf-8?B?Y0JYUEIwTzBhL1BWUzNLcnJFVTUzSXRKeE5yVEpEZkVleE00bmdRNGdWT3RB?=
 =?utf-8?B?MnN0YmVFRDVTZ3Y1aEs2ZE00UHcyRXB3WUpHb1lEVWxmbnY0R01BU1VJejVo?=
 =?utf-8?B?ZnNMR2dDemV0dTV5Zk9IcWttV20vZ0pUOTdGUUF4dXJUV0UvaUFtdlNQRXRC?=
 =?utf-8?B?RTZDUzE1aHhtT2Q1eGV0eHBUZXFVOUI4RDlod29TZEhlUFFma3V6VWwxa2xF?=
 =?utf-8?B?WnR0ZllMQmVnWnpKanVkaVZxQ3p6YVJoditHUm9JYzdtRXpRKytJcjd2OUxv?=
 =?utf-8?B?cUdtcXU2c1YxbEgraGVQN0Z0TDBTU2g3SVRNajYvQVR0Q2lRaEkxNVRCTlQy?=
 =?utf-8?B?LzR1THhGcG9SRWJoMWZ6SzlxQ1ppbVpieFBkdzQvY1JNMTBvaTRJTWNGcHhM?=
 =?utf-8?B?VndEQU92bEIzd3pIaTh6aXBIdzBOcmtYZHdUdjNNNU4rTXR6NW9OdE1JUnBl?=
 =?utf-8?Q?vtS5wa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmMxWDVML05makFlU0M3THB5RDhaWUJlZXVkc3AxUG1rZ0s4R1FWNlRCekxQ?=
 =?utf-8?B?djZ5WXg2MU4xQjJLSmJGb2pqYlJ0MVI5dXNsbGV2aThwY0sveEZuYXJ2MDFm?=
 =?utf-8?B?Q1ZDV283eWhuUDYzUy9HbXhFVlBSNnovMmxhR3Z3U1pXNnFidGNDMzlwZlYr?=
 =?utf-8?B?MW1YWHBrVUoxY1NpTGpMb3Fja0FDYUNvK0NvazVqWTJ1VEc0cHFmM1p4UnJY?=
 =?utf-8?B?a1lMTmR4ZGVPcE5ZditzNndDc1ZZNkNkTzluYWNPazRkNDhWR2YwUVI4ZGsx?=
 =?utf-8?B?aXFHUW5Pdks0UlhrV3dqNDZGZlhENFN6UHJZd2hjcUw0QlRFSW5MOHZXNG5p?=
 =?utf-8?B?V01WNGEwdnNMbkJBcktERWZDWjl4ck9EUGVwOFZQUWxTREtST2xpQU5KQWVv?=
 =?utf-8?B?czRQcFdUeEFndk5BSEZIeHpTbzFuRkx3V0dDcjFpMHRNSEp2VEEzbm02SE1M?=
 =?utf-8?B?R0ZWZ1NvWFdPV2pXUVA1ZVhHZ3NBZ1NDRXJrWGhESmlpTlVGai9IZ1c4RmN2?=
 =?utf-8?B?NXZjY0doSnh4b0xmQURkK1RSUHFiK1RMVXlUVHdGY0JNWGNkb2Zpc1FHMVVs?=
 =?utf-8?B?U1d5RTJWcFNhK2lQeXlDQTFOcmg5eHRlUEVXY3hET2lwUUlHK2FYb1VBZ2ZI?=
 =?utf-8?B?cHZ1ZVJxRFVOMTVrQThzVjExcXcvaTBiUkFTcWoxcWVqenFxa3ZwUEtVQTBC?=
 =?utf-8?B?ZG1ZOVRoMFQ0NStndjlYODhXVGtBUjZhSGlWMHpGMW5iOUZDN01oeTAwYU96?=
 =?utf-8?B?b2pSSmNmS2RmQWF3TVZMejFUUlE0aG53K2hQaGJuWGY3TG0wcmhueVdzTFU2?=
 =?utf-8?B?K3pGNEtFSlJxSjNXSnY0ZURDWWtEL3dlYXpNeFFDY2JvOHVNRTdmcWhqOE45?=
 =?utf-8?B?Kzg0OVltYzhDak10MHpBWnR5Z0tpZ1ZUenZsWDgxTVF3NGV1ZSttaEhFcUdT?=
 =?utf-8?B?NnVhcXJadno3MEFuQWlXeExnVFU5UStMNjJyUFRkeTl2U1RrNGZ4THpXNjNC?=
 =?utf-8?B?NkhnaW0yWVhyNHRaNWxOYVdvOFoyNHJYblZtSXN2RmZKUEhCbDloTW5pSXgy?=
 =?utf-8?B?MFYzZTl0T095dFJmUFhkZEpsY1FsQyt3RzJTODI5WVh6eXdsSGdNa0VJVjdD?=
 =?utf-8?B?ZDNtZUZ0Nm41QTkvdWJyaXJRRUhPYnFRUTB1NWNEUkVocVVZYUdUMmJQcWtj?=
 =?utf-8?B?c1E4SUNDb2h2SXBoV1JFbzNIY2VLZXRzc3ZiSkJCUkxNL0ozbDR6eFFXUHlt?=
 =?utf-8?B?a3kyd2o3Q2kwMy84QjV6TnEyWVA4WlVjRnh5YXJWeG9zRy9Nc3VjNDVvY1Jv?=
 =?utf-8?B?WXFlQlk1UllaUGt2TUhBYlpmUUtxc2RtSXlHdnIvajJ2dlhLZ21uL3lmcGda?=
 =?utf-8?B?Zm9SMFc0MWFvK3pLc2hoR3k2K0ZnQW8vcmUvZG91N1g4VHhZc210NlpjbE5D?=
 =?utf-8?B?Nkk4TGExS3JuSFJDakNtTFpyTmRqeGJQOFRUMStIZjhaYm1zVWIwclpDK3ph?=
 =?utf-8?B?UUJyR2hldFo0L2hQV3pTQld4UTdYbUN3dkdHZ3RjKzZPa1Z3RDI0UCtJaGts?=
 =?utf-8?B?OXdwRTM0Smx5TTlHMFZ0bzRxaXZHRTF4Y1psNHdSSUxQUlB5YlBYSGdpSnpq?=
 =?utf-8?B?TGZzSEJEOTB2bmFkNTJKbGt3Wks5QzlMWmNqOVhIbmFoeHhmRDVJYnpSaWor?=
 =?utf-8?B?ek9pZTJ4T3VmK2R0TlF6TXpLcDkwY2c3b0VvaENJS1VlY1VnU2hnNHl1RGxH?=
 =?utf-8?B?RFNucFQzUGQyM21IcGhUejlpSFRlMTBGTWZjUXJkWCtuQ3R2b1I0Zng4VURq?=
 =?utf-8?B?S3R2WHRka1oybkU0S0hOcVptUDBoeGZZcnFuNlF4UitKWDl5dnpJTSs0UkFa?=
 =?utf-8?B?YWNvNi9aY0hKUzQzVEsvTHNzaytHdHdyTlUxRndHQ2FDWU03eVNHOTUwa2Nu?=
 =?utf-8?B?Vkp4M0YwUFB5Q2FIejhsVHhCbW5RUjJQOGZhalRZWGRMTm1oc0crWTI3VHFw?=
 =?utf-8?B?KzZGc3lIaW1sSEtTd0kxR2FHekU1VitHRGlRNHp6RTV5SVVDSDlXc2JEU1hF?=
 =?utf-8?B?aEhWRzVreGg1cklQUGJIZjJDNFJoSTl5ZG1TVEljME1UZkl3Z2lteGg2R1NS?=
 =?utf-8?Q?upVClRKDxeu/bl/crLq22yy9+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d98758-fc13-4f3a-87e0-08de1104ea97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:54.9820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dY3VhnToPui64P7Fej4hl+WwUnUJpWArcCXNzKpgGifCK4nnO9pG9cxC3KoesPhCxLuVfjkLOCwhEEUwKzp7og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 12/12] doc: cmd: Document remoteproc usage
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
 doc/usage/index.rst     |  1 +
 2 files changed, 79 insertions(+)

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
diff --git a/doc/usage/index.rst b/doc/usage/index.rst
index 14daa08ca18cf590ef837ae38faf8c6bc85a26b9..31ac3b438a6a0c77f1a1ed2d1d2cc6c05ec90d3f 100644
--- a/doc/usage/index.rst
+++ b/doc/usage/index.rst
@@ -110,6 +110,7 @@ Shell commands
    cmd/read
    cmd/reset
    cmd/rng
+   cmd/rproc
    cmd/saves
    cmd/sb
    cmd/sbi

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
