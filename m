Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KBlHwLSgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:46:26 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304AD7EC1
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:46:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B420DC87ECE;
	Tue,  3 Feb 2026 10:46:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B706EC0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw3p42QLUdhSmngkTIasATjMEppNoXk+M7Nof05CBCDRqpZQSxfFF/OesszH8lfHCtxL1psirTgvByh/PTAY04td8AYF3ky05nKUHEp5er793wKVwRTUDWVbuRrPsqwiVCx8oH66inon9pHWkjANARroEyxBFjmE5ABH2Z7RjANpdHp4aBLp2IaZij1WPtWIokMA5iqTqVsaWYGmXprsvABgDEReDHHZQJaeRlDrp5juUHxguBQALm4qr3MbFs59g/cRR9ddW1+DSSaakdXfUrU2v/J39yYt1znxHu3m/RYUJOvCsI82WHsio062Qis45WXQ56swnN0i5acY95ZqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPspR1f8x8EmRHTo7a/aAkNO/gymepd95G3Fd1O9huE=;
 b=Qvtz5IXtYo5b2m1qXRAX2ZX1CVMrZj3R2RCOvM0yKiGzrY9dX6jwbK8wztqgZX7xLixwiHzYBiBG45QWk64VwyZBhHpSFdL16YVWLW+sO/ea1CjGsgljZaw/1q1X8EpJrg1VQ7xRau6sMgmJSF61clBR8MaMN37QXIkgxs+G10GaOSxI6a8UxC2n9BRM3MO2YXSpk4tszZo61MdQ7PvtVKGPAt1uyaBQKMqjUAmMdvfX63ghHhz7w75dvAkpGYvxhrvH/wpDa0mQKHH29zCaxv3+aDaVGHx6MHkGHgPJXFz18wfyW/XmcQlg4bk6nsGR7aESGkkDifD5e5hPzQiizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPspR1f8x8EmRHTo7a/aAkNO/gymepd95G3Fd1O9huE=;
 b=ldyaYipnhUnlZ0OfH1s5oVACakQG31d3Acn66OqkOsV9ek2yG0a6LoQwGxsav7j8DXyoqflSbUufcJXD/wIBZaE81Z3NWGK/DvTO/UMWqkHu7hU1Upp/M8AEetXwn4wegmZ6FfixMStF85zFFojAkDsYqDqaGSG3VEwJcsAxoH5TR+fuvPx61oH1yTbeLcCgnQ//TpUsmSO3Y2W8dWO4EHeVFI0XLRh7lkGQMBFUvDgjQx7ZdO2X0Xr3eF6wIRs4nJ9ac6aQDTJWSCkeEFw4uZPItKSWFEu42vecZpEWppayyaNucuDMNnVuMA/aTwb2zS2Wdo/NwYYCuXBDmE6dfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11639.eurprd04.prod.outlook.com (2603:10a6:150:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:46:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:46:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:38 +0800
