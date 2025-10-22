Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A6BF9850
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F8EC5E2C3;
	Wed, 22 Oct 2025 00:49:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013001.outbound.protection.outlook.com
 [52.101.83.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D251CC5E2C3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm2c/V82kFCcsGmVK/xVkb99PTI5wEV38vHHI4+0KRm5djSr/rYEQ4gGN9Rfl7TJ4S9PHFHdaKA9QfNnNIt/5cka4TG9QOIYjSeoQ1K9G2OMPvPNdvwoOLNUGc+GiVc+eby6tY2YyyucSAES9QGXN+o6L4qNzdW8Vw8BqpD3BB/JuWnpJOJTylY0GUUifc2ghjAU/noYjwcMQb8Du8wQD6meQ90H907ROld5eSdrqs8r7F4gMSOJb8y3jt5vwY83xJqR5VJs0Bi36nj5U6oEgOHlgMFB6aE+t6rBfGWBKW6gaFfRAJP83VzFeujazsLMrRIaigAieYvPosR341xLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW8I4BIMUyt7mW+9D9lih6esPG0JFhqW2Aoh1YFP5/s=;
 b=QS4baLNJ2OoeWW7tyYP6CpZt6J82HuvoVLdHkBmyNAPFXKUKePnxI4JpSE8wCSE+4BtV/QUhyw5ElDGajWda8q8G4jwoN5qsDYPcUKR2euKAyG1nHySkZRE+Zu3jT7aSxanSZzjQyzQ3tcxAUWhDuK671X0/OY2Q30cfYYveRwqWlaXbmtKuQ1yToiJsqTU17A564H74Lib+JfOH3iFEEiahygUxJr1s/k5TcP7NRHn29ZhLTY7xwSCNyADA3GCk6xWg1BkYeaFFOsGOn69lkNWxyuxFgk9/OCdcYAxkMLNxC8CN8KVSZHn3qaOFkB0Bfizj0xgzWYB4iBhnXsD0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW8I4BIMUyt7mW+9D9lih6esPG0JFhqW2Aoh1YFP5/s=;
 b=jUnQBs9m/2wP7qUg9gdbpbqXyzGBRDgdFYF7PICjbQMHnGb8HIHsdN9mAT5V/1ThkIA2xWIrzVdfMD6xJN2IQlHH9JWJivJpI5xV3lZdSCWpn1BMz6AZvBAxwghcMk6WYeGxG0LFdon+rZfJboEy+35oZQwL7+GkxC74z0LNZkqU8aRmbrsS8Vj2VZA8BX79HdxDPIBnJfdAUKXf91/S9vzpBcAJFrdAtnnOBNesDzhLFdByq/UA7vPU2O+QTMmSF+OTdxMPSmJX0fdkwXvBMt98TQlcgHAPnFr+IqtQwJ7sdgPQNPKRJo5n+Lz16xOYu5epi99aApOvRyafZNN5wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 00:48:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:48:58 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:27 +0800
Message-Id: <20251022-imx-rproc-v3-v3-1-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=12149;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=cnVVdP4xgqSDbd5SDGhxCgPUu5jQCdFRgEs/9rIMqE0=;
 b=f5G0HRkNv6hmZKDQ2sTFdRL9X5WGQ+8Hs1dNvXnE8nzmMZkoEFRWLE0lH43IK7K+Cl/GOBPv6
 az1dEomVJXJA6WO0SPXVfh4RGZcdzGPl5CIhsaW4fZvpIU6QKwS/h+S
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b30884c-286b-4817-45bd-08de1104c8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFVFQ1VyU3dVMUpMTUN0ckFpUkx3RTBJaUNiZG1Td0JRVm1Ldzl2WGtmbERD?=
 =?utf-8?B?YUU5Wjd0RzJpVVc2a2RZNVlBMzV0Z2lUUmJCMmVIRkFVNHdIMnF2SlJOd3ND?=
 =?utf-8?B?K2luYnRFemNscGNQTDQ3b1BmWkNqU0tLdHZqd2NTK1V4Wmh5R1lhMUYweUNm?=
 =?utf-8?B?Y2h5Y0l1YTk3T1EvaVBzNUNFZEd3NWd0WVVWR00zZVd6a1A4VGluaFQ1UWxG?=
 =?utf-8?B?bnVSS1JpUzFyLzQxd2JjVDVzYUZmdiswUjhRdklTaHlsSXpvd3pBTk4rSXMv?=
 =?utf-8?B?a3BrQmt5bmdKYkJhZmRzaWNNQzN3RC82ZUM5Tm9BZmY3cGFGMzZwS09ROWMz?=
 =?utf-8?B?citYN1k5ckIyc1V3b0dpZG5rSEUxZzNaVzhrUms2M1llamFMazFjRVBQN2pF?=
 =?utf-8?B?V2t6TG1aQk8yNFRNRHF6SWhIZ0o1S2JlcHlUTVRhbUFsRVgwN2ZYRDFFeWtE?=
 =?utf-8?B?bWNzZGFiQ0ZOV2pmWlY3bVUwSTEyZmpPRkJOakIzaTdQMk5OMHFab1ZFS2Fl?=
 =?utf-8?B?NE9Ua0FKV2tuS0k0amsybXhRcEV2VlEwNEJjVmJUd2cyY21qVldWZWJzQ0l2?=
 =?utf-8?B?SXIyMFJvWUpBSElVa3FhRTR3dFBMdVNBUmpsbHdMdzVFbDJocFduRkNHMTVF?=
 =?utf-8?B?eUhpajFqbEgxMjI4NnV5N2w1eU9NWTFiN2htTGU5K3RYQUYweGNwNTBMS2ZJ?=
 =?utf-8?B?WmJuS3llanhsSENzaXJ3S1AxYmhQV0NtSTF3WE9WZnp4aWI3UXVsYk43dkZE?=
 =?utf-8?B?amlrL01GZ3VlRVl6cFBCemxKWk1lK1Y4azV3NkhqQVRwMTlJZHBRdGszOXYy?=
 =?utf-8?B?MXdpUWd0RzNHTEpvSjNPZC9jc2t6YWpkN0VGdWtOZnByakNObytraVIyUW9t?=
 =?utf-8?B?czFtRG1saWtmUHhXNGFwK0JJVVh5dGlFRVVBZWgvU3lRUnNvMEh5MUtaaTN0?=
 =?utf-8?B?TFZ4MHVOZE13c2o5ZDlNVmVhS1pGam51TWhYSU5DOVROOTByODFIYUgvUjkw?=
 =?utf-8?B?eEh3K0NGQnh6WTdmNkVZSGFnenJXNzBObm5uQk1MWHcwV1pmZ0dNOUhuZWhq?=
 =?utf-8?B?N2RBYlUxRlNCNitNaVJJaUlnOWNkUmJDQkF0Z2pLMzJlaStaNjl6TzlkdXJm?=
 =?utf-8?B?ZkF1VUltWGt6SU5ha2xUUit6elZLZkIwcmQ4MmttUnhIV1hPSGljZkpWTXJB?=
 =?utf-8?B?U0ZwV0RaVnRESnI0S1YvWndkRnJPaGh1WUVnOHUwR2VCTHJwNXVDUko1TnlH?=
 =?utf-8?B?VENpSmFpWGZncDBBQzR0cldIRnNkcVppYWlkUzVtS1ZGZisxZk0xMHVvR3NX?=
 =?utf-8?B?OXhBbDBmNW51YnhEYmhCcXVQWG5HYjB0NHQzQStWSkRPOEZIK2k0Ukd4c2Js?=
 =?utf-8?B?d3QvZ29nbFphdTZHaUdJdnNJVDJGeGU3U25LSXZVQ2U1LzNhRVlBSVQzUWRx?=
 =?utf-8?B?UHNSeXBod0N1N2JtR3A4L3BMSEFaUEw2YTVMQVVBK2VhWVJuanJpdkJVSTYy?=
 =?utf-8?B?VjE0T201TmtXQWZicnV3RDRnZ3c2anc1cGZaNVcrc2NvOTk4U2cvNGZWUStM?=
 =?utf-8?B?QnNLeWkyd1pVbFJRSVFYeWlsYmliQVhuVlltYjlZdm1OZkI1bHFmbm1CRG1z?=
 =?utf-8?B?NGFKTU82SHIwOFRac2gzd0U4Mk1nN2N6dHR3MlNlZUl1MVZxTlpUaXFwVDBL?=
 =?utf-8?B?dTR4L0xiVUdvVzJzZEZLNzU5SlAwaW5QTmpNMllHaUFHUTFjVllLMXFLVW5Q?=
 =?utf-8?B?cWZodUpzcFhMSldwNEJFQ2NKa29uZVM3N1ZCZ2N0YXZQNUtLRXQramtkaUtv?=
 =?utf-8?B?RHBtZERQMHF0aWxhdVNqaW9vS1dBN3pvMUZRcldFUDc2eUloRXI2djNRVFZr?=
 =?utf-8?B?eElRY1YxNiszSXpkS2JPUTF0a05KK204ZUg5dUlBa00wNzNnaGN3c0kxOTAy?=
 =?utf-8?B?aENOVVBNeXdiZFNONkhHbnJadUh2a0NteXRyR2d5TDljbHRHemEzQ3FUTEhw?=
 =?utf-8?B?aWhHZUJ3WUJCZjBVd09ma0pPMXZBSUd5TFk5dDY1RnJwZ2JGdE5iNmhtczNl?=
 =?utf-8?Q?oQd/SP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRjc2syU3I1TWVNMUtwOVFPWTczNXdEZHdxckVnQWt6NWVWTk5vWVlJVHRy?=
 =?utf-8?B?MmVmc0UyNDhwQ1k0aDFndlYwSHgwUFh3WldlZWZmVlppQ1JBT1FFOWlrWWYv?=
 =?utf-8?B?R0JuZ3p6dGRsOXhyVEdLSy9XVXR0NkhSaGFEY2luaWMwaHZlOHBOZWZrQVBF?=
 =?utf-8?B?MisrQWpJaWxBQjZYRmV5OFAyaUR6QXdKUWJucXAxUWx1amZQL0dIRG1hYXdx?=
 =?utf-8?B?NUJBYmdZNnlJdldUVzJZWllpZk85NEN1SEFlR3ZKNFlZV2hUYTh0Nk1LRlRN?=
 =?utf-8?B?SVcyTkZVb0lLMFJXSFcvRGE2ZnhLTlRSRksxbGY1R1BoM0JVN2pSNllYbSsz?=
 =?utf-8?B?cGlEQ3pqUU9QeUx0b1ErYktSNWkrTTVtZmJWZWhYRHNWZk50bldNZDNGS0ha?=
 =?utf-8?B?OE1kNEhsekhGZUxSTm9qTk9MMVFXNGh1YnBrRHlWaWsrQ3ZJd0RNeVJ5OXhk?=
 =?utf-8?B?dzRjK2RFV084SmRVYjlPUmlGZElscEFPeEFxVUFCSEZHOFpXQmRvb0EzVXRj?=
 =?utf-8?B?YjFpU2VFRmdlSHRxTFl3dHBHZ3daTWpHU2dOcVZ6NTBnZkVrS0VldkZ3UjJF?=
 =?utf-8?B?enFDQUFkV0JhYmltN2NHMDV6ZXF5MTA2cjkzNk4wYWN3Mml4dEZhMlQ0MUlH?=
 =?utf-8?B?R2taTTVVODFrbDlIeldueHB2YUdYSlJEeVRpcjRHeWMzdVl5TEhPYjdaNlZJ?=
 =?utf-8?B?Rmg1WlZjeHhlSVB2VmZsSGhZbnJnN3lDU2FPNUN2S1RRenNLSFhnZW9MTXVt?=
 =?utf-8?B?UE5YMG5ldzI3QkR6MzNoOENrWWVrVmVYRUlFZWtxRTZqRUhPN2hjcXpzZWVN?=
 =?utf-8?B?aWlLOWJKd2ZibmcrMXVRejhTMGNOUWxBcFhrS0dEaUZUU3dTUUNqam5nWHJi?=
 =?utf-8?B?ZllDcjVLdmkrRExqM3I1WldWWFZPTGVLMVlNREFrYlI1WFhHbHVBSGdRQVhZ?=
 =?utf-8?B?WnM3RERaRG10MXAzaGdvbVptU3VDVzBiRDdNVnFqZ0NSTmhLL2p5Y0JpSEFw?=
 =?utf-8?B?L2gvUFdIZjdLOXdncWZoKzVQak9qQjI1T2hOMmJqNTdteFk5M0labUFyWWpt?=
 =?utf-8?B?bG5aa2taUG52ZWtQZHczeTBUSXl0WVkyelRSRHZrVUhTaVZoTlh6V045NWpl?=
 =?utf-8?B?Y0dwNHdUdFJabEFRbCtENzkrUVhXV3hZQkpwMnFIL0JralBZcGYzVUEvSVVD?=
 =?utf-8?B?cXdocThhS0htaHdIWDZoNUwwVDRGTi9CNWE0empBK0JoOHpOdmRPT2xzM1Mz?=
 =?utf-8?B?c3RXTlUzRFBVWGJtZUlPVkJuMjVJTmtTYWZuT2MrdHhRZGdLVXBLeVFPRXVw?=
 =?utf-8?B?NHJhNHNqcHBJd3VicTIzbVI3dDJDdllwSmt4d25oMnRodXZoeUQ1WHE4WkF4?=
 =?utf-8?B?WktCVEVZRlUzTTMwRktOMXFQdnA5a0ZJTWpNVmIyNHhyd0tWcHc5Y2NrRkx5?=
 =?utf-8?B?MFFZYXRnQzRlSGVRS01JRGl6akZuYWx2WmhiZTlzOGpadlA0a1dUWGVBcVpX?=
 =?utf-8?B?T3FvNm0rczFZTWd1NkNlWGtlWHdDSnRsSVFtK09oRDRJRE0zSTgremNrTWkr?=
 =?utf-8?B?SzBtYkVIVVhRVDRxdTRVWWUvWnBRazlIR1ltako2MEFlMmttWkVPOUdvTHJS?=
 =?utf-8?B?K2dISUNEalVNN1RVbVlqTmlKOGlNSnYvS0VPd1lEekk5eXZCMDRRZTZBM3dY?=
 =?utf-8?B?aE40YjVITDIySDVJVEczRlprcjF6Sms1QitmRkpVNmlZbklYS2YxNlZ1VERy?=
 =?utf-8?B?WFBrLzczQlRzU1hTT0gvNlprbEFEanVsRXJlenFSU3AzZ241d2ZTMm8wb0wz?=
 =?utf-8?B?WWxMaWI2bTFsc3hXb3Faa1N1a21zSm13a0tTeER3S1NPUmhmTmpTMXo2aUtu?=
 =?utf-8?B?UWQyNkJRRktpRHRNTFJwVHA1cjFNQXVEUGgyT2RaQTNQTkd5WHdnZ0xybW9j?=
 =?utf-8?B?RXVmWGtXUW9NekRzYlFlc0lHRFRya0dram9JbUtyTmQ0Vnc3aHBYOG8ydUpF?=
 =?utf-8?B?R0RVMjFhMi81T29KdWlzcmhwK3ZoRXhKaHBSS2dSN29wcUN6dTk1T1lsN3BK?=
 =?utf-8?B?NitHcVBEbTcyMHpwREduWlFoM2Y2QVoxb2xScDlpZUltMEp3WWxhR0ZYRUEw?=
 =?utf-8?Q?2syla3jXe+1yUjsusQe94mKMR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b30884c-286b-4817-45bd-08de1104c8cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:48:58.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYP3x1qrHOuZJo8DwbG95cv3Qyp9oBEZfOk5BAEaIWsAIN3P+F0E4W9eTjgy0fpdPXbo9S8CEk/cVzBQ60qwmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 01/12] remoteproc: Extend device_to_virt
 with a is_iomem parameter
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

