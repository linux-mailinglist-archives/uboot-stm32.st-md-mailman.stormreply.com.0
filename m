Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05080CA3BD4
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 14:13:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3380C58D77;
	Thu,  4 Dec 2025 13:13:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DB7DC3F95E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 13:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPypF3VDMndxTPG0+fdbIwcMamhQwA43Rnqy7vd5owl6CLI8x8QtYKXaha4/WtY79xZ4J7Z7ciAMcJkFDgGZVAWSHfoCsii9GMLmA37S2ER5rf9t3b/OVV1sqMXqqWlvpQ+sYFZPTMnyZH/cFmJX1VdRlQQJliNKSYAJKoaghIuyCeC30HnCCnotLRsTdKrN3TbiXCDYQSh1f/3bwqAkaZ2EaS9bi/lk8nmxKHCVn4XQ0COwaEJ/43O7fl/SdqWvzaXQiVfdm3h3PfcpRU95gfDJLS2AWFqSW0aNz69wpAK1EdHZ2+mBOrLgbbE39gKbbxG/zCQZRLqFuqypuDaPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U2oPWWx4AzY8wNQduzv2KG9uH6pzG2nxODaZkvlpyM=;
 b=gAo+GCGKIe+D+ei1oWI2hL1wyhVeuXDpv5/O1weDxx3oTfXj4hOttrlqRhKAe3qwiDBMcq8x6gTAJf+CmGSi/YnXUB4S4L4wTFZQUD/u6FuhcHM3LwZw0P+59P7IjFcuN5zW1JKXqYiA8/ruWc2s8GtU+MW49us0kA2QhKdAc5tVFJ7ZfujyeLdqHD68BDSSbOfMV5/FiBw8HG01yTCmX2SwYAKnUIjfG33oN8oMcDWfknZ1cWWnzVVp3Cf/xEjayaQ5HVxrS8CBQjHqNAYdd99CQ2fcOqsti5dez4SIZ6TJ/YaTyWJWC15Qu24Yfl5mwV/KJb45QUb0nWR10WZxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U2oPWWx4AzY8wNQduzv2KG9uH6pzG2nxODaZkvlpyM=;
 b=KPnivb5IPHUTP2pk4D7eyAUtWS/Vo8FxSXvXFtYXV6/gvvstQz/niMZGgN73GbX3pSXwj9fAmjYl8p1paRLPnRN78V0kMgSMf3svvIwHmXQe+KQ9bw4ug6M9t+mK7t5RxtBHNpESSVcU6UUudbt8nSPOHkvwmf4AOXoWkqzKDhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI1PR04MB7168.eurprd04.prod.outlook.com (2603:10a6:800:129::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 13:13:32 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 13:13:31 +0000
Message-ID: <68fd4327-58b6-49d5-9f37-594e16209708@cherry.de>
Date: Thu, 4 Dec 2025 14:12:47 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-2-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI1PR04MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: a23c056a-ee2e-4011-ddad-08de3336ebcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlRLUHluSWFLNmR0d0QyelBxYzNKVnU4ZHR6WUxoSGhnNUhwdE5wVlN2SjFS?=
 =?utf-8?B?a2luZ0xlbjVCYUJ4WElwWkpCMHp1a1dnVWFjN2ZxbnE0UUpkZ1M5OGsxaTNr?=
 =?utf-8?B?TEtvYUhtaVpOV1BVWTVka2lnNnZNa0Nlb3h1dDk3b3FPYzVHdDY0SmJ3WS9C?=
 =?utf-8?B?U2dzbmRibWRySGM5d3Fkb3hKTHhUWFo5UUkwRVdJbXF1WUN5SlRlQmdjMlVr?=
 =?utf-8?B?SHpJOUx2clljU3EwWUhMdmtVN3F3UDdxdkFZdVVKeGpqaUcvNjk4aytYblRQ?=
 =?utf-8?B?ZVE4Nkl6eW5jS0Uzb1V1QWdXT3h4Ti9DQ0pZMGRxMEs0N0I4aTVOUVlkUjQ2?=
 =?utf-8?B?SjYzREdPQXBBR0wzclEyVEJ3QVJxTU9uTjdHS3hWbFJRUWpiQ3RTOWQ2MnFB?=
 =?utf-8?B?bUFyNTdaM2RRN0psQUR1ZTBSNnBMYWVCQ1Z2VG5QN3dSNGFRY2ZJRW9zR2Fo?=
 =?utf-8?B?eFJjdzFIeEVKVGk1bm0zSDg4WUJJT0dyR1kzaDNMLy9WeWw1S2hOMGVvekha?=
 =?utf-8?B?NDA2emVXL05xWm9zUTRBSDZnaW1Zam1jYTB6RWJJZGZBT0ZjSjA2TjR0anBr?=
 =?utf-8?B?bHZ0NlRLZlRuL3ZaQ2IxanRkTTFIRG51Q3FPOTBIamJBUGFSSDMxUVh2c0NF?=
 =?utf-8?B?cmhHZFZBWk02L2NhcjJUeWJvQTNiN0pVSjJXenBoNkVCNHg2eEU3ZEVXS3FS?=
 =?utf-8?B?bGl1eVJmVldMekNIaVVXMlBPaHlIdUFIckwyRGx2VGZxVk1SWDlSay9ETUly?=
 =?utf-8?B?REt3Q095RU9HZ0lJeVkwODR5NXFwNXliMUpVS0gxemNhSHNqaDNIQzdCTkhz?=
 =?utf-8?B?a0owRUVuNUhmYTdIV2YvTVJzK1Vmd3liaXpSemxKME0xT0YxOGVlN3cwT2dJ?=
 =?utf-8?B?NFFScm9raU9BUVFBcjZWTVVHQ2s3aFE3K21XSjJpUXhYdThPeWZMZTlJSmtE?=
 =?utf-8?B?VXRZcU1vMmdwSHRWTzRUa0haeGZPTm91eEs3bjRoVzVub2hrcXJsSmkyM00w?=
 =?utf-8?B?aWJ0d01WQ0p4TGZ3RkVJODhBc3E0elVoQi9aSmtRaDJDRFc2Q1Q4QnNNWUkz?=
 =?utf-8?B?Nk9jeFV0Q0l5czJ1Ui90Q29ZS2lyam5TZkxJdFpTd0R1a2djUmlER09YM2NK?=
 =?utf-8?B?NGgzcUd5NUdwWnVFaTVRMFdBTTljbFA3NGxQUGlWYXZqVXNVcHFwKzF4UDVt?=
 =?utf-8?B?RkkvTCsyOTdjTDBqakJUa2o0c2RPRERIRGNUdDYzbjgyM3dhQmNBb09GUkg2?=
 =?utf-8?B?RmJkMHZTL29tQmRQa1F2Y1hqcnhWWExubmN1akZEa3ByL2ZrQm5MRWNta21J?=
 =?utf-8?B?WDVBSTRjazJhS1hHYkIyWmdod0JjY1dXUjZ0VHBNR1UyaUNtems3T0pjZjlj?=
 =?utf-8?B?MFZ5cHBBOVlQUVpWWnM4cldpVWVNdXdSVGtScFlYcHA2eERzWklFdE5jemFM?=
 =?utf-8?B?b2JhMytPR0IwU3JXOWNKYVRMY1FiSldRTytTR0dlbnkrU3gvYmdpaEZZWWZX?=
 =?utf-8?B?ZEl6R1QyNy9ubm1ia2xpK0dpRHlWZTMzcnNDb1NxVUFhNE9EMXlCbnFzQXdE?=
 =?utf-8?B?REdmbmN3MjZOTXQzNXB2WXk4ZkRqOWpGT2xFWkh1ZERJaFVXR0x5a0JHZ0pB?=
 =?utf-8?B?MW95bFZKUHh6cU5ORTQzTkdlRHNzZTBYSjdQQ1RaOU9oUXhHbGRTclEyVkpp?=
 =?utf-8?B?QXEwcVdPMmxvUjEwUER6VGErekgvSHp5eEhpUy9mRHVnRFJmSFRBQzZpNC9J?=
 =?utf-8?B?SU1qVHlLYkxBZmZSVTFBdUxMaG9EdkZpcUxzVUVmcWhqbDJ3eWlkK3R2NWpr?=
 =?utf-8?B?WE5WVVYrYlltdnpJL2ZVTWtmckVTVnl0djNkS1B4aS9MajNIOTRiMDBQemxy?=
 =?utf-8?B?dnFXZ2ppVkxqMUJWSlpRS3B5ekdscURjMVBTT2dRZFNRcHhyZzNEd04xbWh3?=
 =?utf-8?Q?A0Vd+9czt20hVY4ShlYVdA6IfwsnPcvL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTBqcFZncEFVNHA1b1VrNEU3alpHMlJZRjRacmIrN2xoVUVVakdrc2lOTCtU?=
 =?utf-8?B?Y0lIZmdmVUF0N2ZTMkhCTjJRa09INTQ2T3JrSDVTamdNeCtUSFd4Qi9aU0Fj?=
 =?utf-8?B?WXRvZzkyTVM0V2NoVzJaZXd4ZGQ0OW9LQmxLT1ZmSzlMVU9WQU9BM3U5SVpk?=
 =?utf-8?B?c0hZWEUySDFZd2RadWpoQk1OZkdjQ3BwVGVCUnlCR1dkVHJOaXlQTTdzWWVC?=
 =?utf-8?B?ODBPcmdCSWlqSXJHQktxQm9BMDFXSFVGeG1PZnhJY2M3Q3IrMTNkKzI2bVFy?=
 =?utf-8?B?bWxzcnJMRnhHaWYzbHMxOUl3ZWxDcElRSTNiOE1yVXhjZlYrZ0hpUXd1elNz?=
 =?utf-8?B?QW1QZGtUcEZpM3lIRWtNenFJVG9TSUIwcXV0akgxaDVsL1A5TW0xYm12MFlG?=
 =?utf-8?B?TlcxTGlXZnBkRk5waFVsR2swRXZ2bTBtUi83bXZNTDR0SUtid2hDT2FLcytz?=
 =?utf-8?B?STFqc2tPekhsZDhJMWMwQjBKTjUwVER4UEVVTFhJR0txVHJ3U3VtbGVhcGgx?=
 =?utf-8?B?WVY1QmFHandsNU1iS2hnK09IdFpla09zZjBpb2RaN2VGbzUxUE9SRFExNE1W?=
 =?utf-8?B?QVM0K2hDWldjaU9zRDZ3eHY0UmFnSERKRm9IYStLN2w3WnF1Wm56Sm85VEpB?=
 =?utf-8?B?TUJyTGwxR2EyUFY2REhVRERFVDNoa3hJU2Z1ZmVNdEJpUit3RHIrSnhGUXl0?=
 =?utf-8?B?QUhxSHA1VmI2WWZjamNnUnFKeWVwYWpjc1F0bUtTQUE1ZDdLeWFydnVJMEhG?=
 =?utf-8?B?cWlDUXdqYWFjaTIzdjFvcldIWjBoaGxOelA5VTdhSzJ5V2hPRGVjd0xtVmlk?=
 =?utf-8?B?VTBPcUxRbTlDbFJsa0JGK29yL1dZYzBzYi9CYUZKWmRKWUJVdWRCWXM5QTlP?=
 =?utf-8?B?SEd4RnZ1WnQ1Qi9qRFRkaGRTV3hHVU1XWG5PbW5FTzJSRDhZWFpuZCtnUGc0?=
 =?utf-8?B?a1RPcUE5OEpuakFVWjJJYmtPUFMrTHQzd0pDRjhoQkN1TXRROEJrZ0FDTWgz?=
 =?utf-8?B?MU8zbGJpY3ZWYWVwUkk4bkFNclN2OHVoc2dBYkJHemk3UWZXdXdRVHZnMS9T?=
 =?utf-8?B?TEptekNVMzNxeXBab3dFdkoxZ1MxZ0wrSGNyaGJKMVFPVzhxNFBJS2VBOGJW?=
 =?utf-8?B?cDRGNEpDNGRBaWwwVDVBcW1RM0VLU2lLVys2UnB4UlpkejgyUnVsVlRBWnpI?=
 =?utf-8?B?U010QStmaXhFSmV4Wnd2YXRlNndraG1FOTdRb2ZCak1pK2h1dUk2ajJSZWJ0?=
 =?utf-8?B?bjM1WFpGSFZLSVdkUTVDQzJHRmRwcUZoUW9RakFJTzZUTnJJbGpFeFJQM0Zv?=
 =?utf-8?B?a3lZVGpHQ2VGQnhZQjBXbHlnbUl1SENLME8yRVBKVmdpaHd2TlBFOE9xZ3lL?=
 =?utf-8?B?QU9lS1cweGxocHFZZkhoUFRQOGZ2bit0dy92TnJWZklxVjFuT3A2MEpjSEd2?=
 =?utf-8?B?SHA1WVExdkZQcndoVmJLOUdKK0pTNmtxTm02Z05abEZMMHdZYVZEby9WUkl3?=
 =?utf-8?B?THE5S0dTWDc4OXZadk54MUlkYkdieWJFZk1TdzlaaTN1Z2RWMjRYZ0srV1hY?=
 =?utf-8?B?bitPcXlRQkIvM1I2MFp2MjkrZWhCbmlHcmFCTW9CdnVibktVSEQrNW1hMzVK?=
 =?utf-8?B?Q0s0aldCMUliWkV3THUrbXdkbEloWC9ISFV3UmV0V3B4QmVGb1J5QjhOVG5r?=
 =?utf-8?B?MXBzcUZoQTFjdCtUZStlQWkrZno3Nk5iNFlnVmZ4M3R2dXpjbW1aeWJhWkYr?=
 =?utf-8?B?ckpyUmZKODdhMkVKb1RJQXhnUmJNTlAvV0lyeTRuRnkvaGZjV2NVTFBydFpF?=
 =?utf-8?B?TDZvbXpJM1FOUkJ4UXFjSWVoT0tJT283cEJzK3IvdkUyTXNkQlZDQ3h1a0Zw?=
 =?utf-8?B?KzhwWk04aVBQMWVOQURkZjhQU0lubGh6QzRJek43aEtTYnVwR1JCTlBjQllu?=
 =?utf-8?B?aFkyUGErVjFRWXpPQ1gvWC9wYmNzR2ZUWFhjYTV3S25iOVllQXgvaDE5R2Yw?=
 =?utf-8?B?MXN5QytiTXBDUlJqMzk0UHpOR2R3LzRZdURKWFQzNTZ0V3pYYlQ3d1hzVFhs?=
 =?utf-8?B?VjJ0K01GWXdMV3NxN2NkVTNPWk9ISlFSc3c0UlM1Tkw2dW5EdUdHc0I5dkVJ?=
 =?utf-8?B?SG9PSjJCbmh6RklXU2JCdmZ4ekwwb2V1Z0hVVTNLUWcxSDRsc29uZnZCYmth?=
 =?utf-8?Q?6lz11X7MHuGwQvnezQVjYlY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a23c056a-ee2e-4011-ddad-08de3336ebcf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:13:31.1648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNTndJd0qorHikHAQ/pEMa1bJHfbFnWnD44OSJbVYB9FxZo1vqJXa65KR3tO9/M7kc6At1EUsfr6KTUV79/uT75WahGUAqAM43RJ2IpLang=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7168
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 01/23] board: st: Drop old LED code from
	stm32f429-disco
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> From: Simon Glass <sjg@chromium.org>
> 
> This predates the LED framework, so drop it.
> 

