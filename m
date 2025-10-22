Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3ABF9856
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE66EC5E2C4;
	Wed, 22 Oct 2025 00:49:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C94CBC5E2C3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbO3jT8klzxd9e79HiSYyjxiP5aNAI3lrgpUfBDOvhwzmIDiWMb41MhMK0SVb8z/DKNiZWGzIOPtchan9TrSZkR2TNiIKTG33bDXgpJw2xkecasJPY4k4HT1hQlvD4MRvkiqU/VPrVhRcGMJE8+w86kAsM2lD1IYzSQAs02s7pUvfH5pD80P273relBVjlGzI/1IzeFRMCxhHqZTlmlJptRJcidaZqdjGo+2LM6rWwQBThBDAjh0mBVqk22rWoxANsC1pSF1UdSUVgl3SfL2pm6rZj+I484u5kzMFu8JD3VUBkVswawopQ0FTxZDIRXCMaf0mfR86ilbcv+zsP25Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYsFvX77zE4rvPThXJXMkGTzc1d8BHsBvlQovCR+fiU=;
 b=gt+aIedHNSJcUNDiLdtPEEeq6HV6SH2sL5RWqXHbG9ch330sIy1LGcf5p01YCFwLfr495gk2WTGeBoi0vL76b3DD8b+Z/HH/rguzRFW5WlF0NOdr1Wwe9YlLde0Y0zYAXANicPKVZ0HMdcnSaohGhsY8WZ/mXD3fbUvSzophbnqItrDyyqRkw0Qv4o37h2a6B6itPnFfTiNs6YtJNrZkDoDNGZlao/+oZ2gczdtTNnXDTCf3kKwKMOEoB/1ujrIciy9tyOkB2M4771KqMN3rXlA0zobZNm6ZixnBGzx1Xtd6miIpUlYvvMR4aCLtwcUvNgQEY7C+vKmDNuOX8ibLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYsFvX77zE4rvPThXJXMkGTzc1d8BHsBvlQovCR+fiU=;
 b=WtbbneuL4SF8AjEmLgW+eZiEKMMEDlYU1Iash3S1ku/nKcibJ0zr3lnePvN8ugw5oT4NO7fIT1kuMe30hA4G7RGXdQ/0pJDSXy3LoGZQaxuii5N2WKk3S0xrtAPihFDSXZFBz3hcTUbwsjVaR73zGHpUDAsBcaUaZeH0fq14z72B34FZE3sZ2PtHdmzFuKC0eCQf4xUz929F4fkzamJXdWGuRuc52mPO2RuuJjRu17jJfb82BMUS0zyDdI0InEwQiNHBzMw7TUxmUWwBXkpWyAPf6ZG033EKl3t963bAJ3nBNOJGaQ2gNIhL2jTGF1Z7opt0dEB44nsJ8xK0ygNmAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 00:49:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:08 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:29 +0800