Some areas needs to be initialized by using memcpy_toio and memset_io.
Following Linux Kernel commit: 40df0a91b2a5 ("remoteproc: add is_iomem to
da_to_va"), add this to U-Boot.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/renesas_apmu.c     |  3 +-
 drivers/remoteproc/rproc-elf-loader.c | 94 ++++++++++++++++++++++++-----------
 drivers/remoteproc/sandbox_testproc.c |  3 +-
 drivers/remoteproc/stm32_copro.c      |  3 +-
 drivers/remoteproc/ti_k3_dsp_rproc.c  |  2 +-
 drivers/remoteproc/ti_k3_m4_rproc.c   |  2 +-
 drivers/remoteproc/ti_k3_r5f_rproc.c  |  2 +-
 include/remoteproc.h                  |  3 +-
 8 files changed, 75 insertions(+), 37 deletions(-)

diff --git a/drivers/remoteproc/renesas_apmu.c b/drivers/remoteproc/renesas_apmu.c
index 1a50cd3289bc40de23f23630f2b591fba2241dbb..91586a99e0dacaff7d9cb5ecd1ea6e4489659521 100644
--- a/drivers/remoteproc/renesas_apmu.c
+++ b/drivers/remoteproc/renesas_apmu.c
@@ -170,11 +170,12 @@ static int renesas_apmu_rproc_init(struct udevice *dev)
  * @dev:	corresponding remote processor device
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  *
  * Return: converted virtual address
  */
 static void *renesas_apmu_rproc_device_to_virt(struct udevice *dev, ulong da,
-					       ulong size)
+					       ulong size, bool *is_iomem)
 {
 	/*
 	 * The Cortex R52 and A76 share the same address space,
diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
index 0b3941b7798d3971cbe982d3c3d080a717fcef65..4b95227d1fc87e19a724b3389348cb9e5dbfe260 100644
--- a/drivers/remoteproc/rproc-elf-loader.c
+++ b/drivers/remoteproc/rproc-elf-loader.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ * Copyright 2025 NXP
  */
 #include <cpu_func.h>
 #include <dm.h>
@@ -9,6 +10,7 @@
 #include <mapmem.h>
 #include <remoteproc.h>
 #include <asm/cache.h>
+#include <asm/io.h>
 #include <dm/device_compat.h>
 #include <linux/compat.h>
 #include <linux/printk.h>
@@ -181,27 +183,38 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr, ulong size)
 	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
 		void *dst = (void *)(uintptr_t)phdr->p_paddr;
 		void *src = (void *)addr + phdr->p_offset;
