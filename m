Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAP9MTrSgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:47:22 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FCD7EE5
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:47:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4D33C87EC6;
	Tue,  3 Feb 2026 10:41:09 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3E01C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO3LP8tVW/zbTO1ODsQT5Z5gdcgdzFm165k4nJpQilCH4VlhxHYQ7DuhMeBZ6nuDOO/nl8exeJnfoB5wa3qQ1cBKj6KyRdAC2aTeDZnYCtgLk1dZEN0tDS1cm3+zDHIoJso+oHAymfrbA/ZoitETe9kL7E2j1mYW/4GR2KJ8Ra2FsVQUrn2HeaGdpZmdKUi1tQc9cbrAGjgQ5j3dIyijPFioQDh020ndnY3zgs+8hn99CggyFKSD6DGSyAwzmGNn132+TpyHVZkdvu0MtnUCuFbgMtL/+gj0Qr3vxbrQ+cWj8ieQczaNfwlvWYVOW+iR1F3iGiUyErX4uTIGwo6mNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWn1Sb4Qk23EPNx9ZDbTWRmQJJYk/Z/qrvh9epoBqwk=;
 b=eJOghiTKS97wCe6jfG2X04lbLssvenemVLDYCewyWQVz2nfHLGxIcccx63TJJkJd0cOFKSIaOfq72HlV1V+KYa5e91DwRZ6hp6tIOVfbqMBfkzt13oIQCjzwHbJtUmgPJ9kfxJUarVDzlNLHWrHOObsLC3bLb0DrNJoTpO95xIUpBxCLUwLS4HvnCGCzJHFFW1K/gOfoOMt+1MEmzfrsCu+4s6cTVk4S897dvz111HyOLYl3KynXAmU38gAU4Dz9+WtRbD9+8AvBxST0cEgr2E+KGqu7K+ZfDN6gJZafxIcT19/2KAfhqC2KacREFXOoHIKDincwPgRiyB1/nlJSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWn1Sb4Qk23EPNx9ZDbTWRmQJJYk/Z/qrvh9epoBqwk=;
 b=Brrn61dm/rKxzEHdnMvyvtOHubitum3rttPepYVdbku8sTLJSorletr4wwqzP1d2Qr6+VzrBPQ83Xjxl/dohZUzvqqcHBjTZ+C5nb5fcYSdsbPJ4Y3Or4W0OivbXwlLlDPtbZI5k3ZFhBXnps/sBU1utY63IHFlpu7Km49lINvEshcU00vgIqOgXcp5ncd44+a2xXz2q1WSCLiQYwYZjzwYGTd1X037UpA/gHEFByTBkSq4wu74Z79pAnKrj5lWNetxgn2ujLp2QGOhbkbjq+QV7Y4YUIxWMDXkZ4D2fcleRflGTEjFYihjwqauoojZYKCjG4jBwvmull/PsKklFnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:40:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:40:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:31 +0800
Message-Id: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
X-B4-Tracking: v=1; b=H4sIANzQgWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIKGbnJOamFdaoGtqZpBsaWCQZp6UbKwEVF1QlJqWWQE2KTq2thYAmV9
 mXlkAAAA=