Message-Id: <20251022-imx-rproc-v3-v3-3-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=5455;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=A6DJyNDuEqonQWFHhOmkJUDbQqSu5HBiUavYtJm86dA=;
 b=5Q4nWi7OSNNsBO74ag8yYCfpAY+CD+6qjapwX3rAQigQo3uJSk4JbjrazRzp7ZzWmO2okI6JY
 vXgqCBL4QEoDIIBnCNcpJx3WqkEXTPcP9Y63UhFADBudRP5RUYIeYPI
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4f9c7f-7acf-49b9-9cea-08de1104cf0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzZBNllST0ZLcUtWcVB0cDNLdURQOUlxSVVaRVNVNEhPblE5TlV2TW05MlVz?=
 =?utf-8?B?WlN6MHMxVXV4SmozKzd6b3p5V09wcDdpREdMZEs1a1haeWxhWnBZWHJ0Y1VM?=
 =?utf-8?B?YVBBdExxNWpFbHBVNExia1pvSEtQQjJMdDBDakNxdUZWbmhzR0ZHcWIwM09a?=
 =?utf-8?B?MVdFZjBHTTZZQVRMOFVvUkI3ckJwTENxSTA0Q1BXK2x1bDVHQmtUWHR4R0pP?=
 =?utf-8?B?aFVFYjNoVTcyZ0tvN29hbTRTRi8xZS9qb1lGN1FwamNiU3YxNjBWRS9ZeE1J?=
 =?utf-8?B?c2NIRDd3Vm9vTU9mYmtYZnQ5VWJiQVVwdHNlU2QrQkZtTzVUUVZqNEJacjhJ?=
 =?utf-8?B?N0dpOEd6RDNnSDhkODNLc2RMaENKY0JvNWNyakx0ekptUXROR3J2M0h3dW5Y?=
 =?utf-8?B?R1VQMm9CWmRmdXZIUU50NDhWNVhhZEJnQ3paZHVBTlNqOVZyRG8xV3IyYnZa?=
 =?utf-8?B?MDRqb2RwbGhwSzByQUpPMFdTSjJwWXhuV3Q2cDVVcjBscE1rSlZZUDliMzdB?=
 =?utf-8?B?eEVRNWk0Q1hrRm9OOTd1a1pDK25DNzlKUmU3T2pJZU00aXZvbVQ5UkgzTU5k?=
 =?utf-8?B?WGdacUVpOTQ2amJFOXg1eURMMHJTWUdDSFQ5RGtlQXhPTmFrTXBCL0c0bGIr?=
 =?utf-8?B?MDRQSHo4YlJiTVI2MnBKNEdXdExCUzV6M2xyOG4zNTJ1eHNwaUlrSzlHbTZL?=
 =?utf-8?B?OGRSYXZFanBzaHdnZFIxclNwb0pudFJpcTZwUVZSQjJzUEpDN2RDZGVORWFR?=
 =?utf-8?B?dS9ZdGV6eVREeDlKenczOWZuQVZrcFpac0tpMld1TU94elQ1cUlaSU1BM1JG?=
 =?utf-8?B?NnpsZ1BWcGpDNTR0WG44dTNJT3dhMUFjQ0RpYWpkLzVZNy8rTDA4WjJYU1RI?=
 =?utf-8?B?bXo2OUU4bnJJdVY3ZGcxUHRUSThwUmRzL0FNMXpBTkIrMXhEM3ZiR3BQWTYz?=
 =?utf-8?B?NWhCS21CY1RUelFkSWVnU25PbVNvQi9uK3I1UndGUjdZWnI3NnVNQjdSS0M4?=
 =?utf-8?B?bUYzRnJ3eEdreTN0VTJES2JwdUFGWmQ4V2srbXZqREZOQTMwNDNJbnpnenlJ?=
 =?utf-8?B?YjBtb2pVb05UQURCWjU1Q1Z2ZjlDQlJFaGZwZFpXV1N2dldISGFtcW81VDFM?=
 =?utf-8?B?NjRQb0hpMVFjL0RhYk4yb1hlYzdiUEdVanJXQnlzM0o0TVFTTHFrc3dNNGlR?=
 =?utf-8?B?a3U2NVRnSEhEbWlTSGR4RTczcnI1ZEFwSVVvWG9IaEdCMTRrUktjekFoQTVs?=
 =?utf-8?B?WW44UzFEdU1ERGxZMllwZ05FYlBCUXJCREY0a3d5M1Avc1p1clFvSnpBSU50?=
 =?utf-8?B?dkMzSzNSWjA4ZWpPL0FiUTExbDFHWFZlZGM3RHV2c25UZXkySmt2MWxSakRD?=
 =?utf-8?B?ZFpRQjZtTkNna0ZmTC91bStkV0w3REdYY2xuTUhWZ2VYcnMvTnlmdGpqcUNS?=
 =?utf-8?B?cStmRitRNWlMQzFORUFZdG1MeFVVWXdIRm5MUy8wMXdnUnB4TEhIRUt4L1Qw?=
 =?utf-8?B?WHk2UVhRT2lLYTV5cXlidDdpQXltSWRsd3Z4RGFZalRmeWE4QkpYYmU4bkVv?=
 =?utf-8?B?K2JYZ284WVNPTlMzSTNaSlVESFArWXovRjF1YVM4WU9WNk5Tc2pxSjhzV2Va?=
 =?utf-8?B?OVREMXBBRDdkdk5oWkxkejFLaG14V3FYYktyRDRodFRKT1UzQXhCcVRKeWZZ?=
 =?utf-8?B?NGMzSE9sL0lmY3gyRjF2dkpweVoxMTVzTkJqbzhJdmpleklTbkpEUHN5Yzd2?=
 =?utf-8?B?eDBvQk9rWVVjMUovUS9NTU1YaTZEL2grd05jUzZ3cENJODBHYnFTN25pbEN6?=
 =?utf-8?B?MnNzOTJmdGh0S3JRaGFxemtOa01BbGlsSFBzQlVja0hKUWYvcWs1V3czTXd2?=
 =?utf-8?B?MURkWVEyR2FzVEVkQ2ZwVHZKL1ppTVNGZHJaN2N2MWxuNnpWVmE2eDRONU90?=
 =?utf-8?B?dXVwNFRSRmpvbGVLMFVLYlRmNkRzbUtkbmU1OWV4L3o3YlFOMkFwU20vcVFi?=
 =?utf-8?B?NWhJMEkrY2loQTdHdzVnZ2FKNW9pRW5SeDJaNGFzakhLUzJDcld5R1MxeTZT?=
 =?utf-8?Q?u0Kieu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU8ySkxkWUpTb2hVNUhuZmx6bXlweGljNS9QZlpiMlhzVTE4dVRtekh3dWRY?=
 =?utf-8?B?Q2NlZW1yZFBuVXNHdHFTb2w5Q2p1UTV4bHBDU3llYnVOVTM0Z1A2cU5qdlJ2?=
 =?utf-8?B?WFljQVhBc21kTnovbzB0YlNFY0o3QTRkYjUvZEtIVytDSTNTdFl4MngwZFg1?=
 =?utf-8?B?aGhMNmg0OUcxVDBJdG9tK0JHcHNMcTVXRG5BaHJlRVBqMGIybnAyQXVUZ3hm?=
 =?utf-8?B?ZkdYRkthbXllQUdkL1hRUjY5YkhIeGFNbXJ3NkJDOFI3dTA4WUlncDBkRGNt?=
 =?utf-8?B?blhjRnhQUnBUbWNOTHJLYTJVaHltdGV5RW05ejRudy9SMXlCTVowalRyS2R4?=
 =?utf-8?B?dDJESTUxc0grM2RIaUJPeHRRcEZjci9oL2xnRVJTZnhOTVdNUXFlNnJncGhP?=
 =?utf-8?B?c052TFFXMDNDdjJ2Rk5iQTd0VFN0SE5PdGQrTGkwZm1CTDNvQVlMS251aEpZ?=
 =?utf-8?B?S3JjejZJdVErbkRJc1pISXdRWTA4ekxMQkxmNVR6Q1psMnZ4WStxWnlZVGRz?=
 =?utf-8?B?ZVlPM0w2eHhsVnBrMnhvSGtYd3RlMmdxYmRVRXpnYmtySDlXbjFBdWQ1K05K?=
 =?utf-8?B?RHBMSEkvMldPRTVweHRtbkgvaFZmaHNjYWE3VDNQdVB1Q3E5RFQrSThWTUVV?=
 =?utf-8?B?Q1ltK2tPVjBiQUhodG4xNmEvRU5qRWlkV25NbFZCWEdqVzRSWW45bnFMQTNQ?=
 =?utf-8?B?MGEva2NQN2tvZ2hYZ0w4cXUyYjFHb1R6RmRCSCs0V2tIZGk2dEU2cUhPZm5B?=
 =?utf-8?B?TldVRDNHcXBBTXptME93WDZVM0RET1hTZ1JOazV2REY1eldmbFFhNzN6UURI?=
 =?utf-8?B?YzI1STZ0S01ZSzZKVGdvSUdlaFRUMDFibGRUSGF1T2dBaGM3MDlOSDIyYzlI?=
 =?utf-8?B?OXZ0b2MraUR3TkMwZTJoUW83V0RxK1J0d1Q4UXpVa2tIZXhiQkI5YndjK0lj?=
 =?utf-8?B?OTUwZ25oaTVrTk1EZEllTXNwd2MxUDlCVDJ6aEx3YWhyT1k0eHlveWdOcDEr?=
 =?utf-8?B?THJYS25HaXZSVDlFSE5JQytMS2tqRmpKNG0vemRxWi9ZL2Z0UHAwcTV3Q0N0?=
 =?utf-8?B?U3lqbU5vbVpiUlJFZFJ4VUN3NG9jU2ZZK1kweXIwa3EvajlrVzYvN2FEN2JO?=
 =?utf-8?B?Ump5VHRCSzFFTW1lZ25nczlEeTNPc21MRGFRVTJvRE5QVGU5Qm9wT21NUFM4?=
 =?utf-8?B?Y3dBanhZNElkWFJadVdRWWJZUXF0OGdJQ3R5K3FqWDlzSXppUCtwWlpEa3h3?=
 =?utf-8?B?WjZwbHVQV2hHYWNLbmpSTTYrREV3Zm1LYUNkbHZWenJ1YkJQWER0MG8rZGdT?=
 =?utf-8?B?TUZDdEFyTURkdDBOR2R0UDh1T1VBZVZacy9XWWNDRU9IeE4rWExKSk5sUHhS?=
 =?utf-8?B?RTRBMktrK1VqRzFOK2dZeGk1c2gwcmdFMjRDRVkvdEJrQTJRQzZwd3F0TCtI?=
 =?utf-8?B?OG12aURwYTFrdWROeUxBRkxXaWJmdGxmM0x1WnA4Qm1zeHRlYWxKeGl1MkpE?=
 =?utf-8?B?TW11dUlsRTJDQTBtQUZ0YzJWbGJwYVNvVGFUTUpvSjJOcUE3cWMzN1hrM1Jl?=
 =?utf-8?B?clFWbUVnQTJxTmN0a1JPL0t0Y1Zob3dqWWVnZTBDOUtBaUhzS2d1Z2JFU2NX?=
 =?utf-8?B?ay9hcktlNGlyLzJGcDZTTXdoTTBtQ2dnYTZIb1JNN3JXYlREVE1EQTBzOUxs?=
 =?utf-8?B?T0JpTVVtQ05KRVgySzhWRnIvZDU1V25LYXQwT2VPdWJyU0F2N2d5bmc1eFpP?=
 =?utf-8?B?dlpsbllHcVZGNWxtY1JLbzB3cVdjVUtibkg5NzQ1WnpZU0UrWG1Oc2FnU3Iv?=
 =?utf-8?B?VUZPSTl4REtRaGtUZzBEZkdyZWMzVTlJMHVsVVY3ZEtTWFdMb2s4R3pxVG1M?=
 =?utf-8?B?ZUx4aTkvdXRxWlRrSXVaVzByQ09Kd3hjVlZETVpOdXhBWWFEeEhOZmxqMGlN?=
 =?utf-8?B?QndBc3RhRVVWQjZCNUVwcG1PV2pIUXJTU3JZY0FOTHFJU2dwaGQrOVhNL2tP?=
 =?utf-8?B?eCtrc0dnNE9xbUZJSklTc2lWQWxYQXlqN2dtTVRCZWJvK1gzNm5RWkJ3TElN?=
 =?utf-8?B?NVEvaFdOQTRYZXErN1NXUnNSQVc3UkYxaG90eUk3M2ZHUlk3N1g1UXF4K0c2?=
 =?utf-8?Q?eTUfn2eAQTQ9lVjjIDmcgKEPS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4f9c7f-7acf-49b9-9cea-08de1104cf0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:08.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/xAK9FOU9lpP8D6b7cbs1JO1yiQ9QAwr/rORQn3TeFIZnENGp7PzbmZV9TB2GKYQYccsF38aTywW+mU0RiHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 03/12] remoteproc: imx_rproc: Support
	i.MX8MQ/M
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

