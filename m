Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE9hJF3SgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:47:57 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7CD7F17
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:47:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 008F1C87EC6;
	Tue,  3 Feb 2026 10:47:57 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013051.outbound.protection.outlook.com
 [40.107.162.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E6BC0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4IfR1VyqYJkFrKmo/OEFtalfmgVWq5vJs0vPzXVtJd3cku08Ypf+HCnOAWMQlM6UrZH9bmz3BVdZKXwma44YYt7CB5bEbRAhqRTgF8l0CNP0aNYmxMZlyWpeOiTBL3VMDZgRMRChRXezV1lDjdJCToEBcsJDX163Efm3MbUn8ZjBfic/82AwXaYwIUWt4OZB7zynsV1zhD1ezxFyU9oPku4J9+m9f8HSDMf1oMoVMPcvuc+2t5fCYelIHMK7uw5fP40+ZOIznVoVZSDB6D5JJnIufVICgwq47F1HY1d5HIBtw+bWG5+iAYxCGDkokB9vPMgtRxVqzuq+1WLELQ8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlZ7txCufvgBDrNMB2IW01K9N8kpcuL+X1j2xht0yaA=;
 b=HBMjTRsIibp+HAjgOIaoIEeRcwypBCH/c6r0bw2I/0BUxuTzXjHDU9YmP0tRvejis9o6dK0rfnHvLX+VpbcYttEyjeyfPB7HmWyr8BS1XB/UN2RG9KWW/kn+djHVQFpPgeIYqseeyoM6RrSiIlxdd6StUv2hJgAWc0LHaiUL5fentsROYg9A37+wGLUa7Ps9njHioX/O0kT4XNAtiZfGC4zkOtcJs5z2nVGM56RAOVF944XVGNjNvpE6idzHZvzeJuVXkNRPmRHCo9JvUXiarzF3uUVRrmx07U6LlARP6pmihwJX2wIuBxu7UEomMwlOFCcz1+8z771Q5yoBUYs00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlZ7txCufvgBDrNMB2IW01K9N8kpcuL+X1j2xht0yaA=;
 b=R7649k+Yvto6nfzE5frOZymoBsPoegNf9Gz88cgG2L0CKoTDLhy4LJR0nkjqyPXiC2kmjSuIcRVtQ4JlILJyANAIh85IewT0u2LO7Qoik89lsPBs2GUhziOg602Tta+1sfV7/hZzSdBZQv9zoSS+h921DURjqh3XUkOFiHtPLOz0+FVTGLpVfqLWp2/Sj7GyiNyAEC3AY6LKJZgLUFNCBZjj2D9N4U44/0mhB5bCiuRepJ36ufb4cME/aT5SwUPi9E+W8G2z8JXTMHVSDgxEfMghrKmhuiwcZ0M9keplDT8w78Q0tBQ32yMqxIYOAt6q++BL8Y+S5yUFsJ3hh7jZvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11639.eurprd04.prod.outlook.com (2603:10a6:150:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:47:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:47:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:40 +0800
Message-Id: <20260203-cleanup-v1-9-4221c13e7558@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11639:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2244ec-641e-4816-53f5-08de6311aa88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVl0dHgwbGZPSGJhRGhWcTg3d3d2WDVoNHVjNjFPK1JEVzgvd0ZIOEJPWWp1?=
 =?utf-8?B?a21WSVJZblVMWEVBeEwwemxKaDRsQ3RwZGVSV0pXc09CUnBFbEZFa3pSaXZB?=
 =?utf-8?B?V1E1VGdvTFRjYlhmRkE5Z0RkNXVsRVhPSkxmTGtrb01GUWJlb0llT1NJcHFY?=
 =?utf-8?B?K3haK0lMOGsvOWNtMHdtL08yOFArWEFpMXNIT2IwZkp5V3BPcmFKY0RBaStO?=
 =?utf-8?B?MS9LbURyVWltazIzMU96OXZObTFOMXBZcVZ4elBmS2Y5Y1ZZRXRlVkF6ZXlH?=
 =?utf-8?B?cGpiNXlVSS9GVEsvUlNLbm5ueDZIRmtTdjFmTGVFakVvNFNxV2tvUUR5bXdQ?=
 =?utf-8?B?amNncTZWTXYwNVdUZFowK2RCYW1TS1NwOHlXbVZDZE9zbnhPaE9YSEM0WElp?=
 =?utf-8?B?KzQ3MEc3K2xWQk1KZEVlQVI5eEZQVmtmbEtaT2xxeU92MGwxZDJXZjlHNzVy?=
 =?utf-8?B?Y1FSaGYveDM2RkdZTWgybEhsM0hkS1NxaXk0aXVyanptYzFlRExJdkQxbEht?=
 =?utf-8?B?QzRRWStJL0l0dFhldk1JdEtXUGZseHkvYXg5dklPclVnK2Yvbm5kZmE1Y2V6?=
 =?utf-8?B?aGdDNUJONi9YN3lkNnNWaDNFRkhGeUk4a3dIVER5RGxVb1AwcWJwMUdrQitM?=
 =?utf-8?B?Tnpzd0gwcjRFY2VjcVMrUUdZdEdXNnlnWW9zVEhnS25BRVhsUHZleUl5azFX?=
 =?utf-8?B?b2JVcEhrR2pseHBTdkNQZFFCTjN2QjFGamJqK0RPa09BUWpKNTFSdytLNmw4?=
 =?utf-8?B?ZXdCbFZ5VTFCUEliYzV5YWdMbkROa21RcUdsaElodHhId1k4eEMxbFFuSGV0?=
 =?utf-8?B?MWtlUW9kM0dQK2ZwUFZjYVdNYW9qQjZtdDdybEo3c1lsemhUWGRmWGthaFc5?=
 =?utf-8?B?Y3BERDhkMzJVRWVEV0NvYUlkK3E1Y085TDVKR2tJbWhabFFrU1J4K0tNVWJO?=
 =?utf-8?B?UXpXSEp1Mk55Z1JkblJrWGxEZTF5ZmRFSGJITHAyUW9Eclc2SDVrMWpZVkVt?=
 =?utf-8?B?VEkvUW1Yb1hGa3FQVlhMUUtyL0pyellMQjk1aUo0dG85dGlKUWRhR1U0U01n?=
 =?utf-8?B?U1dlTnNuOTJVL3BMeVZLdTdaL3piK1V2OENqcUlKWjdjNlVzUXo2dDU3azd1?=
 =?utf-8?B?QzZPQXVzZnZjUHpaU04yOFRjbXR6cEFhd1prdkhoT2tQOXpCQndGYWQrUG0y?=
 =?utf-8?B?dmlqNU5Sd0xMdlYyUXVBMjVLd0VUTERVR2Y1SFBtSUdqcU5EdTg3QUoxaDBy?=
 =?utf-8?B?bHFsRFNvMUxncEIvbTdvT1NUSEFNcmJwaUx3WjMwMG42NTYybFBZOXBkczFF?=
 =?utf-8?B?T1JVaFNWTkFNVS9uNXl1REN3Tkh0ak5MMmV4bFZRaDVHL0pqenJSSHNsZkY3?=
 =?utf-8?B?dWFpTmNNM2ZkMVliNHAvUzhiN1JQck1tcmRVczZ5US9PU2ZycS9sNnA0MG1s?=
 =?utf-8?B?WlI1RVA0TGN1bEpET1MyekRtbjgxblM1Z0pnOHVsNHNob0h0Nmd2bXBzNVJ3?=
 =?utf-8?B?RDBjSGFBUXlTQXRmTGlqVFlBUmhDUkNkQVRsL1JJVjgxOXhXMFFJcTJUVGl3?=
 =?utf-8?B?akxaSWp4aGtyTXdCMERYVkg0cEZWNkdMYXF0ZXJMbm4rNHhwV3VLRWQzTUlw?=
 =?utf-8?B?WHBYLzNoOUxXaFZUMkJxNS9ZK2tVbWVmcHRzSHFZUGlrelBkSHYySi9HMzJk?=
 =?utf-8?B?QnVMcVFhZWNlUCtiV0pxQmZsRlBrODRHWTcvQUVxRk04SjlkSThETlJ6S2FS?=
 =?utf-8?B?UUNHZytaV0I3ZFliZmN5YUlveVNzNGpYcDdjYTBHc1lYV01JODk0bFlicTF1?=
 =?utf-8?B?TzZUZjIwMVFlY2kxTVUvdGhGZ3Jxbmt4a0JwVzZMZmR6RkRYdE80bkdFT0R1?=
 =?utf-8?B?WTZNUm1iRUFiWStYQWZWUzEyeEFNZjA2TFpCOGtUVmpHQm4wc3JYcGV1QlBo?=
 =?utf-8?B?OHVyOTVvdlBOQzAvbmgyODMwc0E0LzVqWFJvU3dyUDBvemxWQTByWUVwRU8w?=
 =?utf-8?B?U2ZrZzA5UGRhN3ZSeXMzQmlYYWJKZ0g5aFpFVmgrQVFMNC9WTDFidmNvQnBD?=
 =?utf-8?B?eXdDNFJTWlB6WmtaTk5nS0oyWWJRYk13dmwwRityK0hnM091NEU5Znd5TnYz?=
 =?utf-8?B?SmZkbnAxOGZVTU5ESmxFb0xuZmROdkIrN093RlhSRDJKc1hvMHFyck1jb2ZF?=
 =?utf-8?Q?g31tfcCblaTZJrrdv/qidvDkBcYqB3elzkF/+/aIdKZI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZ5N3JXazl2QWxwa2JUMkRROWNtTW4yRXRVUjRta0xEaU1JMVkreTdrRnlj?=
 =?utf-8?B?MlpXK2dYdkQxUVF1SWl5KzBkUUtVaGl5VTVQa2pJbHZUYzdSNmR5TzdmK3Uw?=
 =?utf-8?B?NE40Q2daeUIxandSeTNBV3ZjclZpd200NnViWlpndlQybk9UUjJEWk9DU2sr?=
 =?utf-8?B?NTJ6L1BOK3BpMWFEU2NrZUh3VHdWSkFUUmdnbzZQNXZyOS81RHdJUytGdHpT?=
 =?utf-8?B?ZHZ3d0tvRjhqUHNGc1hjY2RTUVBIa2NmKzM4ZnA1clZlNjdDWWtlblQ5aGht?=
 =?utf-8?B?bHJIWUlmeEFOZjBtQUl0Y3lNMVByVTdMK2FadmcyLzltS1R4eGxpWkFoYUdy?=
 =?utf-8?B?VFo3VXUxY1IyNEZla1dhREMwSEJZSEY5V3hKZC9qOWdLdEU4bHErdU5HdUEr?=
 =?utf-8?B?cHF3VDdOT1VaY2M4WkZRWGNSN2NuYTBzWUtzVHJvWndRZDdvZ3NvWHJ6YnhC?=
 =?utf-8?B?TmZ6dm00MTV4NTFoKzNNNWU2ZkxrQVJ3YXEyaFVoQlZZRkN1VTZQc0c3V25a?=
 =?utf-8?B?MGNlRDZvR2lDVkxEYlMwSVdhSk9HWk9tUG5IOWp1a0JzcXFBQytrZnFBQnE3?=
 =?utf-8?B?RlZHdm9uT0Z6TFg3Q1JVMC9DK1lFUXJoaGdSNnFlc2FGY0ErRFMycFU4TldZ?=
 =?utf-8?B?aWxzSCt2Zmw3TlhNWElFbHpVVjhrMm5RSERHUjZOZWZ6MzYzcWZnbGw0OTFs?=
 =?utf-8?B?ZUl1Z0s5RHlLQythMjNkeVVxeEJuWDZJK29kLzVvY21CNENYekNnbFpRNHFy?=
 =?utf-8?B?NVFNRGlKUHdTSyttSHBHaWdmZDRyd0JPK1F4QXJPN0lhTU40UitMZnFZV2ov?=
 =?utf-8?B?R0xZbndpK0I3Ym42K0lieTZOYzVvZmw2VjdWTjhiVzlPLys5TDF2Z0NNTlIx?=
 =?utf-8?B?N2c5R2MwUWx0b29GTTFCM2RTNVhoYlBDVmZOYmJDUUZQSjRPNWdrVGJnMUdK?=
 =?utf-8?B?T0RiWFFYcVpFaytOUWRhRHhxRDJBZXdTdUFwTFM5RjlCSmJNZk14U2cxdENB?=
 =?utf-8?B?M1hGWFJRT2xnZzgvN291dXU5WXZOZjFvYVVLS0h2V1ZtbjIvNXQvOUdPYURz?=
 =?utf-8?B?RTYrcGsvbjlIbnBIdFhZSXBNeUR2dmhKQWpLYS8wWmpGcFhSc09jaVBsa3c3?=
 =?utf-8?B?SGhuQmhyQlM0YUZQMCtqNWtGNUg0Ykg1ZXFEbmIzeXFSWUdrQ1c1ajFXOWVh?=
 =?utf-8?B?RytsMmxKQm56WE1EZ1BEakFYR1JTbTBGNTdLRUdxU2tZWFpZVFlib1Mvdk1T?=
 =?utf-8?B?OFZaWEUvRk9TRzhNcXBmWWY0VnRqSXcwOE1FU2I0V0xrRGJkTXlIeDlCV0s3?=
 =?utf-8?B?eis4NEZhRHduenpXeTdyaVpMMXNsUXd6eEVFdlExRHQyRGlXSFkveDNvaEVE?=
 =?utf-8?B?K3RoeXA0bGRZbTNML1JTS244K2tYRTUvaDFKaExTdDhQTjlweGgwa1AyUk4v?=
 =?utf-8?B?VjNZZ1VPdWJBcDV3RnBadDNUTVMvNUZaYnl0VnQvbU01ZzhjdWVueTRZUWhz?=
 =?utf-8?B?ckVFdlh5ZHFGcWZpaEM2c2hqVlU0blZZTHVlYWcvV3M1TS9Hci9XNWx0Wkh6?=
 =?utf-8?B?d0dKZkJMdTdhR3E0L0lCSC9UWmt1YWkrRnBRL1VsWTNuRDVlUHRyVGt1NXM2?=
 =?utf-8?B?TXlrRkFIbVcvS0hHc0FVcnVjTWxEcjJjY2oxeFQ3T2R6ajRuakJQdlJUUG1j?=
 =?utf-8?B?UmdmSDRrbmU1L1l1TmV3d1FGdmRoOE8ranRxNGM2b050TnBTRlc0bjg3VEEx?=
 =?utf-8?B?dWNRZ2dzb0dYKzE2cmxYWVhRcVlKaUlybW9DcXVoTUxuVTFsS3d0djBCYkIr?=
 =?utf-8?B?eWNuTUJJUmpCOEQ0N0tLcDA1ZHo5MTJEaTNRQlR0Q3lHSXBnNnhGOWdSNHU4?=
 =?utf-8?B?M20vUTllWEpJMGh3VUV2eW5HQVpmVlkxdGhnWWp6L2hWNVhySlllSmZrbjhD?=
 =?utf-8?B?NDZaRnE2STJrSGVpeGhrSzlrU0VNSjFuck9zSTIrSWhFTG5RMkYrNzhXeEJI?=
 =?utf-8?B?dlVDVjZwQ2EvT3V2UnJzb3N0T3Jvc3NWMks4RlJKUVhtWEg0TFlsU1lqOWpK?=
 =?utf-8?B?VXZ1ejRJV2pxQjgyV1RFY0hiaEVzQXdlM081N2V2djdXTEQ5bXFnWGpmMzVu?=
 =?utf-8?B?S1FSazFIcTZGL0NrMVlyUEhCMFhFT3ZwRC85eXJrenBNQ1pjUFhiQ1hSTEU5?=
 =?utf-8?B?MnhpLzBWTjZXaHh6NFM0NDhRV09xbGN3VXpKZmNMa2xMUVdzTytMRnR3Rzdm?=
 =?utf-8?B?ZUcrUUYzZWxDbm1FS01YUVlmRDY5RmFyd3JDYVo0bXVVdVVoWFBWaXAyb2Mr?=
 =?utf-8?B?TTVpNkdRaW4wQnJNL2RTbzJoYzVyMkJWQlhLQVFENXd6Rk5jaUdtZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2244ec-641e-4816-53f5-08de6311aa88
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:47:46.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mvY0vazLJiXZQ0ZNHG8Aq8qzZhf3BzxAp8dLZgaPEcd6BEPkBI1mSmcWwRxEJY2gQHCD9kHOWTnJUaO7l2YdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11639
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
Subject: [Uboot-stm32] [PATCH 09/14] rockchip: evk_rk3308: Cleanup headers
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmai
 l.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@for
 issier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3AC7CD7F17
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