X-Change-ID: 20260202-cleanup-560c900f7bc3
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 66db614b-585f-4c25-e63b-08de6310b79a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUpVL2VjSjkvM0dFWVhQUHNEdHRQTFJhTXhBcWZnMHlKYndkRkZqNlRocXZq?=
 =?utf-8?B?QVhHMzN6cDk3NVJTY09WaWp3V0VEYSsrbGNQem50Sm5GVklHVlFoRTJXbmhw?=
 =?utf-8?B?eHBpVFpFZ1NyNzdUdHQrM2I2NnJiY2ZoTVNMbHZMRUhLNWxWUTVVejByOFNi?=
 =?utf-8?B?alg1TUpZQWpYbGpDQ1JPTDdGR1lUMW5kY0RrSGJ6cUFSNStJV2pNUnREWnhW?=
 =?utf-8?B?MjV2T0tyUTR3ZHk5WlRyTmpZV285bUY4K0Z0Yi9YaWwwSTBkUlVuZHJHTmFi?=
 =?utf-8?B?bHBIL1NxYlp1QWp2Yy9aOVNtM05WOXBjQW9sUHNqNlhkMk9DN0kvbnBwTDh5?=
 =?utf-8?B?YktQcWpvUVdJOGdlNXZodHRhd3ZqY00waml6a0w2a2VKTjR5N3I0UUExQ1pB?=
 =?utf-8?B?YVdwTjA0aUw4OXhkd3J6WlQ3ZXhqa0hoYzExMVhiN1hvZEttdHdjalBZMmVK?=
 =?utf-8?B?bHdWTzZiWUVKOEFZa29QS2YxTytiUXc5aWNwRFVKYnBNUTRlUURPbGxVQ2cr?=
 =?utf-8?B?c2s5VEVOSEhtVVVoSWsxMm91dGo3aEx1NjhySXNOSkN0Y2kxdE1GNzlMRm1r?=
 =?utf-8?B?YUVHaUp0Z2V2VythMVFvTEpDaEZkdFBFY2V6NmRXbkRCYTlqSU9oVzVFOGFF?=
 =?utf-8?B?c3JoV0NNT2xUeUZtVjlYdFBGaVZZbk5nbjYrZGFobFlRekErUytDOWNXOXJv?=
 =?utf-8?B?amhHSHh4ZDlPSks5TWQ5N3dkOTBvKzQvZldsd3BQak5TdU5VMnRuRGxyeG1E?=
 =?utf-8?B?YnVTd2ZSb21mK3U2Lzc2ZHkrWDMyejR0VnpQd2ZVb3BUMnlwY096Rm5LbHNo?=
 =?utf-8?B?WXFOb0IvNWhtWC94VXhqaThWTFFSRk16WUJ1YUlueTJYc0dsb0s4M0N6VEZw?=
 =?utf-8?B?RVNxYjJkTFVoQkh2M3k5ckQ5bU4wN2pTR0tzYXV6V1lnd3ZzT3VUQmlaOXk1?=
 =?utf-8?B?TGRCT0prZ3RoVXJPSkE1R1FIOVlGQ25QdjhQOGpLUDNRT0ZJQmI2UnBLRWl1?=
 =?utf-8?B?Wnc4S1AyQlFXZ3pPQjI0bjNLZ242dHZlMCtUYVI4TElEbktDdTVTS2pVREUr?=
 =?utf-8?B?cGszV2V1akdWNHBWdWtGQmVvUmIwRExkMis3UFRRTm8rV0xaa2RjTlBxNTBF?=
 =?utf-8?B?RVV6SFJwM1VIekZZMW11UUt5ZC85ZkNHUk9ZdXBKYUVGaWhYSFJ5N0o4aDNj?=
 =?utf-8?B?eHZsSGhYVlhJNlVnczllOFRwRVF5NWxKYmJjQ0xweUdYeUc0OHlUTjV6NWIy?=
 =?utf-8?B?M1g2YU43RGx4NnRnSHkxS0xacTR0T2R1RWtZR1BwWkh5Z2tQTXE4ZERwYlBH?=
 =?utf-8?B?d09pOXMxYVFVUzJZNUpJMG1QeldXa3dUanh3TG1XdUdjZGRTUjFHZE9TbGlT?=
 =?utf-8?B?LzFwZmpmYWxhbjdXRDR0OFBreHp3blEzQUVRQkNOcFRPRWtBeWJaR2YxWDEx?=
 =?utf-8?B?QnVlSXZKOGw4bXJxWnpCRVJmQ1dFZm5VYVJEVmdaL3BYbitjR0JYcXlieE0z?=
 =?utf-8?B?VWdDQ0RHWi94ejRLZTd2N2N4RTd1aTFobCtPNkp4eEM1Y0RmQXNVMStYMVZX?=
 =?utf-8?B?SHo5Uk11U3NyN2MrR1NVWWV6Z1BOS1lDS1ljUlJnWExiNHE0OHNING1LNFNM?=
 =?utf-8?B?L3RHZ2gyN0c3RlNKSlNHVzdCWGMxZkY3eTMwcThXMlB2SFVnU1F3RkdPZTd1?=
 =?utf-8?B?Z1h0cWljY2s1UjBvNXp0TlhvUlRWd2I2cVUyUFZsWHVmbXVGOWRwRmFqbXVU?=
 =?utf-8?B?alAxU2xoSjV3OVRBYngvOWxqKzNISDlrcXRRNnAzTnFDdTVkWUdEWjVMb2xh?=
 =?utf-8?B?NytWUjc3R0I0a0J0RVJpUzlBOFZPTmJMNGZuQzZIV0JwYlp3eEV5Q3o4d3dH?=
 =?utf-8?B?YTVDNldOM3M2cHcwZXNnWjdsTkRPY2JlOTl0dzU0a1QwVCtLSDZBU1ZwUm8w?=
 =?utf-8?B?MThTTVo5YmdiQkpGT1p1SExXTmRSOUdWSUdlU1FvQ2dnRjZtRzhqWFo1c2xL?=
 =?utf-8?B?SVFacWpPMndFbXBJbmtZdi9wNGZiWFpGbXQybVNScURtQWNVRktmdjNLQTQy?=
 =?utf-8?B?N1V2WVczVG14NFRYTUlpWnkrR1ZyVHpmejYyaGhFUWhDazQ0Y1NQN0dCY2Fk?=
 =?utf-8?B?VkVuNUdsT2Mya2NGVHJWc3RoVDhocENKQ1J1VVVzczZjdWhLZkpsU3N1SE9v?=
 =?utf-8?B?SXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnAwTEZjNVBCT2Z1U3BZVGl5cjlubVBYZ3NlU09SbVdwYklBRzJ6TlJrUmNp?=
 =?utf-8?B?ZWRzRXBWSzFudm5NZ1dPY1BXV2pYOGx6UVVqNmllclAyU0J4aks2YVc0NzM4?=
 =?utf-8?B?VTEzcHVoMWZKaFJRSTNnSldjKzA2RGpOQXRRRk56ckw1cEJoQ0Y3eUIyRThV?=
 =?utf-8?B?bzRKMDFUWUdncVdVL0k5a1JpVFRWUmNsbVVXR09PTU5HMFJYdmF2VTJScXFo?=
 =?utf-8?B?ZmlmcnFibUJ0dHBTRWIrZXg5RzdWaHpCYVlaQ3FwZzVCeWNna2tzRW5VeU5S?=
 =?utf-8?B?R0NpcENDaTFSN2s0bGRuK25kYWpVeHE5QUF3UTBmTkVzTXVUS3Q4cU0wT1Qw?=
 =?utf-8?B?Q0llV2dNYVlZSDdUSUlWU1d3aG03cXp2QTVtOW11dmJwTzltdTZpcUhFRVJ4?=
 =?utf-8?B?UEd1bVp5MUVsVjRWZkZiNHRlOXVZazVEbGYrU0JLY1N2cFpucktQV3JjYzRt?=
 =?utf-8?B?Nm9nelZTQlY0cmpPRHluaGtiTis1NzNQZG0weEo4SUtOeGFpcXJ5WDg2Mjhp?=
 =?utf-8?B?cmxNVm14ZUdnRC9MdklBZ25BZDVjZVNFaG4xeWYrSmloL05tQlJrMTVkUzRz?=
 =?utf-8?B?bTlDNmdwd2k4K0gzYzlVQVhyQXIzMGFQMFFSTUdsZzlGNXA3Z0FibVlFMnV4?=
 =?utf-8?B?NnN5bkY3Yjh6SG5rUmMwOFpBRmJtY05va3ZtbGxpT1hBV1lwVHNHSGZYNyt6?=
 =?utf-8?B?VVFQMnUrb2xnSmpNYmkvVSt2TEh1TWxxV1MxaG1OZWpqTzNsUjBSdWNXMUNF?=
 =?utf-8?B?ZUFiNE1nMFVCU3dNaG02Ky84T3Z4dlpVLzhRTlQxcXlyUFpFM2dPVjlEREdQ?=
 =?utf-8?B?Z1hjaThtc25NUWpjVFlGSWE4dDFaeUtUc1lHRnh6NWlKem5pY1FCamh6aVBh?=
 =?utf-8?B?T1NRRzZ2UXFpWkR3L01OZVdXTFJrazIwQ1dUOTZ3Z0dIZlRCSUMyWS9pUGlO?=
 =?utf-8?B?UVlTL1JRbDBSQ2hiay9iVW9BNlRZemluVGRQak9mY1VXb2pUVEZNZUl2SC9Z?=
 =?utf-8?B?SEZrUmJncWFqNEdxTzNEcXZZZWlsUy9wVHliNTFKZ1VZemNRZGhuaElPL1dv?=
 =?utf-8?B?RHF5UHBlbEttUUMyZHBYcys2bllGU0ZyUDRkNUIrSzQ0OGdzUVNGZHVYUE5G?=
 =?utf-8?B?VEFIWCswY2JaTXlXUk82OVVlZHdlV0dTZThFNDNsNWkwbzcrWjgwSGthczdz?=
 =?utf-8?B?K1BSRmhYcmpKZ3kyVy80b3BqeEVqRjVzc0ZFNGdKaGJhREFCZEs3bi9yZ0ky?=
 =?utf-8?B?Z2xnM1FXalBPb1VZTWJVanB4NEFuWFgvZkwrU1BVdENicENjUzI1U21aN0FO?=
 =?utf-8?B?VEFDOEUxZUthVkhzbFdpZnRXcnlYM3hhMHhsRkt2amxGTGdCR1llUFFyY0w3?=
 =?utf-8?B?TWxWaXRHeXB0ZnFQK2MrOHNxZVBGeGIyZGJ3cE05elhRM2QwVThaVEZSdmR1?=
 =?utf-8?B?Z3M4QnRMY2Y2S0dFNmFzZHF6Vk8vVGo5d0o4a1BKNE5FNURhb0JZZ3lFOFFH?=
 =?utf-8?B?UHJiTVF6MkxLRnZSVmhhTm1VQ0E5TEl6OVhyMkZaaWJ0NlVSRks0djNZVENz?=
 =?utf-8?B?dkVxU25XV1NXbDJ5MVovSzdjcTJFbFNYdm1CSkdDYXpKc09aRmlEK0NqMlRr?=
 =?utf-8?B?clprNzEwUDJXTFA2MytqU2tKSm45dVlmVitrMTlwTlcxdTdiN3ZrWHZwdW95?=
 =?utf-8?B?N25WUTlmTVkvTVRTbUZBKy8rd0NsRDBGeVhNMXpWWFVSK0c2ZWVHcmVkeDcw?=
 =?utf-8?B?ZjFsSlNMeEF2QXlwM1ZHV0x3U3FEQnJlMit3RlhRVW05V2hKTjc4czN1SWJ4?=
 =?utf-8?B?L29mSTZkMExCM21iQjgzNXIvNVdnRHM2Q1RmK1FhdnZFV2RZSDRuLzY4OFkv?=
 =?utf-8?B?ZUpheU5rZi9uYXptalJDaHRkNktvWkx6eUdXMzZYMnV6QVV4SjEzNnB0emp2?=
 =?utf-8?B?S3ZRN2RoV0orcEFDbUlaUFZqRlJ0ZGl0UWdDZ3NyYjliM1FOR0IvUUc2QVV5?=
 =?utf-8?B?a2VvQUdrZXBjWmlzd2JBeEF6YkgxSHA4L2Jab0Ryckc2UjZzeDB0S29OTzZp?=
 =?utf-8?B?ZC9VTEkzYW5yN0VEeDhCb3RyaFRtUVR5aEpreGx3Yk5OdElFaFhKMGFZaUh1?=
 =?utf-8?B?amZMOTZRRDlhdjc2eDVrdEFTU2FrVGJraHBua1pzaFFPUlJWZ1NKb3FobE5D?=
 =?utf-8?B?VWl5ZVcxVXl5aWorSWJxV2tmc3VtdGpBOE1iNXRKNitMSDA2OGoraFdCVnlC?=
 =?utf-8?B?QkF5WG02Z1kzOW9vUEZpWXpTRjJrTk5RcG1rTllONVB4aUF3Wko0UTdFV0RP?=
 =?utf-8?B?YWE5ZkZuRGxWejZRWnFGV1crQVpVS2kxNi9hUmozcEJzNFR0a1E4QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66db614b-585f-4c25-e63b-08de6310b79a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:40:58.9911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPhK8NdUzCDLSw50B+G5UuRGOTHbKkSwUXEJNcnA4aTjXtiY/qRk4NOx2MERkzPZVZouYhfyFrTnx1/70DcxwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291
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
Subject: [Uboot-stm32] [PATCH 00/14] treewide: Clean up usage of
	DECLARE_GLOBAL_DATA_PTR
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
	GREYLIST(0.00)[pass,body];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,lpc.events:url,nxp.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,denx.de:url]
