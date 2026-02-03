Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFxDLHzdgWnwLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:35:24 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358FD872A
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:35:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03BB0C87EC6;
	Tue,  3 Feb 2026 11:35:24 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 688C8C32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQOfit3C0XeF79Kz7SQxLnYx8EufxL4TF4uwZYx1+5i538p0SX2JPFRWpqXQUBwyyMch3q9h4Mv3X2vpr/DJ+0M0Xnf59EOBGc/dBio2L2SQfDBSVFrz+hFh62RZIELrdgLhiQifnWfhyfP3/1PZskVO4wBDGQhMNW0/dTYFuargRny3WtxfhWai5JDCkllBP6v7RhP3CSV61B3Ehy0XaJPJRLyQ0oJo7Ec1Y7GrvC8hVQ73SRWLdf++r2Zqwib/AfjHe8zLUpNjT+S6wG2yQykpbl8hfBAwXo59e5QsAUMy47xkk9JYXLC1QS0LLpSB86vKP+RcCiqChHk9Fz3kkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxfvyil36xY1D/eNw+BGYVnOp5UonpwJ6UoczsWHOPY=;
 b=PjHMcQYvKHuYulCaIXuXcJF3OlOQbbA2O15kwc87nq7U5fwl70Mq5+t1907ERk76ZKE2Fgku87hn/f74cd+eGQwc6Ht3w2OYeLJDo7+AN8vGh6OtM1izK9d0Q6CEzlT3yplfzB0pRrFfnWrVNpIH6/J4W6jRT+6MRzwmz6OJ+bZf0AbcA8MPAVtFwJSLBwWzD/qwphayOjEED4bTABWalqk1/9pPLkDjHhY90XL/LSh43Gtei0VNgq/yzSFCHRcPSxG9SUCcL66blZDas0GqkDiALZZSCE4kWqhmWTM52sve4bw7RnKKLAzvxeTlMSqKJFIV7/WFO3Slb4Tiiqx5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxfvyil36xY1D/eNw+BGYVnOp5UonpwJ6UoczsWHOPY=;
 b=CTSgbNWKdlCCH02vJt52Ldhb2L7hE1vRCEZvUQgnFH6szssi28+nquLdFwB8B/a9F5HkaEgi6yLhcKPPlfiGeFoZxgDnRUzTf4o18XL4hdMlla79Af5/xUjDu2Zq0QVKe7nL61/0awH7oVx3s+bdvYxPPAPsK75x/hGILuwv9V/dZeOBMC/g3OpNit64mKwowUARNsATmnMGrzMSXoI27f29yzIAfklPIa62YzPMs/paDzdXKGmGVjRmt1yUWRYOcuVeIdmeHDzGc8Uzp8wjEG77/TV4Im/qh7d8lBlU12pi46/xOrr57fs/TQeRMZXCteBQEkN8Q9AkRhUKnZGoPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10749.eurprd04.prod.outlook.com (2603:10a6:150:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:35:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:35:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:09 +0800
Message-Id: <20260203-cleanup-v1-5-732e986039cd@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2cb36ce2-a0a2-4442-9249-08de631849fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTF1SFF0dkdPQ2xlYlk2RkNzN1JhUWpuam5oR3p1ZE56NXhZMTdoMmlxYjVP?=
 =?utf-8?B?R285T2FYWUZnZUJ1eWY1TVJadWZLK1pXRFNZcmtZbXJtNlR2WitoNkIyalh0?=
 =?utf-8?B?dXIxdk1paXJIcXNqYVAvY2FGUElVcGVHWGtIQUZmRnNEdGo3NUZYUUpPZk1O?=
 =?utf-8?B?L2N2ekNNaEJTbTc1cVNtRkRFZEJlVWEvT2xOMDk2Y0VVZEl1amtjL0Fra0Vj?=
 =?utf-8?B?S3ByV1JsdFlpbDJOVGliaHVlUmg4V3AzUnI4dHh2U2dOZlpaWnZqYXJDSHJj?=
 =?utf-8?B?VWp1RmpsL1ZoT0hibllkVllJdlJURkpJekc5dURkMmF4SlF0eEhSOS83WFNH?=
 =?utf-8?B?bmdjekFaMUFqaWVNaXJxMm1TT21QSGt6MklwZVltL3NweG9TS3MwTm9SdTdR?=
 =?utf-8?B?TUhsdmJHb2FILytVMnhMWmlPVnFvRSs0S05qUUpHaFJxb21QMC91QTdNOFRV?=
 =?utf-8?B?SThveTRsMmdLSDlERTRNdUFwOFZaaWZLL1BadTF4bThHa0JteHF0VWNwRk55?=
 =?utf-8?B?aVJoeHFLZDMraW01bFNEZGl2eG9HV01ScmY2aGlqdFdRRk9hYlFDamRBd1Y1?=
 =?utf-8?B?em1sY3AwZ2lqa0VOZUdBNDE4SEFxa2lQYSttbVdrSWVMVTdMZXl4Nk5kdHRG?=
 =?utf-8?B?RlNkVVNXazAxV0RjNGU4QnlqcnBtdCtDTWJGb1pvQVI2cm9kWTBxU1EzTElw?=
 =?utf-8?B?aWxITi9LZldMZmxxVERXWnladXBQU3VGaElrckUrNzBzL0VjWkg3NUlPS0N2?=
 =?utf-8?B?L2Q1R204ak1pbUVvZWdIdll6L0pTb2prQXF6cVRBb29GZ2FRcXMzdUVwR0FJ?=
 =?utf-8?B?ME5kM3k3TnM0NytHU2NTcS83bXdjQzVORWxwOE5nTzZKUHNmRjdIVUZPZCt5?=
 =?utf-8?B?R1AxODBibUVQeFcrNE5LMWgvZzR0dWdmOGYxR1VZMERhSENBOXh2SlI1SVBk?=
 =?utf-8?B?enJIOFNFSnNxa3hMdWZMdlhjZTFCNjBES1pPL1RIc1ZwejZaYmRGeFhrUWI4?=
 =?utf-8?B?T2t2QzJMa2NMZ0UwcmZ2bUcrSEFzbjRJWDRrNTY2SHgwNGlYQ1VkRm1NOUUw?=
 =?utf-8?B?d3dnU2N3Z3lUdU1WZTE0YmY0aGRCUEg0bkRZd0R6eXozNWw3UXMzREpuZk5Q?=
 =?utf-8?B?eUFpaktWN2pDK0dRYnFFb3pLb0FueGpsazZhSEVESnF6TEM5MkQyYzhPd0t1?=
 =?utf-8?B?aDg2MFllakdkTk55MFJXNy92UmV5YnZudVJ0ck5MZVh2NFJTd0I4SDcvN1pS?=
 =?utf-8?B?UmFjQk02UmFVSzQ3OHBRR3pEa0FJM3J1T2I4WVN5WDNBTm1uOUZOOUIxbitT?=
 =?utf-8?B?NE84Nkd5NllKclVSRW1OYWpoUVN2VzM2QzBRZkFWODdscElnV0JGMHd6S0Va?=
 =?utf-8?B?aUpwSFByOU1KUWhnL2F0VU8wY05Cdnd3ZC81VlV6MkdwWGpVTExQajJidlFo?=
 =?utf-8?B?dUlOQnVzQ25yVXg1RXpSZkJ4Mk50LzRVOGdoK2ViZVRwa2RjOWhYZ0RBRm5C?=
 =?utf-8?B?cVJad25CSGRXSzc0aFVtR1h0czBJNHVkaFhCOXZ2ODBBRVNBN3VlVlNxaHJP?=
 =?utf-8?B?ekdFUWsySUpqakpJRzM3TlJLM203Qk0wNVR6L0dsWFlvTlpKc2x4TVBqbGQ2?=
 =?utf-8?B?YWNKVGQ3bFh0b2RtVmFSeTliSVJvaTB3K2k3KzB4WTVtRVRQMUxzL0hTT256?=
 =?utf-8?B?M2QrLzRnK3ZVOStRbUhXb2U1eFFmaU1YVHlWaVlVNmtzVVJNSGowdHROaEV1?=
 =?utf-8?B?Z2Zuc3NKeTVzRWk2WXZUL0VJQjh1MzYxSnc0Y1c0MTVLNWV0eW1jSFlGZnB2?=
 =?utf-8?B?aWtGRXRBdGFnOWxpL05zQVRzWUhjRmYxYWRmbS8wWjFwWElzbW1tUEZ5Sm9B?=
 =?utf-8?B?ZmFlVVJlY2N3S29VZEFmckhQNm1zWGUwMG1SQmF5NkwyVHpSM2tPSnBqSkYx?=
 =?utf-8?B?R3RzdndFQUZBbTRYY1NZUmR6czRzSFp3Q3pHMFpQcVJ2aVlScGg0TTlmSzJJ?=
 =?utf-8?B?T3RVdEJjUHdjZFhSS3E3RGcrUmphRisxOUlJTS9neExFaCtFSVhEZU5pU1JL?=
 =?utf-8?B?YkdrejBGcFdMV0RqMnk3V0hOa1RZTlNJR0s2RHdCVVN0WWR0VzVtSmlNQjhP?=
 =?utf-8?B?VDJ4ZWFNWmdrQkQxYVZLUnkwVEs5bVhjeDBEb1FIS3FZbTIvbEQ5UE9rT1NE?=
 =?utf-8?Q?IYf1pkRsvK5HJDWZK96jsEGGAl3IUH7VtaTR7I0mw+0C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZLY3k4cVBaVXN3Ny83d3MvczN4aWxQbW1sSDNVZ2tLZGxYSHpJck1yWGZr?=
 =?utf-8?B?M0NJZHV0eHRUdmI0eEphakxhaFNyUGtLMWgvQmNWRDZwNmdoektPSXVBWkNI?=
 =?utf-8?B?bGJHQU9VSy8yWUFORUpxcUtWQ0lCZW5oY2VnZ05HdkNDeDFwMTN6MlFDemkz?=
 =?utf-8?B?ZXg2d2ZENW9LWkx3YkFtU1JSaWdoS01LRHltZnNkaHNuTUxTT0Q3SXU1cW03?=
 =?utf-8?B?QzBIOGVkQXZPcVorMWJaOWpNYVIwQU1zeitGNzZhbnZCZFlqWVNPNi85YlpU?=
 =?utf-8?B?Nm9nU1hBMWFzUHZlZGpDdGRkMlU3N3loMm12YzFwRHhtWEJiZ3AyUjdtWkhZ?=
 =?utf-8?B?OEhZTXQ3YnhXRUcxUnVFUG9RUE13SkJHN01YUGlBU2VScS9xWDRBVWNyVTVF?=
 =?utf-8?B?Vi9oOGN2TjlTczJFQXRFTDk1NU41UjZaQzZhTHlHQkZpZWMrNmdmUGdYbmk1?=
 =?utf-8?B?TjMzVUk5cG9mSkk0VWQyeXVKR0tUVnA4L3h3SmdIcysyTFd4cithM2lyZXEv?=
 =?utf-8?B?WUdVN09LL3doMWR4d3pHOTZ2SXpmL3I5WGdacHVGL0tKZVZHVHQvL3pqczlk?=
 =?utf-8?B?Qy9zZWNuMEUwU0JRWHdEZE9SRVU0OXVYWGVzNFZNdzBQUEJQRFVwL2hlTDM0?=
 =?utf-8?B?eWduYWlnZlFFbi9CL0RzNi9XRTVDd1FPWlgydXdUdHhUZENjckFoODVHZ2ZE?=
 =?utf-8?B?QWl5ZmtkZExaT29JenRpKzN2cCtJR2thOXZMZ3NYRDNMbFpaeWlXVWo1NDg4?=
 =?utf-8?B?cDJ1cGVwazBod2dWcU9KUlA0NGIrQ1k5QjhML3lCcTQwRGpyczlGZkV2MzA5?=
 =?utf-8?B?cHd4ZkF6VnJJdU5sMDdkNDFDaWJRRTlEd3ZuTkZoRjA3dUl4WTFtK25jU1lY?=
 =?utf-8?B?clVRRThwK0dpLzVpSlZIbE1GUGQxSGlGYVpESUswM21kT25KcTZDTmloUzlr?=
 =?utf-8?B?S3dybmswajI0QXc4eWdwY1UyTnQzQ1FDdUhnWlAyQlB2SWVIM0M5anA0VWxu?=
 =?utf-8?B?WTlDckxWbzBXRUVFcjkzOXB2bVZqM21jS3d4QmNwMldLS1RoV2M3Y1p4M041?=
 =?utf-8?B?b0F4SXl5K2FqS3FYV0ZmcDVzQ1l4OUg0N01TRzNRbm83c2IxNzNSbnZxUTNK?=
 =?utf-8?B?YTh6aWFzeG40WThhK2RLNlpjS0pEWlA5blZBTGJDUElxMnRoM3ppWStoV3U3?=
 =?utf-8?B?WWlSNlNTd2dITzJUZGduQStMVVA2b3BlTXhoZ1dDZ1d4bVFJTFA4bUdVYlNj?=
 =?utf-8?B?aENtWTVpNXZBVHQ1RXBkenJCZTRvR2VXNWJTUmlKNW1BaUlSUStwZDN5WFVa?=
 =?utf-8?B?OUdNa0RPbCtCbFpTbGNRWi9aWnJwOWRsUUxRakRCOUliK0tnTHMzWlh1VUVi?=
 =?utf-8?B?RFZmN3lHYVlXTFNoR1BZUXFQYVE2aVlJR3k3ZTQvUkgvZmdqUkNRNUdoY3ZT?=
 =?utf-8?B?ZXlXaVgyVlJ3RmNQOXBqSzhNR0pGaDRCalIxNGJpOFM4M1lKUCtHcGpLMXdO?=
 =?utf-8?B?Zk95dy9TUnZQdDJIRkdVY0NaL2xjN0NQemFkNXpEU3BpQlZOTWNwNzRiQUc5?=
 =?utf-8?B?NnZZQ0RGMzI4OW1LeXBSb0dlNlFrSVhSbk1FTGtXYTFoWlBreU80MTFveW5R?=
 =?utf-8?B?aVdqeTZoaUNPaG9vU2Vmc1gvdlpndVRobm9LdG8vdG5PbWExUHVpUVlnT1RK?=
 =?utf-8?B?R3JBYWV1RzREVlRuVUNTdzZIVURtLzZFdUdYV0ZMMkZXbGRTMVBHQVNsVGlJ?=
 =?utf-8?B?RUo5ejcrYnFhZDRSc0g2SStBTEpGa1R5ZldZNWxKTmFxejJpUzNBam9zenlJ?=
 =?utf-8?B?VmxhWWZTeHoyWmd4eEltc2puSGZRM0FBVmFya1JmNGcydWVMVmN4NldxTjJ4?=
 =?utf-8?B?NFhpNWVBSUdOSGhhYXJwZTFJQ3A0aGV5SlN4aVYxOTJQN1BDeHovKzg5dkNR?=
 =?utf-8?B?UEFBejFTMEw4ZnIxVGtYQStDMFBiM2JwSk9UKzJtb1BxSlNVMVpVRncycldS?=
 =?utf-8?B?NlBPUXdZck9lMFN4T0JPcGNqamxrYTlOWG9MSjZTMk0wblJ1Q2VLOTBXVU51?=
 =?utf-8?B?YW5JVEZ3ZWh6elJMZFA3S00xQ3BSQnBKaG5Vay9JZTQxM20zSWwwa3hNY21I?=
 =?utf-8?B?d0kyeVBHZHZYcWR3M0dXZG9pTnhQYndudTc2b2ZLMk00R3FtSEw2b3ZIdVp6?=
 =?utf-8?B?bWloU25RdlpoemRTWjF1SHV5NUJtby9BSGZyZkpYL0dYeDZZRHZmM2N0OC9V?=
 =?utf-8?B?eTdjdmtIUXhRZlhxRit1UG41SnhjZ0JwdmVMTDJQMVZJK2h4SmVRblQxQThx?=
 =?utf-8?B?Mk9VYTNqanRSRlZoMlp6Z3ozSjFZU2hYRWFiMVBzb1RMaklQaFdvQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb36ce2-a0a2-4442-9249-08de631849fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:35:10.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luS5EYMlp3scFZVOgYCkT9nrXMeZ+s7Kwgmpk0x29XvjLp+r6diKK04qXqbxmofub0GJPw3s58hg0BLjHrVVXQ==
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
Subject: [Uboot-stm32] [PATCH RESEND 05/14] test: log_filter: Include
	vsprintf.h
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
X-Rspamd-Queue-Id: 5358FD872A
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

snprintf is used, need to include vsprintf.h. Otherwise there will
be build error after asm/global_data.h is removed.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 test/log/log_filter.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/log/log_filter.c b/test/log/log_filter.c
index 8622dcf29130f6f6eb70536e042c2ed51ad61893..680c60164b623bb30bf0a5457c190bab8d97468a 100644
--- a/test/log/log_filter.c
+++ b/test/log/log_filter.c
@@ -5,6 +5,7 @@
 
 #include <console.h>
 #include <log.h>
+#include <vsprintf.h>
 #include <asm/global_data.h>
 #include <test/log.h>
 #include <test/ut.h>

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