+		bool is_iomem = false;
 		ulong dst_addr;
 
-		if (phdr->p_type != PT_LOAD)
+		if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
 			continue;
 
 		if (ops->device_to_virt)
 			dst = ops->device_to_virt(dev, (ulong)dst,
-						  phdr->p_memsz);
+						  phdr->p_memsz, &is_iomem);
 
 		dev_dbg(dev, "Loading phdr %i to 0x%p (%i bytes)\n",
 			i, dst, phdr->p_filesz);
-		if (phdr->p_filesz)
-			memcpy(dst, src, phdr->p_filesz);
-		if (phdr->p_filesz != phdr->p_memsz)
-			memset(dst + phdr->p_filesz, 0x00,
-			       phdr->p_memsz - phdr->p_filesz);
+		if (phdr->p_filesz) {
+			if (is_iomem)
+				memcpy_toio(dst, src, phdr->p_filesz);
+			else
+				memcpy(dst, src, phdr->p_filesz);
+		}
+		if (phdr->p_filesz != phdr->p_memsz) {
+			if (is_iomem)
+				memset_io(dst + phdr->p_filesz, 0x00,
+					  phdr->p_memsz - phdr->p_filesz);
+			else
+				memset(dst + phdr->p_filesz, 0x00,
+				       phdr->p_memsz - phdr->p_filesz);
+		}
 		dst_addr = map_to_sysmem(dst);
