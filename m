Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GV+C53cgWmDLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:31:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9184D8624
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:31:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43DB0C87EC6;
	Tue,  3 Feb 2026 11:31:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013054.outbound.protection.outlook.com
 [40.107.162.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71583C32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:31:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZH+yoT+49hT08zVy8ueS9d57PMvRiSe29YBxWbx/XIfJtQ33IrRh5fHVsZSATN+CLrDZJBtbAI4ehmkvFUHAgafDhMEW6f2ZxectJimAB0ozygs2A/jkPpjsiR6HHNVN+lORvrxHfdqEPGMY/IAlN307rn4Nzr8ULg9AaDepZdnusMyaaQUXylQ+J9QOSt31HBI+jldgr43jUwzLIqFWc2KQUT6ARk0vzFoXXxygGeTmJOpLr9svLKfNNcFDfYTdrQvnqi4uY+0iG5EoXPZAAFEZMx5cvXjMwd3sHRcrkahXxa1N5lQdWqofNQkBY7QqfExXoi2879LNoVLAOlDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWn1Sb4Qk23EPNx9ZDbTWRmQJJYk/Z/qrvh9epoBqwk=;
 b=jUngzmY2sKEjQLElQXV+9ZrVk8dS+cxthh2ZL4HBm/+MZpn4UnGz0w8MHmwNkdf+ZfxTfShQ9Gd+vD1TKfj80MrRkMmyxeOt9yCSbf5E4KYsYN955FwMEvz4BfoPrbBi8dGk6QcOveKYfOnfML641CQrL55n1qnaqt2DNAjF3hcwj5SD2UcRUEneOVgpVl0HqdmdMM+PB9p8KMLgPgoHgiuI6gu8T/2Pj12McnjDjtXtcglpYhtK4l2ehQx9luIjKwGQapTPIKQAQuxaDX4X4fL8vweLM1K/nKSMI24f5NMcelfxDUVUB48WnrzuJDOHYdsV8w6Ze65e5Juz2qUvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWn1Sb4Qk23EPNx9ZDbTWRmQJJYk/Z/qrvh9epoBqwk=;
 b=tO949zzuSNeBvPULsmBMxaVTWJB5Sq3fVNJ2bfoOkK+4+vxWE2dviFjnRNvhHicuqRBY/1yzn1w5/YLHUlKpCDBKUghRZZg+w5TFpTELY6gxUljdFi1VZVr12lZWKftI0oomhgLoEhtvLhGnjUVplWd2B1aIfNKQDFnZFy32AbD3TWddBqNaMI9Jcp5xJS9KIrEgjoS/4B8U3dLVKWRvEfZA0KiudWQL3ywyLU0UyZr0nuv8vcYiTva9BEMKiUVy/HR/9MZalP5DAuo/jko40Cv1tVXm97kfVGrWul8BCQLc0SfKX4o2a6KKI27RidkfNC4JHXxwnbkgWQwBo9hwKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7890.eurprd04.prod.outlook.com (2603:10a6:20b:24e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:31:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:31:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:04 +0800
Message-Id: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
X-B4-Tracking: v=1; b=H4sIALTcgWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIKGbnJOamFdaoGtqZpBsaWCQZp6UbKwEVF1QlJqWWQE2KVopyDXY1c9
 FKba2FgCgA1oQYQAAAA==
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
 uboot-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 991a7dc5-079e-4412-4aab-08de6317c45b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEJ6QUMvcFZJVXZvUXpWVS82ck9pMmdrUzFpOTlmaWhmaFhjK0FpaTR6MEFs?=
 =?utf-8?B?MXZKQkdxL2N6ZVJZZ0Fyd3Ruc3VnN3VpZzNtdzBTSDczRGtTNmtrUXFqSlg5?=
 =?utf-8?B?djc2ZU9CVnVrSFl4Vk9keC95SXlHUC9ZSENzMllVTXM0MyttL3QwdlVWMWdU?=
 =?utf-8?B?c1duNERrNjkvcnUwTGl1NXQzQjJoTjFoSHY3bkxPd0RDQXIrZjBwcUpwWjFT?=
 =?utf-8?B?dmk5MjN6NTJyU3FHTUhIVTM5YThCK0NTeGJ3aHdjcTlpYkh4ZWYxRHRJTG1I?=
 =?utf-8?B?QkVtZGRPZmt6eExDWTVTd2VlMDZFbURPNlljSnVYMTFibWtwdW1Vb1ZYQW0z?=
 =?utf-8?B?ajlhWXMvalJvNWMyZkpmbFJKdm9wOTF5SlhCSlpmNGkrMjV0cUtZMlhya283?=
 =?utf-8?B?dDdyVFZibmtNNHE4YUFTZXlEcmZoZVFOdGdtTVpJb2ZqZmlOeGZ1SDFOVzdH?=
 =?utf-8?B?M25lNUdlanpoSWMwbTdoUHpDRFQxQjBtNG9VQnh6RnRtUm1QaVYwazdyVUt1?=
 =?utf-8?B?bWdHQ2JESWVlckZMS2k4Tnl2SmZGUXR2cUlIU0lYV3lBZkVnVitGbzhKcXhG?=
 =?utf-8?B?Z0FSeEhSMmF5OVZiTkMvUDJTYUVPV3prMjNaUVFrdlAvWm1rTWNqUG40WWxC?=
 =?utf-8?B?L1RidGFMME5vRHNQSUREa3FQSkdNeDQrdVVlWHk0OUllTmtDSndRdlh6ZEdZ?=
 =?utf-8?B?Wk9lQkJ2UTRnUkN3V1p3ZUlkQ0p0UURmNlZpd2VTNFVqU1RFc0ZSaDllb3Ix?=
 =?utf-8?B?WHNXWHdKTXlUVEJxRWJBS1BkMGxxQ0tLOU4raFhWRlArelQ3VExueWhXWlpL?=
 =?utf-8?B?RGwrWkRDcW1OUjloeTdDVnI3Sk85ZkVqUnVDUU5zczlXbDBnZnRycENnZXAv?=
 =?utf-8?B?WVEzTjhKNVlrZ1REVm1tMGxRbWkwTUJWR01tZVJwd1JrTDAyTXVCWVQxUGpK?=
 =?utf-8?B?SUxMTURvSkI1UkJIc0xYZ2F4ZU9XMFNHK09SOUtOVXBHNWM2alBpcnI2Q04r?=
 =?utf-8?B?eXZDSmw0YjFJSitZeENZamViVDdHaVc5TGhwaTNnZ0M1R2JMOStkVDBoNUNz?=
 =?utf-8?B?Y3hlMEI5NW9sVVFCVFhuZXY0ODdmNHdFV29MUFVKNVQrQVVocVRyY29VTzFM?=
 =?utf-8?B?RVZyWk5JMlh3Nmk4UEJvemFob1BqRGl0VEtuZW9Ld1BIOUIzU0JzeS94MjFL?=
 =?utf-8?B?NUxIVmpUcFcrSCs3aWwyNjdKdEw5cDZrSXgxb203bis5UGlDTm80Y3d4NmFH?=
 =?utf-8?B?Y0ZrT24xeFdZYjR5bVdrRDR4ZDRTWE8yaG4vV0ZqMGZLakVxbnVMT0NYbGtB?=
 =?utf-8?B?VGUrbG5pUXpJWmJOUnZtNyt1dlhaYmtjdUlVRHBTWEJRazZkOVlVV0Z4Y3pD?=
 =?utf-8?B?cVg0OWt4RExLUUdIUldqWFE1WmFXQ01tSFdSQU02RTBTQ2lENFhGZFNieERw?=
 =?utf-8?B?TFpCMGQxUHAxb2VtTDFySFBQb3pUR1NnMEplUlZkUTNTcU44MzJHWVJMbE5Z?=
 =?utf-8?B?SjdPckxDZVdLbnQ1eEpZVzF4c0xoTzZDNHRXUGhSemMyUFBiTFhpRFh3bGVC?=
 =?utf-8?B?TVM2RVJ1SW9SUThnOW02bmRQZjVxYkczSVZoWTFwbyttR2cwUXpzSUJJZXR1?=
 =?utf-8?B?Q3VJTDNXMisvaVd6ZWlpTzFNNm9Henc4ZWpMbEhFeVdIc0YrTStqaW5rS3FL?=
 =?utf-8?B?NmNaZ1hWTHhBMFYzWEZEK21rdGw2a0thRWhabnhVTTV3NFQ5THZTSFViQlFr?=
 =?utf-8?B?OWc4VVlXSkhWQU0wOWd6aFBTTXRVT1ZRYjJBanJBRERCYWZkMWM0NHNySHdU?=
 =?utf-8?B?bVM1U3FwcitWRXJyaVRZYU5LQkpxQllia3E3TTRkQTZvczJBMFlzOEcrTWtV?=
 =?utf-8?B?N1VId0ZyMnd2WmtIbHAyMS85REw1QTNOY2UxcGtJNGZ1T3RwZFlIOEE5SGNW?=
 =?utf-8?B?dzlheEVEWVl6ZkQvWU5XcGw2ZnZzUHc3ZHkvQ3dIY0FnSGd4djlrY3c5NWUw?=
 =?utf-8?B?aGZWOURMUDNxaW8zWk90VkNzQWFhVThNRXZUVElqclhGbWNyam1DSkhJVVR5?=
 =?utf-8?B?ellKTkYxVEN3bkVGQmx3ck95MHJJQ2xSMHJvUWRSMVVacjdXOTdaYnU3WUdh?=
 =?utf-8?B?NStYS0ZhdUtIaEZyV1RTM29VeDJnck1nS25EVGlCR0tTS2FLV2FEZnZVTFFw?=
 =?utf-8?B?anc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDJZK2NqUXcrSmxMQjJhaGNhcm1KNE9pMGVPb1VMMTY1MnZINnB1ZG5IMDA2?=
 =?utf-8?B?U3p1bkd4ZVplWW9aV29STFpqZDQzWnU0V3Y2SGZ4SWZQblErbkFBVU05SExk?=
 =?utf-8?B?ZUJabDhLVjE0Y05kZk5TQlgzWjZUazVRS09pOWxQUkx4NWVzKyt0bXJhL1pE?=
 =?utf-8?B?d1c3ajBZTnBUTStJbGhMZENmUHRuWGsvSEl1TU1tNExFTUxML0NoY0RpUEN4?=
 =?utf-8?B?RnVEWTJEQWJ6dko2VDV6QnJKNU5IaDAvNStRaXZSamEwbnpFUE5MOVRXODBB?=
 =?utf-8?B?c0VhYkdOcWQvRi9aWHdjV2tzKzNGMkhxV2RvcnNWeE1yMjhVVmJGRmJJTWw2?=
 =?utf-8?B?UEZ0enhiR1pOTzlpL2kvVEJLUDQ5UDc5UWhQc2k5YWtSV2c4K2tlSWpwS0lj?=
 =?utf-8?B?N3Y0SWRKcHdmdHNLMC93SnR2TW5aVGFLenU3TDVPTGhaY3JiZWxCYTFXMHNt?=
 =?utf-8?B?RGlPUHBIYU85bnk0WUsxZ1V6UVMvRzNXaVdsZzA5YkRVMmRMc0xYUFJMYlJ4?=
 =?utf-8?B?S3MveWpKcWxnQjY0V2E2QitGbTBMQUpVUGxBQTlyYURSWG4yWUMwWk1jQS9T?=
 =?utf-8?B?dlJNQkpzNisvMm9RcjBYS000K3NGRXRHQk1HWUVoV1ZKMm50clp1ZkRzM0pM?=
 =?utf-8?B?bDJwMHdCZjI2WlA4Q1NRSGhLMk4yRTROaC9DZjJhZGpWQzBLRU5mRzk4MTcz?=
 =?utf-8?B?Q1Jkdkovak9OUlRIRWtRdnFLQ1F6cE80d2FmaDBtWHQ2VzZDT28xRXhTaWs4?=
 =?utf-8?B?aENrWlhIQlg1MmpVMVh5bGR6c09KZU5Ga3ZzWUIwby9rTnBRYnBIL3o0ZWcz?=
 =?utf-8?B?WHJIdDZrcnBSUGMwcHFsdFFueUEyclRDT1ZvakJYMkk5bHJLc2UzeE1yeUJS?=
 =?utf-8?B?eTRYVVovUkZVR3ZEY2xINzRhZTVtd1M4M2NNYlRJdFZhOTRNVHNObWMrdzhB?=
 =?utf-8?B?UFpIVEV6U2pTOUF5M2lueDdBQVBMamh6OTZVWE1NUk5QZXZSMFM5d05YenR5?=
 =?utf-8?B?dHp4aFViZGtnWHZMUUYxMGNDZ3c1RTB3UG9iWTQxWDlpanZROTJvaEtveHpK?=
 =?utf-8?B?TENpajVVWnBvdTdreWtlaStLMHpLbzJ6cXNDWW51a09PRHZIT0pSOUJYK0Ey?=
 =?utf-8?B?SXoxQVZCRGt2RkJiK08wa29kZHhkbEEva1NsK216SUNhNWVEUWgycGd4ckpx?=
 =?utf-8?B?TjVSbHBLNW9iRmdVWEYyVUdWUm12VVh2SHpyNE1HdFZMbDN1OW9sU1lpRjc3?=
 =?utf-8?B?S05MQjdTL2RCUEdsSnRoQURjemo5YVpaNlc5MUUvWFdBNDg2cWxaais1eFZo?=
 =?utf-8?B?SmZmV29yRFBQOUQydFMvOTVFYTYra21BOHhLY1J2ZUtaWEVNNERoZlR2b29q?=
 =?utf-8?B?bkhyeWFxcEVEeHQzdCtiNUtwKy9pZTcvLzNEL28zUzVvRlFycUo1RktqMGRw?=
 =?utf-8?B?VG83cGV4aFMwTDFNRFJuRlJnblUrNmwzYzUrODB1cGV2MkJ2VnpGTnhxaE12?=
 =?utf-8?B?eFlkaHZFK1RYUHRiVk04cFRXS3Q4Nk5XVWViR3gwSzZ0K24yWG1OOFBPUjJr?=
 =?utf-8?B?UzJaeHF5S3VNejV0Znl4VDRxeGRBdTQxczZhWURpWDhmRXhRSzMyZGJMcjdI?=
 =?utf-8?B?NFVDZHp1UEhlN2pGVmZmY3V4SytGRTBqeHlwaEsrVXVKWW43a1ZSL0VBdjdj?=
 =?utf-8?B?aWlxcWVlYWVGTldQSGJHdVQzeU96MXpTaTVGSHJlNVp3R0d4VTBzeE5pLzVr?=
 =?utf-8?B?a3orWUh0Y3RzaXpsWk5Zek5uMGZwKzFIOVIwVzJJL0xUenM4TVN5dlc0ekZ2?=
 =?utf-8?B?NE5GMm1yRVdjSVN4NXJWMVBsTi9yL25xT1oyeVJuRUlUQWpHTmkzcVRzaFpY?=
 =?utf-8?B?d0sveWY3TFJCNHl6KzRsQTlYVVlFTmY5Q0tPb2RMM2trVHJOMml4MytidWV6?=
 =?utf-8?B?MzU5Y1E1azRjcXpGSXI3UDVHWlBlMXRrWGVLTVZweklpMnZaclE3cjAzeUwv?=
 =?utf-8?B?ZXJzRnBhVis4bWlvWGxIRmJVVmNsU3BMSC9nOUxHTVlrVFRzdHJLTHBOSUZG?=
 =?utf-8?B?Mk16NUZTMnp1TDh6aWhiTFBkSTZGc0VzcjZ4RUk0NHpHUHk2VGlRWEpXcGlM?=
 =?utf-8?B?cFhBRUtVOURVeS9TOTlNR0RXNnpBeVhsWTcvNzdYTVdJNlB4WmdCMy9QbkQy?=
 =?utf-8?B?NlpwRWczbDlpbTVyckorNlJmTTRjcWlNNjFhYjZRa1lzZmg1SVB3eUhXOWs0?=
 =?utf-8?B?OTZjVGV0UmdxMjlKcmUxZmY5RWRnTk9wZ0xHZlhOclBQV0NrQWdXa0ZGamNQ?=
 =?utf-8?B?cHhLZ01wSW8xeVh4QTU1KzJaRjh5cFVlVXhZaXRIb0hOcGFSd3Q1UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991a7dc5-079e-4412-4aab-08de6317c45b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:31:26.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBwi8V2ACfowe80RZQmjPmJ+4dWZIqx7TZXEhV1Hh2vLyL4jMb5WUUkdg/RUYEB1vJJYeAbzVM9ZImwY+r66iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7890
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
Subject: [Uboot-stm32] [PATCH RESEND 00/14] treewide: Clean up usage of
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmail.com,m:n-francis@ti.com
 ,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Hua
 ng@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,m:michal.simek@amd.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,denx.de:url,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B9184D8624
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
