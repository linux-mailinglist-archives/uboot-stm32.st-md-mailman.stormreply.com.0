Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE00CA4655
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:04:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 541ACC628D0;
	Thu,  4 Dec 2025 16:04:29 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013023.outbound.protection.outlook.com
 [40.107.162.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C33B0C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYiGe314px00bsZD+DIoaYNYHr6dyoUXAZbLZU1j/kF8uYMg9OGjG+dST2mW4ZnBV9PBkIBjQ1WeQ/fqNdnm0i4LVQD5DvFV/eUTraSQx+PZNw+g0AcoYa7BHB5P9rr8UZabBwjCbdgD8t9roMLDr3eylHAhC0/rbVv1tOYip0LQuoS0zI2NyohpJ+RLagqy3CJMybniPr11gIvqE7huNbldovehroO+ruBNLnQnWSsFclZN8zwpb3pKWRmIcAsr7KRGkQVtE/BGZDedbote7INAZL0233A7+cfGAzC7gPTICRM6uzyh0hin+rVjgkTEH6WojNXF4TeWx+B7j5kiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=uqOoqXWzeeTtUBaRe0M8ysF7pAtIeG4LMVq2N3iIUbLfwhHoAzOvtmYQLdN60hujwcaEZDjueQNHrsVQTc3bNZOUW5VWR+j5XX85iXPXWmVt/k3Gzx64tuaXT8gqAxSm9uajD/gzkYokxrT5ufV2gv0x2poB+4TSjKmQ9aXB/mqWjZijPYIcnY3SA6j+XySD3BiNZ3gmXrZxkAJoUpufWEliSggsrmOaf0ikdAnQxZbOOJy2gZoxBYALogida73grE/wnoAiaAAmlDVpMo3wvOmdDNeIDe6T56E6XRjhgHnlG2fBjPzkZG7CV4Qh9KGNrGQ9s25fEGQ2cm3qD9oS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=Ir/2P8dm06F6xIT1lWZG9oD8SQGwe3gLaAekKNCvuKKpb+lvRISiJWW+4Rsyca8LB0ZPO8zV+5of8V0H52+fp24zQ1vVpdMHSc+rUp3/uR1/QTmVSw9GkAT3pziJ1HB1/X/aqHcfNFEiUOgvcUtHYuvU9ec0IKt6z861v8CwuXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB11819.eurprd04.prod.outlook.com (2603:10a6:800:2eb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:04:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:04:22 +0000
Message-ID: <ab6b981d-4661-44ec-b254-b43ef8f6253d@cherry.de>
Date: Thu, 4 Dec 2025 17:04:21 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-10-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-10-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB11819:EE_
X-MS-Office365-Filtering-Correlation-Id: e2705914-97a5-46e1-9bec-08de334eca0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCtKam93amRERGhPbGtkb0xEb2U4Ri9qU2YrZkZ2VVJucEZBMEZzMmpNbXl4?=
 =?utf-8?B?RGh1eEZvT3lqSG8yL3V4WDF1bllaYnpJaUdPU1ZYYXYwbE8wblVqeHhWd2pq?=
 =?utf-8?B?N0RTOS9CalRvdkw2VWdHWU1Da3c0VTBLekZRcjdOUkMyQU9nVmtXbHFRNXAv?=
 =?utf-8?B?bWhnL3VMNmhTV2ZaaG5zL2RuU0RsVitheVVtYmZhU24yc1ZkK1dGNU1Jc1Ix?=
 =?utf-8?B?Slh1OTlQS2JWRjdUTEhTOFJkTWhhWkZzNVl2S293elEwK21MRDk4TXBxaEY2?=
 =?utf-8?B?VW1FaVpOTEhRWUNmaHlZa2Y5eGpoYVZobHBIT1NXdG4wZkpsbEtsT3NhMmFR?=
 =?utf-8?B?cHNYYjFIV1lHTkF4WnhRSk9CRndKS0xxVzYxSE9HUHZZS3JRT3Fra2FzSjlQ?=
 =?utf-8?B?VUhoOU1wY3hpaUFVRi91V1U3ZEI0VjR6TUVNYjNzZFo3OGpiQVhFcGtoT1lR?=
 =?utf-8?B?MXVDNkhLa0tBOW10WUNvQzc2ZHVBK2VMUHJhTWVnSE1DUkRNTVlkSk90Tk5R?=
 =?utf-8?B?YlViVHMzcjlaU0dKSWk1Q0w3QXZoYjYyR1VsTUcxSm95YmxJTDArSEgvNk16?=
 =?utf-8?B?ZWRRNGlweVFIaUlGcnFxNVYzOUp3YjNUejg5WEM1Sjd6L0I5SzBvZ2NjN1J3?=
 =?utf-8?B?S2l2ekNSTFJ6TWFuWG9Ta2JIbUZWVnZtcjFHcG1uSE11YU0zK0JZTThYSTdh?=
 =?utf-8?B?b3JZWDRpNENuU2xrMEZZNkVaZkcrOWlzbWoyRVVyMSsrZGpyMGx1Z0RVa3Qz?=
 =?utf-8?B?ZmhGNWJsVEsrS0ExZlFNQllWTGZ1UzVnZW5XQXRaM011MW5DWVZFRWNNek5p?=
 =?utf-8?B?K29XaUszOFpOeTZWQ3p5bXZObXZjanpjYks1UDl2NUJzV0wwRHdGVG5NdktX?=
 =?utf-8?B?RW5OeXVBMWl0TFk3Qm9Ka2FOeTkxeVk1Rk5LUGpsVzB1ZWJvRUgyZyt2UzlW?=
 =?utf-8?B?M0RvejcyellSdlVOcjM3UU1Yc0NWWVVRb2Y4THB5OGRCZTlIL21TT1ZvUEI4?=
 =?utf-8?B?ZXF4bGp3eUpoZVpDaHh4ak5DUWFSNVhMS1VtK1pvbWVKVG9CbEVWNVVjVzlh?=
 =?utf-8?B?V2Jid1ZsMEhGV1lJR0wyZmd2NUZBVldTN1gzR1RzdVJua2hLK2Vxb0JjaGlu?=
 =?utf-8?B?UGw5MGY1RGlTRkx3QmxzbVdjZ0IvMjdZait0bnNuYjhZUnViNWsvOEV2S001?=
 =?utf-8?B?NDIyZm8vMkc4ZmFuQzJpNGE2TkpFd1RUb0ZMa0M4SkYwMzNoN1VlYnMvenlT?=
 =?utf-8?B?SXZKSXVLM01xZWdSYkRwNGNkSklUWk03TVZoNGpMaVg1VHBwNGFXZXcrWUx0?=
 =?utf-8?B?TDIzc3ZDS3RMVDBheS80ajUrdTdxR3ZDVXcwckJWTkNtYytzblBOQld5WU9P?=
 =?utf-8?B?dmlDNklwL0lXVSt0T1pzVHFYT1M0Q1JteitKbEpxYUtMcjJKUmZsNm5qMzR5?=
 =?utf-8?B?a1ZVUEV1RHV4WEM0R09zNlAyNVhSeDhkdVRVdWk4cENvQnJlSENSb2E5eUY3?=
 =?utf-8?B?NTlWbHdNN243dWRqcWlac0s2T2NySDRPb0Q1bGV1SnhGT2VqSms2cTk1ZEtk?=
 =?utf-8?B?ZmJoNVRRK1A1UTdnd0hSUVl5MVFTM3FPaENoeFUxZFVJK1lQWFBTaXJDZjRo?=
 =?utf-8?B?T2RyVU9vNmhqRzB4KzlQUk5vdUQwcXRtMU1IVHp2TWN4TjZUSzdXKzd0WElQ?=
 =?utf-8?B?SjByQ3UzSlB0ajJUYlZ0U1h6S3BEOWtMZkQxcjhTNHNYSFNBQldaeFhDQlFx?=
 =?utf-8?B?OWk0dm5YSDNNdi9jdTVuRkVadVc5OTJlRmJJdUdnN1ViM3BvQzdsMEZWbDlD?=
 =?utf-8?B?emlwbFd5TTdUUTFCN21oMzAxamgxdENuZjhkc3BrUFMwUHdjT0JVN3dsRkFr?=
 =?utf-8?B?ZzVhSFJoNVNadkFkOWRScEVCYzEraC83OFZoMGhwRDZGRU5aU1F3RWV3bzZZ?=
 =?utf-8?Q?KkCAS319KWyWyWHReBRXPn4CN/dZMcCb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJRcVF4TDltajkzZjl0UG5CUGp1OUhyeDJraExUYk14eGR3VERsQjdqMEpn?=
 =?utf-8?B?UzlzVmFVZGZ4d2RUWFByZ3ordzNrZ0IzTjUwUGJYSUhBQW9tTjl2eHdqNi8z?=
 =?utf-8?B?Q2c2SWVOU05wN2FPZVhMRG8wRklHYVYxZGpPUFMyd3JiVU9pT3A5b1UzTU9K?=
 =?utf-8?B?ZXQ5K1hENmJiUmovb3ltZWR0TTF0ZVlISFc4VHh6cjZhOXgvZkUwUmxES2px?=
 =?utf-8?B?b0FsNHlnaDB0Y3dPZFIxdDg2MnZ0ZUxXZXlrMmZmL2NwOFVaR0FVV3FnU0E5?=
 =?utf-8?B?RnYwRjBGUUgzT3lST2tiNkhGQWxSZWdBcTVPRkxwWWQrQUgxaUQ5ZGk5ZklU?=
 =?utf-8?B?UCt5N3ZENnVGR3psUW1TeDJjWEtrVFR2ek9XMTFmRVphbGpYWTlkT3BERHg3?=
 =?utf-8?B?MEE3R2ZzRUNhOUFzWDY2VWx3dDBZZXJSa2V5SHpCdFhXUE5GcGhwUjJ2dGNX?=
 =?utf-8?B?RFVHc0lJSm0yYy9hWGtWNDRSWmxHT0s5bFAxQkd5azhoOHl0MXBIb1NBajJT?=
 =?utf-8?B?WTJhcEI3K2w4V0w4UFhsNWhKVUZuRk51dXU5dzJtSVFBei9oaEdXSTRvRHps?=
 =?utf-8?B?a1d1MEpwQ2xIZXlXcWhzNS9ER3ZtK2o2bUQ4c2VtNkZxbjVWSVQrS2VXS1Rs?=
 =?utf-8?B?MjlBZkNGdmkrZjJRQklzNS8xSEdvaXJJdHlwLzg4aTAwdnlMb3ZqeCt1bkl4?=
 =?utf-8?B?Y2syMnNaQzlQT2FISFdvaGN5QXBSdDJCSFBPbGw5MTcycTJYMVZ1WkcrYUlP?=
 =?utf-8?B?QlYzd3U0YlNURGtXdDBNenZXbTFMTS84dnRQK2txZFR4cDZyd1o1VzNxZGU1?=
 =?utf-8?B?czZ5S2YxV2N2TGVkR1ZIaUhycTBONHJFWVRQUUF1bGtELzJKa2Fmbkhtcjd5?=
 =?utf-8?B?YS9zUVdnZlUrVit2MmZrejVpSWdvMG5QUUgwVFFrUUFjTml3L3paU1VGcDg2?=
 =?utf-8?B?VlNUU1RPSzFYekVpa1dwQ0lUaC9lSmUvQ2Z0RkdlU1JDUFpsaGFQZGlZdVhC?=
 =?utf-8?B?MkVzZnlHZjRlTkt5bnRXTlBjY2Jpenc5SWVVcXJ3VUlSc29UYUZFN1I0OWFM?=
 =?utf-8?B?NXVSMkZzd204NnpBbFJVYmVkL1pCMTBrWGFMNWRsTTZzeCt3SGNKVjNaYity?=
 =?utf-8?B?bUUwN3M3bytUVmw2MmsyQWpsMXB4MjVLTHhMK3dhVG1HaTU4Q01jbXpVRXRY?=
 =?utf-8?B?cWRpS2RkUDdwbWdxTksvMFFVOGZQdXFVMkhQT1BWb1htNkV5aGlEdU93NVEr?=
 =?utf-8?B?czhJNmszOHBqUkJFM2dnU2tWRXpWS1MvdGZob1BydEJCMnFxODRHYkhBalda?=
 =?utf-8?B?dTlGYXpBeHgxUzBWVExpcG9UditvU3hIV2pCdzByWlYzeGhYb0dxeVRUeHdH?=
 =?utf-8?B?NFBkTEY4WXZ3enVKalJlTGcxZ2J5L3NmalcyRmhvUzA4cHFlUmhUYU9leXVZ?=
 =?utf-8?B?OUtPZGI1VVJxL1hObzRIdzdpZ1FxbDVRdndDaXdXTURyRHkzVCtqeVQ1TGcr?=
 =?utf-8?B?SjhMa3IwVjNXMEMyakxMSjViWUp5V3Zzc0VmajYvTUVMLzd4NVE1WjN0N2lh?=
 =?utf-8?B?RUxPcmNOUTRlL2t3aXJKMFlISHRaUWZuOTV0ODI4aU5WT0JXMUZ2UkRYN1B1?=
 =?utf-8?B?TlpiQUJlL3VkbVF1RjRXbmNvTFIrZ1U5ZTVPQW5jcjhuK1lOclJqRGw2Ynhr?=
 =?utf-8?B?aTA5b0UzR3ZvNEhvSm8wQ010eVd0ZnJJSXE2a0JIWFRLc2NZTWh2QXlXa3RM?=
 =?utf-8?B?M1M1SnE3VzFWb3NXbGVCNWk1QTFVa0pKdlpZWk96VVNlQTFLTWJjcmluMWlW?=
 =?utf-8?B?NjZtQzAxZ3dJdGNVcHNIeXd0VjdHaGdERnJUZE84V3J0bVpJQzd4YVFtWWha?=
 =?utf-8?B?N1I3VTVUYXJpVmE5ODNUV2x5M3dPZWwwb05SUHJYRzV0R0UrYi9DU2E3NWRy?=
 =?utf-8?B?dm9LSWsrY2JDTEo5bGhJTkRnRk1QeFIyZDM4VU1ZMWE0Y2ErbUJpdE1Pbk9o?=
 =?utf-8?B?MFlHcCtvM3gxK1ZnVG5ZZFMrZXIyaVBzdjBiaFA3RWlsZ0ZpdVYrUGNkUy9q?=
 =?utf-8?B?a3ZHaFErOC84SWRoMzJCTmRZeU9ZcHVMazNmZEtSR2I5UGVvYjlUaHpjczIr?=
 =?utf-8?B?MklEN1dML0tHVEZDK29OM0lUWmVhSjRxR1JwdThjL3laZWYyVlFha3E2dHlO?=
 =?utf-8?Q?v7RhwSL28MTDVrtSMoWpNnM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e2705914-97a5-46e1-9bec-08de334eca0f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:04:22.4951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNtYbB8MvhJQkhPmKSZZMSgnnr829j9NtRhOp9oEIr/iPksWTIvVHhG/r0pEwlq8N1b8tQm/l+akX+J6xuHaVWOPlKdvX7CV/vm+pJfkc+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11819
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 09/23] configs: stm32: Enable LED config
 flags for stm32h743-eval
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
> Enable LED, LED_BOOT and LED_GPIO flags.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
