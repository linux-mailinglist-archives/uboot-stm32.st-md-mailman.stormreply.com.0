Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714CBF9865
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20BB2C5E2C3;
	Wed, 22 Oct 2025 00:49:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AA64C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnyL6yYQst0qyRshK/kEa2qfz6On6GoG/vxS5Xvaa3ZhKQjCFYDcFuWUo6qAQ7ehgrGIvFlIRqoyIiKFD/yLU3K+6QeN6VmIgojFHOov0DSVfUQh3sFhVfg1aucXg0qmNk75S6qt5RIZWOt5RP472VaoJpAoLTlWfX9AN+R/ngPVF3Iuc9CJC7hrBsvybzC/k7JaXm5cPZgMXOyX1N9oxEd8KrCK5h88grCwbffwIufpjp14kGdU3O9/Xj3WxWpq/9mRUeq5oab3m7Aqa4kmcvJIW5/QDLS1VCB2RegrgjzF6YO3XpUIrJ/9hHVlee1tC96s3G11cIkgkWoGFPfcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2MfTdr0sGgtArBvrrsOqZ3uGgyi2tZ0043yKJtGlVc=;
 b=S6O5u+5Y/MORmaMa0lyVyou+vcfmIalIJHJk7M+E7ZaEPEcot51ioqyNghPf8DrPVRqaWxP97ZaeRkXvsfdju/XKCr/e3jFEalIC+SMsFbNWeGLVTUkYP9z+Xhc9RqFESDARanAJDXox+GOKQEwSETpWi+YTUsDDZeQV0uwaxMjgtfGOrpWxUjOkMP60ex/bRC4LSwkKFOjivbEZfIALnvgR+n2zrDyPhuGW3wjzcFe2YUYuOnvqmC4zmkcl76q2vWTjxJN+SpRDyy7+ksKF9mxQNhruTLpR+uenkFxjoLw3EMBSBvfctF5As8lOOfISDDhg2tpROUEAw/XiYhgBVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2MfTdr0sGgtArBvrrsOqZ3uGgyi2tZ0043yKJtGlVc=;
 b=mOCsw9olIb4Ru5bIQnn40MWUDXvKXVX87Hg/efTkKBo3yVp48VMGcD0yirkW6hqgjqRJtp4XjogM1zb2fm4Q1+fAnsm+FZlu6vXZEYyfwgVF5HCGK4dulmYdzABiNu0l5GZJ3gtw1K8PY3d49VoqkIx9O3bFljgqKXkMx8gSob35I/6Qebj8aihyE3B78oSEEYVsUQsigasfG9bdugqxHlhe3m9eMD8LPJyFlNRbrW7nzZNEvQg7JbCU2iMGGy3QIWhWXjMj6E8NV3n+TlCETlXu0Q7jl4spQe4vU2s3xEu3mpE9Ju5kXbOWM1ifjUSqJVBjIQnMYRY6CDpquPrOtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:34 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:34 +0800