-		flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
-			    roundup(dst_addr + phdr->p_filesz,
-				    ARCH_DMA_MINALIGN) -
-			    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+		if (!is_iomem) {
+			flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
+				    roundup(dst_addr + phdr->p_filesz, ARCH_DMA_MINALIGN) -
+				    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+		}
 	}
 
 	return 0;
@@ -230,6 +243,7 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 		memsz = phdr->p_memsz;
 		filesz = phdr->p_filesz;
 		offset = phdr->p_offset;
+		bool is_iomem = false;
 
 		if (phdr->p_type != PT_LOAD)
 			continue;
@@ -239,7 +253,7 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 
 		ptr = (void *)(uintptr_t)da;
 		if (ops->device_to_virt) {
-			ptr = ops->device_to_virt(dev, da, phdr->p_memsz);
+			ptr = ops->device_to_virt(dev, da, phdr->p_memsz, &is_iomem);
 			if (!ptr) {
 				dev_err(dev, "bad da 0x%llx mem 0x%llx\n", da,
 					memsz);
@@ -248,14 +262,24 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 			}
 		}
 
-		if (filesz)
-			memcpy(ptr, (void *)addr + offset, filesz);
-		if (filesz != memsz)
-			memset(ptr + filesz, 0x00, memsz - filesz);
+		if (filesz) {
+			if (is_iomem)
+				memcpy_toio(ptr, (void *)addr + offset, filesz);
+			else
+				memcpy(ptr, (void *)addr + offset, filesz);
+		}
+		if (filesz != memsz) {
+			if (is_iomem)
+				memset_io(ptr + filesz, 0x00, memsz - filesz);
+			else
+				memset(ptr + filesz, 0x00, memsz - filesz);
+		}
 
