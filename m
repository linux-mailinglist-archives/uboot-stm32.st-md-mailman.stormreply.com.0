Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEeMO+XSgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:50:14 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC6D7F49
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:50:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F1A7C87EC6;
	Tue,  3 Feb 2026 10:50:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013053.outbound.protection.outlook.com
 [52.101.83.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A70A0C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzNBJJiEHDEqulzKnLMuCYCqWbb3xDPrlfeRRHt8vGUbOXq4JVotYdW/rVQkmJ3ofU4AbPoniY+YhTe1ZOnv0NVKUcz7n6v1zuNAcDt4WX0EGQJ3ix7kRhPw9qcvqCsqsB0TwHX+MSJbaMLqPQhYIVxqBTLk1IpEbOg3g7kiFTr069F1iVYOszW3LQOOTvV5gnb62AZvjj489ZPZhwnVUPSc6WvnudoDzK+zUn3VDmcJBMeI3S5m2MVKlk1KpSVMheMGp56cCKOKTfLif/34aHFqISLvwo78wfj+9lWogu6ok9yZ2xT+OmdC8fKkdEC3i/Btz925RNiaiB4qznkP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mARH3HXQvn9H2K9C75Ooeo+YZ9BTcmxpCVUThYGK/EU=;
 b=ZLJ8RPqU+U+jhNOZpFAjPfkwLOAuluhqjv8QZr3btBAmowB6jjLj0WoArt6zWClvzaqvy2LFXRoSvxhRAYacgsLd0KnlkLuLo/sQobXzsnC2AC0M/gmGUr0hMlMa9sUIKrroeut+fBz5y7WiqIQ+qT/g1DLEEAmVczRRqaRrYyGEc9ObPJPZqF1cUm3KdeN5VKLaKFWvfQvTgr/Tw25PrvxYjM/MHP5lrLUUR8TY3vlO+eH+xSvUIXu1B2RONyRGeUaCgBnTKWLyMfxcdc318iHMD1KmOYOsGPmfcPdQfE2ZIQKqvh4z7OJkaw9bRyXyXomjxPPVVJ8jzv9lEgw2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mARH3HXQvn9H2K9C75Ooeo+YZ9BTcmxpCVUThYGK/EU=;
 b=oSmws5M+VR4YetJjTTeYXuhauFwDTzfZsDLafSLpzz4NH5DcPSwHd9Xa0rDlMyL3YcvCLia2NMJOlbt2A767/o/jwY0YofVKmU7pPZGKbswu305q6xawPXy50YBkWzyMcmS/v0pZlLse80E3JjtWYZcrVq/QdFpO4hMxUZQs4FZPxZ4jP1BW2tlf/knB2szfnlo4P5u5fGiFzeLubEh8Ljkk1kyWU8zVUXvwhocRZiFLNkJ3Q0GNtvhBIEIvjW58m4ozCiDsbp7QYVFs20NHlqCoH8rCMUSy1medkNyPYFJTUVcMc4LD3EfQf4fE78K3Z3zDwSDJTEoTyX43EJoCaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:50:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:50:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:43 +0800
Message-Id: <20260203-cleanup-v1-12-4221c13e7558@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e61b993-f5a3-4d95-5d06-08de6311fbde
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2E3SjFua1BqWW5MTTNFYUJNY2c1clJGLzhjMnVWWHJwc0MwZTV4YzQ1dlp1?=
 =?utf-8?B?Z0lzRDcrc1dXQVdBYUdBdXIvbkRZWFlMZTlSZkNhdEhWaVhkdXZlSVQvNzNV?=
 =?utf-8?B?b2pwalFTTHlBQ09NVCs1V0VCNDFMdkkzeUQzN0xJdExobjA3aUhOWEMva29t?=
 =?utf-8?B?Zld0dGxDbTNsdWlEQmZsWnphUDJNcEZQOFowNW0xSlQ0cWFlK3VCcTJ1WkpF?=
 =?utf-8?B?ZkQ2M2s2Y0lSUk9pOE83d1ZZZlNnT0ZjaDViTWNIUlhnc3NlQ0VWZHc2d2hC?=
 =?utf-8?B?SVh0Ymdkc0NnYXhmZWhiQmxTVUhDcXdBVXIvZ0Rrd2JHN3IrQ2lxK05pSkcx?=
 =?utf-8?B?M3EvUlVuQ2ZUOWl3WkkwaFlvMm1jMWlTZXoxSzdpeHIyU3E5cnMzc1NVVWhF?=
 =?utf-8?B?a0pJNFJLT1l4QkJ0alJ1TS96R25NTXhReFpqcnRxdEpYaVBwTHRaQTFGbkdm?=
 =?utf-8?B?aUpOdlR6cmY3ancwM3NDQzFldUEwMHBEVU9CN2RXd28zaUw5dnNDYjdOTE1I?=
 =?utf-8?B?aVJsVUhRQ2Y4ZFdGU1puR2xlRTdmblVMa2Q5U3JJd2ZlNU9ydGlkbHR0Tkc3?=
 =?utf-8?B?alhqTnUvUW05cWZBMzR6QnZsYVZEc3dwNkF1cjRPMXVKTjRMTk92UllIYlZr?=
 =?utf-8?B?cm1ZVGpCeC9QY1hlN0t2WkpwRHMvUnhHYjY4KzJJdnFod1N3aGczTFlhQzRt?=
 =?utf-8?B?RSszSXZxV2g0T3B3U0JFTDRPeEtCaTZHSFJrd1FlWUgwNnJ6bGg1QzZPRm5p?=
 =?utf-8?B?dkRicUhGRkMydnBMOStnVXRPMVVHdGIyVTVCdktYSXZaZVN4UGYzcDcrSHds?=
 =?utf-8?B?eHNvWjVONE4zQXFQRWVSM0NoeWV6dWVQbWV3Y1p0MXpYbmNneUVCYXFCKzBR?=
 =?utf-8?B?emdaamNyTm5KSzlrU0pPWEFKaWpFdVFpNk82VlJndG9MNStia3NzUjVZT1ZZ?=
 =?utf-8?B?TlFxWUpydTgwZ1JHYnd3Ymh1MXczaW5SY2VIa1EvSWUyRGh1SVQyVjNocHVp?=
 =?utf-8?B?QmFhbUM5aWhCR1VaNEROWGJIUCtUYkQzdTY0SGdERkdsR1I5b0t3WFcxcTU3?=
 =?utf-8?B?L3k3ZCthaU5EVTNDaXdzUGhnZkNWNmc3UUZTeGI4UjM5b0pVeVBnL2lya0lQ?=
 =?utf-8?B?dVZMazhGZ0tuNjhrY2NFbW1wNFB1NTFjMi8vQ3BGQjZRWjRaRGo3NnI0eFhI?=
 =?utf-8?B?Tkx3ZDEvRUxLMzVHMUFaU0xjaXVEWTF0U1JuUEJVYkxCSEc4aVdKWE56VFVv?=
 =?utf-8?B?OWdQZVJXKzAyRC9iZHFUZU9yMCtka1RoSGplRXl1b1EyaDA1UnhENk1abEFT?=
 =?utf-8?B?TmNjMGRVYUF2Znd2ZlM1WXRVNkI1NDEzMzhSMXhqOHVhS0pJQzhIck16blRU?=
 =?utf-8?B?RXZHMW1CZGxuZHl4R1pBTks4dWRRRXdvTU1mbUJzMFJvOFlTYmgyNU51M2hP?=
 =?utf-8?B?SXhRSEw2WGkyOVBXelhVTHN2N2dGOFJxdTlTa01jakp5Q1ZiaXZjNzZMNFRT?=
 =?utf-8?B?VjFQSEpkYkZtZXBNamhIeWtucmdOUW1Pcm9hR3dZYXp4eFpyMXIveTZsa0tZ?=
 =?utf-8?B?alhnS25HcnJHUzk3YXhLTmROWmVxY2o5S1JKNEpQeW43S1RYZjMyeEs0ZmVM?=
 =?utf-8?B?UUc4c0dMOFB4c040cXZ4MGJpSml1TnI5L2Rid2RKbEJxZDNKczR2SmJJd3lr?=
 =?utf-8?B?UVQ5YjVzMTVkbmpPQlVMWkwyMEdlMnpMOTlCMm1palBWeEFOUzhLSk9IRHNO?=
 =?utf-8?B?cXdrZ3pJYnduUmdtbXlXL0VMaWNiSmlEZWV3SGljbEdnNWxsS1lPbEFQbkJs?=
 =?utf-8?B?WEIwUjZuZlFwTWVKd3VkdWFvb3NNRWYxc0p4K1h2bk10dGcybkU5K1k3WlNq?=
 =?utf-8?B?em1waGV2Qk5FT3ZwVVhsa2lBUVowend2L01VTFE1dEZ5TlVWa3RBTmZRRjBj?=
 =?utf-8?B?NTJwYzR3Y2ZUQjFsZ3dzT2ZrWU82NFN6b0pYTzF1MlpuZVpKS24vQS9CZDdW?=
 =?utf-8?B?WmY1V2Q0ZTI4SlM2ZGFJaFJiekJXVjBYWjBSRHZuZDV3VDY2a3AwNkc3SzYw?=
 =?utf-8?B?clp3MFpVRmNPSkFaVlp3VDUxeGNqT2NOcGUxank0Wkhhd3EyOTJNVjJXU2ZO?=
 =?utf-8?B?K01VSi8yeTJhN21uRXppRWdiRHYzaHgzR0xXamRONTY2bGdlQ040enZZNXp5?=
 =?utf-8?Q?YVsY12QciVrn5WQ1aJ8stJRfG6PrYXmAA1hER+oFIIyH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjhaOHlheVJ0a0czdVo4aXR3NHlYQ05EODJhZDRjTkVWU0FJK2Y0b0xaNHNC?=
 =?utf-8?B?aCtpbjFxV3lDNGc5Wkxld3gyS05oc0phQXBuMU12Z2hhYzUvaTYxMWxGRG1P?=
 =?utf-8?B?cUxNcWREZ3M0cnFRb1ZmbDRWS2lJaVZJRlNCTE94YVEzb2VLbzRKRVdKemJv?=
 =?utf-8?B?aklCY0pDQ0taaS9LaWR4TTlSdWxqSXloWUtjUDF4VWVXNU1saFlHaXNHRXRy?=
 =?utf-8?B?UWszK2VZKzkwRFRQelJ1MkJuVmREeWU2bzdTSmJET2lvVFZINm5LS0dZYW8w?=
 =?utf-8?B?eWt6Z0JsYnpPWmFKWUR4dHVIQnZQVElHT3BmTFNxcUprRzdQTW1icE95VFBJ?=
 =?utf-8?B?Z1RPNDlVNTNOZU41YUo3eUdGditVc0lzb2ZiRGlybUlrRm9jQm82SjdIU1Z4?=
 =?utf-8?B?NThZZXdrSUJYRVVmWVZzekNWRG1BdmVhaUMzTlIxbUpRUTJ3QWxuaHU4UFJx?=
 =?utf-8?B?Q1BkRUx2V2NjOGRiK1YzZTVIZ2c0Rkw4TXRoVmsvN25nN1ZVVGllSkE2Tjg1?=
 =?utf-8?B?MndQRFJMSng0RWJtdUhlbFhHQzdUTllQd1k5YTJHNzlQMDZSQkRtdkljRHZ6?=
 =?utf-8?B?NTZUUm5vTGgzUkV4dGtDeTJhUGVLK2VNVlhLTXJGM1dyTUJJaURtZkYxVnli?=
 =?utf-8?B?ZUx3cDUyYk1KMlA3K1Avalg3TEdrbHJOck1haGoxcjJYYnRGNTlNc3lJNzlT?=
 =?utf-8?B?dTB0NjRWNTRwYWtEdU9ESGVGRkJSQm9iUjdNUFZZZWlaeHArbS9MNGx3MWtE?=
 =?utf-8?B?ZFNnVmtzRlpLa2YvUkI1RGlwZmtoSUliampyZ1RNS1E0dTBPMzQxQW1hUGdW?=
 =?utf-8?B?bCtUOHVYbnRkdWExWTdocUNYZCt4N25qTHRTeXR3b0V1cWVTbXByd3U5cm1K?=
 =?utf-8?B?SGhxNnJDZXVWYVlPaEJlM2orRE1GL0pWVlZxVnVvbzk0T0YvMjc5ZkJkMGZC?=
 =?utf-8?B?TU5KME5JTFRjd1hDVDd1T0JDQ1NEbjNHOW9ORkdsWEVEU0puc01NdnJFR1BR?=
 =?utf-8?B?L2thck9VR2RjbEVGdndCNGIrZUlka3hmcGlxVHdPUXUvajFVbnJlbGlFRkNo?=
 =?utf-8?B?Mk5Pa1dYTGw5bnozU0tEOXd4TXBXbzU2ek9CdmRTS1IyU3dwMklkNWVFdGh1?=
 =?utf-8?B?OGxTU3daVXFreE5sbEMzWVkvNHNXaXU1bU9LNU9FeVVPeE5JdEVxZmRvZE9H?=
 =?utf-8?B?WndDL1J2RVBmdWJpalFrczJaenpPclZXcUQrT2FXdjk5Qk4xYkZBNEhXMUF3?=
 =?utf-8?B?akhvT3RNOGswU2ZYU0ZEbCtJTnloVHRCTlN2Y1ZMUVlqODhsSEFFajZyTFFO?=
 =?utf-8?B?WmlLK2tqSGtna0pJR2tObHJBMFY2OXlTVWRBUDc1NjI1QmJSV0oxQjNZY0lD?=
 =?utf-8?B?VTJxUm45bmwvT09PRWRGbVl1Ui9tRFh6aXVoaTdwZisyYU5BTEVpOXg4Mkps?=
 =?utf-8?B?ZVlPTE1iUENkWkZ2V0FkRjZQMXd5eDVkY0Vpbjh4U2xvVTR4Q082RUp0MVlK?=
 =?utf-8?B?MVhJUGg4RldMZlZaS0d3K3VsdHdHRTM0amFER3lDdmtrVFE2Y1pTS0tURUtk?=
 =?utf-8?B?dTJiR2dldHdQdUxMVVdiVGxxU2xkN0R0OUozT0s2R0tBQldnTFV3L0FGRHp3?=
 =?utf-8?B?S2Y2cTlNekJSNFJVbUZYb1lJZDNYVmpBZ3B0TWtSOFR3RzQ3aU0weWtLQ1l1?=
 =?utf-8?B?ZTFxdTh0bzg1MXlBUFhRbG5HTTNqMnEwYlcrNGpxaDBnTlk5TC9Ha2xuWDZi?=
 =?utf-8?B?TkxhTUlQeGx4K212SHR5VmsrSkV3UUEremJndUFSQ0JDOTlzR0EvamNWdFZz?=
 =?utf-8?B?Z0pOeERXWHd0RjFoTzZ0RkVVRkhKVUgyM3hxQlRxVFVCUzFqQXk0d2xCOEEw?=
 =?utf-8?B?YytwMjAxMS8wZ2ZydHZPTzZOWDd0L0lrUUFpRjIwUTNSUE8yTWZzcFRHRHlO?=
 =?utf-8?B?UU1mTkNJWXl4WUtlOG83YjVidHZZMFJoVFI2L2JnS1NNcitFUTNLbGkzTWJE?=
 =?utf-8?B?NFJFaWpJVHFnOGxWTURKMDBhSENnYjZzRE5PYjhHQzVjY0o2RzE5bEhlM0Fy?=
 =?utf-8?B?VHVZSmtqdWh5SlBqeUNlOGxCa3RPT2U0Sit1OUdsMnZGN3pXYXZOV2lLUURV?=
 =?utf-8?B?SkFBd2dTVkRsdWdJQUt0cG9wNExLM3I0T0duYmlOaXExYXova2hJU3oxNTVt?=
 =?utf-8?B?bDF4bkw1Sm8yWHZ5YkNtdTBXQ04zcVZWNlI1MjR4Q1V3OExzdUJnMEwzZlBu?=
 =?utf-8?B?YVRVVHNtREpQUzI4MDJlVTRqMFJodUFvN2pOYm1rVlZxNVcySmZPc2Z6czhu?=
 =?utf-8?B?RVFaVUZkbVljQ1FTNnN1blRHWFdjaFVLMVFzUm9OT0dVTmZCTU4wQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e61b993-f5a3-4d95-5d06-08de6311fbde
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:50:02.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjQuGXabYLhYGAxOAFJVFF0b19eZGg5f5nCmbDlh4JK8+L5Ho/XAlmd8DslrACnWAT9aC/QH4YZ+9YILSiGESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989
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
Subject: [Uboot-stm32] [PATCH 12/14] renesas: common: Include
	asm-generic/u-boot.h
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,nxp.com:mid,nxp.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9BEC6D7F49
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

struct bd_info is defined in asm-generic/u-boot.h. Include it to avoid
building error after asm/global_data.h are removed from this file.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 board/renesas/common/gen3-common.c | 1 +
 board/renesas/common/gen4-common.c | 1 +
 board/renesas/common/gen5-common.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/board/renesas/common/gen3-common.c b/board/renesas/common/gen3-common.c
index 94da00985d34049222a2c5aaec650d03dc2aec85..f89ae81e95ec551b8b254fd0fee0b9839f798b85 100644
--- a/board/renesas/common/gen3-common.c
+++ b/board/renesas/common/gen3-common.c
@@ -16,6 +16,7 @@
 #include <asm/io.h>
 #include <dm/uclass-internal.h>
 #include <asm/arch/renesas.h>
+#include <asm-generic/u-boot.h>
 #include <linux/libfdt.h>
 
 DECLARE_GLOBAL_DATA_PTR;
diff --git a/board/renesas/common/gen4-common.c b/board/renesas/common/gen4-common.c
index 38fba7a5ea77778383d29f2403a585bdb54994e9..81c6f6f4c6ddbf78f50657bef9a31a4f3e8e6099 100644
--- a/board/renesas/common/gen4-common.c
+++ b/board/renesas/common/gen4-common.c
@@ -13,6 +13,7 @@
 #include <asm/mach-types.h>
 #include <asm/processor.h>
 #include <asm/system.h>
+#include <asm-generic/u-boot.h>
 #include <image.h>
 #include <linux/errno.h>
 
diff --git a/board/renesas/common/gen5-common.c b/board/renesas/common/gen5-common.c
index a05a3e8abef46f55ae649d11741ad45797090728..3b724e59049c0b451b6e346a6ecb9846c3226e97 100644
--- a/board/renesas/common/gen5-common.c
+++ b/board/renesas/common/gen5-common.c
@@ -10,6 +10,7 @@
 #include <asm/mach-types.h>
 #include <asm/processor.h>
 #include <asm/system.h>
+#include <asm-generic/u-boot.h>
 #include <linux/errno.h>
 
 DECLARE_GLOBAL_DATA_PTR;

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
