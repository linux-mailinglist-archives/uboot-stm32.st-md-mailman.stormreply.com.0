Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5510BD7E5D
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61420C56601;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC1F0C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuDuIFUcR3DdSG/+rrkJHCbCzogLW6AEtrNOuwmyi4smwidZQ7QPULUlW6bHp4x/H6jUC70vITywiVSfqnfK+YVUV3We/Yd2iNmQKc8r9vyW8TyrAWdyIZqpfNpjN+a1mh9v4GFPDHlvuep5wkNt3eSypmYS13H7aUIwNkxEKfoMKp6hQPi7tUhEL22fpTkX3v7oSijZrGGDDT+fcpXKbd0jLRcxHtdW2nBsvQRr15XIF33t00YtFMG456/8qm3WilyuX8cB7CMvMZdKuasSIt1dsgUfpZbZfYjASki2ayPJviQl3njC6FADofkNG5rWKhh0uEf7ntpAGOXhfRAy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSOk2R4JBxKt67UHb6TZhNV/s8ITqwQYSAMcWrXIBxI=;
 b=QnwgYryRltqBAjCKvO/SXGZNkRbEPM+WjSjx+gZtucoi+GVUSUa6gXp+yjsq1HQ3WBaKO6KHgVGV6eAIGMnXEAh0/+SM1sIBbI8CDN6vDJ9H1+IHZUhvlvlb1vtVwsFp5gImL/AvQPjvGs+GbOo/jRA4y4/+g30spNQEHl1NktH8P49Ewstr36OoMFJHyMiQ8GoQZN+LLGhr66C5ml8z9NuxIEJyReRt6d4Vsy4qCAL/W87erQU6Uv9U0/iWobWWHGoF4jf7e0xyEh3X10cwb60opzkKt419eyFqbeT2kT3vShw+4Hu8XWbn6L0azto7r+WoRj7gKKoAGApot8lrxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSOk2R4JBxKt67UHb6TZhNV/s8ITqwQYSAMcWrXIBxI=;
 b=s6giujt7384+kq3WtJn8Q6OhTmjTR/WCQSLVWA54ikAlOusoAKh7drm5THzJ/ja7EK8hO51QKvDxCK40XlqZ6v6dSXwlHL/LLixyBjlZOtTL7bbRhB2Bs47+5Tr4/4tCFhczO04VZFFbVxK1dv7SMEe36I8g4dcar9aHUBIQHVeX9EXnjEuL62zSnawS7Bj4DCjr+cINjIyBXDwreAmpHrz0EW6BMEaEriUULEdJlkrvojfVjcorMOcuKYHNWjUhZixUiZJHXF7UBcH7JD9sLXDv1fZnsbZJe3iHNTFygwGrxUvKo1xPkDb6aGQYYrUHfYe2+AnsCkRiR3dSjOMiHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:26 +0800
