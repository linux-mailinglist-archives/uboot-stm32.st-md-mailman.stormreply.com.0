Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHkJL2fTgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB13D7F63
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DF61C87ECB;
	Tue,  3 Feb 2026 10:44:08 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 689F9C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSo8nJTOpSvUNoY+812hmg7ciaUghctkX51QXQLMH3fAOw+85FBb5baFsjKIbHGeh7P6+GBtwXqTyzG9g5fUbrxkK/dm2abhQkBxDfHzvb4a8o3j0jSvd7J8/TYoKhau2vYfgmOAbqljQ3+RJQpZ5Ab33RoBZUo2/xaxNHqFPSkLnXG6QeD2u3OJgtR8xZ2ZR9Ot/c5KROwHmPDvhZIMm2fT5JgMOcBtIEM25hSvgLvTq/jgKTiRcD51PZSraWrAiHQC+tY3BzD8GGLGPJjkdQou8WrVZZfc+Y4O8efpgQu5EE0XxhoZVcUPoQaeH/At+PYLJ8FDthWOixC4gHt2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfNIjXlzFleMlM5Sbj+07/Y7FJm025AMJVxfxnXJVNc=;
 b=gFKP8lDiLVofNumyM94g4X4iYleKH9kC5XQfo/uF9fFL8WIPjRhbLwkZwbb7VK1uC5t0rBNY1wW4l62aR2ISSyHjDjPHCkoJnJhkJYSblwRuHUUlJ+eaT6drG8RUCmO1pcZ6TaQQK94g80murEgU62xODugi1yQFx5TLkIN84UwHxjT9nfYA6BIabCO/kYrFmDdVJX5Ug/+ga+ura+Jlhz5BavAra2H+yG30TdCKhfwRvuWspCpS/B9h/vwHx/N19qMPv8gyV/1/J6f3oLb/+9K9m3t0bBP+USBQ780GfycPnXWN5rpitswuWAp1srDdn9N/JKNpfc2tgTyhBthqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfNIjXlzFleMlM5Sbj+07/Y7FJm025AMJVxfxnXJVNc=;
 b=p65qqupVwPKEONbDlnQE74wKyHbjkhvzuyAVC3ZYOKZ90J2DW0RsumeMZc75chZWp6UxI8tyTA6zkwBN6mYPCKODDUDOW+14ZvrkasnUXLwMMOR6ukRZuPFLv2YYVBelO/Gi7qGpeBhy4Vb0z32xH5Cs8AvPb6uCEJAfvtpLtq+qff4tqtESX4oZlDdB5lr8nYRGiOhyMML24jUZwP06h0ZcVwOMwwJ+jPvihTCGABPzYtP4tQBuQx/aMe9aszyJWk2Anhw52F1doYwZCNAeKnDhdAdYR8FZU+ywe/Cgx/7Zh2t6iJQ9Mw6i/Amf9/5xug08MrJDBWqxLRFkjYBz7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7147.eurprd04.prod.outlook.com (2603:10a6:10:126::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:44:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:44:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:35 +0800
Message-Id: <20260203-cleanup-v1-4-4221c13e7558@nxp.com>
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com, adsp-linux@analog.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0187.apcprd04.prod.outlook.com
 (2603:1096:4:14::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d22f78-1644-4f05-829c-08de631123bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZ6Wng3SUtnQzBxNHFYcE9SdnBJYkNqeURsclZDWVJJTTdzK0ZKTVFQV1lX?=
 =?utf-8?B?anViRFVRdW9tTEtPeXBMeVo4b0krWmw1UzlZd2phRmthM0FrMk9xbnpUN3E1?=
 =?utf-8?B?ZWpYK2o5K0pDeDREcFJxS2tBdzdxbU1KRTJWZmNBdzF6L0Ewc1VMaXc1aXJK?=
 =?utf-8?B?dGJKdGpFcmlsNWNDUGVZTFkyZW9NOHJOalNZRzVmVjVEbWtOZ2l6VEhKRUxB?=
 =?utf-8?B?c3ozVHNqK2tYZDZhY0FvTGpQQXU3UXgvWkpWcTVGQUkrWVVLYmxacC9JNTBm?=
 =?utf-8?B?QUR1SFZHN0kyclMyWXlndGNGYWxTL0VXNXpIVXVpRE9WUDA1V2FoTlFPTk5u?=
 =?utf-8?B?VER4WVhFRjhPalZUZ2xydkhUN2Nad0U2ajlxbUxHL2MvMFhvTk5ORExTZStw?=
 =?utf-8?B?ZitDRDVaK011Q3lMTDRJdGpBdGRhbjdxazRQdWFycVhGZEtBM1ZCV3RFQjMr?=
 =?utf-8?B?aDRmaEgzR3M0dnd3TUdzUzh2S2NHeVY0UC9xTm9SRXpMQmRSU0VmTFFvcGlE?=
 =?utf-8?B?RVpGMDFYcEx0Wk05MkhJZ29KcmpvZWowbmgxTHRhbjVNcSt5blo1cDJzSDVI?=
 =?utf-8?B?T3JkM1F0RFN6YmpyaUhXcG9qTWt4NkM1di93UEFHUVdhN1FmUi9nUkpiNVFp?=
 =?utf-8?B?Snh5ckkwa1h0bmpqS0RYdG5XZ2xwMUxyTGxsOWtrOWpsSEUrVHdwdHdtWXpL?=
 =?utf-8?B?RjlUcVBFREtodGUrRXVhc0ZBVnVsRUhnZVBkSmI3SzRNS010VGNTdlhVZlhz?=
 =?utf-8?B?cHg1SGs0b0pDWW5ZSWtMK2trcEhYRUlkM2FOejloMWMwL0dsVzRNR1hzeVVQ?=
 =?utf-8?B?ZENNRnRMUE1KRlVLTTJzTlZqN1E4b3RscXEyWEk5ZnU4RVl0d3BPM2FSV2JW?=
 =?utf-8?B?SDVpR1hRdy9jWTFnS2FyVnBLMXlLb0Y0ek4wT2d3RHo5dmhSamhJejFySnhW?=
 =?utf-8?B?VlorQ0JTcjh2YWlrTlNjLzRxMGk2cmlpWTVGaFFmaTRaQXZ6RmpFdVdsRzBl?=
 =?utf-8?B?NEVISERpWlI4VktBa1U3YXYvNzJiVmVRbEZIaDJNK0wvZGJCY1dFMDVESFV4?=
 =?utf-8?B?aFhtV3BzRHVWdWtwTEJVWWVaOXpqV3B1T2xHbXlzZDBYWHNEUHQ1MFNCSVZJ?=
 =?utf-8?B?MFA3RThUczVLSHJmQ2c5OS8vdUVzT010L0N0QkdqWDAxTUQzNHhLZkM4dFpE?=
 =?utf-8?B?YjNoQXpOcHl6UElZNFpKT3oySTdPeUdwUHpPdHd0aEd4QjJLUnNhdWY0OTRP?=
 =?utf-8?B?dDhZdEtxeHZlMVdOU3hqcWNjYWVoWE5GVVZHZGxqdjh1VktaVFZBU0kxUktV?=
 =?utf-8?B?dTQ2d1BCVnNaTmJLdVlWNmxIcStKY21NMHoydHFzaUp5MWZjaVBFUFYvMEMx?=
 =?utf-8?B?SGdvVFU5MzJubGZqS1d3bXVrYjUxTDkzQk9YSUdRSEpqN2xON1cxUkpMaWpN?=
 =?utf-8?B?ZEUxcDMvUkRidHlPZ2ExaU1ZNi9LY0RXUkcxZHYrU1hXZlJQTlRoNzF6U21r?=
 =?utf-8?B?cGMyZW1CdmNrcC9VVjJHM0tYR3l3ZCt1azdZM2VYdmthc0Uycm1yZUU3SjBw?=
 =?utf-8?B?bU1DVUEwV0FkT2pReVZUTWVoM2daendNVmU3K3ZtbUoyU1lwK05mZVhsQkpJ?=
 =?utf-8?B?d1BVcXpCZWlEckVRcmhpNjA4c1dYNEszU1kydDhleW42YkdYaDA5cFhrK3lM?=
 =?utf-8?B?TXJpS0Q5N25TNkJycFZlM2hOcDBlMStJaDE1WkQ0ZFU1Mk5UbnJ4NTNheHhz?=
 =?utf-8?B?Zk9pTTUwM2JoaVJ3Wm9RVCsxR3NBWTJ3Q0JZUmNkZjQzcXZ3L3Z6Y1ZXdDVz?=
 =?utf-8?B?ZTVyZHFQVnBtM2dxdzNiU3llcnNCVGlrVmFyOVVxMGV6TU8xOWY3dFJvS2Ry?=
 =?utf-8?B?aTVFUVdUQ2hLR3RIWER0dlBuUitKc0tHaVZRTEdiNTV6bzdpemE5WklFOW9x?=
 =?utf-8?B?MjlNS3NnV2ViM0ZtNVVwTVE2djhCMHhsZlU1VTMxYU9adXpJbFJ1b1lxQ3Ft?=
 =?utf-8?B?b1lycXUzVm8waFlWQ3JWeXY5TzRJT0d0c2RxRjAzZFRDTHdhSGxQS2lITktN?=
 =?utf-8?B?bjBxSlA2S3BRbnRUZlB1VzlrZ3ZjSFRYK0ZsV20xZlNxMUZIN3l0cFpKcjB2?=
 =?utf-8?B?eHRPR1E4Y3F6bW13N2NESk1uMHJvNGdkZ1JlcHFXTityY1c4azBGcWg0d1FJ?=
 =?utf-8?Q?bExF3gGe2X2MwMLRgy1MxPTVBJiN+Ou7uswRM9sg3t2L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhDSnJMdVcweXZHcXhZaGt4YjdpMDRXQ1F1U0trcllUdVJBQkovR1lmcFBo?=
 =?utf-8?B?T2dScmN0UGdOOXhPcWtNZHFiNnRwWVhPV3F0MXcxYm9ZMFNSMjhLakpMRis1?=
 =?utf-8?B?WFdoRVNLN0NjalE1R0NpUGhRelRZZUNuR0JBOHhrUEgwS1NPTFZkZWpoMSt2?=
 =?utf-8?B?ajRDcCtWQytDV3NwK29ieTlTaHlaRDZKU2g1b0VKNmhVeHR6amw5Zjk3Zys1?=
 =?utf-8?B?TmhHclFPSFNHeSs4MzViMU05c2lOQ2hhaXZoWVJ5cUcwUWVUMjZBQ2RTKzVN?=
 =?utf-8?B?T2didnROSHdJTUs3cDVVVi9lOTN4UUFyR2E2V2RFV2h0a2FtczVvREhISllw?=
 =?utf-8?B?SHg3bjF3SFYzRVRFZTNra244ZzFTVEMyc3RvOGR2R2JlWVA5b2xJeWpFTVVJ?=
 =?utf-8?B?M3U2c1RkbmNlVVFHQTVPR2M1S216YW9hVXVrQmt2RXNOekg5eUtiQ1o5NnpO?=
 =?utf-8?B?QWZ5MkpqMk4xb0NobFl1TzFrSHN0MkJobGhsSEJCdkF4eGx2dG9uR0Iyc0Rt?=
 =?utf-8?B?RVplMEZRblNNTUwxeEtoMXhjbEdCUkd0T0xZcmluTUlQMGpEdlVSYWsxdUND?=
 =?utf-8?B?NFllQ2V0aXlweWlHc3VkcU1vSDhhMEhqcndXOHBiWWM0cjRWWFRtWWYvajF5?=
 =?utf-8?B?aEQ2RGx0Slp2Mk1qVEcyQVFRY1MxUm54WHdqa1UwaDk0ei8yMzNGb3NqWjF3?=
 =?utf-8?B?M0tObDkwekxVMm1tWmdNTjA4aEVJd0hOOFJiNUE1RzcxMUhpakpvaWNkdWth?=
 =?utf-8?B?UmlKd3M5dUthcGNUVFAxbGJvZ0t0ZThLamtBOG1nQkdJaks1ZkIzZDNDa2Ew?=
 =?utf-8?B?MTdoZzl6QzZtaldrTlZQOTR6OUgxbnF0YTU3d0RWU1hQVGFKNC9zdWl3Mmdp?=
 =?utf-8?B?dmhCajBVSlphQ3VOYU1vZDdlNjNJNXFxSEt2SnY2Yjh6ak1iOFVrRVRpczZo?=
 =?utf-8?B?UEIvS3prbEpQMC9GU3JPeU43a1EzMFpmNFBZQ3FCZW5TL3F1Y2l5MUJNczF2?=
 =?utf-8?B?TGtZclNPZnlxRXRhRS9odnFSOHkzeVR5cm1vaHV5dTVHRkErUVJtSjQ0V2tz?=
 =?utf-8?B?T1pWc2hrTWZERmFWYjlIZXQySHVyemVnZC9INFJjM1VHcVltOTlwMzJsSTNW?=
 =?utf-8?B?U0xvVzNNTlZpOVdKQ2xvYkdnWmdFdFZwVktZbm1jRGJiTlB4MGNQcFBRdXlI?=
 =?utf-8?B?YzdzMVNvNVEwaXVEa2ZBUzQ0RXpYYnRzMVFjNUMwdVRhQVhYbFIybUVOSUY4?=
 =?utf-8?B?UGdFMFhpY1JZejFlT1hIcVlkbjFHL3lwYzIrWkVkcEszWDNxQ3BXbEUvOXBW?=
 =?utf-8?B?elAvblVSQUhva1VzK2hUZzR1a3NTY2R6a1IxQ1ZhbjFyT0pPV1YrQmhQWHFq?=
 =?utf-8?B?WENFVTlRWnRhVXZOUGtUTWR5VXFVODRGNmtBTGpOT2ZxbXg4elhCUXNLTnpP?=
 =?utf-8?B?cU9LdDhBV1l3NkNXLzlWdXpKYzhwVVdnRmRKS29YdiswcGY0Zmg3VXVYZllV?=
 =?utf-8?B?ZEdLQ082L0V0Z2JtTythd01hZGQvQ3hZc3p3ZDZDYWVJbnRZTm1sY1pSRzdY?=
 =?utf-8?B?ME1Ycmx6NG9TbXBDbFhmQnJKeFBBQjl2ZnI0TkZmY1lDS09vMU01eklQWm1N?=
 =?utf-8?B?L2krWHQ4TnRyNnMzYUluTGVGb0hkdUxwYmpobUlGME15ZWxDaGdlVGNUZWc0?=
 =?utf-8?B?WDFtMGRQMHhTL2N2WjhvRGtoaFhwQmtJRkRWTzJUTHpldmJJdXJITDRhWExK?=
 =?utf-8?B?b1NZdHRPNVo4amVMZ3pTbnYyUWtjR091MTNTbzZwRDRVZ2FGUkZFZXFjRjdy?=
 =?utf-8?B?bzVqOHJ4ZzlIREJrMFFsMXJabmhjblVhNnBtM2gxVU9US2VvTG9UOG1IcXdC?=
 =?utf-8?B?YmZZWGdtSFNNRU9sOEF5U3RmNSt4aGcrL1gvbEFuMXJ0RHZyall2aExZL2dw?=
 =?utf-8?B?a0lXR1cyNzREOXovT1B4RXk2aURHUEw5NGFqTC9Bb01ZNE5JOWhGVHQ3ZWVr?=
 =?utf-8?B?emhuY0JwdkZWUUVFb1hLUDc0V1dJTys5S0RtWUhqTFdkMzFGQXptSVhzcVZq?=
 =?utf-8?B?RGlMc0VWcGhucnpMYmozTkJaRXFhM0NsZWViRVNGZjFVR0s4b3FjN0JvOUhR?=
 =?utf-8?B?aWlKd1BVV0RhYmd3ZnI1QWdOZmUraXhVUytaQ25sN0pCem90MG9NeDBnMHpT?=
 =?utf-8?B?eXFOQlh4QlR2NytmeXM4TTM3RlJhUVlBY0JHeGRlSGxoWjZSVjcwV1hXcllo?=
 =?utf-8?B?cFJlOWdFcmtITVJWQlJUbi9sMGZwTmZpVk9HT0Y3eWxUMHhCTXhQUmVSdlJp?=
 =?utf-8?B?NDVjR2o0TzR0RTREVWRnSGQyNjNGdTNnUE5GZU1lOTVMZk9BTUZLdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d22f78-1644-4f05-829c-08de631123bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:44:00.0482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFKU/SY3Ypd8pq3qsZabPijGusxnCe6TBsiwGimBBAq6U/hHU2JGbnIeYqpueVo+DckNhWFaZIszR6FZah0b1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7147
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 David Feng <fenghua@phytium.com.cn>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 "Guillaume La Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>,
 Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: [Uboot-stm32] [PATCH 04/14] cmd: mem: Include vsprintf.h
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmai
 l.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@for
 issier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[199];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,analog.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarke
 tos.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5CB13D7F63
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

hextoul is used in this file, so include header file vsprintf.h.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 cmd/mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cmd/mem.c b/cmd/mem.c
index d5d7ca2790bdf2d100606963c0c2d48b1c6b6978..8690fc1e4e6b93d78b48cf4c080c7f52bf2504c8 100644
--- a/cmd/mem.c
+++ b/cmd/mem.c
@@ -26,6 +26,7 @@
 #include <mapmem.h>
 #include <rand.h>
 #include <time.h>
+#include <vsprintf.h>
 #include <watchdog.h>
 #include <asm/global_data.h>
 #include <asm/io.h>

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