Message-Id: <20260203-cleanup-v1-7-4221c13e7558@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0dd77bf7-32e3-4b44-c2b3-08de63117473
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnVickJpUWxhYTd0UWhvQ2dPbUpDWjJ1SkYzckhwWFcycDVVRUxZL3ZBSEdy?=
 =?utf-8?B?OGc2ZmYyUU80Qk9HYmxpUnhMNmd6bFg1RVZlZlhXbTdVdXVpTEl2TUlCZFRh?=
 =?utf-8?B?WHpuUXFNS1MzWDBmWDJUOUluZllHbjdpQ05lZm9xekY1NkZsK2JNK0ZpRVQ2?=
 =?utf-8?B?MlZyMmNSaG4yMEN6MUxkbE1Md0lHWHArZjBSNUptMjE3YTVsSnU2cUxXRW9t?=
 =?utf-8?B?UjRoT0k0dVVobUFURXVXV2hDK01yOVhWbytYTkNyOWN3K2paZlA0QzlOcTJN?=
 =?utf-8?B?T05sTkl5YzBzZGpKT1ZVbXVnd1AyWXdlUjk1WjZ1OU9mayt0RjBFN242TXdS?=
 =?utf-8?B?NzRmRmgrcGFVdVJoMStldStHb1prYnBiYjgxYUN5ZVlkRDlMNjlpOVp1QzVR?=
 =?utf-8?B?b05EaDc5VUR5QUhDd3E3eDNpbEMzMEFPUlZMV1llS1VmVjFPTHpvYWlFT2Zr?=
 =?utf-8?B?a0YzY0ZpK3hBekFRU0tuaGFxbjBDQyt5WUlFeVdkSC8vaW1ySndjVVZWZ0Jp?=
 =?utf-8?B?dmtKL2lFSVlKK1BacEY5KzdRM2c1ZWo4Y1BQaTZCekR0SllGdGtOU2I5aHkz?=
 =?utf-8?B?NmFOTzlCS1VKeDYvRERzUmovbzhKKzhUN1BrQ3FQL3JLei9LWHJSVnFUZDBM?=
 =?utf-8?B?c3J6TVVaZ0RzajZwTHdQV2JpQXM3OTIzMmtac0k5dVFwQTEyN1o5R0p0cUJ1?=
 =?utf-8?B?eU1Ja2JXRFgwVFJOdUhhcWNORlBnUnptRkw4R2tnYnNROW4rK29ud2xxVUxG?=
 =?utf-8?B?UGlnS3E0MzAvREhxa0xpRjVhOVdPVmsrNkRyVDJOOXJSbU9BNS9WQjRCZ2hN?=
 =?utf-8?B?V0NjQXpJVjZwR0JVMVI2VzIzbWxocWUwTUprQVJJb1RCdG05UWVxZ2FpTmlR?=
 =?utf-8?B?eERSWS93anhjY0hvOXV3cGp6UmZmRW5zTDNGRy9aSy8va24vSEMvNFNFRStS?=
 =?utf-8?B?b3ExdUxyUWc2bUcyTjJzcUMyZG5jaDFYSThkZm01a2tGOXlDMXVwR2owMk5G?=
 =?utf-8?B?aW00dXJiRHBRTEVZeC9ZbDdqMXp5TFFBY0N1RXM2bEVtbmljUXlWQ01aN0s2?=
 =?utf-8?B?SkExZHhtV0xXaitIT3ZCNEpYa2dvQ1kvc0R0K090TXlSODlTa0EwT2tJN3Ba?=
 =?utf-8?B?M2tURVQ0SlFYVFVlZEcyUnA1ZUM2SUdTWkZLZkgyeEZVSFN0VHVKL2lwSWhh?=
 =?utf-8?B?eWhWc0R0Rkt5YlArUVRvdHRJYzk4YVQ1YU1TZ2syb2c2c1FwVUlwZGFVRXRr?=
 =?utf-8?B?bHFLT01KWG5tcWRHdCtpemxYcjU0aEZtK0Z3WGljT2ZQeFZybGdaSHhFMUNJ?=
 =?utf-8?B?SUxJOXdESnl2MC81bmRQZFFZL3JrcVEybzNWY3lsNDVnRkRuRGhZaTA0dFl3?=
 =?utf-8?B?Z0UwL0VEajdObGNHSlZuQ1I0bDRxaUo4a3RyYnVlMmplVGJiQ1Nlb1dsa3p2?=
 =?utf-8?B?K3h3a09nWGxxZjFxWjJSbytwUjhqZ3lIWldadVVveGlPSHhFeVNUV0kwTU9U?=
 =?utf-8?B?dklyZTM5VU9sakxTRnBVTEFibnJJQzhQby94ZlZvRlcrT0N0UExzOHNFNnZQ?=
 =?utf-8?B?Z2hRWVgyblI1dVM5Vm9mbFpIUWM3TVowTE9pUWtXV1BlbHIzTE1PdDRGenR4?=
 =?utf-8?B?MUR0aVJ3V1NYUkV0SDR2V28ya0ppZDlISXFMWkFOSXVyZVIzL25tanNGb1Vs?=
 =?utf-8?B?aUdJSTdEOWdGWjNGYmZUMkFEWXE0Z2tBMEZzN0dBdTk0emE0b2NCcHIwODRL?=
 =?utf-8?B?N242cGVEMGsvMU1RQlRKNllxb1NndktaRnNWVmFZcmpTU1RJbkdxZVlVSS9x?=
 =?utf-8?B?bFdyY2dzWVBlRmtsK3Q5WGkvTW85L0g0VDFGUVNTaWZmQVkxWVVJNWJoMHp2?=
 =?utf-8?B?Z05yVE0yNnJTQS94TThSOUoxWDZTYWFRZmFkUEE2TVNNRnQvQTlRa1pOc28y?=
 =?utf-8?B?UGZ2Mmg3UGVFTnkyTGlESlEycjNHdG9QWTJSbkdLeVFNZklZZ1R4NjFUcGpo?=
 =?utf-8?B?Vy9wNUMwZ05FY2wxSzgwQXZma2NKNk96UytOa2tXM1NtcnRTVjFtelNZWEtp?=
 =?utf-8?B?aFJ6WklxaTJGanIzRWViTmFPMFp2c2s3UHNtYUJRb0ZJUFh6SlJzR1U4b0t5?=
 =?utf-8?B?SHdMa0FNaG9qWDBxbkt6Ynl3UjlzWHl5bnJHa3k3cmVlMFdLTi9uNnYxZTlk?=
 =?utf-8?Q?BLVdH9X2lrMsTKWNSvkELwKoYOibtOtPPz/h+zE456Xe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmR3SDhQMytlVG1aWTdJRHloYzlIc2lnVFRReVVlVmhkd2M3NW9PWUMwcWJH?=
 =?utf-8?B?Zkw5V0hWMVRIek9CNkdYdlV4U3VNUW93WXpZZE13Y1ZHRVhJWWVMSGpxQnc3?=
 =?utf-8?B?N283WXJGV3YrUlNQWUxmNjVVdmY0Nlo4TTBWQ3hMcFZXUG5yWFFOUXlGdWNz?=
 =?utf-8?B?UTEyVlg4M245bU45Z3JoOU8wRm9hYkxpc2FvZFBiRG5qV0YrUHVRbkNDZmlF?=
 =?utf-8?B?R1RHQitpWUJwa3o0NjRlSVQ4WXNyYUNTN2trU1BWR2I2MEQrT0NEZGV3c2ZR?=
 =?utf-8?B?eExnaHpiZ3lBTzN0bThyYnNGdjJJNjEwSllMNVBaVm8rN2U0enp2UlJPMjdS?=
 =?utf-8?B?OG9FSlN3Uy81SCt2TG1mNHFmYVpkdWYveVJYMmpVNlZLbElmSUI1Zjgzcmx1?=
 =?utf-8?B?WUtRV2g2eDJ6clQ0KzNRNysrU3k3VVBIZFl3QXZLTlMrRkZqbjI4Rlg1MkYz?=
 =?utf-8?B?YitDL1ZjbTdVd1hxcWpmTmsxRG1mK0Y1dTFBekFmUjRIanZ5ajg4Ky9GRjJ4?=
 =?utf-8?B?b3lCby8wc3Q0RGw1Nm90MUV6SGdSZldXdk05LzFkMzlYRTNlbU1IZzhhQWtQ?=
 =?utf-8?B?OXNOdjJOY3NMK2hieEV6Y2JkTnRVYjZRWXpJTW5zYW1HZEc3bEQ1NmJjajQr?=
 =?utf-8?B?NTM1Y3VXM2QyampVa0xMNGVCWGJJUXBJSjlYREV2bTByWGxqR0djVFZJM01a?=
 =?utf-8?B?U04wcEp4SmNlcXVTOEd5S285UW4wZkZINkVxbHNHWGNuS1p1RXpUOUx6clph?=
 =?utf-8?B?eWZQNTR4Z2tNaU1OZnVKZXRKZGY5YWUrUlU3WEg0cGxHV0tWOUIyY0p5Mkpu?=
 =?utf-8?B?MVJHV1llL1VoNCtuNndoQWlTSTcrbUNHaXFZWW1YL3pMaWtRYlIrZWtYeXIw?=
 =?utf-8?B?M3p5NUM5Q3lGTUFLc2JrL1l6T1NqeFh0L2ZyS1AwZ1dqaURkOFhuNHo1d2dT?=
 =?utf-8?B?aVRseFUxcEVuZnFGL1A3NTV2ckxha0RkaVgreTBESW0vL3R6bUVMUzNHYnJH?=
 =?utf-8?B?OVFuTHR2S2h5L2NNc0pmU0lBaitHZExKU3hXaWVzbk53MEg4dEpPa0VSVVlr?=
 =?utf-8?B?Q3h3STNndFIyWjlHcFc1UUQ1UTZyWlFINzhFQ09wUXppdm5XMkEwUjVaMGhl?=
 =?utf-8?B?THNlbkVzSElxUXBqdS8rQ0dGNUlpSGltdFg4bmdMNyt6VGp6dHZ2UmYza0dO?=
 =?utf-8?B?ZTdhV1pROUNWbk5sY2NqVHlxLytEdlhEQ0FwQ1FWeTZhNXhkcmFNL2ZNeUZT?=
 =?utf-8?B?NUlHOW1oYlNkWVE5aUpmZnVBNEF3TGZYcTdXbDYybExuclNnL0FrVTlRcWhH?=
 =?utf-8?B?ZzN4VnJVeERTOE1oeGQxZ2xoMnQ0MDVmNHE2eGVNL0dNYzE5eTlFcmJHcHFv?=
 =?utf-8?B?bS8rTGlBQXFxNmNvVzlFeEtMNVhrcDZxemdpa0VhT0NRbWlDMVVwSGlzaWND?=
 =?utf-8?B?cXN4aW1WeEdDajNJc2pnczNWQnNEN3MwZHdtaDRHcy9LbytsWmNqOXJRZ0hi?=
 =?utf-8?B?MFRqMElETEFac2E1SldmL2Y5RU9FMlFjTTJheWdvRzd1QnJnTjFoV0tnREc3?=
 =?utf-8?B?UVh6NUZaWDlLNElVYkdoSE9ScERVSVAzek5pb2dFWXdNSDZZWk5ZamF1YjZC?=
 =?utf-8?B?KzMwZnl1REFWYnJ1elJKdThYNEd3dUhKTmo5dEVEaDg3dHMyOTdGdlBIK1d4?=
 =?utf-8?B?eW9vVXZWc1NRdUFFZHBzM2M3N1Fvem5WN2R1aWJnQkRHeUJzcklycHZlcjZV?=
 =?utf-8?B?bUg0ak9xaXk2QVhpT0JXN2w4RkNNbzlwWEhOYUNVQndINmZrUXpVdU5Ja2JE?=
 =?utf-8?B?MTg4NUxjQncxVWo0KzdnczhlUEs4NTB4ZDhmNDJQcXNGWURXeTNIcmNja1g4?=
 =?utf-8?B?L0tna3FEL09rRC84N0FSVnowYUpjblVoZ09IeVYrMEN1V0pmVC9sei9NU09N?=
 =?utf-8?B?eHdIaVhwQmE4T1VBb0RwUEZnbVpIaHA4RncvdlcvcXAvWjNheXVaT2p1cnBZ?=
 =?utf-8?B?RUlUWitiaW9rQXZtMGNqaHNGVHJJZ2xUOXROQUxHNmE4LzZlalBqK011WkI1?=
 =?utf-8?B?TGNJRnRNMUNGRWViQ203MmZlL0dveG9QdSsyUm9RUmdoTUpUODZKVVpmUjBL?=
 =?utf-8?B?cVhEZjZqcms0VFZSTU4rbGRNUGFXZFRCM05FN1BUaTJwWVd2YXA3Qmd2eHhJ?=
 =?utf-8?B?Y0c3YTJ2RUllazdBVGRDR2tjZjR6NEY5M3ZSUG45YnZtbi9OMkhoSGgxNHJp?=
 =?utf-8?B?YkdhY2t3dlVDcjQ2Mk0vVHJBdytLaWo5WXUyTEN6ZSsrSTdsRGdDM2V5c0xt?=
 =?utf-8?B?dW9qdlhqdEsySExaa2NRWUNXa2M0b2Y1eFFQcnk4TjhZMjVUbTVKZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd77bf7-32e3-4b44-c2b3-08de63117473
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:46:15.5813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOq8hyXURNSPFDDptG7CqxHjKpRpPag4vkQo6X9It04MLX6ZGzNr0arhCGk7eVF/jFJRokpXtAiFnPuNPu+s2g==
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
Subject: [Uboot-stm32] [PATCH 07/14] toradex: common: Add missing headers
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2304AD7EC1
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

