Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMmPDUXegWmDLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:38:45 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4724D87B9
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:38:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C394C87ECA;
	Tue,  3 Feb 2026 11:38:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E659DC87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/0AB64bJrS2DlPpd/VhpsdX6uliVqgtS8N9KVl8DyG63VaCu6N8B/ppKIE60H7ehnFT+H1EdXf0c2+rmftIlmKn5DHL1z8u31N5JTTHxpCfwKf4KeWvFVRapWkmX7luTFBh/rPcQTbXDhHlVVC+//Rr4TRuCNd1bxHLd/pwsqvlg3J3oAo6pAvFPqfpL39RuoFk1hDoxnnBv3vBRFPELKZqbvQljD8XeGFMuYQ6reYhoZlyDz3qn1svKDxSpwLxS8DH1owmzgN555ohphQv8edSz/u/Wawo05Gw+Xz5/l/TnXqKva5iAQoi2nz4yQywU93JTZTBPCWrexrQOg1PWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlZ7txCufvgBDrNMB2IW01K9N8kpcuL+X1j2xht0yaA=;
 b=Nan9PelYeMIfNFBHT3kT+PW6drk8+wW/Q9rUAgIVQN2xRIctCS/KHmDDQUWASQlmUhSMU3eanTrKdhQtPpTl+mGJt6byTYmNWEbyRZv5nlhPCygqF53msny46VI+XzJwoHEfuXnUzxZW0G5qlx1FlnxCdWETVKaryNudjAm3TEWWgvSVTGNYxRZCPFC3Jwrf3vVQnw6lCWAi3NpUXh+fHmwm5b1xCugwymOELVPOXyP7C+MN63bIk4E6tnFm9SIOfmgC1101eafOOlctjS/JvXw0SuOdEBTgoEPNxn6lTg2D6ONOe/mAhH+tygRs+QDJ/tM9yDon2FrpOw6VcCNjPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlZ7txCufvgBDrNMB2IW01K9N8kpcuL+X1j2xht0yaA=;
 b=oqb46McNMZen96z/gIkt2NDtPr3aEJoeDefcTLiy7hyb0KZw/q/l7vQGObPWfMr2g5gM0rbIir1CyTrfwZVzf3ICyiQrOL2InkMfoQMN/9yNZsA0wqJ7igy7d/oX4gohKooLiDPHv/JSbqvnye+oTb3jz4k3psxvXy861WzxVsbnEAeae+TqEszHQDU1RiGl40ExxVYTrzyqsuqSfxqnpKnD11J+torcak5j0Y/VYzIVfSb5j1hRMOdXROcERKq0NsoOianKsU5HeTUIJELPUCoZpUb5fmHaI3BTSv9HCrn8hvUPIRiq0Qd6ezUDcL3DvqURgKgR8Y4gmifm8FWqAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 11:38:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:38:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:13 +0800