i.MX8MQ/M use MMIO based method to directly configure SRC registers
to start/stop M4.

Add mmio ops to start/stop/is_running.
Add i.MX8MQ cfg data, i.MX8MN reuses i.MX8MQ data.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 107 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a..c71e409a00a55179b06434dfa190e8eb8ba559f1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -9,10 +9,27 @@
 #include <dm/device_compat.h>
 #include <linux/arm-smccc.h>
 #include <linux/types.h>
+#include <regmap.h>
 #include <remoteproc.h>
+#include <syscon.h>
 
 #include "imx_rproc.h"
 
+#define IMX7D_SRC_SCR			0x0C
+#define IMX7D_ENABLE_M4			BIT(3)
+#define IMX7D_SW_M4P_RST		BIT(2)
+#define IMX7D_SW_M4C_RST		BIT(1)
+#define IMX7D_SW_M4C_NON_SCLR_RST	BIT(0)
+
+#define IMX7D_M4_RST_MASK		(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST \
+					 | IMX7D_SW_M4C_NON_SCLR_RST)
+
+#define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST)
+#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
+					 IMX7D_SW_M4C_NON_SCLR_RST)
+
 #define IMX_RPROC_MEM_MAX		32
 
 #define IMX_SIP_RPROC			0xC2000005