Message-Id: <20251022-imx-rproc-v3-v3-8-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=1053;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ng+m0tT1Cpko2PTCFlrPuzv6RY6JW3cnRutVpkJhT/8=;
 b=oRFEAIpGMJdAp1JK+HwiWRzgtfFWO+DA3Bmf68muof5Gq3YhnaggjgRg3//yo+laNuhyoes0i
 rxTzJ95WlIUCQ2BbSG22Xv1vrAwAQCPcGPXI1jljFQjWoDBq/wY3E7j
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 5728588f-50b0-4c39-cafe-08de1104de4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2VrT2E3YUZqMUlTZEFtY2UreTh2djJyZE0vc1BtQWd6Rm4zdzhFdFRCLy9t?=
 =?utf-8?B?SUZTakVKcDdVS25MS2pyS2x2emg1SHlRTlM0dFhyWExPMmc3aGdwQW83UHUr?=
 =?utf-8?B?NkxmczhyMnVqTVNyT2ROb01jOHQ3YkNMTzlzUzluQjNqS2IzYlBCKytORWhp?=
 =?utf-8?B?TEh0NndtQ2RNTEJzNWswQi9QNy9kSlJidWdGSzJzNnJ5dFdSSXhlSHhHanh0?=
 =?utf-8?B?OXpxN0FRWTRMclpoT3Nsd21SL3BqMm5sOEU4bXhsVTZwNEhUNnZ1RDlXbjZx?=
 =?utf-8?B?VHNMWTU2d2ZWUFNiNDdUanhxVHVyOXk3VUc3bU9OeTBYL04xdWZJT20vbUFr?=
 =?utf-8?B?MGFGWEhKck1BOHk3MU1ya3UzblNiQ25OYmMzU2IrL2pzUWhYMGdieU16NU05?=
 =?utf-8?B?ZHUyUU82b2VHcTZraVBFd1V2SVlGMnJVYVNNZUZCbUs0SXVhMFRaTVNVck9j?=
 =?utf-8?B?OFBLYjdhRjgzRGsvQlJXMHk1dW9PclRoMDJPY1N5V05mTjVpRlgwVFpabGI2?=
 =?utf-8?B?Qk1XT1g2cmN2V05jTngzV2VOUXN3U3JMRTg5Ulp1ZHZLK1MyMlg0TUNaL3ZH?=
 =?utf-8?B?aHJOcUppTktSMjdGWVo5d01tUXlRSEx5WmJLTXNQZzk0TEh0S25iWktnQXdS?=
 =?utf-8?B?cmV3Qkd3VHJXUitzdHVNc0hRdENIK2JKeG5VeGRJS1hLTWRMUHBpaFk1ZFp0?=
 =?utf-8?B?MG1NL0l6RkZFbi9XRlAzU0RkUnhtUDE4eEF3dVBSQTViMWFwRk1pNnd2bzRY?=
 =?utf-8?B?dUk5Z0Z2MkVPbHZNKzcxTnE0ZVprVlRpYi96MUxGM1RnY0syc0tnZXFkNTZZ?=
 =?utf-8?B?OStBU3hhRWlCVS84TUp4eWt1R1FnZUZhNndRUFhvRXQ4RUNPNmNsYkNqd1ZD?=
 =?utf-8?B?enQ5eFRwTGVtbDduRjgvM0tZVnlRU2p4bGhkNVA2amhwN3F0MXhrVGFBcGVG?=
 =?utf-8?B?VUFXYWxwdUlpaVdIUnJzOUphN2xEc3ZUQUZXd1pPZ2VaRXJUUmdoRzNHRTdE?=
 =?utf-8?B?aW9tZ1p5UHV5Nm94Sys3dFlGUXJQOVpzWitTL2M4M3FDa3YwdVMvK1gwYllQ?=
 =?utf-8?B?T1FGS3N3NmV6Yk1PV3pVQ2lubU5mdEFTTGMvdzhVK1M1MVQ2Um9MT1Y5WjdB?=
 =?utf-8?B?Qk9VYmJvUDhwaVRwV1NGeFVJUzBUMzZFb0xzYmdqV2NxNlhrVHNvb1gyYVpL?=
 =?utf-8?B?ekVWaHJGaXhTWlZVN2o1dmtpUmVYUm14US9rdzhpb0ZYSFVkQnJGRzIvTHF5?=
 =?utf-8?B?NUREamxTeHQzaktXeE9yYlNnKzNqdmtnVm1qUU54VDlrVWY1SlpzcVNibytZ?=
 =?utf-8?B?Y2FiVzRpdXhhZHhwem1rdDZPTmloT2hCTmJzaktJanFWbnNkVEpYMGtBYWxK?=
 =?utf-8?B?OFZDZGVkU2p6ZTNBZDMyVmVOU1M2dm1NWitlcjRmWFRvQUlkZmRLUzlueDVD?=
 =?utf-8?B?OFdFOUgwemp3ZkJTWHhXU2Q3LzdML1BuRVAvQzNIWkRrd0NWZkNyQlVnQlMr?=
 =?utf-8?B?WWFQeWYrcGlRMjlNaW1QVjVyNWJDTmttWHBiTHRhcjNBRzJ6bUh2ei9Oa2Zr?=
 =?utf-8?B?RnRTT1VRTTNMRlNCd3dFajErY1RHWUx2b1RJS2FxVHZtdTV6RUZucnp5aXBN?=
 =?utf-8?B?NzJBMjA0VWNkNVRGNTJCZ1FJM2VRYVVJUEErOG1XRkVhaHdSVHZ0ajVrSDBl?=
 =?utf-8?B?NFBhMmVLa0dIZnJqWHc0bEpscmdLMmRWbkVSVHprem83T1lweFNzOW5BamdR?=
 =?utf-8?B?YnVmb2ZmZVdxajZEeng4VktkMjRwVDhvWHQ5TFNMdUlsTlUzR09xd2JzRi9z?=
 =?utf-8?B?Sm1NY3FSNjdTUWpTSHo5VEhYUWFCUm4rRjd3ckpDZzlrdmh2N0dEZ2ZxZFJ5?=
 =?utf-8?B?NUJHelUvdk5wc3Q5YUpVc3VRSFJXT2p6a0Fhd0JoNHErRXdZUWppd2c0TXBm?=
 =?utf-8?B?QlVTNWYvK1BueGo4Wmo3NWgrUGhwNERSdkZEK0w3ZlVMRG80QUdUQU53dUtT?=
 =?utf-8?B?d09Da2hwVS9GdFBuaS9vWVU2a1RpUmNCcm42K3REYVRJMUM3djJ2a1Z2ZDho?=
 =?utf-8?Q?RGEpFT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJjeHdwYno0dHhGenVxWDBhSU04NXVFbXRxL0RWQks5OTc4bWlqbC9yZHpU?=
 =?utf-8?B?OFFFajVsbmQwY0Z4czJvc0xPdXJRZjJsVEJ4YkxUaU9CcFVTcU1BZnlIWG5K?=
 =?utf-8?B?UmVOMllYalpyc2p1bDNXY0M0VDFTdTBwakhmWDZFY3RKbnc0dHhPVU1mTHg3?=
 =?utf-8?B?b3A5UHVHZlhPQllSQ1ZBVVEyYlhsa0ZKeGtnUjNvdjcyZjlHS1NaVCs4SmVm?=
 =?utf-8?B?czlvVURlUlZXVks5ak10bDl4algweU9FL2ZEWXpsSXZCdnJPQlBsdFpNdTNl?=
 =?utf-8?B?QnlTbllzK1BUaEdJVXFCenZIbUIzOWJTQ2o0OCt3VnVXVXZRdGYybUsxbXdM?=
 =?utf-8?B?Ykdpc0UwMW9pbmdOM3MyNWpDblpsQ0dGK0V1ZnlnRjdyZitvVzY1ekdnblZo?=
 =?utf-8?B?NEVjZmh1RlhhNnJPdzd4N1ZaZDFDU1E2cXF3UzhESDcrcndCVElIY0h1MlJQ?=
 =?utf-8?B?cFE2ZkkyS1dUblBsR0dncHVEUlNkemRVeCtFUWRldW9DcFBrNXFBa3NPb3ZR?=
 =?utf-8?B?ZFhWTllRNThzQ3R1N3MranM2TjZYeTZiaE5CblVvNWYxbE1ZMlVLV2YzREw1?=
 =?utf-8?B?dVM1Q0ZnZGR5dU40VFFhbWo1L0ZhUWRrakpEYy9lQm9reVpYQ1ZtVFF6T2lz?=
 =?utf-8?B?REx4Z2gvNEwzR0hGM05pQUp2WUt1UXdwYklDUkh4RUh6c3cvNTg5cStMN3pm?=
 =?utf-8?B?YjQrVWZ2eG1Gb2gvSFZsVnoyMUJkaVlTK3krVTEwa3ljQ2pvSFduTUdTQytG?=
 =?utf-8?B?WmFKQS9vUWMycUg2aHRFbVpaOTltNG0yM3MweTZIZ1crb3I5WHphelRMYjEv?=
 =?utf-8?B?dXFHdEwrMUtnRm9tNUtKVGxpLzJTQ3grWW9PTzJMRWNtbkNmaUZpK0NhNlQ0?=
 =?utf-8?B?Mjh4SHVXQjlKendYRVVYd2RuWFREc1g0ellHZlZDZmFia3pZUnNWVlZjVVlL?=
 =?utf-8?B?cTBTWjlzRzVEVTN2Q2JlK0ZlQkVNcmVxeCswTG5NUVdJRXlLUlNhMzhNNEZW?=
 =?utf-8?B?R0NSdEhyRThTekNRWWZDNm5NajVtczR6MSt1RlZmc1FjMG81ZEhhRkRJMGgw?=
 =?utf-8?B?UHZzTGJNOUN4VXhhTDBjM29uVDRSREROeFRFaGhjZE9wU0ZEZWl0S2gwODhk?=
 =?utf-8?B?b21xWTJmR3AwcjdES1VZRHVNbHBIR3luSnh3dDRGK0t0TFVpMDBBTU5Meitr?=
 =?utf-8?B?NHJEcXVSMFFqb2tOaWNTcCtsbGlYaSt2dFZsTXA1NGFMVXNMVE82YmozY1Fz?=
 =?utf-8?B?Tk9oekVzTVU1SDZwSHMrYXhuSVhJUncvT0RXbncvdThKekFQTzhaY3kxTzl3?=
 =?utf-8?B?Y0d1MUJTazdDT3BPcnJCaFRkZHAycjZ0Z3NkYkFSeiszZlk1WXFIZmFUVGFW?=
 =?utf-8?B?NFV0TnhnTXFvVkh5bU5KY0lITHZzOTF2Y3R1OEpjS2RlUC9zV0cvWXdSNHhC?=
 =?utf-8?B?QUNScEdDUzR5eDh0MHRMenNPSVFsWTFRUlJQenlOSWZlYm44R0NTWkpvdTRt?=
 =?utf-8?B?UFU5U2tqVEdYV3BJWHFTaXViOUlhckZLemFQbGZhaXhWTkFLN0dZZGFVWUJB?=
 =?utf-8?B?SU5PNEhnY28wbHY5ampGbmQvWWNxMTJBL0V3RFJLZmtNQ2o3K2ZTeFNUQTJT?=
 =?utf-8?B?d3dyazU1RWFvSXFkdG9JeFdZS0VzTjRYVy9zZWYrTGo0SlZkQVp4WksyZ3E4?=
 =?utf-8?B?YldwOXpOSFVXcTkwOUtWZ1pGL3dlQ211SGswWWtZZkxMbWZIZU9mVHBXa1JM?=
 =?utf-8?B?ZGtjZVpkOUhTbkRka3lzZDhreWVmZVFUcUtpR016cWYva3VBOUxIRGpqc0c2?=
 =?utf-8?B?Q1Bxd3JsaitQYTFkNllBeWlBWGlYUisvNHZDalFvbHdWZEc0Wi9ndjE3bW44?=
 =?utf-8?B?d1Frc244YUFTek85QmRwUk45NGI0clhIRnlBa29CT0tMQzdRWndhRmEvWjVo?=
 =?utf-8?B?TE4vanJpdTZxM0lSck1ZOEVZdm55bFBwdEo5UDg2dmxJbkNDeFp6aVBiUjdl?=
 =?utf-8?B?STRTVHR1SEpZbm94dVVNekV4Nm0yY0lGbHUwRFdhNi9GT3BjaVpPTERYWVM3?=
 =?utf-8?B?YjlzekpRUXFLVGtzUzRXczBxRzZIQlVCcGdIK0EzeGlISjNaR3Jpdkp4N1Fi?=
 =?utf-8?Q?6FRBG4UczX44Gx7N0hoFiEdaR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5728588f-50b0-4c39-cafe-08de1104de4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:34.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqoNIMfzwtJaXmoHE9qoiNOyEEziGfQdFMayklBXEghrThJcWo37m2VLsWeR1k29J8k/hxQi8mKxnLKKvjugvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 08/12] imx8mn: Enable remoteproc for
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
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
