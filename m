Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCnBM2fTgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70534D7F66
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FC94C87ECD;
	Tue,  3 Feb 2026 10:45:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013007.outbound.protection.outlook.com
 [40.107.162.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F0DBC0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEvJW3Tf2CqHQW3LJcNBgjp1OVOqZ2AvbPDXfl7GSFYEeCV2K+yqZKNo9idqfSKRmZ1sdbgrGtCEjhYxQtPOUe7nTYawIUVPo0lp1PCNtKunkg4kSFtEITbUfDA7COUX4KHykPuxcOgxWVo2vZlNVxDelKab1Z4kQWZGbRo3/62JP5YPsqJkW/mGfkll20hhd/vxew3XzO4oPQokHxBrYzF2RPN5DWAGUSU3b0Ve+kZRsdFVm3mjTQx58texeWR0+kvievh/VVpjWqJrPb+WIhN4noSrTbsACxLL+zOgYRvrQCNBW2rsBU/oIFnFdaHEmXVD3uKVd9GF905b5x1y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VssyrbsKhy/hzCHFhqpCm15ufXmqdTZQ6a9TAby6Zcs=;
 b=kZGpT0LtlQfqJB/Ll94L21VASKWJAiMhSpl3yVgN6mGR4Cpt7FpM9dXQVXzkVtbEnSyslEjvuR5GP4znvI+SZyuoGgtEBL0sCZJWse4Wk7WV3DTq12NNZelwNewH8w1ajYqg9XKS68MMNV5YJ5Jbjvrbnr+6YBE5Wk5AL2iUFd79m8ZQTFOdf1/Ne8h+rU4tfAAa/KriLd991qI9oxF4iUwC4D6FjdFzk1uNa4tcWFYmvoKBgweSwfh7VpPVj0iW2Oj7QfVi41DZkoC+ovtsoksXEh1wsGNWEiTp1K60Ci8fDbp2g0yauH5f1MG5ieXxw3TO/DPvvINjpH96fyznNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VssyrbsKhy/hzCHFhqpCm15ufXmqdTZQ6a9TAby6Zcs=;
 b=oPXYsOoreXpXVIrpgGO2zLhEhxmDlF4jYsKqQrbE6iLE/RmmYGg6CoMX3KXh4wNq12O+DcabuqDNcjriBMyx2vKMn/aa2xsr4+nBzUB/Fjb2R9bxZSQ2LA50/3dxc64McTZGJ1/gjfh08+gZJoO5ZieLS5+NXmJwoj39I5LedZMICg2mEMeOtauX41Il9N+Q6Cc9Lk6IAbzF791eLoMzTnZgHwmdMKypJwPh2DWHfh3C1rQa9m8vgohY1A0FXTsqh29hX1HnO++8HUb/g2PHL2/HNidu3kAZqA/u/Ra5j4BtLEl0V8USlAgQQ6SrLd2pnWFJaK25rCSxLhDo+UbjMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7147.eurprd04.prod.outlook.com (2603:10a6:10:126::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:45:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:45:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:37 +0800
Message-Id: <20260203-cleanup-v1-6-4221c13e7558@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3a352d4a-c96c-40b1-a1ce-08de63115988
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzhBbmFkR25NMjIwakpsek1JV09seHdaOGxJekYxbXJmd1RwcEpQVlRoK01E?=
 =?utf-8?B?Nllwd3FhQ1lwcjFPK1RVL2d1OU4vOVNTcjJEM2U3QVR5RDRHdm5hcXg5d0h1?=
 =?utf-8?B?VEtiRU41UURoWXRuM3ZKWGI2VDVUZXQyRmNGcjhXNEFSV2p0eWNGcG11U0hZ?=
 =?utf-8?B?VUN2MmFHeUFjOEpVWnFnUno0VXRDVWtPSUphaXAzYmNJaUxZSWF6b212Z2o4?=
 =?utf-8?B?Q0R0SURiUkxBaWcwa09BT1BCRllyOHV2aGU4YkxTNjkwcmllcldQVnA0Yy9v?=
 =?utf-8?B?UU5raU4wRnlzN3VvdDNCc1dQeTAvV2hCNDRDeURmZnhCUHY2d2tNa0JkNmYx?=
 =?utf-8?B?L0hsM2dqTGZ6QUVINDhTR3d0TTJCWDhGNktmcEM2RU9mR1c4ZWpkdHVxUjlE?=
 =?utf-8?B?RzB3RVJhNUZSUkVNZjVMeFNlK21Dd2lhcktvbDkwYXpBVmdnU3dQVHRlcFRC?=
 =?utf-8?B?OExlZVVrRUNYZCtrVGxFb3YrMHJjdGo4c00ybm1lcUp6c1VxcnczMmQ3Zkd0?=
 =?utf-8?B?alJFaSt4U0N3Z0diUGVCdHdOdHBJR1JXR0oyVmhwRVlTb3ZIUWZabmpwNE9r?=
 =?utf-8?B?QTJTVnkxbFpYWjc0RzJUZkhydG5iVUR4b0thVlRhZ1RFc2VUZkR5RmJmTm5P?=
 =?utf-8?B?SHk4TWg4c3pQWGlxNTN1TjFpMG1MaisraWlhNmhIcFlEeDBSaC90ZnU2b2pG?=
 =?utf-8?B?ZkIzTmJjOVhSSjFGRm5BdXFXSEpwM1JqL3VZUEFEMGdwa1h2YUE5WTVpTFFp?=
 =?utf-8?B?VFI5SXh2dDc3bHN2T1ZDYVJvSXhLSVNseEs3SWVFcVRuTXppQ245a05vK0RR?=
 =?utf-8?B?cllQUTJJaFB0cnBOd3RmcHFOVVBYcnBTdXVHblB6T3FJNTlWNVUzQ3J1VDZh?=
 =?utf-8?B?TitOaFkyYlNJcHlqNGwxaVV4aTNwM0p2VWlsLyt5cmVvTHJXMjFhNi83ZlpM?=
 =?utf-8?B?ckwyYkh5VDExaEMvYmhnUVRweGdDSnpCYmxEaG1Xdm5qc1E5OUNrQ0Y1dVdj?=
 =?utf-8?B?b3ZHNHJHek5SL1JrZ2dSTXRYdnBFWFVMR284RUtoQUJjak01bWIxQ3EwODd2?=
 =?utf-8?B?MjhXUEcxRXhTL0NIbkRHQjBZTUw4Sm5YK3VNdi9qaTQ4VXMrMHBUWTBSNHJx?=
 =?utf-8?B?QUtiNGhlQWJ4T1ZHampsUmlEYS96NGluL0x4dnpURUxMUXM0SXQ4cW5vRXVM?=
 =?utf-8?B?VUZWSEtKd2ZRaldzUlMwM0hXVE5mWStkaVNLWnpuUzBobzgvakcxeWFDd1J4?=
 =?utf-8?B?NE0vZjR0ZTRyNUs3SFc5c1VwV1dhQzFJWi82bm1ldFhvQUhpVzVhZFRCaEpE?=
 =?utf-8?B?OEZhc0cydmkvUVRTV2M1ankreTN5ZUJoWXVZdTVHV2dDcE81bDNjWnZpOVR4?=
 =?utf-8?B?M29kb0huanRJNGN2S2lLelVjWEQ1KzZaNnJwSjZ3dThsQ2liR0o2N3ZJV210?=
 =?utf-8?B?c2o5MlJMMXVSWHFiSzRXM1RiUFh5NVIvY3kremVzWUdEdHF6ZDluU0dhb1h4?=
 =?utf-8?B?aHhDVzFxUjhEM0lIVkcwNWNZamlzekhhNjFWMXJySmZiRVlLM3pzdTk4Ly8z?=
 =?utf-8?B?Sk84Q295eWpOVFNTSk5KNVdqTmNDMUV2dC9ZSEtnTVV0OFJ5Szc0ZFJveU1l?=
 =?utf-8?B?R2pVLzdjamFwT2RyQ05SbjJVYldDcjlPYktHcXM0UTk4SGxGbkw1Z2hVL2NJ?=
 =?utf-8?B?STl6bUVtMXZXS1VIYUl6aVVZeTY2NmJKZW9OOG5PVENZRlg0YjdxaG5nbFRI?=
 =?utf-8?B?alV4aGNBS2VpM1ROaFBWZWpVRXphNkdzei9iTDhhYWlvTjV4ak8zUlNGWEJY?=
 =?utf-8?B?ejhaR3o2eFJKeUhMRWUzM3NWZTlBczllSGFiZjB4L1oxZVA2ZkwwUEI1bEJm?=
 =?utf-8?B?Qms5SFEySGRIMlk1QUdHU0gzcEltK0ZFd3FGQlJrTGJQcVJ4SW1QaE4wUHZK?=
 =?utf-8?B?eDA3bVBQRkJvTVlBemRZbUpSejc3TDQ3MkQraHNxUGFpSE1LU0hyNmJ0MUhY?=
 =?utf-8?B?ZlR3end4ZE1BRHhLMUZySzkwand0MGNJazcwYTBiTXZUWDRwMWZhZU1lYWdL?=
 =?utf-8?B?N3RCNHZid2xlWVJDaDB6L0ZiL3Yva3ZHN1RGMHE2TnZzMVZIQW04WDI1cVB6?=
 =?utf-8?B?TWdOc2UwUW01NFN6MERzMWNKN0FBSVBBa1pJT0ZpSVF2OStVNDZhOEd1Ym8r?=
 =?utf-8?Q?IsPofahDxuTy80cWCoJy0snUG7SmQLjqlV3xvSaCwwQC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG1OM0tsYnFHTkd0UjF6UjN4VktHc0o4OWxoR1huOGsrYVVuYURSbGxFdVk3?=
 =?utf-8?B?eGRzQWZIelE2REc1VGVvcUhpNGJkWGxUeWt0cFBBczU3dmlLV2R6dElFMC9a?=
 =?utf-8?B?aXp6WHhSNzh6Uk1SSGlUdVN0SkpoQWRGSGdQdTJxUG1nTUYxUU0wK3NYZE1C?=
 =?utf-8?B?RmN5MUpIdVdRKzdiZ2JuVm1raGdJYlZER2lQMndMTzNHaklVN0Y0VkFwaXIv?=
 =?utf-8?B?akZ1UDRFN3FMaTcrc1pDbFFYaDF2cmVyUFdIeHM5TWtRTmxNSGdFeCszN3lK?=
 =?utf-8?B?eFh6ZUhmVTNDTEd5am1kTzlmWGxEdFUxNnppY0lsTklXRlBxV2w5aWRPS0d6?=
 =?utf-8?B?NndBelRWenpTR2NsTGtraXdLa1NoWU5LcmloWGlnRndIVDRCRjIrWkttbFZo?=
 =?utf-8?B?YWZVd1BOQkFGNDVmSjgwNUY0OTFEaFZrV2JDRnJnS2ZlWll2SnJFajV0bDBH?=
 =?utf-8?B?aFNWak5ybFVMNGJueVYyMFhEMWtLRUlXK0lxNTNVc0RJaDg2NVhjancvSzhK?=
 =?utf-8?B?aXlBNWxvY1NjR1VYU0VNanFJS1N5REhhN1JvM3NkMVd0YlJtTS85WDd6T1Ix?=
 =?utf-8?B?VXZzZ3NlemxyRitnY3REMkgzOGZJMFZuMGU0NmdMR0RXeW5qSS9pM2pTYTdS?=
 =?utf-8?B?a0trdDY3bU51ZXhhRXR2d1JMN0paQXZ4MzFORVlrUW5SUm5aN0czeU1Bblh4?=
 =?utf-8?B?SEpNSDhqZ2kyZDgzS01TY3RFK0FPcDBydElLMjR6UXBSdVZ3Tms2dzRKKzhr?=
 =?utf-8?B?dHlRSm53RnE2RWk2SkNJOWUzOHVhdVhZNlRLUVNXbm9OYjFadFViMVFpck9K?=
 =?utf-8?B?RVVYSWtPTTZkQXpGRlRSUHdSRS85bVlaQzlOMjFUQmVLR0RUY3NiMW16Z0Rq?=
 =?utf-8?B?a043UTl2cjl4RUtjVXlURWtraFdDNGpaTG9ESFBVWmJRWmxvQjNtV29wRGJI?=
 =?utf-8?B?YlJPdjhpaGpvYXZrNDd2L0M5S25LVHN0cEcxaEw1U3pWaFVmWmFodi8yQUs0?=
 =?utf-8?B?NDRTSHJaam5scW5HRlpobFpEWkVKZDRWTkYxNldaaDQzQUROZk1wMHJseS9G?=
 =?utf-8?B?WGNia0lmdVd6V0hzWlhLQ0RCMEJrN3NyUjEvMjZTQWtKalVUb1hzelNVQWVn?=
 =?utf-8?B?UmVySVVZT0NLVHRJWHZDWXF4aUJ3TndrNTRnTlFrTEx5MUo1T2IzbVlvdy8r?=
 =?utf-8?B?MnNPM0lYYjJTR2lGV2x1d09GTFlIa2txaytUMDF3Z2UrcXdhTnNLbXFWSWVk?=
 =?utf-8?B?bzhvNUNrTWMyd3ByWFpkeG5ueVlTMWdDQzRoWWs1UytLbG5DM3IvbDBCQzdG?=
 =?utf-8?B?Y2luMkUvZEtWTTQ2MW5GYzV3djZLeTZDWlBkWDZ1VVBEcjA4R2haeXgvVlJk?=
 =?utf-8?B?S3lkbExCbnBOb2p2YkNvcnlENGVYRWFKelEwRjBYcWdYS1JXNjZJYzFudTVL?=
 =?utf-8?B?N29GMlIwWHRUUUdZY0lBZnFvViszaUVOc1pDcHZxTnZWVEI0UTM1anVGWVBO?=
 =?utf-8?B?aVloUi93TkJ6QkN0VXZxR0JPc2lHZ0p3ZjBZOGIwN1V6Ym11V25ZNzlDc05k?=
 =?utf-8?B?RERyNWtQT0h6bUpIVDFKTkFpZFZIT0w4OWtYK2tTdzZvZ1pqN1l2cCtqc3Ey?=
 =?utf-8?B?MXBWcmduZng5cy9MbURzL0lONzIzdEtmRDhGUml0SEY0Qm5GVWxlS21NZ2JC?=
 =?utf-8?B?WWJ5YmRNRlNlcXF6cXRmUm1INVloaG83S1o2aEVqZndyNVluNlZMZEFQQTJy?=
 =?utf-8?B?V0djOUJabjZJSWpVWTFXODdnYm0zUGh5YitFZ2IzeFhWT0xyeTc0a1hUdHFS?=
 =?utf-8?B?bXJaQXV2WXRrR1lXcE42YWY4b2RzTHRuMGVDeVB2N2U2SW1EQWdFRDhCRHlL?=
 =?utf-8?B?WEl1OUtLcmZIUjdta0ZoR3hhc0NqL0IwM1BrNHVIRXlrNEcvNUk2OUVIV2xa?=
 =?utf-8?B?Q0ljUEpwbFhrWGlsbXNXUWczUU02eVdzd0VPN0NWb2UvTTJ1YnpGSUFWNXpo?=
 =?utf-8?B?KzYwYkZTTnU1MEgvWkNaNXQzN0lHZ0JiSVZncHhlSURkaFNxSUxqMGpOS0gw?=
 =?utf-8?B?L1ZNazdNTEplTEUvVHg3Ung0UGNJREJZYVN6M0hTU2dOL29MVWZVL0Z1bGtp?=
 =?utf-8?B?cXJTNzBRem1HSXp6VUpVNTZjeGIvZUNYVFkwSjcxMzhxeGdEVWQ4SU9sTEhr?=
 =?utf-8?B?bUVTaEs3SmhKR0h4T3BPVHl4c2x1dTE5NC9FaVpFTTgzVHVnWUlJeExENElE?=
 =?utf-8?B?b2NzMy9nQjFaWHlSZWpkdUNFWm1Ucm85c2sxclBjN3lhRVhXRDloaTZtUHZj?=
 =?utf-8?B?Q1hldGVTOEw5azZub0NkNzNBYWxwbk84a2ZvNEdtMTltZlF1VFBSUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a352d4a-c96c-40b1-a1ce-08de63115988
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:45:30.2897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgAk7aII63CROwE+x2xW/KfGI7mwnEpAp3NxGFiEhKceiN2/qJYK3WEvVZ9XrEUBkQp2+/+aZu2DmR43ydHDrA==
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
Subject: [Uboot-stm32] [PATCH 06/14] xtensa: relocate: Add missing headers
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 70534D7F66
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

memset and size_t are used in this file, so add missing headers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/xtensa/lib/relocate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/xtensa/lib/relocate.c b/arch/xtensa/lib/relocate.c
index a499590c75bc5f143ef9dd008b36262b63e027de..d3d317edf88fe433908ffb2300f8f8733415d1fc 100644
--- a/arch/xtensa/lib/relocate.c
+++ b/arch/xtensa/lib/relocate.c
@@ -4,6 +4,8 @@
  */
 
 #include <relocate.h>
+#include <linux/string.h>
+#include <linux/types.h>
 #include <asm/sections.h>
 #include <asm/string.h>
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
