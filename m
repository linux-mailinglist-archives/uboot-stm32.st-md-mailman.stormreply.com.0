Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41FC306BA
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:07:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78D16C62ED6;
	Tue,  4 Nov 2025 10:07:09 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013063.outbound.protection.outlook.com
 [52.101.83.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1AC2C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwLetbqlYZByG3c4eSNE57tw50bzQ9rFR+H2L1dzMcvwc84JvAQTH8Q4BDkFu4I4GMsjZTaF50LZ/oVuWW2X8JKdXQab2dnPW/o6R9B8WI6TQm+GjxPp5eePPtUYZT6mYjABMKCG5Od1p+GZqGNtRcI4bOT0rVFzpVp9WvXJKhaZgNfvA/EcD9TjXVjCDzsLSc0b3jY2SN33btNbGns9D3GHcLsba3mNtJUBkgkWajn2C9PJd+AWE6XuDpK1RQm8nQ1MjUcT73h6xhpdKk8QUk0mykDNVS7/njH2T/JaiL9HVDaF24WB/xOovuqvwUmJghr88JyyAqOr4sCdOLWcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4dcCQuZv2DP2IdAr3EaRsFbMwaJFuN7SmhB7ZPu9Pc=;
 b=YLmgQeK64si/0DDxgyilwnRzI7XulMTJGXju00657+Ove3uVkAvSldPJyCEtwonnTCeg+9xR1bbUchvQp26XerDIU+XND7S/B7oz6Obu/xU8vX4Q59if2bNwWNl41WT14QntJO7kdH03SO0G1HQ9XJtEjZb5ielJIxjfeLIKlxdyAkp/iOz3Rj5FAao+o2ORk5F9HeKQal9pecGToOb1AJ/HjmVYbYlAU2CIZTFxO9u4qKwVmaGEApQiS4UiCCMhgWm+tolwGU4PaNU9QqzLgS5lMlaN3g8VSZU9v34QPF+mTdKWqkocze8rfoXUgwCkdpx0JEYAayKs2VWTJDdfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4dcCQuZv2DP2IdAr3EaRsFbMwaJFuN7SmhB7ZPu9Pc=;
 b=B2IUNrMdUgB7bQH7iBmXpo0UEcfD6hMqmea5xOyjWgZ2ZGitWFraSNqFvobHVCCJZZMo0hH13iTYuFWQ014AmKqTcGbCHDjlhSJmqN+8klYNXzDVqn7GLs3Hs/rayF4PAlz4elZZ0hVfx3clGpRYi6bJjrvwJcvIzU+2wKWEb5NjRK5vs7NMp4gEpQKBaPXKFRRz/R9aYzWYAmqlFnAtPBNyA7kuLAotB4BHUk+O9rKPmJvmRDEorePsIAsEMd9fVM0EYz/x9ydYQz5luCIEErEZtkz6tD0rS83JjjBI/KbibTlS1ft3JdwBTC5ZtcjMEWy+LVYh6ZwUaMB1iKOhig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10955.eurprd04.prod.outlook.com (2603:10a6:800:27c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 10:07:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:07:04 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:59 +0800
Message-Id: <20251104-imx-rproc-v4-v4-10-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250766; l=1284;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lwpSZHnOIasgBMz0psJYnwIHVmwWkVmKLh7PPVlw+Lo=;
 b=M0Tbbqc2ji4sgwEtuUJgh+WUXFJR8hWv+67yMTGGcUGYf7KHrQ5G9Gc/M+8nLUxcNXaeV9XZ8
 XwO40VMcwxTDHje1kKv5QxjIUgZmQ67Jzx9NuA/17c68z6RWOxdAsRC
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ac835e-eaa5-4487-14c3-08de1b89e74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUxZSVpWOWhGUWFWK1hoejQzVkovNHc4cVRwc2pPRVhXZ0REM09OaHdBWnd1?=
 =?utf-8?B?b2UvdStaMFJ4QXJnT2xKeWsrVFZZVGtSSzNyWFArMHowdWxiZy9ySzZKUjNq?=
 =?utf-8?B?NHU1T1o3MHFseGJFRFo4R2cxU2JBQ1dMNFB4ODJJOEpZMXJkR1NnTkdNcmtB?=
 =?utf-8?B?Szh6aVlTTjZMS0R4M0NGUVJieG1MRnhhbFZ5S3hSZ3dDc09sZS9YNHV0d25K?=
 =?utf-8?B?aWVqSTRmQ0x3dXUzTk8rSThFandaL05BUGxWbHFnM0xLV0M4eVVlYmhibzgz?=
 =?utf-8?B?bW5ZSHA0T2YycHQ0emtweUFITWc1Z1RVMjMvUFBNOHBMTjJXNmtFKzdjdzZm?=
 =?utf-8?B?V3l4VFF0OG5oYTZoZFNmZHFwUVNtOGJ5NlFFL3dIVW5KOWgrRWV1UTB5Vmt0?=
 =?utf-8?B?U2JJZDRmZFpWVW9rVHJPanVTOG5OeDFnbHR1ZThsOHhyVktSTmpJUFUzb3RO?=
 =?utf-8?B?cEVqL0RIdXFuQ0V2elk3UkJkQWlqOW83WEVHUDQ5S0FtalZEdk5UZ2w5eHRZ?=
 =?utf-8?B?WUZWQW1GMWNwZ3pnKzFlYlhQRi9BQnhvU3dYdCtSZWFLZEJxNnh4OGF4VHA4?=
 =?utf-8?B?NHhxa3RFcFRtTktQd1dlWU4vNWdpRi9nNnNrVExrS1dZYjhpY3pMdE85ZVUy?=
 =?utf-8?B?eW9KTXRldmhhUGl4VEgwWjd0K2dFNExmck1sMHJaSjQzaWtWQXZpVXJKeFlV?=
 =?utf-8?B?enJhUElXZ3RlVWF5bTJPRjkwMUtXV1E3VjVrNTZLaThFVWorZjgvbE84VXBo?=
 =?utf-8?B?TGNCSXdvczFsZk96VmJCbmhQSGlaTVhveGx5UXBlYUczQ3BmYWhCSlRCdDh0?=
 =?utf-8?B?d3NWb0FQZzY2RFM0QlNyOWkrWExkMzU1WUdRNHkwck91RW9HSlRPd0JDMGs5?=
 =?utf-8?B?M2pJczA5ekVFVmd2MFU2elF3V0NpaUdWQUphb0Z6THhZRUtRQ2xLOWljZjJF?=
 =?utf-8?B?NjVrV2JzazhtQ2xFTXk4K0Z5S2tvR25QVVZDU0lGTmlxWVA0Vk9FZFl2K1Qz?=
 =?utf-8?B?WDBJM0g2Q2k5T0grZ1UzYXU1VTVlNXY3NTFlOVdKN2xEYzNtanlDZmloNE5w?=
 =?utf-8?B?VXJTSTlDZUdqUEVEYXBwNEdLNjd6dmZFemNNblV0aWdLeWluclE1cklsWUh6?=
 =?utf-8?B?YWNCRjkwVlZBQjZtNWxjNkJmcjAvTHRZejNBdlhNc2xaeFFyWjJXWjNWV0Nj?=
 =?utf-8?B?aUQxOURINDZNcmVMMFVEUlhKTGdMUGhIczJRd2YvMjVnMjJkRWtxMFFLWnRR?=
 =?utf-8?B?dFc0TzhiaVVqYWI2eDlOb0NRWEkrSEgxYjJVTkszclovVUtGOTR1T1J1QXY5?=
 =?utf-8?B?UDV6bG1VNVRxSWFhMEt2c3UyTGtrNEZQVVJsS0NNVGFZMzR2NFBKR2VMalBq?=
 =?utf-8?B?cVd0T2NGZE13UURFNUhham0yMXJZVHhIK2ZhSzc0UGxpMWJJOUZnMzYxcUhP?=
 =?utf-8?B?RlNRT2E1Q1Nlb1dKZ3VMOVg2OVlmaVQ0VDNZMkpTNjY2WmhYVC80bGc1dWgx?=
 =?utf-8?B?QTgzNlZRM3Z6V1ltR3NVL3pTNjYrTEFxd1JEczJuNHNvU2VoWTRSeDA0Mm5E?=
 =?utf-8?B?UmNMTVBhMTBuNGlCUnZOZFdpam1BdWtJSFJRRDBwaE5uV1kwNTZGdFg2ei80?=
 =?utf-8?B?Ym01anhkRFV2RUx3SXFKcU1JQVorSG1wanNxd21YWWM4eVpmdVV6eWJvUUxL?=
 =?utf-8?B?M3FaYTBwbXZJUENDVUZsZ0ZyMFU0YVFiUFloeFV1NEJwenhJb0wxMmp4MWZn?=
 =?utf-8?B?elk0T0lmMTZnKzVpWmx6OENhTEZRaVlCZEhZQlVTd2ZGUlNWa3I0WFFaaVA4?=
 =?utf-8?B?NlU4MDJ6TDlzYjdTN1l6d3QxTFRWeHo5aTArSVNNTjFlTFNFSS81Rm9mc25F?=
 =?utf-8?B?WmczMzFUczlXaVNwVEZxTlhCM25PdmxJMHljaDROb2cvbU85bnlNSWZSbXpR?=
 =?utf-8?B?Q2dhZ1YxQ1VsMW1HUHZlMHF3ZGR6SlhXcmZSMTJ3V2xOd0t6c2xsd0lNNzlX?=
 =?utf-8?B?ZnNjWmlTZkhTVkJub3UyL0dlVGIwQkpwVlFWbkw0MW9HTFZnbUZPL0pvUkdC?=
 =?utf-8?Q?fOyjBR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1pXSEhWWGhwY3dXUUxOeWNRcjZEMG0yYzd3SkFRNEpjV3FVZk0wUXl5WDFh?=
 =?utf-8?B?MjdkSFY2aVZxdG1tNUFhRWJxQ1JQeCtQbllPeWtKd2FaZHdEVk1ER0dQMmFK?=
 =?utf-8?B?T204YjlSWGQxWXplTlZpNCtmcGNkdHIra2VoOXdua3k1bVQ0ejEzUGFzeWNa?=
 =?utf-8?B?NEovWmFvNTBOcUVOZXZXUVFCcnIyV0p2dVE3OHlTRm5vOXVOUzBJOGxBM0pP?=
 =?utf-8?B?QU5DSHUrWXNOS3h5bmZ1MXRyZWFZaTB6dVNDcHpzaDk2T0F5ZmpScmJtZjRU?=
 =?utf-8?B?VGxyU0lZVlEya2NFYlRWdWFnSXlLdW1XYzdNc21lV0EyM0pUNkxTTzNiYjE2?=
 =?utf-8?B?QUpEcVlZNjA1R0ZyOFVnL2x5OWpZaE1XYzg3MVJkREd2OE9pL2w5VG12TC9m?=
 =?utf-8?B?TEtiVk93SmJrbXpFeTdyUlJNcGVXYTc2Nk5MeFpITDRVWlJET25VaHJ1WnVV?=
 =?utf-8?B?RnhGL3FLQmxhYkp3UFJCaEc3R21WRmEzTjVGY1hJNEFUUXMwNVl0bWx6c1ZV?=
 =?utf-8?B?TDVHT2tsOUNweEN1UzB1MGdhK0YydWJ6Qzd2bFBWWTFWYzUyeE4zOTNOcUNa?=
 =?utf-8?B?SlludlppMk0rWEcxR3NxZDlUakQwTmhmOXFKOHJDV0xSTjlHNWV5cmVWanli?=
 =?utf-8?B?cDNSR3JtZ1ZGTE1VbUxCZklVVll1MkJqRXNvdnovQk5jbWVwa0tXMEZSUnBF?=
 =?utf-8?B?WVR3UTVsSGRibE55VHFrdlpndUlTL1ZLTDk0ck9hc1E2SEpDUkhyUHZJb2VM?=
 =?utf-8?B?ZTJoakN1L1pKWEtHNG96cGRQY2t2clY5RUllY253UVJXc2NZUGpoR0dvcE1H?=
 =?utf-8?B?TTJIOGdHaE42blVyOFU0MytYSWRkeXZSeHpRZllOSFgzcHkrbXFUK3l6ZXh0?=
 =?utf-8?B?d3I3bHRkbW5pSmRFcWFJRi9iRFVaY05XbnBYRjUwME1EMnlmUVBJTDU0aEJy?=
 =?utf-8?B?ZHlKakY3UkVjTmEvWENNeWlZWTlYbkpkaE1VZFRQcmdRb2hScW16WTB0MlpL?=
 =?utf-8?B?bG1YOEJ4OXp6M21JTnJ0SEJENTFMdzJyZDBNcll6cWFvdVYzVkNGbU9sQnBU?=
 =?utf-8?B?bzlKaW5Fd3JjR3dHQzAxTW5XK04wY1RHdXVhejhEL1h2NjlmdnhHK0pxTlVZ?=
 =?utf-8?B?ekI2TzlVRzhDZFIwMVVHSzZ1bzhvK0RJV2ZzQXRqcUJCOXpzcHcrUWM4aTlq?=
 =?utf-8?B?M3pNV1VJVGl5a3V6clRKT3RVc3U3Vy81UUxKemdVbVNLWGplYm81N0J2cHNL?=
 =?utf-8?B?Q21nLzBXZ1BteXMycnRKSnJ5akVlSlJDb0poS1RmLzRLTWJtSlZIZjlFS29G?=
 =?utf-8?B?UWsxQXgwZ1B4V3lmT2l0bGtZN3hTTUN5WTFkTTM5cDhDdll1bGFHbWw0MjU5?=
 =?utf-8?B?ekZ5NllPL3JMRkRSN09tMjQxMXNBcGtYMFJxVnczY1liUC9zdFlnTm1obTRI?=
 =?utf-8?B?cFNzYzBSMjVIR29EUUV1bEJFajU5U2x3a0dFM3piMUhrSXV0TS9jdjRMZFo1?=
 =?utf-8?B?YUhKWWRXZWI2Mk85enJIRE9rU3FFb1RkMVVkeDdpcXYzTnJveW5jWjRRWGI5?=
 =?utf-8?B?Zjc5S1pQbjhFUmRXTnVnNjJEZXlrVG9UWHZXN1ptZGlWZlRnWnF5eFoveGNJ?=
 =?utf-8?B?ZjJucnFNcHpyTEFOcU9FUVdwVFUxQXpWdko4UFFETFJNWmtGOUw4ZGJoMEt6?=
 =?utf-8?B?a0RTWUNuOEJPaGhRaTN1RzRvQnpUUDhUUGxuT0I4YmxwdWFMbjlBRFZ6czVE?=
 =?utf-8?B?VGgrM0NHTENUM2dPWVpQTWdBNFJQK0tucmQ0cjFZZmJ6QzBxNS9PTlNVYjQx?=
 =?utf-8?B?d3pXanYxemFrK2RxUTY1eDlTTVQ4emdkSzNxRlhzTnZ6U1A2eUtQZ1BEajc0?=
 =?utf-8?B?RlEra1Q3MWErQ3l2b0dmTmZUai9BMEt5MjVwazdsU0dWTjIzSXV2eFJ6Q2Mv?=
 =?utf-8?B?eTJDNmgwZHBVekJPblhQUDk2aHcwRlJhMkFWYlliSFRnZktSYTQ3TWhtQWRu?=
 =?utf-8?B?QkFhbzl0MWVnMTJGRXVZQmI2UDdvVjJlTkREZlpSVUtCOU9XUmRteEkrVmhF?=
 =?utf-8?B?S2t4OGRudGZOMVZtSTQ3STM0L0ljTFkyZTU4SFN3SlVRVFRybm5xMm1BaEQ2?=
 =?utf-8?Q?xne07rf6ZDYE8josskiouwLH3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ac835e-eaa5-4487-14c3-08de1b89e74c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:07:03.9673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBCjdkhIs/C5fRrC0GtGnsQvWYWRnrjWSf02f8L3qS6n0SjArK/gaT62Z1hrKInCo6Koudh+4LfKEibhwQH0Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10955
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 10/12] imx93: Enable remoteproc for
	i.MX93-EVK/QSB/FRDM
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

Select configs to enable remoteproc for i.MX93-EVK/QSB/FRDM

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx9/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-imx/imx9/Kconfig b/arch/arm/mach-imx/imx9/Kconfig
index 6ad02b9d5810379afd17290a82c40e23e4d26a66..5ac516961264dc98352d2347ff57093079559a72 100644
--- a/arch/arm/mach-imx/imx9/Kconfig
+++ b/arch/arm/mach-imx/imx9/Kconfig
@@ -69,6 +69,10 @@ config TARGET_IMX93_9X9_QSB
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_11X11_EVK
 	bool "imx93_11x11_evk"
@@ -77,6 +81,10 @@ config TARGET_IMX93_11X11_EVK
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_FRDM
 	bool "imx93_frdm"
@@ -85,6 +93,10 @@ config TARGET_IMX93_FRDM
 	select IMX9_LPDDR4X
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_VAR_SOM
 	bool "imx93_var_som"

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