Message-Id: <20251013-imx-rproc-v1-7-fb43a3fafcd0@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3891586a-84fb-492b-ef9e-08de09f91ac9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE9icGFPTk9YTVhaWi8ybTJueDBUU0haYi9OdVFXTXRmNFpWZis1cGJWWGUz?=
 =?utf-8?B?T25DVW1vdnJWRU5WMmoxOUhydzBrTERIRkthLytNWkRHQTJUdWtoVjdvc1hn?=
 =?utf-8?B?dXVha3hyYW8vWU1WMjdWWCtpMG5aUUkzL2VibVYzNmNJK09wNFkrWHF5RkRr?=
 =?utf-8?B?a3lsb2pPZXd0QjBPYmJYTEk3alcva1llRGN1aUo5K3dFamNDNC8zdlRDSVA1?=
 =?utf-8?B?amM5WW1pTC85SVlTSDM2aWV2QldreTMwTURiaXVlSXBQaTVVOXJZTGZWN0gx?=
 =?utf-8?B?OUdOcFc2RXV5Z0pqb0lyNHJ2aWFXRTBMM1Y0OXFLSEtVY3hkekJhMUxJWEkw?=
 =?utf-8?B?NGZjTUgwaStDSWFhbDZFL09aaXRrRUZ4SFNhejFuRjQ0TVFUUGJqaFdtTVQr?=
 =?utf-8?B?MG96ejE1bitmc0lUT1RqSGRiNy9vNlVyZ2hQMXNxSVZaKzBaSVZBTFF4NERB?=
 =?utf-8?B?YkxFRHowc0lpcXRzYjNxejUyVzRiQ055ZUhnSlQrQVBHRm1ydEJzWG9icU94?=
 =?utf-8?B?Z2QzekJWajVLdTRmaDFlTGsvSEpQMldLQ3hKZXIxaDBpMVJrc3BITW5OaWd2?=
 =?utf-8?B?bmdwNTBNeWRVNjNHamVRZ2ZyVWZ4bitSaW9lMEJkSDNxa0hPby80dS9OU2ht?=
 =?utf-8?B?RS9neHFCbUNEVkxwKzM5cjh1aVp6WDdrVjBNZ203QkxIWnZKM3FtZUFqMXJE?=
 =?utf-8?B?Nm5ZeHhBMVphUm5lZDhhdHc1OTJpbTJDS1NEVE94QmZRS2xHb2hxT21mc2lV?=
 =?utf-8?B?NktFNVlYM3FKNGhra3NEUzl1eGJlKy9OeEdMVjhlb3hOWHFhYzZyTk5vOEV3?=
 =?utf-8?B?N3VPMTkxODBpN2FPblM2bVZSeGJzSUtzbDBoTUFLYlFMaGUxTkZZRUhPbFFs?=
 =?utf-8?B?NUFUT1JxZTUyMFFhRDk2SUd1NUN2WmtWYXVyaEh2YnVkSUUxeXVrM1hablIy?=
 =?utf-8?B?Z2d4b0FsT1lPK3E2RHFlSUx0SUtHb3k3a25SdlBVRGtvK1RiQ2hJREV4Umk0?=
 =?utf-8?B?UGEyWTQzVTczQi82SFRJeUNOMUU3WEtmWUV4YnlTZzJLZVhlV2RueDJPSE9I?=
 =?utf-8?B?R3k0VXNocGRXSmhKQ0lmZTFiQUJRZ1gyUzZ3SVFNT1RnM2ZPaFc4Slgyb3kv?=
 =?utf-8?B?OFdOaUQ0cjRVaTUwSmk2azRHTHBzb3NFVGpWVFYxbzE1RE5KVzc1M1FzWDh5?=
 =?utf-8?B?MUx0d2x5cTB6Y09wZ0hiVitDclJuMW9ucGhIRU1lUWttU0FLaFYveUNHSlZi?=
 =?utf-8?B?MlJUSDNmTVlTbkd5M2Z2L2dvbDhQaUh1QlJEQjgxamJFUjB2cHQrcWlhUnBT?=
 =?utf-8?B?aUgyb3BnWHlacmVlcEZXWlJkVVVWMVFIcW4rdE5QSzlIUHRnbUc3c25UQzFX?=
 =?utf-8?B?ZjhFWnYzcDB0UTFhSHZZMzF1T0RsZGpDTjM2UDdoUmhkMm1XVXFKY0FaWEN0?=
 =?utf-8?B?UzFLVXViOWJUZ0JKcG1IZVVOTlRGN3JUWlYzNTN3a0JBcEVqOXIxWGRScGVR?=
 =?utf-8?B?TktheWJOZnU4cWl6ODJkNDZzYUZhdWkwMG5RU01NOTRSakNHOHZOeE00RW8x?=
 =?utf-8?B?WlRXY2s2WDFMTllzaDVuZmdWckN1TjhMcTJpNzg1eWR2WmdSeWptS2p5c1Ba?=
 =?utf-8?B?Z2psZzVNcE9zeTFaVkFXZndtL1dOWVJxK0tBREdCTzZ1UFMxV2xJTUpOKzV2?=
 =?utf-8?B?cUpZYkduU0JVM21oVy9EcEcrNWZwSzN5dWZyQ283aTFITXpGK2lSU2VBZGx4?=
 =?utf-8?B?NjZDMUpESFZySUF3MnlNa3JpMC91M0JGaE1IR1oyZDV6OGliS2Uwb0pQQ0dH?=
 =?utf-8?B?ZXhlaGg3MEM5ZWo0ZjNzaTMwdnRDWUtaRCswVGFCR1hraWdsMVMzbEVDdDdQ?=
 =?utf-8?B?Y3VqODdsbUtDSFBaQmZaQlRtK2U1VkVxdVhnMjFNbXIrUzhQamxXMndDSWg2?=
 =?utf-8?B?bmtrM3pYSVc1czNlUHZSSjRJMHpUeEN3czZWWDBnb0N2c2tJeUloR1Z4NHNV?=
 =?utf-8?B?NlJPdDVvV1JlUHo4a2Y5YnQvNE04VnBGSm9aR1VZZ25oajNZVUlFK0hLdVl1?=
 =?utf-8?Q?m21Y6h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0dUbmJuRXQ3WXF0Y1d3YlkrYWpPeU0rbW4ycEdDRXp6ZnNsL0IzMUJUNDdQ?=
 =?utf-8?B?MkdIVUlFYUZWdVFHUGFLb0NsQ2FqNlh2NzF3LzlvSzUzNHNTKzRmdFRGeGJh?=
 =?utf-8?B?dGZ0SHJsOGFXR3o0MTAxVmh2U3hFT01RS2hVTk1kUjVQTTFLRkNvRU50N0hG?=
 =?utf-8?B?SmZjeVNHaCt6c1IwMVVnSTMyNlpzOTMvT28yYUlDM2wyZnBWU2tFUm9RTE1r?=
 =?utf-8?B?T0l1RVFtRjVoOEMvZFBLSEVMRThXMnFUQXhTVDVYWDZIK0hNaFVvOUVnQ0Fw?=
 =?utf-8?B?OTEwaGJjZk1WT011Y2p1RTFUZzFiWXpHNy85d29TT3dZRjZCMmptOGR5Ykt6?=
 =?utf-8?B?NzRUOUJZVzZSenhVS2d3VjREU2xDa3ZqSFJwbWhMaTNFR0plbm1jeGJDa1FH?=
 =?utf-8?B?UkphaGVHVVExckt4UnRkWjlrQk85dDFWMk1VS1JoR2ZLZk54SXNHekk5Vy9h?=
 =?utf-8?B?cERKcHZROWlheGVIa3F1amtiTGMrWlVOc3d6UUc2Q3BSeG5NYjVtOEh3K0Jz?=
 =?utf-8?B?c3Q2amxiemd3MGVxVnJsQkEvNkhCYWRoTDFBc3RNZUhMNFI1d2MxWkQ5RVNL?=
 =?utf-8?B?QmlqamIyZ3plcjVwUWpGT1VvdmRGdmRsRTA4aDhQYmhkcEs0YWF3V3c1THR3?=
 =?utf-8?B?MDA1bGN3aEYvM0RrKzBGL2MyL0l4OGFYRUFSaUFNbG1ReFpBN1NKc2FWV0pa?=
 =?utf-8?B?MHRuanoxa05XSGN0SnNNdmtpTnA3b2llNmV1dC9ndW1mbWpucWY2b2FuN2dM?=
 =?utf-8?B?cXArSmxuQnVXNXJybndMY1BlZEhZS0w0UDRtcHA3QkVYQkVJZ3FEVHV3bU1O?=
 =?utf-8?B?dm8xRE84S0VmQU03bkVnd0pDaXArV1hPWVFyQUxUNFgrWVR4ZUJCSVcwTTIv?=
 =?utf-8?B?cmJXS0h0bk05ZHltblRCUkkzQTcwU0R0cktmZzZKMGJNT3AxL3FqYkRlYzdB?=
 =?utf-8?B?eExCNUlWRy9wTlpqL3VaYkxjRFRXK3dnN1RyaEhvLy9ydG9WUmQ1LzF5cEVS?=
 =?utf-8?B?d1hRR0R6TEx3aU9nMEt1S0J0ZjlXdjZNTk1ycjBYUmg3YmF3NWxyc1BQSWlK?=
 =?utf-8?B?REJUS0w5VFVKMmMwTEFpRkhyeVFFSlRHZ2l2V0tUb1Q2ZTl0SzNLd01jTnRr?=
 =?utf-8?B?aFhJOEJ4bVIzQkZPcWhKTFk2QmNxREtaUkxBZXhnN01IODloV281VU5xZEpE?=
 =?utf-8?B?Y0F2blNjTEp4Q3cySGx5VzFJR2JUS0wvUnVvRVJNOXFMZnVsNUwvYkJNeEdT?=
 =?utf-8?B?cXQvaXFkakNLeGV4V0dnbXVqUFBVS050K3BIYUtJSnVUL21zTTVNOTFTOTJM?=
 =?utf-8?B?ek1qVkdKZVUxaVRvU0F3Q3htWXd6N0xDc3BqRjBmdXJjVkVyTFNJRU9vUVl3?=
 =?utf-8?B?aWViMGdZSVArY25pMXFiTldaajB4VktFUjkvVXhPR1R5ZTA3eDFhenRkbW40?=
 =?utf-8?B?Rk1wOVIzQWVQclZoUE5zSlVKOXF1TWtaTiswUmwrb21qRUVlMzh5VFNjWGow?=
 =?utf-8?B?ak1HSlZlcDhhVUNjT3NlY2VxNXl1V3pwTWdXSW9FYlNQQ0RHYU4zQ2hVSGlq?=
 =?utf-8?B?Z2lETFNUM1V4L2Y4MjZjZG5jSE90VkgyRDF1Q213S0hlc1pGVkJnUUFUbjNY?=
 =?utf-8?B?TWZHNGU4VE1KUmJYSmRUUHE4Z2ZkeitTL3VXejRjQjVCaHI1eFZaRzVnVk1W?=
 =?utf-8?B?ekxUelhLd0I3WXhKeVZ2SVlhWmtsK2tPejZNTmhScVBjUkZzdWhUNDNGSlNX?=
 =?utf-8?B?OExvZmx6c1RsYjhYRjBmWlRQUWxtS2kyUXpZZ1RBditTbm81ZEJyKytRNWpN?=
 =?utf-8?B?d01pcWc0a0poaTRLbkU2SDJ1Qm9PS2IrMllnUitxVWg2czk0elR1ZDJDVk1I?=
 =?utf-8?B?MnZQUThFTWpEVFE3T2k0WTdyNTFVeXZtV3c3UUNnVG0yYWJEeXI1QjZnbGZV?=
 =?utf-8?B?emhrZWFGQmtidXEyMVNxWk5kMEVmdzgrejREVVlKK3RWaWphUWViUU5TUzZZ?=
 =?utf-8?B?c2xTc245bVZVdDFWaUlqK0pjK3NwL0RkL21pMEpValdEZUtMRmNwdCtRZlZv?=
 =?utf-8?B?R0dTTHdQY1RCZ0daS01nL3ZZWFQrSDFwdTdLandRRDJ2Vyt2Tm5NTUNBRFN3?=
 =?utf-8?Q?3Ko6QuxMDMdb20/7Vmir8Ao0j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3891586a-84fb-492b-ef9e-08de09f91ac9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:43.5470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmmpuLULkGnMdvQhHWHxplEFTnVYsPXi0jOCebMTkwc5QQAUaqbQ3+8TyrjJIAfSGzocSDKFCnYD7tKKtpmbzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 07/11] imx8mp: Enable remoteproc for i.MX8MP
	EVK
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
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