-		flush_cache(rounddown((ulong)ptr, ARCH_DMA_MINALIGN),
-			    roundup((ulong)ptr + filesz, ARCH_DMA_MINALIGN) -
-			    rounddown((ulong)ptr, ARCH_DMA_MINALIGN));
+		if (!is_iomem) {
+			flush_cache(rounddown((ulong)ptr, ARCH_DMA_MINALIGN),
+				    roundup((ulong)ptr + filesz, ARCH_DMA_MINALIGN) -
+				    rounddown((ulong)ptr, ARCH_DMA_MINALIGN));
+		}
 	}
 
 	return ret;
@@ -381,6 +405,7 @@ int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
 	Elf32_Shdr *shdr;
 	void *src, *dst;
 	ulong dst_addr;
+	bool is_iomem = false;
 
 	shdr = rproc_elf32_find_rsc_table(dev, fw_addr, fw_size);
 	if (!shdr)
@@ -394,18 +419,23 @@ int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
 
 	src = (void *)fw_addr + shdr->sh_offset;
 	if (ops->device_to_virt)
-		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size, &is_iomem);
 	else
 		dst = (void *)rsc_addr;
 
 	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
 		(ulong)dst, *rsc_size);
 
-	memcpy(dst, src, *rsc_size);
+	if (is_iomem) {
+		memcpy_toio(dst, src, *rsc_size);
+	} else {
+		memcpy(dst, src, *rsc_size);
+		flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
+			    roundup(dst_addr + *rsc_size, ARCH_DMA_MINALIGN) -
+			    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+	}
+
 	dst_addr = map_to_sysmem(dst);
