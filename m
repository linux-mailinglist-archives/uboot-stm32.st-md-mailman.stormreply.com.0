Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDwMIYDegWkXLgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:39:44 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B648D87FD
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:39:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD7F9C87EC8;
	Tue,  3 Feb 2026 11:39:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE33CC87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab7/oroC7QBZ0AKF0vqfwHhiApzR6BjL6g8ZlvzJg78UDpCeyTLlyBCwLkxRkkTq+89jn4iMhxyplf7xISK/BAfDLB+Z6BcMDiG7N7TLn5MIOxTBF/LJ+1c2u2KaXMQ6KkjLW1wqBRIeBVGpvy4nW4tKBigQI8YIjbXvyzU/4BLikLHHbb0OBEETr8tpLqcWwrAzpMlnAiG+V9B68qAE8ONpcGvfSTMSBD7+wO7kKKgBc2ElZBP8iKua+U80lklMTPkrlSXKmfZuKeQ1pPzhapZDO2APqFiyagcyL1n1hv3brk+lvdtxfwT+9F/V7HT07vU3pWJ+f0/x1oiMgRHIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl+Uj1K48vUj4yxZKuP6zOWmIwhFmSeOCZJI8Wb8I3M=;
 b=w9wsBy+YucdNWFjQGBwLT15JcC6TtQvR6T+pp5zzc3FZhrMxRqpOuWXY3wdBbLRUTDYf+iqX2v360LUPiOl0jFBp/zHn1eIqPnpcoyzTgRBNLceqJkobomrMbCOpJ4J72o4SSsrY26XME0tJgnq1x8OYlL/t1o2SQiHHPC4UbW8qQDYCoqh5a94M+3esd5w7jSfU1rQ1zB51IsKGe9pdQppniBACxPIW0Ir9e/98fQtkjCe+8ekW8fHwzmD17oo6SzuGHpZgCx+BAgsqDL/5OUz95kekwcgStj8qHn/ZbuxaQud6tavG1OAfSBDNdWJE58lHzJ7OIvFB2ofAgt2oAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl+Uj1K48vUj4yxZKuP6zOWmIwhFmSeOCZJI8Wb8I3M=;
 b=s/WyDmIyqPn+yeeJhOt15PIc5ZiZUf3JCj3PpW7IUuAjOFrUjQqT0SwVW1Z3Hj8puvLlODXZUX4akrLn0gE8wGMfuItQ+0D+68dwIrkWZdwaKTe4RRm0PXWTp0FgC7X40nDav14whIN4Pofut2xRN/+2zD5NsxfHfdYSh758cDx25ZuiK7tUa0DFVzE3OX4xK1nP+bSzW2GAUO8lBf+TrnX/M7jB3Y7F+D3/U0v7j/pPuLczPxuTS+T1WnpHlWku+W4lp9lS+pd7nvp9u4Mvg0zV2ZWeqbNhHIUWau4FbgiPDbKxFq8ReZf1BgpZsEkZ4TX58KTpeJFWJquIXq1bLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 11:39:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:39:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:15 +0800
