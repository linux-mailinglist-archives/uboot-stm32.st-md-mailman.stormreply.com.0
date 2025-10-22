Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E167BF985C
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6BBDC5E2C3;
	Wed, 22 Oct 2025 00:49:20 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B78BBC5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc6PbiQYhbzIGfDNjxoi+1b1j7HOumKeERfFfu2mHbzxixFZn/+7C/Thd47rIRQK4Nc+OQqVPDXtwN0A6c104EJ8A2FlqdquTCl0x2JnfBFyCkCvnwKlwc3xt1TH6X7qCKRYh51o747ftGxODRR9v3Lv0z0iPNFdJm0OktjGnYJ8kP/GjYAFFqBnK1jB8qJeAzztfPHl76N8JUsXipS3J+WShPjm26gRlZepeOV3Lr77AuE11oxbrRj2rF2hkzaFqNTude5axPnEwZcBffaptKyXWZj5Xk/SkFwv2By9wSvN77gq8zzB7ho407tMgR4qCOUIm3dB8D++cV2CE0Y+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q9Lgp7s0o6y3AJQNTpBS5pO1m2WcQivlvAohBXVQRs=;
 b=SG/u/bkNT5YFbz9KlyqwLmvP9Ojj2ltly/PViZWelC8tUAQNJCswSX+PDLimHZvjueW8pUU+JbelO3T3c9gHifNAOqk+jWOAhpIG7hKCxu0PGleVv8wwsTglwUAF+y59QCBOpCGL/XpyuHfVHTNE/Ox0ckJs/AKhxZLgnSAT3gSQiaMVmbdfxKOS/sRyHvkjubktNyRY/Zyr8ycjhj7mqcgEksmUWZVn6AkQjdHXKkFFoxs/GA0SCsvdpDneZdUo1eo9wXEu0oJgNe4xa4k5duEYXH120hYpTxenIDDxcCsvaD+NjCUW0cSNee9A7x68IrU+bv39/YMaQASIH9Zi/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q9Lgp7s0o6y3AJQNTpBS5pO1m2WcQivlvAohBXVQRs=;
 b=lSf2aViU5JUGuyeryxspfH4g5VIHxUUo935kdPDcxOtsTHUOLH16zSxkWzmLoPxaCC/ukyb/YdAYKUxY9CPho9rukrY/tXGCyYo+wxuyfNbgfLwkCxnZV4Jx15tIqJVzG89gs6MfHtrpNAfpq58zwHmT0FaqQ6vHQ8SQXVydeD1iPouYTrXYH43404HJ/vvxEfHp2nFiNJ+FfceNZo4Vmr3kgSzKi3KFXHwTu7YSjjzNGbTRjYmSkdnj03SmW7rhmhX2wdEz2afKe76VqJ/B2VWchLJntHlyv1hA4SXCS6tCemMlCtKlDdUbP2+a/dAZWKp9Ot5YYC4eY6HGUzBYyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:18 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:31 +0800
