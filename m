Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE9CA473C
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:22:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D3D1C628D3;
	Thu,  4 Dec 2025 16:22:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDE22C628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX07oDbuYKqP4F4zdtx00yrvUcCkNG6rw/tT5PhRx1TrPzLpPg4PoFYGLx6vK+Nkk/Zt+Hs+C0N6iAZJMXGSuVtGJo98QVXS5wYYungpEF9I1goIslslgTHYGVy0OP36+t6KVsxKKa6UWbd+H3BrUE1e6fZGHFAvVRZBvqkO4T50aXdhUb9Kx85IaWdu2Q3vgrSnfICOoMxlJEO8gO9PyIKxup2akIYPZwb8O7r+QXzFrJFmB0zJ2bvwgGj2FqgjKVnVCCpJztuoJYXd13hPlt92LsGaMw8lpTBVpakR8VPwJ3NzkOeXDQSRPKlU/fs2lBQINkxDXqZAwGy9FVCbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=fB53HTg+HhTQFON37QA+M+NXirEMRr5A6pTbVMmZMdNURAynzJvjXsU5+0oqBc4HZoyr759ujPWj/fiIwi4i96L3cZa6ZM7avYNiE788pfAkUdFkpGi4R5f7prusmedpt7EJBYgbZhdfM2ZnQ+wQ1+fAITNdtNQ4qYZdVOUemeXIughaPQtLSNwidVpAcUnvHemu0pg35RvAkXYazJew5KZU3QTDi+9E9yKy71jb0F/i6WAilDSdEl9PvArc+e+/oyuGh+HJRy/HUGFouJdF19R+shhJWdXyCp2ui2PTEw7yUlYjMckznfZ7H6b/ABkq23lY/O96PB+9gyOaZNWQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=kbUE1WeyzHBTkjeQtIsiZVtsriyOPmlBEsqWHWnHTYHm+Yohga+S8O+Ub5w0+go0l5PX+mVnPanTHsMYJ5JSRYKFVHlNI1u9PjkGh5l5vmf5fRC6wwJRNqNZACpl1vritmVtQ2GO6N85RZf89aRXrrDGEoTZNOQSo/GYu46l3g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB8PR04MB7148.eurprd04.prod.outlook.com (2603:10a6:10:12d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:21:58 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:21:58 +0000
Message-ID: <12eaa971-c14d-48c4-9677-1382ac94e7d3@cherry.de>
Date: Thu, 4 Dec 2025 17:21:56 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-17-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-17-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB8PR04MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c7bf43-e067-4ddd-0123-08de33513f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjJCdzEwMUUxMzNVKzk4cW8rRnV0YW5idHp3dVNUMkp1UWFPeFE5bURMbXln?=
 =?utf-8?B?Sm83UUdNczJmMTBSMFB5UFJkUnlnQmVIUHc4NTJLRkkxcnErUmlCM2dnZHNk?=
 =?utf-8?B?Vk81cFBzVzlRTk5BRVVZbjAwWnpMa21KUUlxSkhMeVpNWGpHTVNHUHBmRGIr?=
 =?utf-8?B?MDZZQ3lnZEI1TFpsUUkraVRuNTBDS040Z3RkZFRoTUpVSi9JK0o4WjVpK214?=
 =?utf-8?B?KzcvMnFuVGVKSkVnK0tJZjB0dHdjekUvcXhiWEMxckxVS3hPaytHS3I1NFJz?=
 =?utf-8?B?czRNK3crVkVtc1l0UFBma0RYaDlibUhCc3VMMEJIWmpNQlA4QWhTVUxvU29l?=
 =?utf-8?B?NnoyWmVMV0lTa2ZtWXVuM2pSSXFETjhmVVpuQmpOYkpQd2h0MEcwbHhIeEF2?=
 =?utf-8?B?MDY0L0FRWlJCaTBrMndXZ05RYm1iZ3JUbGlwazJNcVBCVmxBQ3EzdWo1S01P?=
 =?utf-8?B?dnZLamc0VTd4YWd3Q0VZNlU3WU5Sem94OFlpUHYrOVFIc245ODNuUjh4aEFo?=
 =?utf-8?B?N1RDUUJpaU0wY1N0TkI1cDJmcUhoNGY3Z2ljMDA0WnEydlUzNERXMGNseEM1?=
 =?utf-8?B?bDAreDRPU28wUTBMUHp4SFdUbXhRL0pPSGdFYVc3ekVTMXh3N0wvdWg5eDV6?=
 =?utf-8?B?TG1zbTJ3eEVETVFiSVlRU3hhS29pbTVaay9tMVgrRXowbjNJc0w4cDRURjZl?=
 =?utf-8?B?NnVjLy92UUt2SzFoWkw1MXhqWGEySW52YjByV1JCajd3T3FzTURYQjhPMW43?=
 =?utf-8?B?ajBJM3ZRd1p6YnlUSjBMNnJNQUlQeEdkMGVSV1pzMGRLS3BnY3lsUHdSNi9F?=
 =?utf-8?B?Q24rOXNuaUFFOWQxQjdRUFdEWHA5Z0plRTd3bzN6S1pKcCsyZWFvOVo5ZFNX?=
 =?utf-8?B?aDFkeHQ4alVtTWEvRkxUTW1aMDFhYnNFcTQ3dXM1dUxhbEt0SzdMVkFsanYz?=
 =?utf-8?B?RFVUYWVaSXRVN1dFbkhLaGs3dGUvZTh6UnA3S2FMS3BwbFkyRVpyTThlT1ow?=
 =?utf-8?B?R3dnMTVwVzl1TVM4YWJwdkF5SmlxRzUyd2lFTUMrZzJqYngvU05OeHh0WmtO?=
 =?utf-8?B?QUl4eUZURkVKMVpzQnlJUk1kK1lhRW9jVTlITUFyVTFBQng0U3NTcGFCeGdh?=
 =?utf-8?B?TnUzcnNjSk0yYVE3STE2SXFVUWM3dlVOY0U0YjM0OXpDY0JsOXFodUNzR2Z4?=
 =?utf-8?B?Q1lBOU9FZmhweTlhdmZhaWI3UHo0YnB1SjY1OUhWMGRlRE51KzBWcFEvWmRL?=
 =?utf-8?B?aEpCdW5yVCs4ME9KZWZsZTJud0N2cVhTMDdNMis2TzlSQmdzei9hNkZBK29K?=
 =?utf-8?B?ZS9xZUo4ZkE1SWZsL3VxSDQ4TFFzRnNGbFRjelNqL3J4cThSeHVqVTU1MGdx?=
 =?utf-8?B?OFBvV09pd2gwWFVTUEZmZWNDeWdqSk9oRXJpNStsSEZRVXAxTzhzUGtqZzdP?=
 =?utf-8?B?R2Z0OU5zVldSMkxYOVpSZlcwZkV1cXV6dllRT29aOGM0K0ZqWEZSRWl4ZDRB?=
 =?utf-8?B?K0kyWVlSUVdSdzFqRGF3Mk5PUThtMmczQU5ZeDNaRHVuOGovVCt0NDV4bzlw?=
 =?utf-8?B?UXNXekt0NjRGUjFiNG4yTUtUaThTVy9nc3lzU1l1Z052U0NyMWFIbWgxL1hH?=
 =?utf-8?B?QXdFTFAyS3RnUTBGK3lLd3Z0L1lsamdsMFhoRlBraUR3aGhia0MvN3pydnl2?=
 =?utf-8?B?RDdJTFVMR202UGRKMUVxTGJ3RWpiYmFMd2dDakdEZTFLeUptQWFRVFlhRnFG?=
 =?utf-8?B?a1Y3R3BPU3ZaRlRiNHpSTGEzVjdDd1FPdU9sM1p0WjlKVFJ1MGlraHVUREZi?=
 =?utf-8?B?VFZkZWo3TThxbkNWdk5SdzBzeklmb1dxOXVxVXNmenEwTmdSK0JId1hodS8y?=
 =?utf-8?B?ajIrWUlWbWFUT0NLSUlvRTMyMGMzZ2ZEeGUzSVZPRXFQZVF1TWYweTE1YWpT?=
 =?utf-8?Q?1wYAo1Snff6LQtwO9SofbTvEh7ftpG80?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3dYbGpnZkg2cEhCREFBcVFvREhPUzdKYnV3SEEwamMyL3RwVUU4enViU0kv?=
 =?utf-8?B?OHNWbU42clJqcW1hbUd6OGdkbkpnaDUyZjM1RHhwTzJGcks4ZHJ6aGtCSDB1?=
 =?utf-8?B?ZkJ2aTBrRnNjaUc0eTY5aWdoekNFK2NMWXlwSkpoVXE1cU11N2JDalVYbnBh?=
 =?utf-8?B?Wi9RRVA1dGg3VUxDeTNadk12WTZjMEdOTDJYUnk4dXhiR1lUM1RiMlNUdjlW?=
 =?utf-8?B?QjRBeDQ1U29Zczg1dkZDUUZ3TWFsNDJEUU9wZTdDVkhEeVpBeUNMQUdZUkpk?=
 =?utf-8?B?d0xBRGwyM0hVclBGZ2E3ZzZKckdLRHZtbEpTUi90d0ZrK0pMUW5FWDV5czdl?=
 =?utf-8?B?S1MvTTA4ZVVPVVM5dHg3NzFKMm1wUHZsVjloMlQxZGFJSW5VRm56a0RPQVpV?=
 =?utf-8?B?OEZHVWl6ZStwY3hETzZFOFBGTzN1ektpaVZLTzBMaVJjWVlHTmpLNFNZV1JY?=
 =?utf-8?B?MUswNlJtQnEzQUFXUUtoTTBQeHVhRDVCS1dtcFpnclZFeUFTNHg0M0N2ZnVF?=
 =?utf-8?B?WFVzQmIvQ0E4eDB2emJENm41NktabkxxeWJzeHFCekNueGpHMkpUd2JxVUxh?=
 =?utf-8?B?cHhvQ1hYOGFQZS96OXJwWk1iU1F4TngvWVNtVWJDRzJaZWRpSFhTOHprSE5H?=
 =?utf-8?B?UWdsRzB6bEpXT0VXQ1U3R204MnQrRTJGQXUrVGw5N2hNZjBkZFJoK2JqRzdt?=
 =?utf-8?B?R21FamlmU2k0OW5hZm8zbWhFYytHd3FNV0RCbmU3NzV1VUxFYm1TZjFha1pv?=
 =?utf-8?B?ZXdrakZvZWxxRWtmemxHa0pqOGczaHFmc2dlNkE1VnJadFJFYzRuMkplVkpu?=
 =?utf-8?B?SzZhTUU2dWgram8xQTcvL081enRIU0l3dXRwTUgzTW5jdGhjMDVRNTNJSEVa?=
 =?utf-8?B?dm5MVTU2RldEcCtxTVZRZTRCTFVxOWl0aVhTbHlRSmpJdUxVekVhcTZuUTNn?=
 =?utf-8?B?Z0pxYUI4WjBmY0ZLY0FoMlAwWk1NaVdYdE42U3RJSGhWMkNjSCtDUTV3Uk1o?=
 =?utf-8?B?aVhhK2kycVlTRXMycHZ2a1Y3OUtyTVdCampnU282MzIyUExlT1k1dXIvb3E3?=
 =?utf-8?B?bTdEQ2QxMmdjRUN1ckdBTG5pMkdRT3RLdFJRb3Vvazc5b3pNL1BBd2liTkFE?=
 =?utf-8?B?R3FkeGJyWFppVEFPZnVZcWlaRi9jdWdqUHd3c242amxxTzErRUZvU0RUMmh4?=
 =?utf-8?B?NWFYSmRKL0hPR3ZudVM3ZGFTMEFsOVFDbTZaSWJWaE5YU0EvbFJHTHVqRTEz?=
 =?utf-8?B?RXpTOGpBWGFnREtrT2thQUdxZlY5UmpVUU02K1daNjZrbnlsOThsWkxxS0Ro?=
 =?utf-8?B?c095b0dSZC9JWSs0RWRTUE9JbUtRMFpPLzNjMERjVkg0aVJkYzZRbExPVUVq?=
 =?utf-8?B?VjJXcEZYUk4ySzkxYkVlNm4xVWFVcHpMOEFyNW9ydW9UdUNScjA0M01JeFFY?=
 =?utf-8?B?WFNQZWw1aXpWbmpOZnNKdTk2L0FEbmxONncyeHFEMU01aGlsVHM1SXcrUmdQ?=
 =?utf-8?B?ekg0cTJmN3VUNU1NQm9iTWg2QUZqcHJVTTZINUo1a1BDcTdqczZqemtBR3lu?=
 =?utf-8?B?cy9FWmsrTTVGcVBCdGFZaW5Id1VBSEJ4UmRCTnZWNjBpZFVoUkpUV29mSDY3?=
 =?utf-8?B?dnVPNGdZdW9lY1FlN2NLKytDRDFYeHg2a0wwaVovTDFtK1JlS2pNb29OazZM?=
 =?utf-8?B?TFdTUkR5SHQ4Tks4WURuZ3QyNTlWbFI1RjFneHlJZG01YU45dTlQUlZKMHFh?=
 =?utf-8?B?aDYzRHlUUXlQNGNLcVdjRGtSQUxzak9UL0tlMWxLZXRpT1NNeUxsS2ZkMkRu?=
 =?utf-8?B?ci9kWlZFUEwrdWNsN1ZjWUc0VlhDd0c1ZG1zRGNDaUJUUkt2c1Y1WGhwbFZs?=
 =?utf-8?B?MU9BN2IxTDN3NVFjMURRZkJEYXlaanNrd3JZbHZXS3hCZnUyN0F2MDFqVlZP?=
 =?utf-8?B?a1JoNFZBRkliaDhwdzVwamJHRDBpQzZUdERMa2ErbEFXQTBOc2hYNzN5UlBI?=
 =?utf-8?B?YWdRM2dLbitrVFZFajBmQUNFNUxrcHJEN3p5REJYK0pxTmF3VDJJa0UzN1Bv?=
 =?utf-8?B?eWc3R3lsMzU5T3ozcmVyQjFxRUxGcFltRHZoMXNSRi9MY2N4KzhHZS9GVmYz?=
 =?utf-8?B?cTVmSHNUczB0YUovYjUrdDZWS01DT2pLeEJoU2ExazR0dlV5SXA2dERWZFlC?=
 =?utf-8?Q?XPT4sYNHvZD0pYUqh0q4K40=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c7bf43-e067-4ddd-0123-08de33513f4c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:21:58.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9EFCevfEN3eKH95gy3/FBYW32cfFBqgy4yFNCt73iareVAzLzNcjJayjdgulLvpYrAB/fSjYf9dX/2w2vmQ0aevpA5uGubqaYlcONG0ukc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7148
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 16/23] configs: stm32mp2: Enable LED_BOOT
 for stm32mp23_defconfig
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
> Enable LED_BOOT to use led_boot_on/off() API in board file.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
