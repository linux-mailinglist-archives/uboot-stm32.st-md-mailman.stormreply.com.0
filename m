Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHeNMqfdgWnwLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:36:07 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC31D8749
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:36:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25DB2C87EC6;
	Tue,  3 Feb 2026 11:36:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E59CC32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClCWMXwQ7837an3Qnh5NcJ72JJ9IPey80u8//ddZQ69G+uTw5NalASbSjPZH2ZoOF6Cz6cE1QEufgz9ZLrOJ77bb1/1lgvecE27aLLuyu2GgINMf30mbhsYorygpACGbHXJwWYw+lDvj+1qDI/4JKXwLws8gN5b6NEYhRtudLAU/4rfhydMaWW3hAu2mKuL79qOWnuxZKYsaTo9K2FvRLBuHLTiXefCj7YRGT+U4NXKUM0QrrwJYNPy8UlUZJ1urzRuMTEi9SCjiz2ghu4ByyMIrY3NRZ32TVGVEvUZwhgtY7Sjh8E+3wlsFtl3E0Fu1ttuLlP8MMOVswhVK8n3tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VssyrbsKhy/hzCHFhqpCm15ufXmqdTZQ6a9TAby6Zcs=;
 b=VrEWF0X7d/PEwmVdwvjIH9z/hW1M/ZZQ8zHvDk5a0ygoOCzbhRfdctKW3ujKP+JZviIh212c+lc9qRk0gYOQpwpfOMETtDefCuPG+P5gn5hKyqwjsdo7YorQ/Dwuy+pgqEgnIfmddUvMMRQjcgRhfeIFLOR7gwWJuFW66VumTL6iGFVZTXu4XbcTiHelQdNN9LXSpcNA3oDTWHiuj13J1DOosWnb7W9H/FJkHiG+PDLBYU/zz10EdW04dE9GCmNzevHSh87vjUgS/Y0Ic669WCQZAz85F3ACNus+eQJKBoJ8vbrDBvBN88N/MbXnUDOp4D/qmgVXE9ZAk9Mdom75Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VssyrbsKhy/hzCHFhqpCm15ufXmqdTZQ6a9TAby6Zcs=;
 b=IP7EikkP0DPdSw+XWCKLQoEvd+SbL8PsgZ71DtvT44gLG9CWsNMoEA+rRdhqUaGYnZNbwvd3xhN4Jp8qoPc+V8czDCtIFwtHggrS5tQXhirFvsIW5vJvCZaTxqX95wbVPksOiv1aHpapBHKfJ2n11AQm8qS/YDvnUVfsnQF5csXcWXAbpOMrgkcYLEMdgzg31bgtXEGtsP0dKkApssg8wcRiUPQN5LwpOdzhEMcGXu4/17q4qFQfouaFJka25WAqSbBjotgxEE5ss6LoeC4mjwHDyXvBKyABaOaPZBZwlIyd9FlryuyeznR0b+qRudvBrUtGxh3f0Wtl2NOe0X1caQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10749.eurprd04.prod.outlook.com (2603:10a6:150:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:35:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:35:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:10 +0800
Message-Id: <20260203-cleanup-v1-6-732e986039cd@nxp.com>
References: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10749:EE_
X-MS-Office365-Filtering-Correlation-Id: 79396eba-cd1e-455e-ba3e-08de63186483
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjBvYXpoeDI5bTRYeDB5bEc0bE4wRDhITWNza1ljeENiOXA2LzZRenYrYllU?=
 =?utf-8?B?bWMzTCtUdVM5VUM1Y3JnMjBBK3o4RGl3bGNyU2c4S01NVUQxRHBVa2Q2OFJV?=
 =?utf-8?B?eEtGWmNCSkJ3aERGNVBiQmJ5ZEdBa1lEU1FFM2tZNzl0TWw4eDFPcnhDZFYv?=
 =?utf-8?B?aTdsUGdsa2tyTWFQY3VOSmxWTG5sNVRDRHFEMUJya3VOdEQ4MWZUV3BzeVNj?=
 =?utf-8?B?a3ZiMElIU3F3Y0w4dXJjVktLS2FkWURxNENpYlRnMG1ORmI3b294ZDVSYWo3?=
 =?utf-8?B?UUI1OEhPaHR4dktyZU5MQnpRL2FNQlRyV1NGbXVWOU9XS1cvcFNDQm5ETDlP?=
 =?utf-8?B?YlJJeUVTcVIzZEtoQ0cyTlRPeEdCZU1SblBXdjY1Z3hCYW5yRDRhRUI1RFB4?=
 =?utf-8?B?ejBrKzRVdkFSRWhqS0dscmhZdFBiOWxxVkR3L1BpMkVoOWUydTVGdm16WC85?=
 =?utf-8?B?NzNRMEtyUXhkOWNxMGQveTNEUG5CUFIrL0tLaUlBWUlTYzR1OWdwMENJek9S?=
 =?utf-8?B?dEZEeDBYajVCWHpvVER6QU1KZ0gvM2owaFd3K0orTTRjZTU2TVNwcUhDWWNT?=
 =?utf-8?B?aWRiMC9hKzNhM2F2K2RzdnBQbTBNK3ArU2RYdDh5ZlR3cUFNUkk2SEZOakQ1?=
 =?utf-8?B?enVCc0lBaFlqbkptMjJXdDJicmVBT0JmRzQwWEI3VWpQZGFqaVhaTTFUZG1P?=
 =?utf-8?B?QjFOZHRsSTJYZFVid1o0RHN4UU43QlA1UldhbFdaVGZLbnJVRUNMZmowaG9Y?=
 =?utf-8?B?Z3I1NHlMazArbFo2YThRQ2lNV0VGY2E2aWgwKzhINXBidEZ2M1VXZWNNc014?=
 =?utf-8?B?Z2NTSVBCMzh5N0FnNUVORW9wYXg0OXNqb2x5Ym5RYStTWnhrQmx6M0hkQXFG?=
 =?utf-8?B?eExRS3k1ZUh5cVFZbUNTUTJmTWV4L0x6VmRsdGh1c0Nxc3VJZHloWmFYVHd5?=
 =?utf-8?B?ZzJWVlJsbHZBV0U5SEtFWkdUQW5hYnhIWER1elJaN2l1Nlh3QjAxc212Q0lL?=
 =?utf-8?B?TmtES2IrYXE2eks3TVFDMUFJUXd0U0ZVSjlsN2JNeVRBcjV1RUpKdVNmcGZj?=
 =?utf-8?B?clovc01McHB0TkJscHBNZWRMYm56clVVS0xjL0VuSWlzNWFoOEdnMVBQSXdG?=
 =?utf-8?B?WFpyZ1N3bXB1SCtURjZBclRLV2xhOTlJUXBwZ0RrZitKOUF1ZUpPWlZNeGh2?=
 =?utf-8?B?SmlPMHVrTHR2K2lOTVVJV3J5WG81RGd3OENqNFVIVkUrcG1tVFcvaWlVWTBx?=
 =?utf-8?B?Ni9lMGFIaXlqb2l6dEJWZzc0Q0kzUmI2bTdQUU9Yd3JFZXY4UlhHdWovWDFp?=
 =?utf-8?B?YWcrNVc2K1lSdnRpUFk2VGFmeEYwd3VtSzlVTzV2RzdyUlN1aGkwaG5YMDdD?=
 =?utf-8?B?ZGh5RUx3VHg3QkJUV3EzWlJKSWVYNUNWdXpkQ1l2WW1nM0plc2pZd2JxNVpL?=
 =?utf-8?B?L0FkbkM4MWJ4T1pXRzJYSjNEM3FMdTRiTXQrSDY4OU4yRzE1WXdxQWRXbmZO?=
 =?utf-8?B?R2U3MWxWbU1VbkFFdDh3em1HaE9PampOMThCdmxGWktjQjhoQWxWYVZ2UC9C?=
 =?utf-8?B?WVJhemtnb3FOeEYzYVczdXlVYzhrNStNSU9HeFpLZ2JMSm1iRDJTLzYrMUZl?=
 =?utf-8?B?UldoYVU1eDdSOHM4RHVUYitsTTJwSGR4aFM0UnFGcFFHVHlzQlhlWnZpS0R2?=
 =?utf-8?B?eGN1RE9haDA4c3p4b2NGeFZFTXZ3ZjRBR1FEelMyakhBak1KcFk4R3B4QTVr?=
 =?utf-8?B?VXhJRmNPajAxSmR2a1Z4NDkvKzZQQnVaakc2MzA0Nmh3RnkrNXVSUExMenNE?=
 =?utf-8?B?K0QraFU2MGk5TC9reGhkcVltRmtNNEpIT3VxOHUzR2krV0EzandWSlJJVEdN?=
 =?utf-8?B?NnhEK1A5azJYb1N6QkpLY3JhdSsxeWFhUm9kKzZ1anlZanlnMlRZRDZIdkVY?=
 =?utf-8?B?Nzk1cS9ZZ09NMjVlTVJqbi93cC9mR0hFZEhURk1wWGNHQlArWEE5VFI1ckh5?=
 =?utf-8?B?NkM0R1hGY25EbVM3dDVYeFRPc00xdFV0QklKRnovbW5vVHh6YlJpajBYTkJ2?=
 =?utf-8?B?cXZjMUloYzdWKzBSLzdnQzhLc2NwMUhSMFlyL2hsYkRBVFlPa2pNSU00dmNK?=
 =?utf-8?B?eWltR0dycmpJZGhiV0VLT3dpNGhZMlE0MW1GTmNUdStRZ1NUMzlMQVVhN3FK?=
 =?utf-8?Q?tiqLjwH/b/AkkCAbrRVi10niTQW9JZIeO/N/gHx0h6OF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THRlc2dlTWdVUW91Y0lNejVoN2hnZzFPejdBaTZHZDgvdFIzNGxBc2xHc01N?=
 =?utf-8?B?RlBldTJvOEVtMndFTEhXR21LVVlHdmg2WXZ4c3hNV3dmZmFMU3dBTXdPWmhl?=
 =?utf-8?B?NmwvNFh6alFESXc0VGRtdytwOXlPNnJhL1FYU3FMWnZlSVpLYXhUeUloMUN4?=
 =?utf-8?B?SkV4TUIvaWhUbjdjUFVBNnRoMGxDdFZFY0l2Z3lIZ0dmdFZoMmVYTTJUck90?=
 =?utf-8?B?MVpURm8wQS9HU3VtdlpPMkxEMHprVjkyWnhJNWQ4QTN1b1g1WXpNVVpLNWxz?=
 =?utf-8?B?ZnZENy96T3Myckx2bDZYZ0pwQUR3S0VKMjRPMWsvSjFTMlhEdmVZdHE3NE1M?=
 =?utf-8?B?dUU0WXhBTXZzRC9OaWtzdWVpWXJPZmV2VFZ1YzVQU2lYMG82WnVKSEZRcHZm?=
 =?utf-8?B?QVN5R1A4a3pZSlNWN2NYbkpWUHNSZ2Jqa1hTVDM1S1o5eGVyK2lmUU96R01t?=
 =?utf-8?B?UW4yR3V3OWl5SlpCTHN2MndmVUw5NFZGdGlJK1I3Y20xMUd6L1RCYkxoUldK?=
 =?utf-8?B?S1ZJem8xclFrbVNZSjc2ajNJOExhaTgwRnRwN0xiclVYcDZmQ1h0NEhlcEVT?=
 =?utf-8?B?aU10WGJ2UlpOQnA4c1hoL0tERGpNTGtXYkdqb2syNXE3eFJuL3JWeEQ5blNQ?=
 =?utf-8?B?ZVVlYitPT0dIcEp5S0h3eFNLaXFBZUw0NnplL1JvSCt6LzdYNlRWUkJKM0cv?=
 =?utf-8?B?WFJVbkZMcSsvbCtKTEpHd01UeTBkemRFaGlsam54dlM4c1dLcGpvVk1CckVN?=
 =?utf-8?B?ZmdYUGc2WXZaWmdiNzZDK3VDR2MwM3c1cWczM1R3SDR5WldUM1dxWkRHdUho?=
 =?utf-8?B?SDZ1K2lKRHdtellQVUpUZVJqR21obFc0SEE5YW12enkycTExa0NEcFJCK24w?=
 =?utf-8?B?Y21ra0tkY3RhV3ZzckZzR1l1N3Q2NUN2a0FPVkpmUWhnTzBadXozdlNSelNw?=
 =?utf-8?B?NUZkSFRoTlJLUExNWXNsZHQrUERGZDJONmFpSjNhbGVtczZrYUV3bnVrdFo4?=
 =?utf-8?B?VzNvYU96K3o3WDRtTGNuVVp1dUMrcjdGTGIyejBEc0xrSjBQTGJ4Ym1hK0JC?=
 =?utf-8?B?dHdRRklZdUc5RXJFakljNzdUOVNEMGFBdG5MZG5nS0ZXYTV4UFZhNFZwekhj?=
 =?utf-8?B?TGZxK3hUMnlFd09tU25mNXN3SVFNRjdOU0xWd3prNmRyUm1KZ0JReHFTZnFT?=
 =?utf-8?B?OWdCZDg0TklYczhxTWJwOFJBaUhSOEFZN3RCdjZRQW00SjJFYmNZMHZwQ0Iz?=
 =?utf-8?B?MTNTaVVoRy9JWEVXc2R2V0QyVGR2SGF6b1ExRXJpRVdkTTQxN3Vlb0wwTGl0?=
 =?utf-8?B?Z283V25uaEEzbTlmR2pINlp0UVFoLzVhTC9ML1VzZkp5aVRwQUZmaU1NUDFE?=
 =?utf-8?B?cE5RK0R3eGNVb005MDJaWk1tNFlxL3RLOFNUaDE5dHJ6RDN0d1ZWTDc3Mkg5?=
 =?utf-8?B?U2Z6RDhCb1VoUmc4OTZOU1VMT1U5Q1hld0czV1gxRjVjMFZDSFE0Kyt3ellH?=
 =?utf-8?B?NEV2amJDemRHNm9kajhVZHZ0WkJXVmhoNHBRTW9XYzNSZ0hvY3BqSURZckd3?=
 =?utf-8?B?RmhrclR0TmxBVnJGMHdaYi9zaTdSOWxpaTI0bHUxeTJXZzhiWTFhVXUvNDZD?=
 =?utf-8?B?UFRkRHB0bng5c2pIMC83cHQyK1poc1g4cWlnc0tBMHI0R0Y4K004LzQzV3Qy?=
 =?utf-8?B?S0lwb1JhZ05QTmVibXRoc210QVpQNUZ5eitlczhzZVlZZTYvMHlFOEJQVExV?=
 =?utf-8?B?US9SR08xa2UvTU10ZW9HNlNtdjZBdG5XV0dRNjVobldOUjR1UWVFeWVVdURs?=
 =?utf-8?B?c1NxeXQ0SmxOVkE5czFqTHVXSDI5ZkxhQU55VGhGYk9jZjdlUlVlNHdsSXhv?=
 =?utf-8?B?V3YyMG1lS3hNZnRvS3RUTHF3a2FDK3A2Qm1SbWc0WkdzVnI2ZWRsRTBLNkFj?=
 =?utf-8?B?VnJYSU1qUWRnY1pvMHFKRksrekZzaHZoVGk0NDVRMCtxakVUb2VBM2cxcUFP?=
 =?utf-8?B?UVN4djl4S0NiZzM5dVp5cThlY29DK3lPMC9RV1gxbWp5SjFBRTJkaG1UVzht?=
 =?utf-8?B?ZWJnTHJOcDBVVm5RWFlxdWxCcmJEcmpJSWRON1VqTVk3KzBRUzJPMmhvSmJU?=
 =?utf-8?B?czh1MkJxdUlNcENWaVNXVnlFRlZIOGNsOHVHUmljU1RTRFFuUTIzUmxkQ3Rz?=
 =?utf-8?B?TGV1L3pHSFhWZnhDRjRxc3FQbW5USEVHMnZ0c283dXJ5UG5NemhZOVdzWG1k?=
 =?utf-8?B?cGFLM0dTL3A2aFVyN285S0x0K3dUbFQzVUlGRXAxTnkxTlptOFNlWlErOTZC?=
 =?utf-8?B?OVFuMU5UT1dURzZwMExiS2xqeGJ3d09oSWxwK3h6SzFyTEFrVlB3UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79396eba-cd1e-455e-ba3e-08de63186483
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:35:55.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzupwCTemxkaDQsEfs/YBDiKKpmbzbAmPewu+1ubpdQZEKkTSs5i4HflE8DINiipB0i3go1IOCn7fDV5yjfhiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10749
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
 Ilko Iliev <iliev@ronetix.at>, Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
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
Subject: [Uboot-stm32] [PATCH RESEND 06/14] xtensa: relocate: Add missing
	headers
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmail.com,m:n-francis@ti.com
 ,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Hua
 ng@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,m:michal.simek@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[195];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarketos.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 7AC31D8749
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