Well, we could still use it with the legacy LED API if we enable it, but 
stm32f429-discovery_defconfig doesn't, so I guess it's fine?

Since it was disabled, I assume we don't need/want to migrate it to the 
new LED framework using DT?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

> Signed-off-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>   board/st/stm32f429-discovery/Makefile |  1 -
>   board/st/stm32f429-discovery/led.c    | 39 ---------------------------
>   2 files changed, 40 deletions(-)
>   delete mode 100644 board/st/stm32f429-discovery/led.c
> 
> diff --git a/board/st/stm32f429-discovery/Makefile b/board/st/stm32f429-discovery/Makefile
> index 6b02c0fddec..233eafdad3d 100644
> --- a/board/st/stm32f429-discovery/Makefile
> +++ b/board/st/stm32f429-discovery/Makefile
> @@ -7,4 +7,3 @@
>   # Kamil Lulko, <kamil.lulko@gmail.com>
>   
>   obj-y	:= stm32f429-discovery.o
> -obj-y	+= led.o
> diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
> deleted file mode 100644
> index 4b8038341b9..00000000000
> --- a/board/st/stm32f429-discovery/led.c
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * (C) Copyright 2015
> - * Kamil Lulko, <kamil.lulko@gmail.com>
> - */
> -
> -#include <status_led.h>
> -#include <asm-generic/gpio.h>
> -
> -#define RED_LED			110
> -#define GREEN_LED		109
> -
> -void coloured_LED_init(void)
> -{
> -	gpio_request(RED_LED, "red led");
> -	gpio_direction_output(RED_LED, 0);
> -	gpio_request(GREEN_LED, "green led");
> -	gpio_direction_output(GREEN_LED, 0);
> -}
> -
> -void red_led_off(void)
> -{
> -	gpio_set_value(RED_LED, 0);
> -}
> -
> -void green_led_off(void)
> -{
> -	gpio_set_value(GREEN_LED, 0);
> -}
> -
> -void red_led_on(void)
> -{
> -	gpio_set_value(RED_LED, 1);
> -}
> -
> -void green_led_on(void)
> -{
> -	gpio_set_value(GREEN_LED, 1);
> -}

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