Message-Id: <20251022-imx-rproc-v3-v3-5-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=1963;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=h+N2NEJapn3FzYp5kMru/5FeC7RZ78w6kPMaHhHMC5I=;
 b=0YTeEHWm/ndtyQbV7AJV7rRnz0ni9HviAa3pk8bRWOuKbF/bSvxGHZSSxt0lfTthZcnmPSKbk
 szeriI8dZ3hDWWCiC1+xHH2FE3mIvFLvh4LIzSmuwEwWYwDyPb7cyDL
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: a0326947-f4ff-4d88-fe84-08de1104d505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFlud3k2Y3dJdTdmcUsxYmw1QTBiZmFjMFg0akNmSnpuRDJlbGt3T3ozRm42?=
 =?utf-8?B?MGZsWlphMFMyZ2toNkMyYWZ1bW1yOENoUlZFOHB1cnY5cmtubHZWYTQzK2ZI?=
 =?utf-8?B?bkFDbXpnZDJLVnNoNDVYaWsvMlNKRkw3aHNWOTZGYVBBZHVnM3A3S2JmWWJE?=
 =?utf-8?B?VGZ6ZThWaG1HaFhVNlBzK2JOOHd6TmRiOVU5UElYRkE2bHhIdjBIRXJwTE1J?=
 =?utf-8?B?Rjdod203NE83Y3REY3dzQjZ5dVB0M3BWWmY5NE50K0ZJdmlDWFEweUxJTVdK?=
 =?utf-8?B?RkJkZVlhTlhndzJoZXMwbEJNL2FYR05VN3ZpQTd5ZWt5dEw3bzJYMGFqNGl5?=
 =?utf-8?B?eHRHRmM2UnRqc2hQY3NMOXhGM3d6K3V6bWZ6enBkMHRqR2Jxd205cXdLT0Mw?=
 =?utf-8?B?RHlQeCtsb1RYckFmWnJ4cWx4cXZqNjVFbnBQdG1VWFFhRU1tOXlHbnRBWDh6?=
 =?utf-8?B?VUozamovMkJhVjNMcVlpcjNpelE3a1hoOGJiZDFJRDF4M01qZmtEYXU1T25t?=
 =?utf-8?B?a3pHaU5UMXFTOGUzd2hLYStkaUtsK05ScldURWQ1Z3FkRzVYWTZkcE5Rai9r?=
 =?utf-8?B?NXBuMDNwOHpTU0RCSUhaMzBwUWhBVnJCR204QWFSY01qMVdseTN2NkhpbjhD?=
 =?utf-8?B?RE1UN0Y3WGs3aEJPWUpYdTRmVnZSMlB5cmFvMjREdC90dWt1dkpNOGgvUHBG?=
 =?utf-8?B?MHUzNFdBT3FZQ0lKQnFrQlh5bmdySU5XaGdaenJnMFNvS25kNEpvNDNvKzB4?=
 =?utf-8?B?VFRpRzBqZSt3bHpVemFsUStsT3dxeHhZcm5IVjJRU1NRY0xSbmhWZTNjUUgw?=
 =?utf-8?B?ZldXUFdYSnFSRnFST1VlRVU4UWQ5MFBnaWtrTml2aVlEYit2RlE5UlE5dDJX?=
 =?utf-8?B?ZUQzUmQyTDJrcTdROFI2cVQrbjJBa2g0eVFqTmcybEQ2V1pyejhySUVmeWJh?=
 =?utf-8?B?YXoyUXJWQXZOZ2RyTDJXWFRUSmxTcGdzclVmeUFtWmI1RnJ5UndQK0YrRkNW?=
 =?utf-8?B?aWlvOEVnbFpiK1BIZWFrUDcrZUkrSkU5Y3Q5dlhsNnEyWGgwQ080Y21XWFRN?=
 =?utf-8?B?UGw2Q21oNmEwa3cyL2JvcU5JK0U1b295NUtKT3hqSjd5YTNlOTlQcUV2WS8x?=
 =?utf-8?B?YVgzM1J0c1dkai9kS1ZZTjJUZXh2RGdHcHFLb01ONHdVRjZLQnZOck04Wm5J?=
 =?utf-8?B?dlhwQUc2Wndnc2F6NEVmbWZFcCttUVhBaEE0VnU3WG9TdENsWmJJN09FOEE3?=
 =?utf-8?B?VnEvSXJEL1pGeHZidHZ5bmhhR3ZIM0s3ckZPQ3NBZFc2aUh3QU5ZRElxMEJD?=
 =?utf-8?B?MElrcHVxaTZsd0RGTWZkTlV4WVBad0Q4Mit6SlJzM05qdTczR2txVHJTRmRV?=
 =?utf-8?B?QWQ1aDE4b2ZJTE5Gc2JOMEEvNElqcDRPS2oyOWh2QmFicHlocG12dGlqNDJN?=
 =?utf-8?B?Vk5qUzBiU1Bab3FSdk84WCtUUXVBTjM4VHZWQlRrUzI5bkNmWWNweDZDMVRU?=
 =?utf-8?B?NllyVkJ2OFB3YnlRWjZVc0xRSTdMMzRHdWRTZ2VzMDNQUGNFclkzUmsxUzhQ?=
 =?utf-8?B?VjRMOEZadStsc2lTeVRna0VCOGhORnozb1daQUpiYmVVanp3eEtpSVhWSGVr?=
 =?utf-8?B?NEFjbnZFUisvemtTdzFpWlpCa1hiZnduZktnMDVUemt3Z21jUitGbk9BaVRt?=
 =?utf-8?B?WC9jYVg4Q3lLU1FZWXJ3bHJZUHcxb3J3Z2xJeGhRUVY0cGtBRW53WUdZZERN?=
 =?utf-8?B?NGdjVE9vcUpyZ2Q1VHN4VHZRb3lZdmVZaU92RjVQNnhSOGQvYjVVNlQ5YjVm?=
 =?utf-8?B?RE5zR1NOMEFxTldUblJpV1krWUNLdzJNOHNnL0FYdVlrWkR2dXh4L1ZHZlAw?=
 =?utf-8?B?Q0hrSWNCL0xobzh0Z1NBc1FPSmxlSEN3LzdRNXErMVdMWnBKRlZMRzJMd3RZ?=
 =?utf-8?B?RVVvVU84OWljOUVVdmhCUmQvNW1vTDhwODRkRzFaNVI1NG5kMzNud0xWVXJp?=
 =?utf-8?B?eW5FdFl4THAyaXNETklNdm5UaFBxdXNLeEtsZWVHa2d3OXUrVXJwam52NHpC?=
 =?utf-8?Q?hN78oP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBZaHRVdEtkOU5VR2V2L1VhSFFHNkRQQ1RycHViazFkTXUxTXlvOHRybVpk?=
 =?utf-8?B?TEo5dUFSdkdIdDVMWTVtUlJXZEZrRkMwaUdQMXpBMm1PZ2pscnNvblYzY3d3?=
 =?utf-8?B?bzRZUjBkcmZkaTRWMVlmRHd0OWZXeDl4ZjQvZGNpeDFTTlBuWnNCV2dkdkRs?=
 =?utf-8?B?U2l2eG00dGFPN1dGcHpqSy9HSFBLT214eFF1Uk5JQmJPNDJwRklWS3kyR1Iw?=
 =?utf-8?B?eWlMWlc1Z0kxMWJLeTNsZlZ4WjNISU82cDFMUWVEenJqMm9vS3VlYWo5dDBH?=
 =?utf-8?B?UWVnTFppVThQTGZRbnlEaXVISVlqcVpLRG83VUN2Zm1VNXd3QTdNWHZaYjFZ?=
 =?utf-8?B?cEpnNTRRdzhSNkRnekJkZjZ0MHZ3ODVNSWpIMjhlNUM1Nk5vQzk0aFg0cGdw?=
 =?utf-8?B?dU9WSllUdDhNNFJyUkp0ZXExOUFkRzZHUXcvZkNseFJiSWp2LzZPdkJwL1Ft?=
 =?utf-8?B?T0gxMlFaTFhMdnF6SnpFL0QrRkpVMWFTbDJPQ0Rac3AzZGFOOG1VajQycmo4?=
 =?utf-8?B?Y0JjaWZIbGxBa3NJM0toK1l1YVBOOFJjNGx2V0E2Y3ZhdWU3c1Rac2NlMSs0?=
 =?utf-8?B?ckdJTDFrWXpzOE0yOTlsdHhnTmt2SWIycjVXZWRFb1lybFpkMGZ3Z0dwQk9M?=
 =?utf-8?B?bXpoNXpIOXJEK3lBeFVnZkMyRVdBcjlVRVJTRWdnK3ZjNzUrY0tjN1F0cHJh?=
 =?utf-8?B?UnZUdTNNSS9FUWxORGY3Qk9raWt1ZFRKRzNYSlJ1N3FnbzRDc2NHMHorWElk?=
 =?utf-8?B?MU1kdktnNlR1VjNycGlkQ3lEaUF4dEROK3lENmFKQmRMSVd5Mm5ZYzJLUHJP?=
 =?utf-8?B?azRCNlJVL2dadmFJbEFXSUo5NUNyTmhuSmV1Yy9HYW1PcXZ1eUZuVkpubnBi?=
 =?utf-8?B?L1Z4Y1FWcEhuT1FBUnVhRVFvUk01MlJtWXRDWnFDdHZYUngwL09KaEhuZFNX?=
 =?utf-8?B?T0ZudGZLUFNVV1B2Q3pmZmptMXRxb2xmNUJobFo5d3N3Q2l5VElRNGNSOWo5?=
 =?utf-8?B?SGtUaXFIck5vTEhXOFV0SExWbmw5MFZyUE5tajRIOHZMdWRoR1UzbEpCQkk1?=
 =?utf-8?B?RE9iNXdCVE9FTittN3FZOS96ZXYyOTB5cVdQczlzenVES3JHUGVZSDV6ZFVZ?=
 =?utf-8?B?R2pNMXQrdVp5MUVKdmozaWVyd3ZhOGNxUzkxNStGNTZQSFR6dFREd21WUTls?=
 =?utf-8?B?b3IwS3dDVlNWV1VNTmZxQTl3bHVwd3IyQjBTZ3BXZUxQSmxibytpSFdYSHFQ?=
 =?utf-8?B?SUtSeEpDaHZQckh1RkxDVE5YR2lBSHIyeUg4LzRadlRDKzM2TFl0UXFaME1i?=
 =?utf-8?B?YlNoZFB3TWNkU0lTanpKTkJSZS9xSWZrNGF3dnE4OWV6UTVqWEQ5T3lHYTR5?=
 =?utf-8?B?YUlMaW9Sc1QzYUZrZXZ1UkJ0V0FQc0ZPZEl4MGdBN09Fc242VUQ5ZEM3OThC?=
 =?utf-8?B?Y09BanJ6YXN4SjV4NnRUVTRCcE5lOUhoWE8yTFdGbU91V0hhTVIvUlZMUW8r?=
 =?utf-8?B?VmprS01BZWVJN3ZKeUlOYXREQnFDOXk5c25pTXRrSmhNOEVOKzV1dUtlL3hZ?=
 =?utf-8?B?TDZrTVB1ZUZEejlkUHlMTFlxMmgreWRSdjRIZ2syRDVWcUd2STRiTk9KQWx3?=
 =?utf-8?B?TjI0N0hrYnpEbkw1Zjd6R3FVRnpJUnNldGRScmcrWGd3c05CMVowS0RXV2pO?=
 =?utf-8?B?anNxaU5QenFzc3RxeWVlMUhLRTVNZnJKRFVMZm1WU1A4ZFV5aGhKeGthQUJn?=
 =?utf-8?B?c1dwZHRyWVVmUnVHNDdzOExOUjV0Z1M4R3diOHNtWktJWWZWVWJwNGJ6d0xt?=
 =?utf-8?B?MzFpM2JnN08vU2tIcGF5ZXIybTVadUg2Q0g1dS8rdi9jZU9hSlZRSFJGVENl?=
 =?utf-8?B?aE5qTjBVUlpXWkhBWWVReFMvTnJxNmovV1lOK01PQkpYdmxHUjVzQmR1dFVE?=
 =?utf-8?B?NmNXTnY0djRuRCsybnpkaXlLVENPYzJMOTZWcTlIMFZzak5rcUZOM2p0Nk5i?=
 =?utf-8?B?YmYwNWF5SWRIOVd1QmtDL084YUUzM2dFZE55RUN4NHp0ZHFBOGhTU2V6azFD?=
 =?utf-8?B?RFJaZFo5TnZqZHZJWXB1VXA4RXhVLytqVE5EalpsZWdiRlN5Z2F0cEdLMU10?=
 =?utf-8?Q?M3eA3bSBNZLZVA4VJVIW8+Sw0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0326947-f4ff-4d88-fe84-08de1104d505
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:18.7150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NArXOI/0qxfEW1ibwJfHLCAhMnY1OtVRT0B/MVjJeFUrcLrW7gnoGP+NnsBg0yDPtXnUQCXMSU/Ysn0noPF4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 05/12] arm: dts: imx8m: Add remoteproc node
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
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