-	flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
-		    roundup(dst_addr + *rsc_size, ARCH_DMA_MINALIGN) -
-		    rounddown(dst_addr, ARCH_DMA_MINALIGN));
 
 	return 0;
 }
@@ -490,6 +520,7 @@ int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
 	const struct dm_rproc_ops *ops;
 	Elf64_Shdr *shdr;
 	void *src, *dst;
+	bool is_iomem = false;
 
 	shdr = rproc_elf64_find_rsc_table(dev, fw_addr, fw_size);
 	if (!shdr)
@@ -503,18 +534,21 @@ int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
 
 	src = (void *)fw_addr + shdr->sh_offset;
 	if (ops->device_to_virt)
-		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size, &is_iomem);
 	else
 		dst = (void *)rsc_addr;
 
 	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
 		(ulong)dst, *rsc_size);
 
-	memcpy(dst, src, *rsc_size);
-	flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
-		    roundup((unsigned long)dst + *rsc_size,
-			    ARCH_DMA_MINALIGN) -
-		    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+	if (is_iomem) {
+		memcpy_toio(dst, src, *rsc_size);
+	} else {
+		memcpy(dst, src, *rsc_size);
+		flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
+			    roundup((unsigned long)dst + *rsc_size, ARCH_DMA_MINALIGN) -
+			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+	}
 
 	return 0;
 }
