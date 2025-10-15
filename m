Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF6BDC23A
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:19:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA8C5C56618;
	Wed, 15 Oct 2025 02:19:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013036.outbound.protection.outlook.com
 [52.101.83.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCCF1C56616
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxYPAR8CEQT7QNPk6I9ea8oI7fF0IzsCbQ9NXK6mceZwQL77X1R05n9QyYHlCVb63Xr0rhOjb858m257Mp4FygIEC8xxaKbmov5Zgrw6CaRxVmrSpawlXylDSs4DuPWcic1RMCtD4eM2LTxmV1DnbgkXbCNUVbdET0EFOF5O+7rUS71Y9hfrV5PV2/xdijdD22OlYskOTul3pHSFQZJnzPh2zq2DUBsEe7/Xo6FXpe26j4IfTfX9kxCNuwt4cvr5daPQ2/cdKUQz+W9aUT7XenOXo7O8VjrUl4EGQum081mLiCIrqci714QFnZBYdjISwdQEkcxoruP+LM4JwYakWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCE8hrs0y5nmvebkbgKE2fSLvVcSMpMXm0r9sWglbkY=;
 b=qDIzpmiNhJ9v2qqANKR1594a/NRDgDe/Rtvokev8SXFNngSHQ7WfvNtWlh5HzHtE2eWyVR7q1+/S3cJSvSANnSQNeuOd/9L1ehwKthssFDIAq1B/wFqoUNa3tcUULco7JEi+aZjeqHn81sSeW0z027lzy2+nBrZA51oLsiFrTQQeUhqgg0urkp2AEZ2M4IwPALZbUDgrw/OuVv3wHAtnCeEHnlLBmhcNTCqxU3DIDOUun2oy1O81ZRzri43bhnhvtMngD4t+cnBvrHa/EGNQADjaB8JleTJin7Y3+kABlQvt1s1nHuBRe8QV3ux+OddmdBDYOhQt+IgYZcjB1NgDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCE8hrs0y5nmvebkbgKE2fSLvVcSMpMXm0r9sWglbkY=;
 b=vQy+FkZhjwZiSI/qA7VA3eqTW0ilZ+HjFv7mMPpZPSfG98ODQPLq8bjz1tYEoOBYQzAbV/5iXCT/ljWL7ekZ9G3CSNq6BpRaCRXdejEIAkRGGkTVLLMUpndLbqlz1nI6qrDKU902F7h5rCpEll0636T3m44TgnhBiUSNbXYJLTs+wrwoEVjTbQQrEVNi1Yy1v3U0Fyo7TcavXo+Y0qo3WJoX3YqRL0gU/01CVw4oxD90fcsuHKm7ljUu9aLKOy8ois6F6yJpdd/fE1xLGgymnGFdHZ9riUIm3jOZih4leHRFnbb20kQ+5fiwO5pGYXkv8XJyzQ8F7fq7kqLD2ETawg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:34 +0800
Message-Id: <20251015-imx-rproc-v2-9-26c6b3d16c35@nxp.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 2721c563-66cc-472d-e235-08de0b91322e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmZLZDQwVE1ESGRERVV1bEJKbHRreFVUQS8wM1ZsVk9NcFdYSmVpeW96ZzFy?=
 =?utf-8?B?eWJzc24vdUROZlBMMnhNd3EzdXFrYzhLR2NGMS9xeEJtWVpkb3p6WmhFV0s1?=
 =?utf-8?B?RWg5RWVLZUsxbGpKYkVLdncxWUJ1VWdmemRGY2UxdVZ1VTlIWWptam5ybWVW?=
 =?utf-8?B?VWtRQmZSYlVySVpIR2w3SHJtdThESXhmajhYM01LZCtjYlZRaXdVVXZkcUl2?=
 =?utf-8?B?S0RYUzhhdHBZUW9rWjlUOXFNM1pXNnJpa3R5UTRHWVRPTjY4MEcxaE9Eek9q?=
 =?utf-8?B?djNqUnFTNlYzOTVyZ2g5NncydFJMWWdvTlFzVW5GMWxpcUZ2TFFKd1F1VTcz?=
 =?utf-8?B?ZVlaNW9sakFreVVnQUZnbUVuQnBCVkxSVUU2Zld2WFplcDdneWlnY0NwYjRo?=
 =?utf-8?B?UmkyZ1F5cjgxZHZ4bTVnVGdnTDhCOFRuSlRjZWVGOVl4YnhsOER4TlpyZis5?=
 =?utf-8?B?WHdCOW5KamtvWnVhYzd6MCtmUWhkYmNWRkUzN3hGdUFkYlR6Y1hxMzlmWEdX?=
 =?utf-8?B?WEZZR2ZuRXNRdHZ6UmkxMW9aS21zWUdCWGowdDJVcWViZVpGQWc3WkxkRGtX?=
 =?utf-8?B?VkFBM3Q5Q0hJcVJSLzVZZUZRMkNQVHdzOWJ5UklEdXJYUHpabzFicFozb3hH?=
 =?utf-8?B?c0wzemNBVFE4L0pmK2hHV1U2d1J0NjJyZjdmVHZ1UDdDZ29RZ0dlUDIxYXQy?=
 =?utf-8?B?V2RqUENONlNFd2doUVdIVERTY2dIZ1dSYTB2bWxIeE1lME1MT1BHNDFTQVc4?=
 =?utf-8?B?TnhVSGlZb3JNc2ZEaUNGcVllYzV4aGQyUS9aVEwrYlZRYmh6MHNWaTE3MmYy?=
 =?utf-8?B?NkJHendWVjN3VmlPa0hvQmZGT0JQMXBPdWNueWIvSlpEd0h6L1VidUE1ZFFz?=
 =?utf-8?B?K3gyR25pZXBqYjQ0aFd5VlBCVlNlNCtzWDZtUURtaVNTTXlWSmVsZTdWa1Ri?=
 =?utf-8?B?d3dKYmVHNStPeWxOV1pTQW90Sjg5SzNJaWlKWHZFOVY4MEFhbGI3bzRObUV6?=
 =?utf-8?B?dC9BM1JFMzNuQ2pqNjMwLzJRYXJpU3YyeXpLdWd0ZWlCMExySzRXK2hqMGZw?=
 =?utf-8?B?V0duUmhjWkxiRmZJanZQNmdoTTVKTXFZaFdZL1NsVm0vUURSK3dCazlQNXpS?=
 =?utf-8?B?Y1FJdUsrTXJqbjVQK0ZNZG9McndPZCtOeDBIY3FPR2grbkY4YXAxcmJQbjNC?=
 =?utf-8?B?R1NxWGhwbzZMM2w1em9lTHNZZm9aM2ZRWDM2NG1CMHNmMHkwbmttb1BJSDM4?=
 =?utf-8?B?dHF5QlBxbnpDdGpZNXBqZUFQeGh1dWVpbDRET3ZyN0MvREJKSGZuazJSS1Vq?=
 =?utf-8?B?QlZtaFVabGRUMy9xMDlZL1l0NWkvSjBGRm5sTkpWVjJSc0RDS0FRanN6Nmo1?=
 =?utf-8?B?MnBFREh4Q3lJRkFRY0VRb3RGUmwxaEJ6MWlwSXlJK2tZRzNjZFoxelk5QStN?=
 =?utf-8?B?aEJ0VFNEaHBUd2VmMldqaWZ4aUVCbnhnUTBtM0piN1BXNDlqQ0FqcitQcUhC?=
 =?utf-8?B?Z0Y1VDBDQ1ZhRGRLRXgrVWJoSVNFelFQZmxvMEpLRjY0MkRpbE53bW8raW5j?=
 =?utf-8?B?UWY1b0NZaHY2NHhNNnFEVm5abUp3VnlwUlEwTUdXWTNXQVBBeUxqVzdQZlFt?=
 =?utf-8?B?VEF6STNHM3ZRYldTd0lLY0UzL0I3dTdkYk8zaU1NNzIrMVl3QjR6QS9uck5r?=
 =?utf-8?B?NjBVR2tmdmJ0NU5pZC9GMGJGTFpHU1l5OEIvK3o4RmR2YjU0ZDU5WjJEcFI2?=
 =?utf-8?B?Q01CbnI4dzJhWHFUbExiand0Nk9WT2NCdXVHbkJvakZDRkRlckRUYUFZRDQ1?=
 =?utf-8?B?OFhLZm4yTlBvWnNvWE5BTkZocS92L3hFS1h5cDZNdytGLzlENW5CNDdGK2dj?=
 =?utf-8?B?c1VkZEp6SkRMOS92NEUvN2RjWVNsY0lxb2Vzcjl2WW9Bay9OODMwTTY0OG1K?=
 =?utf-8?B?bjVJVWdPbXFDeXBIQ0ZuaWxUdFJxS2NlVEQ3amhhSzRZalJSb3RXNU96Uitz?=
 =?utf-8?B?ZEVPamM3WDM4SWxDQmFkZFRHNEI2MVNrVndtejdvd0theHhjN3VnVEE4bzF0?=
 =?utf-8?Q?480aEa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STJBZEZGbFp0enA4dk1FejhubTc2TXg5anViNjRFQ1VaOXlDZkxlSEgxZjR0?=
 =?utf-8?B?Zm11TDZLR3piazF4dWw0ZVAwMmt4Mlk5QmNZTEQxR2RjT2ZyeVNVQStzT1Ru?=
 =?utf-8?B?cjhUcU1wWndUK1hCdjk3VEV1S1luVmVDKzFDMCtlSTdXZE14Si9SbnZ3Q0NG?=
 =?utf-8?B?N204anVndHd1MEh0Y21jYlZIbHl4QW9OZ2dVZWJ4QkZWYnI3aHB0OXBTODdj?=
 =?utf-8?B?R2sxSVBnN24zZVFNMEZUQUNzYnd5eVhHRzhHeXdrNmRmS3BuQkdsVm04UWo0?=
 =?utf-8?B?cXc0eU1jVEc4RGtFUUJUSitrRlZTcVcycnpDV0Z3dU1kN0NUOVFoMmlmRzRZ?=
 =?utf-8?B?RGlNamZuTXd4TnJSZHBpaUtGdFVTbnp0bE5Fei82TjZZMk54aS9TQVR5cHdk?=
 =?utf-8?B?MHhwVEEyMkFabFdIR1dDQXRIT0RBSVhDeGxGQ0VHb0JDRU1ZeUZ0QWZPdmlk?=
 =?utf-8?B?RDM1VTJnRlZvM0t1aEFmK3h3WFRqZHdnREQ4N0t0d0VERjRsZkpvMHBwRzhw?=
 =?utf-8?B?WlpEZFNLM0dGM1ExalZOVkdqTFhRQXRmY0QyRW9rOTMrSi91THdUQWZ0WGtr?=
 =?utf-8?B?dnpZQ0NqdTQvcFhYVVFkdjhic1JGdFVDa1lsQkNHd3EvRXd3M0lHK2E3RXBC?=
 =?utf-8?B?ajc1dUlQSktYNEZ1MHVCdkdDNWxyS3cwY1VqTWhsVnkyV1FEZUMwYjhFNUpu?=
 =?utf-8?B?U1NSL1hPbTFUeGxzK0NwanZFeGl0enErelBoQnBOcXpoSFJ4dnRHVU03MzlL?=
 =?utf-8?B?Y3J0TkRwdlpHZWlMY0hWdnZabEs2NW5CYUtyc1h3MURoNmlCRTkvbmNzdkZJ?=
 =?utf-8?B?YmhVYVExcnJNSmJnWjdyZW5uUDlhUy93S0hCMmFrQnN0b05HMlllUVhzdkdm?=
 =?utf-8?B?dS9PZEhHeEZvNFpiNERya1NHSE5vMEQ4VEh0Y1lnMjYxbmJmcGtNNGVnZ01n?=
 =?utf-8?B?RTZoNlpyZFRjQnRPL0kwaURFQVg5eHNMSTFQS0V2S3BKcEFEN3JsNWs2eVFy?=
 =?utf-8?B?d2RiR3Z0TUFMRlVtS1dKRkMzUlZZVE5hOElGRytNMEsvU1cwRDh1ZUpBNlEv?=
 =?utf-8?B?U0tpKy9SZ1VRZjBNenVCazlCcmZPNzltZ0lSOGJROXlkOWI4ZzhtZzdvbU5o?=
 =?utf-8?B?dEJ1ZC9BNG5KR3FNZi9KSjhDYlltRFFQT3E1b0l2alVhWkpnbHRHV2U1QlpM?=
 =?utf-8?B?eXIwL2pmc2tWRnBSSHRVcVlqL1Njdlo0cHJoSncySzZEYUlndHNWQi9YdG9V?=
 =?utf-8?B?NERaaEVqWUtLYWF2cXBHTTRUaHZqVHFCOU9uN0lrMzhQbHcwUXBoTVNDSmZh?=
 =?utf-8?B?TWIyUlpDYXpGU2FLK2dDcG5QSWsxV0RXVktWZzNnVGszWTAxZFVMeC9JL1o5?=
 =?utf-8?B?M0dPL2tESnZRZloyUE5UNUY5WDcwRzAyRVpZT0FpNDRSTGJYTHg3MUJWNUJB?=
 =?utf-8?B?QnNmdGtPSlV2Y0Zrc0EvVjRoUVM4VFRzNXN2SUJUZXRlWVFzY1pjTTFiRE9x?=
 =?utf-8?B?M0F6aWRNcG9GSTFac1NUcEY3SWk3V1JEZkxLVjlMZUJZaG94N2I2c2czTlJZ?=
 =?utf-8?B?Z01WM0MrSnI2K0w1WFdvTHEvclB0TldsaCtkeWlESVNrUnUwSDBNQjFqNmgx?=
 =?utf-8?B?MTdaNy9ZTm5TdzlaTmczMmhaVHdnM1dCWEozb0JWT0hJSHhTbUhQdDhoTStl?=
 =?utf-8?B?a1ZVRlVnZ2dtcjFaQTZuYXVqWlA2Q0dEN0RDTWw0UER2Um9YcUFXVkd0bVFD?=
 =?utf-8?B?TGZ0T2YwMnl3dkgvODFLcGdScnhrbCsyU1NwakpHVjU0NnBYam9uZ1VQN3M3?=
 =?utf-8?B?a0o4OGYvRnNxQkZCK040TGdmSWhLRndJeWhaWC9kSG9sK01jZTYxdE9ZNlo3?=
 =?utf-8?B?bjdXYSt2ZEw0WTBCT0VRVFRBL3RnTDZDdG5vbXBoZUFhMVd1bjBubEZzcGFh?=
 =?utf-8?B?a1cxRkVraFQvb2UwdGYyd1lXaGlESVAyM09rMFpwcHVZSjdSUG5wZEVOeE9B?=
 =?utf-8?B?RFZzMTlrc21heFFhY1BMbzlEOVk0S0FvOG4xNitMMTZBMWdjYm9xRUxwRkN6?=
 =?utf-8?B?L3pDem15OXdWY1IrbzlMaEoyZmpMY2xvb3hJYTBHZEsrZFZrM25VQklEdXd3?=
 =?utf-8?Q?rNLhsA8eibBIiD/J0k/ksVo4b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2721c563-66cc-472d-e235-08de0b91322e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:57.5485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAuNeOsHELzUAH+V/C52sxFDc9T+ntdtF5JL5GRksqv+a8icxCdhj0CTPQZvH6cC3k9txc+Bs+Q50T/9pOIVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 09/10] imx8mq: Enable remoteproc for
	i.MX8MQ EVK
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

From: Peng Fan <peng.fan@nxp.com>

Select configs to enable remoteproc for i.MX8MQ EVK

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 0584dcb580fd4b25582b26b899c70f3cb78a3858..030ed2f0633212499bf74f232e9bcd19d9bcd86f 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -67,6 +67,10 @@ config TARGET_IMX8MQ_EVK
 	select FSL_CAAM
 	select ARCH_MISC_INIT
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