X-Rspamd-Queue-Id: 634FCD7EE5
X-Rspamd-Action: no action

This patch set primarily removes unused DECLARE_GLOBAL_DATA_PTR
instances.

Many files declare DECLARE_GLOBAL_DATA_PTR and include
asm/global_data.h even though gd is never used. In these cases,
asm/global_data.h is effectively treated as a proxy header, which is
not a good practice.

Following the Include What You Use principle, files should include
only the headers they actually depend on, rather than relying on
global_data.h indirectly. This approach is also adopted in Linux kernel
[1].

The first few patches are prepartion to avoid building break after
remove the including of global_data.h.

A script is for filtering the files:
list=`find . -name "*.[ch]"`
for source in ${list}
do
        result=`sed -n '/DECLARE_GLOBAL_DATA_PTR/p' ${source}`
        if [ "${result}" == "DECLARE_GLOBAL_DATA_PTR;" ]; then
                echo "Found in ${source}"

                result=`sed -n '/\<gd\>/p' ${source}`
                result2=`sed -n '/\<gd_/p' ${source}`
                result3=`sed -n '/\<gd->/p' ${source}`
                if [ "${result}" == "" ] && [ "${result2}" == "" ] && [ "${result3}" == "" ];then
                        echo "Cleanup ${source}"
                        sed -i '/DECLARE_GLOBAL_DATA_PTR/{N;/\n[[:space:]]*$/d;s/.*\n//;}' ${source}
                        sed -i '/DECLARE_GLOBAL_DATA_PTR/d' ${source}
                        sed -i '/global_data.h/d' ${source}
                        git add ${source}
                fi
        fi
