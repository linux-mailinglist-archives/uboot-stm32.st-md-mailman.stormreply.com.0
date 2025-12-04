Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827FCA4649
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:03:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 373EBC628D0;
	Thu,  4 Dec 2025 16:03:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACAC6C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeCQW1Z/YGxak/y7ZLCgrjfUhiKeVGq/zdPHS1en5Hb3pBS1kiTtO7AolTFyxyafIY7axctbTm5Yr79p81l+sd1AFjmL5EOQG+WGXZFZgc46yb8TMz7qLcP62oA7oqC7F0zqQ9T0wsPkRd+V1zni24wroGujNHbELkzNQPjCGg6wmkGBnBthjlcNBLWcS+eNkdD23leV4cNlCVodagyYsZE6fSZ8viMVmsffs9kdl+t3pxF5SqlmX81I3F++WDReJY/GLxBXh5WL1/fPUDVINeYrl46bSyujJo2m3+mqmaeLcZKACA9mDntn73rdwo+fII5kmVC210tEm6uChQgfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=JYU2yzZtyRyavWgW3XR3EzPGtRYMpTbPR0NDfBj25qODeHrH9RZO86uniNcKuvjcSlGzne/QKtAAcFy6KYhFbdNwCAsQcZK3k57xqYSFWv5zfhJs/+hUo4cX53EgqLEZ9FQwvxDZvuv12MQwEZ3n4PxVVC/BXMyMAt5ntVdDY6j98mbvpXDdFt+zZwB/zVaXA9/9SNubiesV1BvIcWnlPkzIOiXxXLGMft36Xi0iD0zV/QhzzJUsAgk0GcV9A9A9lS8n+gcwi501wtaZ/rmDAEYC/7kniB3VKqc5z+1FptcX/MlHsvCAiIeRBmaiYoeEBiiHNxJcfb5mV01WCEDTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=LJmx/etTTriaGr/fVXFsu2nHCVb6UDtt34H94JvipsROmMctSzWrz9iS6kwyRP1tWOWBuVnnigs6qwCpRksdj6N9TlJaBkcQlLi4MxSfo1MZHVfwD+2ajr1NxlxDtIWEBSvponp+3ngpROXWMp8RbiOpC1eYs7COdH8csF8ZZfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10640.eurprd04.prod.outlook.com (2603:10a6:800:26b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:03:50 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:03:50 +0000
Message-ID: <6d50fe52-4a35-4366-8aa6-116bd491efbc@cherry.de>
Date: Thu, 4 Dec 2025 17:03:47 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-9-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-9-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10640:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bac9a0b-558c-473a-4310-08de334eb613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bk1TdGRqSXJrVkdMSEdRVGZsUXp6ckJ4QXNoYXM1MVBGS0F0TTFlQTh1T1Zl?=
 =?utf-8?B?UEd4V1R2UUo5VU9GN0EvWnU5QkpEUDYxb0VPa2RtWmp0dy9YRUtUWGsxV282?=
 =?utf-8?B?VFphNlo2b05OMzdzQ0xsQTlQKzd0VXlESStXUXdxMnNUUjFmbDNqUytDV1Jy?=
 =?utf-8?B?RzM4L3p1N3JKZVhrdktvditIdnQxM2swaTZhVS9Bc2dqQXIzQ1J2VTJVWDNN?=
 =?utf-8?B?QXZnbkZtZlNVSG9pTzVxRTRXMTJwcklCQWkwcFRsSm5ZU0h2LzRhVXZUK3pG?=
 =?utf-8?B?WHRvc1JENzUxeUN5K2hKbzJzOEFOcm5DMkd2L1pOazk3MWVIVXhrYUdqVkla?=
 =?utf-8?B?czFGa2ZYTTB4S2g4NS9aenVSc3JSU1E2VTh3eE5ITE8vZGxzdFZkQVpodEtX?=
 =?utf-8?B?b0NEWmh0ZGFnMzJyWHBGakRmMG9XNkI1VXA0dVdWNG16TUN5YlRSV0Y3eU5E?=
 =?utf-8?B?R0JBMXZNMlRIZVNHU1hsVkJueU9mYnhiN3A2TEFSTkVFQUp5ejQwQXJvcFZR?=
 =?utf-8?B?ZHR4NFRWVHdMWHcrcGw2Q2hqMUdrTGFUU0hMclJhOE9XcG5NVHZNYkoxTS9x?=
 =?utf-8?B?MUdtckZ4WE50elBacDROa212ZEVWbDc2enN4ZEdzdWtoK2RNYUg3U29xdG05?=
 =?utf-8?B?NjRueXlaZkw5TmdqZGNhNm0xa1g2c01pdUV6aWxVSXNmcFl0Z3ZzWFplNzlj?=
 =?utf-8?B?cE1lNldZdFJBK1VWZ0VxWURXQjEvSGFEdkVzMWthSWw5YkhBNCtISjFMMHJH?=
 =?utf-8?B?c2JjSk0rZG4vRFl2a0lPVjdvSjJpS0hzaGFxV3MyNG9vakdYRFV6eURvMjhm?=
 =?utf-8?B?TzJxLzhIcTR6ZkJmd3pqYmMxU2g3YkJKL2wzc2hrYjhtb012RjZrSU1JM2tx?=
 =?utf-8?B?OWUzY3gzQjRqdmtweWNRTVZGdHN3a0U5Vk5iTFlIQlBjNmVtQXJKWjdHQ0I0?=
 =?utf-8?B?U3k2WmkwTjJKR28rTk5tMnBFa3VaNVlKcUxLYnpGOTEzZFAvZlRDbG5UdVFO?=
 =?utf-8?B?NnBSdUpZRFpob3BGS1BUTnZGa3VNYXhvWG5sTTRvMHU5clNJeDE1VUxKNDJE?=
 =?utf-8?B?NmhibVk2VlgrR25rN2hMeVlqWEF1NmtpS1FwNEttcGtiMFRYRUt3NHN4UjJU?=
 =?utf-8?B?WFF0MzZkWThmTkNlK200UTdQdGR0QXpCdkpubDN2NG1MMVpxaTNHdFhNZTlv?=
 =?utf-8?B?YzJvQjFjOTcxQytBb2szYkR4d3JrSGRaRVZiUHZuSVNtVGMvbHphN3AyK2JS?=
 =?utf-8?B?OEN3N3FJYmFmMGR6b2RxdnNVSnhuMnFDUjVlR2dzaUF0dTJVc2p6NVhBbHJo?=
 =?utf-8?B?MGNGYVVzTURMakhFTDN1MjczbHRNOEswaEl2Y2hWazZ5dU1kSXhZTnhleGli?=
 =?utf-8?B?Wk1SV2VRL25Za0JqRGFWSi9xRnc4dlpCc0YyRjZCSVRNRU84TVYxamtJMmVj?=
 =?utf-8?B?QkZ0dmZwMDZTV2p6cjdZS010Sk83ZDBlamZxYTJrdDFlZGJyYVZoZVFpMFpu?=
 =?utf-8?B?Z0x5d2JvQ1p4VExHaUNEM2ttY1VwRGVNMXM5YTNxc2hKRWFuSC9GWFRkbEsx?=
 =?utf-8?B?bnh6M21BT1lYOUMwcmZWZjdxRG9GYnhkU0ROSTVLaXE3WWtBRTZLWGdsTFM0?=
 =?utf-8?B?TEQ3WWtDeTRrMmhNWHZtNTArU2dRRnJ2ZktWc3NSWjFINkNmOGY1WVkvQ3VC?=
 =?utf-8?B?b1VrV1pKbXVoS3FhcVArVEhtOVhSTFVLWXJIU2YrOUVWVHhpbENwdUdKSXV5?=
 =?utf-8?B?RnNlZkdBSjMyaHFKYjQ2dmxab2IwYWVwWDk3bEsva3dWVGI1cEQ0bmVHaHE0?=
 =?utf-8?B?cVRCUnQydzJ1MnA2bnYyMWRScGVKUHhqM1B2T1Z4UVFFSm1FTUxPMkJzTmJo?=
 =?utf-8?B?bVdQMkxRdEw1Vk8rT0FvOEJ1QmZIYndyTlBSZHprZWErblZRcGJnYmgvMCtk?=
 =?utf-8?Q?OExhk4PPpY9bmt0nn2dS/AO62vS8cuJu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1g4ZktnOUg2Z0RsdkM5a0lZK0czbjJEY09ZWTVrQVhDcmlabVlNZFM0dEVo?=
 =?utf-8?B?R0ZETDdYYWdRNW53ckNzdEpYQjBWSXhnZm5PUHpqdTNmR25GaHVCOGNlLzFk?=
 =?utf-8?B?bHo5VFFtNFl3czBsd0FNOUlmZ1BHUkdLK3gxdGExSGVUZVJrNXVxMjgzcVMx?=
 =?utf-8?B?RFNVY29ZbXZXaXREWFhickxiWDZkcDZvL2QvSEJ0WHF2RHQ0YjJTalBrMG41?=
 =?utf-8?B?ZytCZytiWXY1TjZpazBKcUdaZUFzNmsyZlVPT0IxbG9oOTk0OENzL0Z5ZkR5?=
 =?utf-8?B?N2ZTUlArTDF1KzFEVVVQN3Nna1M4YlJNTmN3Vit1VnYxL0tFQVRpSDhxanpJ?=
 =?utf-8?B?d21ZMFlwcTJyTVZxNWg4TWpLRjNkVGNRTVIycjJ2dmRjeVlXQlhhYkpub1Rk?=
 =?utf-8?B?MXZBb205NjdXeWVoQUY4V0gxNVBpNXJ5MDRDN0FWd0dxVzBxTEFYTmRvMWxR?=
 =?utf-8?B?d0t6L296dk4vbW1naS9WZzlTcXNZc1lKZHlISmZsNVlHeVdsaTdlaTFYd2FV?=
 =?utf-8?B?UkJRMmJTamNrTU9mUGYrdTNIRnpGYVR0bGs1NFZNdEduQ3h1MVlPcXNvODE4?=
 =?utf-8?B?aGNBbjk5clVLMGU5bWNtOG5xVDVkUU15VHlleFNGTmVobEtnV1B1SGZ0UDg4?=
 =?utf-8?B?dUVmVSs0elowMjJyWUdMZTVwRTQ2VU9rckZSMHNKdHdCQ0JiRFRjb08rVjMz?=
 =?utf-8?B?TFNNY2MwNm5LTXMvUzVmWkZNWVhrL3FhbnQvZGNZcHZNN1ZmK0ppSm9RYk9G?=
 =?utf-8?B?amdvajBpREdKNnduQ2pDUkdPK1lrMVBzOTR0RDhka1ZhdDcvTWZjaUNMSmZB?=
 =?utf-8?B?VEtYRHpieklDUklLODluOHRBTVZDUHNKUENnRE1Fay9xVlprMlN0dDcwVXJI?=
 =?utf-8?B?RzhoRUliY2pTdE1LQ25NdXd4V05vTVF4b21ISTBVaVF6U2d2VlpwRUhyOERz?=
 =?utf-8?B?VWNUSmkvQU5SbGNzOStpbkpqZXUrR1liMmJ1NU54U29vRG00VUxuaGN6b0hP?=
 =?utf-8?B?Ty9lQ3hSaU5YVi95NEhBbTlCQ3NYQjRZN014dWFuQ0xiVy9ieXFVZmt6Q1hz?=
 =?utf-8?B?L1BhZDRZdWtXM3VGT0xIaDdxMUxUMXNZRlZ4azIybWhSU2pQL21xMStEcFJY?=
 =?utf-8?B?d1FhTFo0OUN6MFF4SExkT2hEeWRxN2ZwcyswVGtQQWNUdGFKSWQzVm9TcjlE?=
 =?utf-8?B?NnRRZVZwbWJUbHZ3RWwxUE1WNm43Yi92dHJxd1EzQ0VnSU95ZGhIOUdnK09G?=
 =?utf-8?B?Zll4UUF2dXo1TWxlbkYyZXUzY2p1RHlWM21WRlRxUjkrWUVVSE1sY09KMUp6?=
 =?utf-8?B?ODR1ZWxzNXgxVE42VTZ2TXlhVXdwOE1EZHBGRHgyeEtxaE01T0svSmVqejUv?=
 =?utf-8?B?b3R2K1dxNk9GR2h1ZFdNdkRNQ0l6Zk9sLzRMc3lRN3orMzhBMmUyVFpJWVlS?=
 =?utf-8?B?eWJmczBSaHZBUnF3cTRSdHp4RUF0eDcwSmxNYnNyMnpzK1R2OXNvVVVFcEQ1?=
 =?utf-8?B?QUVyMkE1alNoN0Iyd2VRUjJXalJCVElsYVBBSUN1ZDVMazZidmFOUS8xSkNq?=
 =?utf-8?B?V0dlN2x0d1B0NG9scHRCd05sRkFaRmZIdlhrQ1FaeFJQTElOaXdTVGd5YnEy?=
 =?utf-8?B?R0k1aGNzQ2NqV2hSL21BcXUwZ21NcTZiWFg4eDR2T2Q0MVg1YmJyYzZsa0F4?=
 =?utf-8?B?aEhMcTRjbTJmMUsxbVpuZHRyTzdMdGtud1RlcU1JditURm03ZitxTlRkUERh?=
 =?utf-8?B?WGZyV2FlOVliRUUzZzdQeVRxMzE5U01Ja1prZ0lFQzJ4MTB2Q2RXN04xV1lL?=
 =?utf-8?B?KzBWZnhTT0VkOE5lRlplb2wyRWhhR0NrcEVYU2lrSWc0L0JaTE1weTRYd1hM?=
 =?utf-8?B?RnVxeXloa05iZEJtZ0VjQmZ2ZnY1MGR5ZWl4V0lnYlNxUXhIMVBPTFNaY3VZ?=
 =?utf-8?B?cVdKaDd6TEx2NlJwWjlBR05pSjhDTDRCL2lQUTAyZWhpbHpSQmNzU2FTVmNJ?=
 =?utf-8?B?djY2ZGtWOFJEZWdiUTZuOEtXSmFRQ1VxVGNsMjVvdGI2dFJyTTRud0ozSElk?=
 =?utf-8?B?U28zWllMWktIQnVmK1RheWVkUnphYU41OGY0SnRyQVZBMWpjT1NZSG5Pd0ly?=
 =?utf-8?B?c2w1NkV6Sk12cUF0R29GWjVTNFBkWVNQZXZneDBMMm5tQ2xSZGdzZStxVVpP?=
 =?utf-8?Q?m7QuiBM0VdKxNsGkdCywSn4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bac9a0b-558c-473a-4310-08de334eb613
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:03:48.9734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSLeA2lD5AiGT/WNUdiyU5EleV60CrbWQQh0CI1HE1Znv+c+Iohe7EHyRn9o1dbQlCB1i550jpjIULZYqeiKVbjyuVJv5x0YGsounH+/qDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10640
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 08/23] configs: stm32: Enable LED config
 flags for stm32h743-disco
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