@@ -22,6 +39,7 @@
 
 struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
+	struct regmap *regmap;
 };
 
 /* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
@@ -38,6 +56,14 @@ static int imx_rproc_arm_smc_start(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 static int imx_rproc_start(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -65,6 +91,14 @@ static int imx_rproc_arm_smc_stop(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 static int imx_rproc_stop(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -92,6 +126,25 @@ static int imx_rproc_arm_smc_is_running(struct udevice *dev)
 	return 1;
 }
 
+static int imx_rproc_mmio_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
+		return 0;
+
+	return 1;
+}
+
 static int imx_rproc_is_running(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -171,6 +224,15 @@ static int imx_rproc_probe(struct udevice *dev)
 
 	priv->dcfg = dcfg;
 
+	if (dcfg->method != IMX_RPROC_MMIO)
+		return 0;
+
+	priv->regmap = syscon_regmap_lookup_by_phandle(dev, "syscon");
+	if (IS_ERR(priv->regmap)) {
+		dev_err(dev, "No syscon: %ld\n", PTR_ERR(priv->regmap));
+		return PTR_ERR(priv->regmap);
+	}
+
 	return 0;
 }
 
@@ -217,9 +279,54 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.ops		= &imx_rproc_ops_arm_smc,
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCML - alias */
+	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00008000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* TCML/U */
+	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
+	.start		= imx_rproc_mmio_start,
+	.stop		= imx_rproc_mmio_stop,
+	.is_running	= imx_rproc_mmio_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
+};
+
 static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mm-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
 	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mq-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{}
 };
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