Message-Id: <20260203-cleanup-v1-9-732e986039cd@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|MRWPR04MB12330:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9eccce-8a0c-4719-3516-08de6318b3f4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|19092799006|376014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWtVS0x6Q3BjZU9XdVF1VEJseE1YSnZuQUhCbjQva0FqWlFROXdwS2FOak8x?=
 =?utf-8?B?WXpHcjB4dnp3VWN5bDJJMGwrWXFkYWZSREdjQnRSVVRKT2dmcjk2VUFPbmRD?=
 =?utf-8?B?b21sejBTZ0x2Z3huZmR3RnY1emNwM1NONDMwM3pWM1dSSXNQalFTZTRxT3ZM?=
 =?utf-8?B?ejVYZC94RkdKYURZd1lQemk4U0ZaajZwWklxS2lZN3kraFVkNjBiQUQ1SUVP?=
 =?utf-8?B?TnRxNWE2TDJsd1FGaFV5R1l3ZTlxYjl4KzgzamwvN2RRWmFQTHVWUGYzN0Fs?=
 =?utf-8?B?amVQSTBDR2owTncrT2VKTVZiMlBiZFRIemd1OVl0Y3A5OExyd0NjWXpiTHZu?=
 =?utf-8?B?ejJSRGNBTVJzT3FLdGpRZzNvUVdtN3NJOGwxbzN1MFVZN2EveThnR2cyRXVt?=
 =?utf-8?B?blJ1TDZnVDJHZ3ZIaE5maGlJTkM3RGlqZ08vYllpN2lURGxGdGZ3WFlBcUJZ?=
 =?utf-8?B?RDJ6RytMeE9mTkhDcWNncU9PWm5ZRWhRUThERDVJMU5SYmpRbjRSYytHczBR?=
 =?utf-8?B?R0g5SFQyYjJhZkNodVE4ZExWSEZ4YVNNRGpzVjdrdHJIRS9RbWUzZjRxM3l6?=
 =?utf-8?B?QTJXbzhYVC9sb0xTcWY0U1Z6cXNKd2gycWYrZ2poKzZ2M0RXUFk1Vy8yK0Uy?=
 =?utf-8?B?N21xalI2VkVYOUV3VzY0ZWRvSmZua1JjTTkrdnhhMjN4VG13dlo5NEtmVHZV?=
 =?utf-8?B?dUJzQWlmT0FpR2M3UG9MUC9rdm1uMVc0TitzUGZWdjd1TGFJcmkwNTZjNVhP?=
 =?utf-8?B?elp2dXV2NkxnTHBqcXY3bXg4NU5XUG5nQ0dicm5kWjVHc0VDMXNiY1dRYjFs?=
 =?utf-8?B?eTF2OHU2OFU0OUdxcWd2aVlIOGd3WG5xeFM3cnMrOVVSeE5DSW9PRW80M2pG?=
 =?utf-8?B?VkM2c3JYSkV3REliUjdMTktVNitqZ3VXUzFxKzJITHVsUmFJeVhseHI0NWJH?=
 =?utf-8?B?Tno4emEvdFJhUCtSRVRrM1ZQOG1oTUtiQ0ZQMnoyeVhKSWpHeG8rdGV1WUhm?=
 =?utf-8?B?OFFxTlgxMjh1aHllUVpoM3JPdHRKa3ArTDc2UFFqRjRqTXpkb3NJcFd5bDYy?=
 =?utf-8?B?a1U0V01RalJybzBtTXl3YkFkWHRTT3JUcnJ3T0ZjbjdjL095YjYzb1YzcUNK?=
 =?utf-8?B?WjZhdmxtK2Q3YlFjRFh5WFhKMWc2M2lrZXdpS0RyUSt5MzNjcWorNm0xSlZS?=
 =?utf-8?B?dFVyU0Z0UDRPT1djRzV4c0NiZ1Bnb1pYQUZLdkN0THJIei8wb3lsMStWNW5s?=
 =?utf-8?B?LzFUZGQxZ0lNN1VjVHpZNzYzQWQxNHE4RUJkWVBQdHBYUXBNZCtldHJiUFNx?=
 =?utf-8?B?OGVYRnJVYVRERUFqY1NGcENEdnBoUWM0UGluZDk2Qk5oQzRLMHRUNlBRYXZW?=
 =?utf-8?B?MERnai9UeXhpNnFzQWNta1JiNUVCMHNjWWo5UWhuaHhoWVF0TDhRVjVnc1Jh?=
 =?utf-8?B?TU5aMVFyMnFZdWl1L2ZXTm56UUFyTDcyUUpjNzF5ZmlRU2NsWG1NaDk5azIr?=
 =?utf-8?B?MGFRN0RoVlBmaXp0TVpaYzN1di9YeDZ0QUFOajd0eTVpQk96YUNGNEpmamJ5?=
 =?utf-8?B?UVFhbzRNN0J5cldDeUk2TzNkUVVHbFJqdmk3b3FyaUdEL1p6dUJBZHBTUEJM?=
 =?utf-8?B?TnhVRmdIOE5TM3h4bm9ESHlwc3NjeDZkS2hrYnFhWENjT1BuS0dGQmRlOVNk?=
 =?utf-8?B?R3IzNnpxdFlmSHlKK2czOFpNbXptMFBqV3VJM1BHZ2FnZ0lkRDBxUUJFZ3NH?=
 =?utf-8?B?Nk9McExpVS9WMlJwWjZoV0oxSUwrSXR4c0xUR0FpclJqSGRDQ2J4RUpDZjVP?=
 =?utf-8?B?THRhcTRTWUJabkNXLzQ4Z044NmdpNHliZmprQmVDTisxZzJTYTZ3Wk9kN3Nx?=
 =?utf-8?B?bEhTTzZES3NjQkhBWG5qS2F6SEwrSWQ4NU92eVJGUUZIMzhvQngrWjMyRWNs?=
 =?utf-8?B?V242bjhaWjFtZW1EWEFhbnFLS0hiZlBiR01LZ1l0VjFXQjlyWCtTQWJ5TURE?=
 =?utf-8?B?QTB1NThFOEJCK3FjY3kwRHhCcUhDSmw4QmJ3SGpjV0FoR2E3QzdGRmdsMWZQ?=
 =?utf-8?B?dzd6Y2FoQ2luWkt1QnFQN1kwN0J4WFdidDBEcGFMZk5QUWdVdlQrdDQ1amI1?=
 =?utf-8?B?ME5wVjVsZDM5YmJDNndCem5uemNjTGpteGJCTUlWdjNYTVh6VTZvTUd3QWto?=
 =?utf-8?Q?iMB4AHg4VlEQpOrBd3m4v4desghihZK36vB3QGH7zt3c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHhsUkJNSkVUTE9ENUJqR1ZoUmNhMnpqaXg5Z09mZGRTVWZmZ0ZTWGlBWG45?=
 =?utf-8?B?YW4rZ3BLbHdUZ05XbG5KcXBpNFJMRVl1VEZzdTdNVG10WkVoaUlOT1VXNWEy?=
 =?utf-8?B?cGRZdEE5VjBtMmhQY0VxY3lBdXk2RHROUlJ6S0VDclByeU9GZzFtODEyd2FB?=
 =?utf-8?B?VWMyaEFZcFdoMDdDZUwrVnQxRTJxWE4zc256RkF0cHBJVEM0N1I2bGkreEpn?=
 =?utf-8?B?ZmhlejJMTFMwUTYrYmRWOXBpZVhacE91eDhDQkZacy9YOTVSNVNuSXFNaFNa?=
 =?utf-8?B?Rk5KdWZ0enRzWE51QmErVXdXdUEyeGthMGFHclNGZWl3VmhsNi9ROVNEVEtD?=
 =?utf-8?B?MUZnVXF0R2xjSEQ5SFVOV3VzVXdRcHgwTUlQMHV6QWZvb2JGUFp3REhVR1FW?=
 =?utf-8?B?bUs1cEsxR1BaeHNMeXJmV0FZVGp2bHRnR0JDL1RWM0kzSURnSSt2Z3JGTlRt?=
 =?utf-8?B?MnlnYUh1TjRqRlJvOUFmWWVQZlhiaGRZSkYyZWE4RnFjZ1VWcmcyVEVxdnZt?=
 =?utf-8?B?YWJIdmtLK2Mvcm9MT0NNanNMaGNTK3FLL1JWT1ZGcGl0YXdBQ1drSUlTaG84?=
 =?utf-8?B?YzJON2Q5V2o3aVZLS3pJWldSZXp2aUpIZ2hIejN1UVJiWmVYd2lrWDNJdjUz?=
 =?utf-8?B?L3dDb2hkbmltOHl4c0tBeTdKRnFSdjQvQk5GYi9OMWQ1bVBYQitVbm4xdk5y?=
 =?utf-8?B?OTBhRk16MHZjdW1ZckVMT1VaVHQ0K3NCWGttRDh6QUhvejJRTndFWGpSTXlz?=
 =?utf-8?B?VmQ4MEQwTnI3SGN0bFcxRTd4RjdQYTYyYzN6eG1JRVl0S1ZxRm4yamZ0TGpO?=
 =?utf-8?B?VGxzcXZRbFFCRDh5NnBpb09kTW5BZUp2SzhDNGtkL2ZBN3l2VC9iL29tUURh?=
 =?utf-8?B?cmszR0FiZDBSbUJMVjRHbmlVMTNXRnV5YzhITWEwZGpnc0RsMkFwMS8zY0o3?=
 =?utf-8?B?NElMT05CYWJlNXFxVjd1UHNrcXJnNUcvMVJvZ2ZLZjJsQkVpcDJFajRZVjJE?=
 =?utf-8?B?NnhuQkZZay96Qys0Nm1BU3Z3VllwUGx6Z2RSaXJjdUpoSnVlcUtvdUVvKzNp?=
 =?utf-8?B?RWh0NWd1NCtWTk9YMGgrMWo1MVJWZXZCSlFXNnIxU2E5Y1FwdUdPZGJYMG54?=
 =?utf-8?B?U2l0ZVgzd3dTNGFlN2puYjhDNEg5Q1JVcENDMEppcmpXVzVmcDZBNWJjMHRQ?=
 =?utf-8?B?b0pnRktxemp5LzZyWHpuVkk1UlhhbG9WZDdYU2NxQ1psS0NsYXNUTk50d2hQ?=
 =?utf-8?B?Y2FJWkZOTGF3c0NWRitBSXU1Y3p1Y242K09IeWxHd3lJQ3J2TVBKRFNzM21F?=
 =?utf-8?B?V2FHcDRlWE9KRU9xMVhBc3ZwVldWMHF1V2VBTkRMM2dDZ1JEb3VGS2ozbEZl?=
 =?utf-8?B?NWFEVXhDdmEyUWhZNFkrdkkydmZyS0NzWnZxdUVzTWgrVVk0SDc5cFB3YTha?=
 =?utf-8?B?Q1BDU1VGQksrckwyYy8zeS92SHFXRXU2a0ZUSzZTZUZ5a2RWSnBjWmR6K25r?=
 =?utf-8?B?ZGRvblRQcWVkVXkwWUlzam9UMExDK09nYjU1akhwYVY0NXZvVnhKOVlDUTdI?=
 =?utf-8?B?WU1jOWszLzdGWEFseGVMM1hRcXQwRWRSYlJ3ZkFPcEhwV0FKKzRPT2YyODhU?=
 =?utf-8?B?RmwvU1FTbVN1QTFtS0hDcG1hTlFRK2pBUHMvYmovMmZnVVRVVGt5Y2FHRlRE?=
 =?utf-8?B?NlR5R2pOVlJoTHRkeTBCY2JXNThQTVdSZk9nVDAyWHJqdHlkNnBkaStBMG5w?=
 =?utf-8?B?OWphajdkSTB6dS9MMDVOYndNRzhFTFJITGFsdDZCcEdyT1g1Q041eFJPKzV0?=
 =?utf-8?B?QjFoOVI1ejhKN0F4bXhGREFBTEMxZ3RzbGo1MXR1aStTSVlrNWlycVY3eXFx?=
 =?utf-8?B?ZHZkLzJRbExqTm8vUGVWWEV0c1M5U0E0bEwwK2d6SlBVZDh0a3N3NGdMcERo?=
 =?utf-8?B?dXhBZEc5QkJKbE0veFFvM0ovNzllbXRsOGE1RjlicEM3VEU4cmNzZnl3NkFO?=
 =?utf-8?B?Qm1kYWJRRXh0bXZ5V01xSThaZWM5ejA3QXBTOStWaUNoZ2d3TlhOaWZiUWg3?=
 =?utf-8?B?NUIyU28wdlB5b1B5QW1ueE9LQzNmdlF5ZjJzMjNUejdmSnJiUTQ5L3lSUjdx?=
 =?utf-8?B?NCtJTVFxbGNERU9XeUVBZGhrcjYwL3JaUXpFWGpoTS9OWTd0eDNYRi8weGVh?=
 =?utf-8?B?UWl4US9iNS9tVGRRcGFpbGF6M0FwUit2QnpKeDZGNld1aDhzQStBbUNFekov?=
 =?utf-8?B?eE5lVEN0UWNVZTQ1ZUVNb0UydVNnMmx6NjdEejBQTjFyZWJTbmdvUHo3SHYx?=
 =?utf-8?B?RUNQcVlPbXcrTy81SVdXcXpXc0toclQ3a1M3aVF2N2lSYzlaVXc5QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9eccce-8a0c-4719-3516-08de6318b3f4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:38:08.4882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRCcX3a57pTSpQSeASnKqWYcUk69XXSOl+Sfa9x5XNYp+LurwKVEZej0QPeszxLeB9Mtid+85ePUmO8KELaENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12330
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
Subject: [Uboot-stm32] [PATCH RESEND 09/14] rockchip: evk_rk3308: Cleanup
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: D4724D87B9
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

There is no user of 'gd', so drop the usage of DECLARE_GLOBAL_DATA_PTR
and the including of 'asm/global_data.h'. Also include correct headers
to avoid build error.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 board/rockchip/evb_rk3308/evb_rk3308.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/rockchip/evb_rk3308/evb_rk3308.c b/board/rockchip/evb_rk3308/evb_rk3308.c
index c895da934a998b4f8a4a8b32fbc7336bd4c41604..75536fe117db3fe26abf5a60d2d68e72ee99dfde 100644
--- a/board/rockchip/evb_rk3308/evb_rk3308.c
+++ b/board/rockchip/evb_rk3308/evb_rk3308.c
@@ -4,9 +4,8 @@
  */
 
 #include <adc.h>
-#include <asm/global_data.h>
-
-DECLARE_GLOBAL_DATA_PTR;
+#include <stdio.h>
+#include <linux/kernel.h>
 
 #define KEY_DOWN_MIN_VAL        0
 #define KEY_DOWN_MAX_VAL        30

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