Message-Id: <20260203-cleanup-v1-11-732e986039cd@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aee9bde-d9eb-4c01-a262-08de6318e8e4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3hpNFd4czgxcUsvQ1BLcURRcXU3TzdRcW5YUlFBSm1xSkFLYkFGWDg4bmJh?=
 =?utf-8?B?S1YvM0F3d0o1Mm5jbGtvMm5zcTZwTVFSbjN3WmN2SGUxWmNSK0dJc1hpVFNO?=
 =?utf-8?B?TnR0aS9YaXdjUk9IZFdMN0hXcFczcWUwSHIzNmlRdXJRV2NVK3RpQklBMWFH?=
 =?utf-8?B?ZCtFWmFnYlNqS2lXYnJQdmpkWTlmRGorMTFYWm95YndYY0hrRDhYbVYzNFJD?=
 =?utf-8?B?VkhibUFPbTBBbWJma1ArTmFSS2xjRHRpckNlS1FOMHRXS01zNVhMenpkUU1M?=
 =?utf-8?B?eVpaMkVPTWlocnpVSkUwaXh2VDY3SUMzQVpFMEh0SDdJdFJDU1lzTTZocFdH?=
 =?utf-8?B?YVg2OWwwMHAyRSttVDdxNlE4YnFQOWdCSFNkVDNINUwyNTluZkQzOHErcWJS?=
 =?utf-8?B?Qk84Uk5Xd0IrbWlXWlFyUWJ4RnZhczlteG9Zbzl6NmZJT25zWXYvMW9sMERr?=
 =?utf-8?B?ZW5zTUdPcmRtY2xONDc2MFpXbUVjU1BOdVJSazFsd2pyWlJsL1cxa1ZXNTg1?=
 =?utf-8?B?SHdlbnhEc1hkUTR5RjdoZ2ZpREdJSjliNW5xeE9sKzZZUDlGN3UzUkQzRVBV?=
 =?utf-8?B?QXJBNTVpclZ4enExQlplSFNwV1hiRCs2eGR4ZDI3elRnZUNCK2Vwd2w1U2Z1?=
 =?utf-8?B?ZGFmTmtBbk52cmU0Njlpc2ZhNGNBSkJPbGZtQk1jaGczdlJ1RGUyZ29sZ0Iy?=
 =?utf-8?B?SkFvcnlYZHVxOFd0QW1pM1VOZDFrYXVTSGZvQzRzUWN0dkdyQ3ZvSytTYXBT?=
 =?utf-8?B?QjI4QkhGUEYvZlNFMGRUaGVoTnZobmdnLy9ZbHZBeVJTSVFNTkswRFhnYVZS?=
 =?utf-8?B?TWVWU0RPa21YNEMvWW5uY3Rxa2NGQWhndk1jemwxSnd5VHZrRzlRQ0hpU0tq?=
 =?utf-8?B?STNxQnFrZ3pXUnhncTB1N3ZNWElmMFdVS3FkTTNrcDlsekhlK2VhelV3RXZz?=
 =?utf-8?B?UUJyVmhqTTBwVHNGMEZQZ1k2V0ZabkpkNUxvOWlWYlBwam9zNEJRVFpJRlZw?=
 =?utf-8?B?cWJiVDNGYzM5ZUp0NTZ2LzRzRmhndHl1cjVyYnEwOWdHblg5MGxicnUwVzNp?=
 =?utf-8?B?UXBCTFRDZzAxL3Q4dUZSdkFpanY0MFpNbkFTOXVLK1RzNGNzRFgvSHRkL3gw?=
 =?utf-8?B?TXlqZnI4alg4bXpFSm5LRVhWdFJhTVRGNzUwbzI3dkQzMFRFY01MSklMSzlw?=
 =?utf-8?B?QjgxenRta0hBOHJ0OUJDZDg3YzJCc3pXZURmZWFzSTIzcnQ5ajRXQ0FSOHlJ?=
 =?utf-8?B?akZFT3haZWRLbG9HQXVKb0ZmWndtSXBWVmlGTjNET2pMWXJPekpyWEUxRGdl?=
 =?utf-8?B?M0JvV2IxenBTNXNLcFdzMzhqWVJpYW1kazdPQU5NeS9FVzRvazR0TGVjRUkz?=
 =?utf-8?B?THRqSVdLQWFTUS8zVklSQkViR0tQRzcyY1J2R2ZKWURiTjZwai9kVEtmckhr?=
 =?utf-8?B?MGRwd3ZKbHFweFVCb1dSWWo2OWVrV2NlMUFOL2ZHeXR0SkU5MWQvWkxBZXpN?=
 =?utf-8?B?TDR6OHdqRUhEKy9WUHducW9TL3JiVTBLN3RGWWRDVWlLbHhFNUJCbHIzSFFZ?=
 =?utf-8?B?Z1ByNWZaWndTYWNKdkl5WHYvcjlEZjdhZ2g1dVJ0eUIzWGZsVFh4ZU1GRlNH?=
 =?utf-8?B?VTVIbTZXT2hnZncwR0l0QUhOTEwwMnJWM01HRFFvbkRNV2MvcmVUUnVWMjFx?=
 =?utf-8?B?MUkxVmRWZnZ6eDdGV1JEeEFYWlFPalNaZ3RTdVRUU1lXUURHSG1obUNYRWl5?=
 =?utf-8?B?eXJyTTlkdzloL3NoemEvL29sQkI3T2NMNlhUbW9PcFl0UzlDMCt0dzZsVXRI?=
 =?utf-8?B?SVdTVUZmcFRZTHZsNVE2a2pTY1AvMGtkalo1aCtwVGIrc3NFUU1leDZjYmxP?=
 =?utf-8?B?QnlQN05wSHN6eHhFQW9ZKzNQemF3T1UxR1hKZHAxQ09PeDIvOFEwdDZsNllH?=
 =?utf-8?B?N01NR00reFdlRHREb3FqUGVDdklzSzBlTlB0ZkpsKzFueHh1ZTQrZWR3dW1S?=
 =?utf-8?B?MDEvV1hLT0x0dnlVd0lpeEdlUEtwZ0FkMkZyUyt6V3p4cGE2eHdUdnk5OWpN?=
 =?utf-8?B?a0JHakkyaFYwTlBEeG5LZURqbjVXNlJ4VUZKMFhBcVNOazlWOFRWWUlaZDg3?=
 =?utf-8?B?Nnd2NUcvMkg5SlFBcDY4cWQ5c1NPMi95RU5PMHlvdjFZaXVudTAxd1dkckdo?=
 =?utf-8?Q?xS25+3ugdYtG+9fpprLeqNOhE+TpgDT0wK0eA8pgU1MW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1RRDgwWGNXVkdCaytOcDh4VVVMOWJuZGVVNEFPRWRQMTFFRDhRY3AxYVc1?=
 =?utf-8?B?OGlMNUN0anFXbDFsbFlRcjRVZXN2cUpzVUVsQm85YTduTU1uckEvK1RNWlli?=
 =?utf-8?B?end6ejYzVlR2MXVrZk55QzdsdUZUTjN5Q3BGbFViY25FWHhVYnVHLy9iT251?=
 =?utf-8?B?VmhLdkNqalVDaFR3dlJ0NHdYOGRleTF5YzV1d0JlVUwvM1I5YzR6N2EyY3N2?=
 =?utf-8?B?OEdsOXVZMklHd2huaUZ4Qjh6SmtOT01HclJBM21LUHFnV2dSZEVJUGRIWWh1?=
 =?utf-8?B?c0lrQkJWNjBPTUFWRkRhNGtFQlBLWm9oenAwNXk3T0c5WndvcWtzUFRnU2l0?=
 =?utf-8?B?N2VtWmVxelEweU9ZQ1dDdzdPbnFoT2lpaG1Ed1psSlRqTFQyc0ExNU5jRHZ6?=
 =?utf-8?B?Ym9LQUhhaGxaL0lyY21hai83THg4QXBIczdta2Q2ckhBVjlBK2lQS1hqdlBn?=
 =?utf-8?B?eStUYmg0WDNFTWxuYUxvazFkQmFzeTJiOUpibCtZQWNxaExXb204VVVWNlEx?=
 =?utf-8?B?L1Mzb3ByVWQ2NFl3dmJpbG8wUHJuajh3WGZab2hIQUc0d1M4Q1dYYXExa3JG?=
 =?utf-8?B?NW5EOXRPdUpNbWFkbTlvK3JhQkcwdEVERkpJMmRZU25lOWFTYVhSNERwd2NT?=
 =?utf-8?B?Wm9tbmxLZUl0UHNwVzZEV0QrWlJiUnNrWW9nZzdHdEl1ZUgrNTY0c2RPOHN5?=
 =?utf-8?B?U2pzUmIzRVJZMHQxUC8zSzRoL05DMmVqb0JKalg4QndjOWM3M1F1OFV4dXpN?=
 =?utf-8?B?UzJMR0p0cms2MmlFUk4rYW9CWUVnVDRjS1NZOG1DdCsydjRySlV6dGRJcWZk?=
 =?utf-8?B?T1dXUXg4a1BSNG1lQTd4VDh4UVQ0eXdhTmNuZ050RFFqeDU2LzV6ZERkNmlq?=
 =?utf-8?B?dEZiOGpPZURFMlBtMTZlMGtMdU5mRUNVWWVOZ041WHRneXVSVUhzU0lGMmZx?=
 =?utf-8?B?bzFSc2JGeTA4b2Y5a0JaN1dJUUZFNGNtaUYyMTlEV20vOFlGUW9lbzBOaXFx?=
 =?utf-8?B?U3MyOUs0NnRTQmtneURsQjdMYWExK2R2VVQwcHYzcDlVaVUrQ1NVRWNTampC?=
 =?utf-8?B?VWR3Q3plRWp3SXl1VEhhK1VYdzNIZnJJVVlYc0VqUCt2L0VadVM0a21HOWJh?=
 =?utf-8?B?Snpuai91Qm9KQTFDOXh5L3hmRFZPNmJFREhoRFdJMTUzTmtNUGRCRGE5NFll?=
 =?utf-8?B?Rm9pUmFQaGtsZC8vNURzY05MNmVpTHd6N0lXVEtJdzFWYzh3T1ZIdXQwWm9Q?=
 =?utf-8?B?TUx2NkdORnV4TTJxRG0xcjFBWGU5YXFGR0lGYnk1UUtyUXVxUGREWXNEMW5E?=
 =?utf-8?B?WWFENm5XT1RwMC9lS05BTXdTOC9TR0Q2eHR6c0c4dEZ6YUhEcWpoWXAwbHdD?=
 =?utf-8?B?TzVmOTd1eGQ5Z1RJUTVzaWFLVGg2cjM2YlcrdTFpSjE0S3haNnA2RWpyQ05P?=
 =?utf-8?B?N3ovRXU4SW13S2JpUEU1SXBNdjd1OTlvWGxKeTFTUm1vUGJ6bG1jRVdhcDJj?=
 =?utf-8?B?ZkxKbTVxSlBSMzlZbmR4bHVhV2UwVHhFS21KbEZLa0RnNzllSjJ4Y3F1eWlE?=
 =?utf-8?B?U2ZnRThiZjlyVHMyZTZKaENrbnVrSll6NTZIelhmaDFwWENUWklVT00yVG5Y?=
 =?utf-8?B?QzEzS2lSS2hWdkxCYUpOY1hMRFJ6MDY2bWtQRWR6VEppWTI3SjdmaXJ2QXJZ?=
 =?utf-8?B?Y0Ztb1NSNGd2elExSWFMWFFBcEFwL0x5SEkvWDc0Um54V3dlNkZuQnlDcWJG?=
 =?utf-8?B?ZUdWVVExWDlPZHdobi8yMzU0bzgxUU5uWlEvTUFvdXMyRExiWEo5eENmSGVP?=
 =?utf-8?B?RWxDSE5TQ05MY0g3UDYwR2pISnUycnArSDJsenRSMXE4SjdwUW5jdXBjRlla?=
 =?utf-8?B?d2hNWGZtbDVMY1o5dld0UWRtUGVSZkF3UE0velZwcGY4eXhTYitxWFZaTFRw?=
 =?utf-8?B?bjZ0Rm9Ca25QUzU5YlEwTks3b0VURDhrMWtHeGhFWjdNYnJvekY5eUJpTjcr?=
 =?utf-8?B?R1VWNVJyb0Z2bWhpVE1ObXFkbFZiWVJON2hKU1QzekpBWE0wVFNtVXJ3SUw3?=
 =?utf-8?B?a0xQdG82WDhXZHp2dzVNSU5nT2RiYnVPV1JESGNoWVo1TGU1M29TSFpYYlR5?=
 =?utf-8?B?WE5TdGNibDhPMXJLaisyLy94K1FFK1p6ZGpEdjc3N1BDejhtaVdsQXA5SEZj?=
 =?utf-8?B?VmpXendYWUhjSTRvZ0JEWWJ2ak5rSmIrK3E2K2hSNWZyZUd1R3ZsUGhISW5F?=
 =?utf-8?B?T0FnY1ZqOVFKWDh0TXd6ckhhSW82M2tvM05Qdm0zUDNOVUtOcDFJdEtSeTFZ?=
 =?utf-8?B?N3BUZmQrbnIrVWJFYit4Unp6ekgyekM5TU91YWRjM3l1U3kzM1UrZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aee9bde-d9eb-4c01-a262-08de6318e8e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:39:37.2928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2bxf17DKhGjYo3VJtj58hVqHewZhmxdSf87hfJzXoWY3acS8TBZhGW2HKsAwZdrdn/9NUBZ1AqQ8+n3k6EYjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055
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
Subject: [Uboot-stm32] [PATCH RESEND 11/14] pci: layerspace: Add missing
	header files
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,nxp.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 1B648D87FD
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

struct fdt_resource, u32 and bool types are used in this header, add
missing header files following "include what you use".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pci/pcie_layerscape.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie_layerscape.h b/drivers/pci/pcie_layerscape.h
index b7f692f645070ad594585dd177df9c66a55e80d2..d5f4930e1813bd570a6d5106c11f2ceaa74bac2f 100644
--- a/drivers/pci/pcie_layerscape.h
+++ b/drivers/pci/pcie_layerscape.h
@@ -7,9 +7,11 @@
 
 #ifndef _PCIE_LAYERSCAPE_H_
 #define _PCIE_LAYERSCAPE_H_
-#include <pci.h>
 
+#include <fdtdec.h>
+#include <pci.h>
 #include <linux/sizes.h>
+#include <linux/types.h>
 #include <asm/arch-fsl-layerscape/svr.h>
 #include <asm/arch-ls102xa/svr.h>
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