diff --git a/drivers/remoteproc/sandbox_testproc.c b/drivers/remoteproc/sandbox_testproc.c
index ad575a7c10fdb399c77f4f01b8167a8ae71574a2..7ed38e8656c5f8d653e4aa32316a3cf7dbd7a767 100644
--- a/drivers/remoteproc/sandbox_testproc.c
+++ b/drivers/remoteproc/sandbox_testproc.c
@@ -308,10 +308,11 @@ static int sandbox_testproc_ping(struct udevice *dev)
  * @dev:	device to operate upon
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  * Return: converted virtual address
  */
 static void *sandbox_testproc_device_to_virt(struct udevice *dev, ulong da,
-					     ulong size)
+					     ulong size, bool *is_iomem)
 {
 	u64 paddr;
 
diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index f45da9a68ac6eaeef0c5a563785a2b9433430b7e..bf721e78bb36f52ee55a776dc7b6b45a89858fbd 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -61,10 +61,11 @@ static int stm32_copro_probe(struct udevice *dev)
  * @dev:	corresponding STM32 remote processor device
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  * Return: converted virtual address
  */
 static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
-					ulong size)
+					ulong size, bool *is_iomem)
 {
 	fdt32_t in_addr = cpu_to_be32(da), end_addr;
 	u64 paddr;
diff --git a/drivers/remoteproc/ti_k3_dsp_rproc.c b/drivers/remoteproc/ti_k3_dsp_rproc.c
index 5a7d63772830cf064e28042ebb6726f058cb8876..9275e1b241de7f13ddda08b27288cc32d7d95725 100644
--- a/drivers/remoteproc/ti_k3_dsp_rproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_rproc.c
@@ -261,7 +261,7 @@ static int k3_dsp_reset(struct udevice *dev)
 	return 0;
 }
 
-static void *k3_dsp_da_to_va(struct udevice *dev, ulong da, ulong len)
+static void *k3_dsp_da_to_va(struct udevice *dev, ulong da, ulong len, bool *is_iomem)
 {
 	struct k3_dsp_privdata *dsp = dev_get_priv(dev);
 	phys_addr_t bus_addr, dev_addr;
diff --git a/drivers/remoteproc/ti_k3_m4_rproc.c b/drivers/remoteproc/ti_k3_m4_rproc.c
index 31b9de7157936fcaf13eaabaa2e1e65ecad31738..f358788f07f0511ac75460bdd4417f3ca482b87e 100644
--- a/drivers/remoteproc/ti_k3_m4_rproc.c
+++ b/drivers/remoteproc/ti_k3_m4_rproc.c
@@ -181,7 +181,7 @@ static int k3_m4_stop(struct udevice *dev)
 	return 0;
 }
 
-static void *k3_m4_da_to_va(struct udevice *dev, ulong da, ulong len)
+static void *k3_m4_da_to_va(struct udevice *dev, ulong da, ulong len, bool *is_iomem)
 {
 	struct k3_m4_privdata *m4 = dev_get_priv(dev);
 	phys_addr_t bus_addr, dev_addr;
diff --git a/drivers/remoteproc/ti_k3_r5f_rproc.c b/drivers/remoteproc/ti_k3_r5f_rproc.c
index 48401bc6eb67b0d0bf673b8db033f9165353e495..c738607c10925c33d6f5a614d8ada2da0c5ecb2e 100644
--- a/drivers/remoteproc/ti_k3_r5f_rproc.c
+++ b/drivers/remoteproc/ti_k3_r5f_rproc.c
@@ -534,7 +534,7 @@ proc_release:
 	return ret;
 }
 
-static void *k3_r5f_da_to_va(struct udevice *dev, ulong da, ulong size)
+static void *k3_r5f_da_to_va(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
 {
 	struct k3_r5f_core *core = dev_get_priv(dev);
 	void __iomem *va = NULL;
diff --git a/include/remoteproc.h b/include/remoteproc.h
index 6f8068e14967571eea18522b70fa272697610a41..9adc3d17d8f773b0c01f3952fcc846fad7337861 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -495,9 +495,10 @@ struct dm_rproc_ops {
 	 * @dev:	Remote proc device
 	 * @da:		Device address
 	 * @size:	Size of the memory region @da is pointing to
+	 * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
 	 * @return virtual address.
 	 */
-	void * (*device_to_virt)(struct udevice *dev, ulong da, ulong size);
+	void * (*device_to_virt)(struct udevice *dev, ulong da, ulong size, bool *is_iomem);
 	int (*add_res)(struct udevice *dev,
 		       struct rproc_mem_entry *mapping);
 	void * (*alloc_mem)(struct udevice *dev, unsigned long len,

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