Include linux/types.h and asm-generic/u-boot.h. Missing the two header
files will cause building error after cleaning up usage of
asm/global_data.h.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 board/toradex/common/tdx-cfg-block.h | 2 ++
 board/toradex/common/tdx-common.h    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/board/toradex/common/tdx-cfg-block.h b/board/toradex/common/tdx-cfg-block.h
index b28033d8332e09d063a6a8ad1d4e334703077f00..067daec0d776070b0b53fc26d1043d6eb781a527 100644
--- a/board/toradex/common/tdx-cfg-block.h
+++ b/board/toradex/common/tdx-cfg-block.h
@@ -6,6 +6,8 @@
 #ifndef _TDX_CFG_BLOCK_H
 #define _TDX_CFG_BLOCK_H
 
+#include <linux/types.h>
+
 #include "tdx-common.h"
 
 struct toradex_hw {
diff --git a/board/toradex/common/tdx-common.h b/board/toradex/common/tdx-common.h
index d446e9f1d5ca7d3d5a1318b389393d28854e2263..db3369a8f9ef9b409c53c45e94aa5f22933a44fa 100644
--- a/board/toradex/common/tdx-common.h
+++ b/board/toradex/common/tdx-common.h
@@ -6,6 +6,8 @@
 #ifndef _TDX_COMMON_H
 #define _TDX_COMMON_H
 
+#include <asm-generic/u-boot.h>
+
 #define TORADEX_USB_PRODUCT_NUM_OFFSET	0x4000
 #define TDX_USB_VID			0x1B67
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
