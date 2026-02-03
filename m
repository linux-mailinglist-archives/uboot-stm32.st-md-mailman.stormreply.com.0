Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPQGK4jSgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:48:40 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A96D7F1F
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:48:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8D7C87EC6;
	Tue,  3 Feb 2026 10:48:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD135C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPGw95FuyIxH1mfyHFm16dAEcEJnIqmUZzufXEggv50ukl8PnH2RP4t8Txnh6X/D2QjWHMAN72INu6AU/5T8PuwrpDDpqjNadHTxNYXva0BzcySycShSBkts2D6QRb0xvuuS44+HvIwEEkF6vpFvCYPj+Cred9Xd3VRgUbt0BpCTbiDx4tC7HEe8+0VPl4DsxQBGlMXpgp+6SxEHsb44LsrWVeEMvizPr6hbcLQaVLPBX1WsAgTV/foAcxpQQlM94Pbd8BnynfOdOOFx816uF7H1WGS1iuBNftUV6mJ+LccvKUGsXUvWIQANqR3DqYe7euwMkgnQjG0HL+dT4887Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSABK4mrFlRETHt7Ep9E6IaJWCfL36Ko+hKrDtSdzMg=;
 b=JFwzKiaZ/ObRqAMOCxj+r8319pl0BiYcFm43u1jwbWkEUCMHmAEzNfZF5r1ybSQXLpD1Z2Q6ZkWSiqxGeeFXSit5b0CyJ7SDSqnYFbz5T+tJXY/1Ip1Zaqxy4WDa+zA1B1Etn2CpxgJgo5BFs8r9VaRp1BWTwURyFTUGGr+Nqxh26TMYpvBRuaAr1U3IGc3oY8SDHlQxioWhQNS84pY7f8Y4SHBBuPDTzAZGQNnPSA7DXE0i+4dj+v+1Ch2iLziDdgqzGlgOjL5fBiEiGU1uo0ZHwut7ljO6TXjFAlv9+4Ssoq3N0ZTvCpFL8QGgtrwt27EG90rZyrT3hUtAgq751Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSABK4mrFlRETHt7Ep9E6IaJWCfL36Ko+hKrDtSdzMg=;
 b=c4lDrC53ZvjeoQ1OsghhbR+jz0l3xoo+ZyHep/bTPZU+zrNxkqJx1Dh77YiqDPlIeFoMUN0BDezRkPo2JOuKB5wZ+QshaW+Yazgh0GY1CN6yqv/evXiY1wcGXNYJyYBIzL7JnNbHT6mhiTK6l8xvvUDBu3D0JbcZmn/LZr2eyMcUL/pyWTOYlptMNmsJ6ocV3mItG/hi3D+taGH24USJpt0RgVZPZbP90PVkLY5udy4H23vsfc348eA7YgMoatDeQ1Nq0pLEh5Pej8prB1VkVveF4/9Dyv+vnaCZvEApyh81hxILodW02UWSZRqoe5OEd6BtPRVnVYJUPif43Bfmpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6908.eurprd04.prod.outlook.com (2603:10a6:10:116::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:48:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:48:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:41 +0800
Message-Id: <20260203-cleanup-v1-10-4221c13e7558@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 82437bd3-176a-4fb6-e087-08de6311c66b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NThSMDgrTVlCbXFINElPVUl4aXh0eWJ3bUUvY1g5bVh4cGw2MHF3OGVFZDJ6?=
 =?utf-8?B?M1hGTk9NQUJmMHgxVEJScTRYcktCelZtaGVhL0xJOElKR0dyeXl6bzAwK2JN?=
 =?utf-8?B?VXJFZElNeGErMGRyTGk5ZFlaemd2SC9zOUxKNWNPb1RQYlZyZ29zUko3V1oz?=
 =?utf-8?B?d0Joem9kcG5xYW1qZVpQdWRaaVBMUFdsU2R2TlFDM3ZXYlVpYlQxU1BOQkhm?=
 =?utf-8?B?ZHBnRmFQREd3TDAvYW1MQm5zUmJLenc2NVZUNXgxSTdockduTFFjcFUycUUz?=
 =?utf-8?B?VTVUcG9FaVZUT2s0cWU3Mm5WUmNvU014ZnNkaVdJcjRXNWVVY1ltTVBpWlc5?=
 =?utf-8?B?dzk4cDcva21iMnB6ZzFIdGdkTDQ2dzlYZmhDMWNEQmE1cXQ5WGtNWWRuaHRX?=
 =?utf-8?B?ZFRYa21XMmIwbnR4TVJIbGZOeEZKWXErNkNpU3VUSjhCQkpDN1dUNTRCbTRZ?=
 =?utf-8?B?WUNnTjNoZWJqVXZWQmxxR0pLZ3FUaGo1T1FPR0E4clg4ZkhDeHlwVi9HSTFG?=
 =?utf-8?B?RER4d2RFcEtPdlUyS0ViR0tGNnRENmlJenZGYjhOUEozMVZFNGlVMlhxUHo4?=
 =?utf-8?B?dGgybVRCZDlkUXFkK3MrWFlTMFFtdXB2TlNSUElTaTc1dE0xZG1Jc0pEQUdj?=
 =?utf-8?B?K2FYRXB2ZnQ2ZHVNektGRE1CdUVRUndXNnFoaGozRUVlbFExd2k5YVFGU29u?=
 =?utf-8?B?SHhjNmdaWWZta1Eyay9wK3hNUW9hRFNpRy9ST3FpZVhTMFIyeHFNQ1ZyRTJR?=
 =?utf-8?B?YXVvRERrT1J2djVuTTR3ZXp5MklvZGdHNCt2OXIzek1Qam5pdE9udmh2OTFr?=
 =?utf-8?B?ZW5KZ0tQTWw4bHFUK0pqVUFTNExDV29ZSkVySWNGa1cxM2xaMS9CR3dmRkd4?=
 =?utf-8?B?TUJ2VkwvcktGcDIxT3IzakhCc2lhRkJhM1U5U20rdWlLVWlFaUhnVXRBcGRX?=
 =?utf-8?B?YThHODBrN0gwUlowTWJnY2tDOERKSisrNTJmbCtnR1RkRU1KeithdDY5V1N0?=
 =?utf-8?B?VndMbU9VNlptU0VETk5hK00xMzFqc2N0K0NLM08yYm1mcDVocWdaQ2xNSEsx?=
 =?utf-8?B?M1cxaEJKOXdldHNxZUphdmpMVENqVTFwamw5czgrU1VjNzU1SS9rNlVaK1VG?=
 =?utf-8?B?bUtXaGQ0ZkVHQ3U0dmgyT2JRWXhNWTJiUCs1L1JMMUM0c2V6eVN4MWUyMk4x?=
 =?utf-8?B?aXhLTnM4cmJIUmtEYWswZzhnVTFwZmMrZzMxb3BJTUp6WHBXdk9kYnhSY0c4?=
 =?utf-8?B?eUdvYU93Y1VNT2RjNUYzRXgxNG5HVm16aXhuQW5XUG9ERnZKMVZhUzQ4aTVk?=
 =?utf-8?B?QnFwSEcwSVNiQldEM3crbWJWVGxsd2hCRnF5aWJMUXJJQ25zTStZMGh6L2l0?=
 =?utf-8?B?STVmQTRWTXlpTEdnVHhKTm9DanpaR0RoSTBlUzBtWFNaWG5XNGxiRWMxaXlx?=
 =?utf-8?B?NkVkTUtrVStCZEVVQWdRaE10VURFdGMzVFdJN0hJbzY3Y0hpclBnSzB3Rm8r?=
 =?utf-8?B?RnFxWjFBRU1mYWsycW9TTmRkaDBKUzRNdWRHK2pGRVUwTVN1bFFKdXVQSTVt?=
 =?utf-8?B?bDVSRVdUUXl5TjZHVnREWHltenlPVy9JY3lIeG5EYVpSaDYrdkZKUjMzYm9R?=
 =?utf-8?B?SStGNStkQU8wdDQ3aUdZdEh6MCtJMVU1OHNhdE9YbWdOUENOUTFJRFFHUGxz?=
 =?utf-8?B?N1JySjdiVStlbU1uUDVJLzM4NDJGTzk3RFBIb0JXVCt1djZkbytIQlV1QTd6?=
 =?utf-8?B?WU1JZDV2Qkh2N0xzUlN1aTF6N3JDbzlqVGFOU1hyUFhKZ1MzS2ZITURnZXNr?=
 =?utf-8?B?YmNGRGVmRjRYb2p3K2trVXp6dW1DQVRnWGwrTmpuRkprRkw3YURuV0tYOGs4?=
 =?utf-8?B?OXlSMStISXlKM0VLYlZPNURFR2hpbmd0R0JBNklhS1laanVBL0ZZY1BwNGVW?=
 =?utf-8?B?YTRTWDFuNnRSWXlVRmVlSHYvak5zOUpZVWZwZXc1UUJnTXdSQUNESzFKS0Ft?=
 =?utf-8?B?S09EbFZWZnZsSjdGcXYzNzBueGltMmU2MHVlMk9NMlo2bUtWYVd6M3Y5aDVD?=
 =?utf-8?B?b05XR3h3WHZ4V2RkeXk5UVIvb3h2ME5naWFzWldTK0wwdWVvQ1FaekZxTzJD?=
 =?utf-8?B?d1FKempkUHFtSFlJaVRRRExIUVhpWEFicldaTkRYT0pMUUhnVEhTeGo0MnFP?=
 =?utf-8?Q?ADzYN6YBR1jK1BzFwaWXdQ9XYQMCR3pQ2SJCujRTI93c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZkMDlVdjNacmNSMEhZVWV2MVk5bTgrbWhiWXBBN0JsemE4aEQvK3Exd2p4?=
 =?utf-8?B?UTJHa0FZSGdSOXAwU2dQWThMOFdRMVdLY1JEWkVkYTNNZDVYa2FscFFnMVRZ?=
 =?utf-8?B?SmlWVitLUGlNR3NRQW9STGRPdnlKeCtaNnN3SlVsOVFEZEEwT245UVNWTGJx?=
 =?utf-8?B?cUxQSzhSelB2Mk5EVksycHVraC9lOHJvMTl6OUVuL0VhVllweExyd1RJZVlI?=
 =?utf-8?B?Q1l4K1pBeUtLOXk4b3RyaWdTM1pLb2xJVVFRdGVkTXhldG14bUpSeDBCbUpU?=
 =?utf-8?B?YWlpNmFiWkFZUHNzaldESjliZFo1RXV4emNuM0VmMi9kYy9pYkEvaEtWL0xw?=
 =?utf-8?B?Nk1jcVZlcVZhMktONXpFa3owL0hkQTFPSkx0alg2SHVyYUdtNnRsWUVDSWdT?=
 =?utf-8?B?U2VlR0xhQXg3RnhEelZ2TmNCK2h3Y0lXWlcxNTJKYkZGYlA0bjM5V09MQm83?=
 =?utf-8?B?WmUvSjA0aEpCeGF1ZEQxYm56MVVramtTNFRpdG44WUZBZFQvallOdTdHYTdj?=
 =?utf-8?B?RU9wVkZicFo4Wlo2OUdLODNyL0hHVW5mcTBWM2F0NlRRbHpDVGh0dDJwUElo?=
 =?utf-8?B?SFFlVnZKNk1WODRhLzdEUzhlVSt0OTVNZDZ6VGo2Z1JjaG5VSUFyd0xhanRV?=
 =?utf-8?B?MzU1NkdEcDNlMXYrVEd1a2NaY0VxcDhBNFNPZ2liTjNTRzNVNEFRT3BLQ2NS?=
 =?utf-8?B?ZTgzeEJxNG85QUpSbEVzdmY4TlM4K2ZZT0k0cjFDV3I3WUZMaXZsYitUQm5C?=
 =?utf-8?B?SXpGODNMeUFrQXBRbS9oMmVyYlh5b1J1bGtnQzVueHBnZ2lIU0hCaFNiZmVP?=
 =?utf-8?B?SG9mVHVWeWNUYWphYmltTkw4VFhNaFc4azRId2Z1QzBTV0YzWEFVTnBjTXlH?=
 =?utf-8?B?QzdycVI4eStoaW50NktMZitQL0dJa0w5RVQyUkRnTHNqb1I0U0pwaHEwejFN?=
 =?utf-8?B?cU5rY2FvWDZpOGttdFUyb0NDN3V0RUdUS1BQT2RaN29laWI2UlpCclhBRE9B?=
 =?utf-8?B?cUQvd0N4ZGhXYW5qaEo1ZmgvWXpFdEo3djdyckdab3pkZmM3Y2VYSjdLdDBv?=
 =?utf-8?B?NWlsZGdSTitzZS9Ed3JSYnZoQzluNkpIVFN1N1JqSlVJc3ZqSHJReGNpaEN2?=
 =?utf-8?B?anhOQ1Aza2pyMHlyMHNncEtOZm9yUlJHNXk2cjNza08zYTI1RWhyaHJ3TzNJ?=
 =?utf-8?B?alRKOURPUE5CQkdpSTFFTGl4ZG52TU8zaVp1ODQzZCtNR1lYZnBsR3BsYnBi?=
 =?utf-8?B?Ni9kL0xsOFRBeThXbnRkSVBacUY5djlRamRIK3NUMGdhWm43MGpSQy9tOWRX?=
 =?utf-8?B?TXVwTXgyUUVWRVBqN0RHZlRRenRCM0JMTFhoTnZEdHgwRDNLaFpxNlliYjA1?=
 =?utf-8?B?UlhkNHRIdSsvM0lOeEhBMWdQR2JXRlBmdi9wWWdPeW9oeUVNOEtRM2Y0NzJR?=
 =?utf-8?B?RmEwR0pGK08xWThrQ041ZnlmcnJ0S0t2MWcvNVpNRklaNDhMZC9GcGNaOTNI?=
 =?utf-8?B?Y0NVTUFySGkvakN2SVFtS1RERG5aK25qR3Nxbm0xeld1VDlrNnk1VUNMdEJE?=
 =?utf-8?B?SVJlYWNRTWhRa2IzUU1NWU9kZXpQWHZmZVJ2K0ZVTUJxQmJyTnJFbGZ4MjF5?=
 =?utf-8?B?VG1UK1ZoRkF0eDZMb3J3aGdPYkVCckpZeWF3OXZ0a29UNSs4K0dpTkJHYmFL?=
 =?utf-8?B?RlpyNWVXR09pbXNpR1F3cmszZWU2cStrZi9yWWozTmJBc3NqZVI0MlUzVFd2?=
 =?utf-8?B?SUlhbmJaYm1ONW1ncHBDQmpBK3I3WEtHRlB3VXFqMjVvRWVqTSs2OWpHcEhG?=
 =?utf-8?B?aU0vNG5wNzY1VFlRNkNIbUUzdUFEcWplWUZ4L2U5V0xYZE1JL1o0RGh2OVhw?=
 =?utf-8?B?emdLVHR0dE9XZEd4RlhITEt0REVvYmZWM2VsbzBOVTN0Z01XQVIzZ0FQcld5?=
 =?utf-8?B?S1RzQTNMUkhjcjBUYnFTRzBtUk1BSVJrYncyenJCd0hsN3hXQ0FvSGZSYkI5?=
 =?utf-8?B?ZXlWb2tERkx2dDJWNXNSTERoOFhjcjF4NzYzUVZIYXZBMEd4NnJkYVJNNzdI?=
 =?utf-8?B?MWRQS1JTSjgyU0M4MkREaFBjdlg3a3JHWHVDd2trWGlaaWk5Q0dmR1A0UklM?=
 =?utf-8?B?VWNsMUF5cElvdFh5cWRXeGErcERobUwrZVhZU3dXU0NlNVlrNXo2WWdHS1V0?=
 =?utf-8?B?YkZpSElxeXZPaGIvYm5CQzdNaDh0TGRaREtTRmRXMWxrYzZsaG1sUVRhbGVa?=
 =?utf-8?B?SUdKbHN4bk5BbFNlTDl2NkpFWm9Qb0pmb0loTnZRQWtXU3JCYVFOSmQzcFJy?=
 =?utf-8?B?bE8ybGx2Y0tRWVh5WHdDdXNFSEtMVWFGTy9ZNlNPTHp0eEFLYU1sQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82437bd3-176a-4fb6-e087-08de6311c66b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:48:33.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9hm24FUfKXtJ9dTdIhjAmG5QqRgfqby69jNUgELyRXyUyhtXOk8utnWTq3V0IY0u+EsAA5ToMlyt9g6XQu5TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6908
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
Subject: [Uboot-stm32] [PATCH 10/14] nxp: emc2305: Cleanup headers
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 59A96D7F1F
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

There is no user of gd, drop the usage of DECLARE_GLOBAL_DATA_PTR and
the including of "asm/global_data.h". Include config.h to avoid
build error.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 board/nxp/common/emc2305.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/board/nxp/common/emc2305.c b/board/nxp/common/emc2305.c
index 50252bb5007f667bd53115922b9c8d06e76f7f61..7e5151eaf5f9f31cb0eba3f85115c0dec46f096f 100644
--- a/board/nxp/common/emc2305.c
+++ b/board/nxp/common/emc2305.c
@@ -4,15 +4,13 @@
  *
  */
 
+#include <config.h>
 #include <command.h>
 #include <i2c.h>
-#include <asm/global_data.h>
 #include <asm/io.h>
 
 #include "emc2305.h"
 
-DECLARE_GLOBAL_DATA_PTR;
-
 void set_fan_speed(u8 data, int chip_addr)
 {
 	u8 index;

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