done

[1] https://lpc.events/event/17/contributions/1620/attachments/1228/2520/Linux%20Kernel%20Header%20Optimization.pdf

CI: https://source.denx.de/u-boot/custodians/u-boot-mmc/-/pipelines/29177

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (14):
      beacon: imx8mm/n: Drop useless files
      mediatek: mt7622: Drop useless board files
      common: cli_hush: Include vsprintf.h
      cmd: mem: Include vsprintf.h
      test: log_filter: Include vsprintf.h
      xtensa: relocate: Add missing headers
      toradex: common: Add missing headers
      tegra: pmc: Cleanup headers
      rockchip: evk_rk3308: Cleanup headers
      nxp: emc2305: Cleanup headers
      pci: layerspace: Add missing header files
      renesas: common: Include asm-generic/u-boot.h
      socfpga: clock_manager_s10: Add missing header files
      treewide: Clean up DECLARE_GLOBAL_DATA_PTR usage

 arch/arc/lib/bootm.c                                        |  3 ---
 arch/arm/cpu/armv7/s5p4418/cpu.c                            |  3 ---
 arch/arm/mach-aspeed/ast2600/spl.c                          |  3 ---
 arch/arm/mach-imx/imx8/clock.c                              |  3 ---
 arch/arm/mach-imx/imx8/fdt.c                                |  3 ---
 arch/arm/mach-imx/imx8/iomux.c                              |  3 ---
 arch/arm/mach-imx/imx8m/clock_imx8mm.c                      |  3 ---
 arch/arm/mach-imx/imx8ulp/cgc.c                             |  3 ---
 arch/arm/mach-imx/imx8ulp/clock.c                           |  3 ---
 arch/arm/mach-imx/imx9/clock.c                              |  3 ---
 arch/arm/mach-imx/imx9/clock_root.c                         |  3 ---
 arch/arm/mach-imx/misc.c                                    |  3 ---
 arch/arm/mach-imx/spl_imx_romapi.c                          |  3 ---
 arch/arm/mach-meson/board-axg.c                             |  3 ---
 arch/arm/mach-meson/board-g12a.c                            |  3 ---
 arch/arm/mach-meson/board-gx.c                              |  3 ---
 arch/arm/mach-socfpga/clock_manager_agilex.c                |  3 ---
 arch/arm/mach-socfpga/clock_manager_agilex5.c               |  3 ---
 arch/arm/mach-socfpga/clock_manager_n5x.c                   |  3 ---
 arch/arm/mach-socfpga/clock_manager_s10.c                   |  5 ++---
 arch/arm/mach-socfpga/mailbox_s10.c                         |  3 ---
 arch/arm/mach-socfpga/misc_gen5.c                           |  3 ---
 arch/arm/mach-socfpga/misc_soc64.c                          |  3 ---
 arch/arm/mach-socfpga/mmu-arm64_s10.c                       |  3 ---
 arch/arm/mach-socfpga/reset_manager_s10.c                   |  3 ---
 arch/arm/mach-socfpga/spl_agilex.c                          |  3 ---
 arch/arm/mach-socfpga/spl_agilex5.c                         |  3 ---
 arch/arm/mach-socfpga/spl_agilex7m.c                        |  3 ---
 arch/arm/mach-socfpga/spl_gen5.c                            |  3 ---
 arch/arm/mach-socfpga/spl_n5x.c                             |  3 ---
 arch/arm/mach-socfpga/spl_s10.c                             |  3 ---
 arch/arm/mach-socfpga/system_manager_soc64.c                |  3 ---
 arch/arm/mach-tegra/pmc.c                                   |  4 +---
 arch/microblaze/lib/bootm.c                                 |  3 ---
 arch/mips/mach-ath79/qca956x/ddr.c                          |  3 ---
 arch/mips/mach-mscc/cpu.c                                   |  3 ---
 arch/mips/mach-mtmips/ddr_cal.c                             |  3 ---
 arch/mips/mach-octeon/cvmx-pko.c                            |  2 --
 arch/nios2/lib/bootm.c                                      |  3 ---
 arch/riscv/cpu/andes/spl.c                                  |  3 ---
 arch/riscv/cpu/cv1800b/dram.c                               |  3 ---
 arch/riscv/cpu/generic/dram.c                               |  3 ---
 arch/riscv/cpu/k230/dram.c                                  |  3 ---
 arch/riscv/cpu/th1520/spl.c                                 |  2 --
 arch/sh/lib/bootm.c                                         |  3 ---
 arch/x86/cpu/ivybridge/model_206ax.c                        |  3 ---
 arch/x86/lib/init_helpers.c                                 |  3 ---
 arch/x86/lib/zimage.c                                       |  3 ---
 arch/xtensa/lib/relocate.c                                  |  2 ++
 arch/xtensa/lib/time.c                                      |  3 ---
 board/BuR/brsmarc1/board.c                                  |  3 ---
 board/BuR/common/common.c                                   |  3 ---
 board/Marvell/octeontx/smc.c                                |  3 ---
 board/Marvell/octeontx2/smc.c                               |  3 ---
 board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c         |  2 --
 board/advantech/imx8mp_rsb3720a1/spl.c                      |  2 --
 board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c       |  2 --
 board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c       |  3 ---
 board/andestech/voyager/voyager.c                           |  3 ---
 board/armltd/vexpress64/vexpress64.c                        |  3 ---
 board/beacon/imx8mm/Makefile                                |  1 -
 board/beacon/imx8mm/imx8mm_beacon.c                         |  8 --------
 board/beacon/imx8mm/spl.c                                   |  3 ---
 board/beacon/imx8mn/Makefile                                |  1 -
 board/beacon/imx8mn/imx8mn_beacon.c                         |  8 --------
 board/beacon/imx8mn/spl.c                                   |  3 ---
 board/beacon/imx8mp/spl.c                                   |  3 ---
 board/beagle/beagleboneai64/beagleboneai64.c                |  2 --
 board/beagle/beagleplay/beagleplay.c                        |  2 --
 board/broadcom/bcmns/ns.c                                   |  3 ---
 board/cloos/imx8mm_phg/imx8mm_phg.c                         |  3 ---
 board/cloos/imx8mm_phg/spl.c                                |  3 ---
 board/compulab/imx8mm-cl-iot-gate/spl.c                     |  2 --
 board/coreboot/coreboot/coreboot.c                          |  3 ---
 board/cssi/cmpc885/cmpc885.c                                |  2 --
 board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c |  2 --
 board/data_modul/imx8mm_edm_sbc/spl.c                       |  2 --
 board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c |  2 --
 board/data_modul/imx8mp_edm_sbc/spl.c                       |  2 --
 board/dhelectronics/dh_imx8mp/common.c                      |  2 --
 board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c           |  2 --
 board/dhelectronics/dh_imx8mp/spl.c                         |  2 --
 board/emcraft/imx8mp_navqp/spl.c                            |  3 ---
 board/emulation/qemu-riscv/qemu-riscv.c                     |  2 --
 board/engicam/imx8mm/icore_mx8mm.c                          |  2 --
 board/engicam/imx8mm/spl.c                                  |  2 --
 board/engicam/imx8mp/icore_mx8mp.c                          |  3 ---
 board/engicam/imx8mp/spl.c                                  |  3 ---
 board/gdsys/mpc8308/gazerbeam.c                             |  3 ---
 board/google/imx8mq_phanbell/imx8mq_phanbell.c              |  3 ---
 board/highbank/highbank.c                                   |  3 ---
 board/kontron/osm-s-mx8mp/osm-s-mx8mp.c                     |  3 ---
 board/kontron/osm-s-mx93/osm-s-mx93.c                       |  3 ---
 board/kontron/pitx_imx8m/pitx_imx8m.c                       |  2 --
 board/mediatek/mt7622/Makefile                              |  2 +-
 board/mediatek/mt7622/mt7622_rfb.c                          | 12 ------------
 board/mntre/imx8mq_reform2/imx8mq_reform2.c                 |  3 ---
 board/msc/sm2s_imx8mp/sm2s_imx8mp.c                         |  2 --
 board/msc/sm2s_imx8mp/spl.c                                 |  3 ---
 board/nxp/common/emc2305.c                                  |  4 +---
 board/nxp/imx8mm_evk/imx8mm_evk.c                           |  3 ---
 board/nxp/imx8mm_evk/spl.c                                  |  3 ---
 board/nxp/imx8mn_evk/spl.c                                  |  3 ---
 board/nxp/imx8mp_evk/spl.c                                  |  3 ---
 board/nxp/imx8qm_mek/imx8qm_mek.c                           |  3 ---
 board/nxp/imx8qxp_mek/imx8qxp_mek.c                         |  3 ---
 board/nxp/imx8ulp_evk/imx8ulp_evk.c                         |  2 --
 board/nxp/imx8ulp_evk/spl.c                                 |  2 --
 board/nxp/imx93_frdm/imx93_frdm.c                           |  3 ---
 board/phytec/imx8mp-libra-fpsc/spl.c                        |  3 ---
 board/phytec/phycore_imx8mm/phycore-imx8mm.c                |  3 ---
 board/phytec/phycore_imx8mm/spl.c                           |  3 ---
 board/phytec/phycore_imx8mp/phycore-imx8mp.c                |  3 ---
 board/phytec/phycore_imx8mp/spl.c                           |  3 ---
 board/phytec/phycore_imx93/phycore-imx93.c                  |  3 ---
 board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c   |  3 ---
 board/polyhex/imx8mp_debix_model_a/spl.c                    |  3 ---
 board/purism/librem5/librem5.c                              |  2 --
 board/purism/librem5/spl.c                                  |  2 --
 board/qualcomm/dragonboard410c/dragonboard410c.c            |  3 ---
 board/qualcomm/dragonboard820c/dragonboard820c.c            |  3 ---
 board/renesas/common/gen3-common.c                          |  4 +---
 board/renesas/common/gen4-common.c                          |  4 +---
 board/renesas/common/gen5-common.c                          |  4 +---
 board/rockchip/evb_rk3308/evb_rk3308.c                      |  5 ++---
 board/ronetix/imx8mq-cm/imx8mq_cm.c                         |  2 --
 board/samsung/common/exynos5-dt.c                           |  3 ---
 board/samsung/common/misc.c                                 |  3 ---
 board/st/stm32f429-discovery/stm32f429-discovery.c          |  3 ---
 board/st/stm32f429-evaluation/stm32f429-evaluation.c        |  3 ---
 board/st/stm32f469-discovery/stm32f469-discovery.c          |  3 ---
 board/st/stm32f746-disco/stm32f746-disco.c                  |  3 ---
 board/st/stm32h743-disco/stm32h743-disco.c                  |  3 ---
 board/st/stm32h743-eval/stm32h743-eval.c                    |  3 ---
 board/st/stm32h747-disco/stm32h747-disco.c                  |  3 ---
 board/st/stm32h750-art-pi/stm32h750-art-pi.c                |  3 ---
 board/technexion/pico-imx8mq/pico-imx8mq.c                  |  3 ---
 board/ti/am62x/evm.c                                        |  2 --
 board/ti/am64x/evm.c                                        |  2 --
 board/ti/j784s4/evm.c                                       |  2 --
 board/toradex/apalis-imx8/apalis-imx8.c                     |  3 ---
 board/toradex/apalis_t30/apalis_t30.c                       |  3 ---
 board/toradex/colibri-imx8x/colibri-imx8x.c                 |  3 ---
 board/toradex/colibri_t20/colibri_t20.c                     |  3 ---
 board/toradex/common/tdx-cfg-block.c                        |  3 ---
 board/toradex/common/tdx-cfg-block.h                        |  2 ++
 board/toradex/common/tdx-common.h                           |  2 ++
 board/toradex/smarc-imx8mp/smarc-imx8mp.c                   |  3 ---
 board/toradex/smarc-imx8mp/spl.c                            |  3 ---
 board/toradex/verdin-imx8mm/spl.c                           |  3 ---
 board/toradex/verdin-imx8mm/verdin-imx8mm.c                 |  3 ---
 board/toradex/verdin-imx8mp/spl.c                           |  3 ---
 board/toradex/verdin-imx8mp/verdin-imx8mp.c                 |  3 ---
 board/xilinx/zynq/bootimg.c                                 |  3 ---
 boot/bootmeth-uclass.c                                      |  2 --
 boot/fdt_simplefb.c                                         |  3 ---
 boot/image-sig.c                                            |  2 --
 boot/image.c                                                |  3 ---
 cmd/bloblist.c                                              |  3 ---
 cmd/bootefi.c                                               |  3 ---
 cmd/bootm.c                                                 |  3 ---
 cmd/date.c                                                  |  3 ---
 cmd/mem.c                                                   |  4 +---
 cmd/sound.c                                                 |  3 ---
 cmd/spl.c                                                   |  3 ---
 common/cli_hush.c                                           |  4 +---
 common/stdio.c                                              |  3 ---
 drivers/block/sandbox.c                                     |  3 ---
 drivers/bootcount/pmic_pfuze100.c                           |  2 --
 drivers/cache/sandbox_cache.c                               |  3 ---
 drivers/clk/altera/clk-agilex.c                             |  3 ---
 drivers/clk/altera/clk-agilex5.c                            |  3 ---
 drivers/clk/altera/clk-mem-n5x.c                            |  3 ---
 drivers/clk/altera/clk-n5x.c                                |  3 ---
 drivers/clk/rockchip/clk_px30.c                             |  3 ---
 drivers/clk/rockchip/clk_rk3308.c                           |  3 ---
 drivers/clk/rockchip/clk_rk3528.c                           |  2 --
 drivers/clk/rockchip/clk_rk3568.c                           |  2 --
 drivers/clk/rockchip/clk_rk3576.c                           |  2 --
 drivers/clk/rockchip/clk_rk3588.c                           |  2 --
 drivers/clk/rockchip/clk_rv1108.c                           |  3 ---
 drivers/clk/rockchip/clk_rv1126.c                           |  2 --
 drivers/cpu/bcm283x_cpu.c                                   |  3 ---
 drivers/cpu/cpu-uclass.c                                    |  2 --
 drivers/cpu/imx8_cpu.c                                      |  3 ---
 drivers/cpu/mtk_cpu.c                                       |  3 ---
 drivers/firmware/arm-ffa/arm-ffa-uclass.c                   |  3 ---
 drivers/firmware/arm-ffa/arm-ffa.c                          |  3 ---
 drivers/firmware/arm-ffa/ffa-emul-uclass.c                  |  3 ---
 drivers/firmware/arm-ffa/sandbox_ffa.c                      |  3 ---
 drivers/gpio/gpio-uclass.c                                  |  3 ---
 drivers/gpio/nx_gpio.c                                      |  3 ---
 drivers/i2c/mxc_i2c.c                                       |  3 ---
 drivers/i2c/nx_i2c.c                                        |  3 ---
 drivers/i2c/ocores_i2c.c                                    |  3 ---
 drivers/i2c/soft_i2c.c                                      |  3 ---
 drivers/i2c/synquacer_i2c.c                                 |  2 --
 drivers/mailbox/imx-mailbox.c                               |  2 --
 drivers/misc/atsha204a-i2c.c                                |  3 ---
 drivers/misc/fs_loader.c                                    |  3 ---
 drivers/misc/imx8/fuse.c                                    |  3 ---
 drivers/mmc/ca_dw_mmc.c                                     |  3 ---
 drivers/mmc/f_sdh30.c                                       |  2 --
 drivers/mmc/jz_mmc.c                                        |  3 ---
 drivers/mmc/msm_sdhci.c                                     |  3 ---
 drivers/mmc/mv_sdhci.c                                      |  3 ---
 drivers/mtd/nand/raw/pxa3xx_nand.c                          |  3 ---
 drivers/mtd/nand/raw/tegra_nand.c                           |  3 ---
 drivers/mtd/nvmxip/nvmxip_qspi.c                            |  3 ---
 drivers/mtd/spi/sf-uclass.c                                 |  3 ---
 drivers/net/dwmac_s700.c                                    |  3 ---
 drivers/net/fec_mxc.c                                       |  3 ---
 drivers/net/gmac_rockchip.c                                 |  2 --
 drivers/net/mvneta.c                                        |  3 ---
 drivers/net/octeontx/smi.c                                  |  3 ---
 drivers/net/phy/fixed.c                                     |  3 ---
 drivers/net/phy/phy.c                                       |  3 ---
 drivers/net/phy/xilinx_gmii2rgmii.c                         |  3 ---
 drivers/net/sandbox-raw.c                                   |  3 ---
 drivers/net/sandbox.c                                       |  3 ---
 drivers/net/ti/keystone_net.c                               |  3 ---
 drivers/net/xilinx_axi_emac.c                               |  3 ---
 drivers/pci/pci_octeontx.c                                  |  3 ---
 drivers/pci/pcie_dw_meson.c                                 |  3 ---
 drivers/pci/pcie_dw_qcom.c                                  |  3 ---
 drivers/pci/pcie_dw_rockchip.c                              |  3 ---
 drivers/pci/pcie_dw_ti.c                                    |  3 ---
 drivers/pci/pcie_layerscape.c                               |  3 ---
 drivers/pci/pcie_layerscape.h                               |  4 +++-
 drivers/pci/pcie_starfive_jh7110.c                          |  3 ---
 drivers/pci_endpoint/pci_ep-uclass.c                        |  3 ---
 drivers/phy/marvell/comphy_core.c                           |  3 ---
 drivers/phy/omap-usb2-phy.c                                 |  3 ---
 drivers/phy/rockchip/phy-rockchip-pcie.c                    |  3 ---
 drivers/phy/rockchip/phy-rockchip-typec.c                   |  3 ---
 drivers/pinctrl/mtmips/pinctrl-mt7628.c                     |  3 ---
 drivers/pinctrl/nexell/pinctrl-nexell.c                     |  3 ---
 drivers/pinctrl/nexell/pinctrl-s5pxx18.c                    |  3 ---
 drivers/pinctrl/nxp/pinctrl-imx-mmio.c                      |  3 ---
 drivers/pinctrl/nxp/pinctrl-imx.c                           |  3 ---
 drivers/pinctrl/nxp/pinctrl-imx8.c                          |  3 ---
 drivers/pinctrl/nxp/pinctrl-mxs.c                           |  3 ---
 drivers/power/domain/imx8m-power-domain.c                   |  3 ---
 drivers/power/pmic/bd71837.c                                |  3 ---
 drivers/power/pmic/mc34708.c                                |  3 ---
 drivers/power/pmic/mp5416.c                                 |  3 ---
 drivers/power/pmic/pca9450.c                                |  3 ---
 drivers/power/regulator/pwm_regulator.c                     |  3 ---
 drivers/pwm/pwm-sifive.c                                    |  3 ---
 drivers/pwm/rk_pwm.c                                        |  3 ---
 drivers/pwm/sunxi_pwm.c                                     |  3 ---
 drivers/ram/stm32mp1/stm32mp1_tests.c                       |  3 ---
 drivers/reboot-mode/reboot-mode-gpio.c                      |  2 --
 drivers/reboot-mode/reboot-mode-rtc.c                       |  2 --
 drivers/remoteproc/rproc-uclass.c                           |  2 --
 drivers/serial/ns16550.c                                    |  3 ---
 drivers/serial/sandbox.c                                    |  3 ---
 drivers/serial/serial_adi_uart4.c                           |  2 --
 drivers/serial/serial_htif.c                                |  3 ---
 drivers/serial/serial_xen.c                                 |  3 ---
 drivers/smem/msm_smem.c                                     |  3 ---
 drivers/spi/ca_sflash.c                                     |  3 ---
 drivers/spi/microchip_coreqspi.c                            |  2 --
 drivers/spi/mvebu_a3700_spi.c                               |  3 ---
 drivers/spi/omap3_spi.c                                     |  3 ---
 drivers/spi/spi-sunxi.c                                     |  3 ---
 drivers/spi/spi-synquacer.c                                 |  2 --
 drivers/spi/spi-uclass.c                                    |  3 ---
 drivers/spi/tegra210_qspi.c                                 |  3 ---
 drivers/spmi/spmi-msm.c                                     |  3 ---
 drivers/thermal/imx_tmu.c                                   |  3 ---
 drivers/timer/ostm_timer.c                                  |  3 ---
 drivers/timer/sp804_timer.c                                 |  3 ---
 drivers/usb/common/common.c                                 |  3 ---
 drivers/usb/phy/rockchip_usb2_phy.c                         |  3 ---
 drivers/usb/tcpm/tcpm.c                                     |  2 --
 drivers/video/hx8238d.c                                     |  2 --
 drivers/video/imx/mxc_ipuv3_fb.c                            |  3 ---
 drivers/video/nexell_display.c                              |  3 ---
 drivers/video/rockchip/rk_lvds.c                            |  3 ---
 drivers/video/rockchip/rk_mipi.c                            |  3 ---
 drivers/video/sandbox_sdl.c                                 |  3 ---
 drivers/video/tidss/tidss_drv.c                             |  2 --
 drivers/video/zynqmp/zynqmp_dpsub.c                         |  3 ---
 drivers/watchdog/armada-37xx-wdt.c                          |  3 ---
 drivers/watchdog/at91sam9_wdt.c                             |  3 ---
 drivers/watchdog/mt7621_wdt.c                               |  3 ---
 drivers/watchdog/orion_wdt.c                                |  3 ---
 drivers/watchdog/sbsa_gwdt.c                                |  3 ---
 drivers/watchdog/wdt-uclass.c                               |  3 ---
 fs/fs.c                                                     |  3 ---
 fs/ubifs/ubifs.c                                            |  3 ---
 include/relocate.h                                          |  2 --
 lib/efi_loader/efi_capsule.c                                |  3 ---
 lib/efi_loader/efi_gop.c                                    |  3 ---
 lib/efi_loader/efi_rng.c                                    |  3 ---
 net/eth-uclass.c                                            |  3 ---
 net/tftp.c                                                  |  3 ---
 net/wget.c                                                  |  3 ---
 test/cmd/exit.c                                             |  3 ---
 test/cmd/test_echo.c                                        |  3 ---
 test/cmd/test_pause.c                                       |  3 ---
 test/dm/blk.c                                               |  3 ---
 test/dm/i3c.c                                               |  2 --
 test/lib/test_print.c                                       |  3 ---
 test/log/log_filter.c                                       |  4 +---
 306 files changed, 22 insertions(+), 867 deletions(-)
---
base-commit: 1de103fc29761fa729dffaa15d0cfb2766be05e4
change-id: 20260202-cleanup-560c900f7bc3

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
