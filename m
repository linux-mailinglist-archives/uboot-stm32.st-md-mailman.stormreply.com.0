Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A5ECA4721
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:20:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09F46C628D0;
	Thu,  4 Dec 2025 16:20:41 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEC85C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9g1VKxEhkcaFHFilSJNITHnyLpsQaY1gSYZy353UMqyRU4dFz65+YNh9R+LpqOeanrywx26cJwU+DOpdoe/dUnCJoV1YXNqMM7QEMl0p0hutLKgIq98cbzCYwVk1R6uQVDCilQJAr08GgzMb81eUzCl3yM+DAEqDJ0ZeJmjXczl2PvQVblWQInawYRhMzDvii0NxAKZzYTqIt/uO/Mx38sRQH+mMbJNPcH0ahdLuMz4eftLGASIAl31sEFbVh0g27c2V1SDSJsdrVCeA6Brcwk6bZGRqUxOnn/h0pu0VqB6J0PtUun48N8v3ozo4NSwKJz6jtEzpNZAbfEXzBvEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=K7VPUG4h+CSLKZ4+5UYkADk0ePpiwxVBkQzYabR921Z8dLWBSNffGY4mjJdGIsNm/5dXzU4gdPzVC0bqFf4XkwM2kDGU6r/bfQ94juVr3UclTiiOLsDXFSCRyyuB/W9mPErnyzCSSg7NhQaTF/fdIjcvXxSMeoZm7U6MJG+5wrt7wULeaNs1s5Pb+r2tb3JteCgg0u87M28o2XZV4vgIjBGbNLbvrhnqNsrF6AOE+ZjsyKWiQxWmOJgir5am8nyaTm31Rn0J28sEAZK/IftX6NbUA2kon3moFt7vlbvXDBTwvNYD5hoODtKHUs8JgipznsxX87nFQWQMDiaVUR2gLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=e4IBMeA8CSlBSF66dKQeHO66sjjFdQyni/yb/i+GivfJq+aicr7kAq3j+O3/5C87lM3QuUwi6Dk5IwnypkBDE19HuMMbTFLvKHedQ27+lpNnS2fGPPopIRMVjnmrLOADuJwMe6YfyGQEq00GfYqonOX5u77sP9r3FtEv5kED0kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBAPR04MB7398.eurprd04.prod.outlook.com (2603:10a6:10:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:20:37 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:20:37 +0000
Message-ID: <26febe00-38aa-4a2c-b658-4e7c6538602e@cherry.de>
Date: Thu, 4 Dec 2025 17:20:36 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-16-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-16-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR4P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBAPR04MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 2187b677-fe10-4149-f5f6-08de33510f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SThGa3M3UnpEb2F4elZocVM2MnJPUUhyWUtqdDQwRDk0WHhiRStKUDR2cytR?=
 =?utf-8?B?dHZyanhNZGprblFlZlpwYkN4MGVGVW1mdjQwYXNqcW1WbkhjVzJURHlKZmVX?=
 =?utf-8?B?WThjNCtiZXVWS1QrYmdKajJCUmlBMjBhRWs3SUw4cTNsT0NFeGRqZnlzSWlV?=
 =?utf-8?B?QUJQV0kvY2dlZUFqSWN3K1JMMmlablFKZGJzYm1CK1diRXdpZ2t1YVJ0QkQ2?=
 =?utf-8?B?eHNXZUhmYXhVcGNjNHBUNmRlSzBkZHpNVktPNy95ZU82UEp3elkvWHhVM0dw?=
 =?utf-8?B?RERvZ2x6RXpFaVF5OFpMdm9rYTFIMlpINE45ZDdFQlViQ1piTzBicmlwcGdW?=
 =?utf-8?B?VGVMUVJuRXVudDFMdVAwMjRvK0FEOW10REVEcmd6T0x6aDlYM29pYjNhZlFN?=
 =?utf-8?B?dHkrZCthOTVnNmFaSW1KTFdwZUNkVUlkelRsR09hRmFEUFNYY2IzUFZrZnZ0?=
 =?utf-8?B?TW5BTlpBelUzZ1VUVXpzL05SZml0VGFmZHJGRjh6WGxpekFQT0dsMXNHSmpP?=
 =?utf-8?B?bmhrcE83VGY3a2Vnc0orZzVzaitBSkZoaTZzTFZrMGVWbGw2S2lrUVY1aTN0?=
 =?utf-8?B?bDhSUjhUcFR2bFRyOXVWc21wdVZXWEwvckQ0U0c1WGc1d3F2dkNKdzkrWDZM?=
 =?utf-8?B?ZWltajBEV2hBZ2lYYXh5eEx2UXVoWWRYSGxpalowUGgySTM5L2p5S05scGJR?=
 =?utf-8?B?ck04RGYvWDlrb0xHT05WUTh6UlFTWVE4NVB6cThhSzJ0d0dYRVN1Z0lIelg2?=
 =?utf-8?B?MGJtcXlXZHREdDJuaXdUZzhkVTdTbGJDQXFQeTdkN3FZZWRHdjNlS3JuWHZz?=
 =?utf-8?B?K2lqcXNucDNyTE9vWU1KOXVSWUN4MUpycUpUbGF4RE82Z0dCb2I3dnhqa0dY?=
 =?utf-8?B?b0FpMk9QdEN2aHBGTVRXVmYrWWJBV2k0dVNBc1RPU2VVbm52Um1DREZ6b1FE?=
 =?utf-8?B?VUVpWnIyNTYyQmpnZitibVZtNTNRckljSVE1Q1oyR2tBd2VVckxHQVNDdmJa?=
 =?utf-8?B?RkQyeTRqc3NzVjlHRUlKK1RVMTlUVVZaNFpsNm1XQlZTSGdlWi9WUzJHR0Qz?=
 =?utf-8?B?YjZudDlRMXdXRkhFb0x5NkhUdll3M2s3ek9pS3VORlRCbTFHRHVYNXpVQ1Js?=
 =?utf-8?B?WVMzSk8zMzRyOXdSS0pSa3JEOW15Y0txRGgwN1lDd3BLWlVpR2tzY3haRU9v?=
 =?utf-8?B?QVQ0eDZub1oySmRYZEY3dTllems5aGFjblo3SlI5UzJmL3JDdVIyVGQxTFpC?=
 =?utf-8?B?dUZBZEJJTWJpRFVVbElONGF2YlNVZHliU1NkU3c2R1VpTUdXVytiZXF4Rkxj?=
 =?utf-8?B?U2p6bXVrK1ZEQm9wdGFaR2dXbTRzWlNacmdDZmk4NWxLZGowa2djRHQ5ZlpP?=
 =?utf-8?B?ekJRNGYxWmoyUmRBc1RreFZQWXNZNVZONy9iSnhJelNzRmlubk00VENVaUpn?=
 =?utf-8?B?TUZxZ01YajFIR0FQdWtKcFlHeTltOU9CR0xIclY2MGdmMEJPK1hzUTZqU2Ro?=
 =?utf-8?B?L0lzS0RkZGkyak0xRWs0ZUZXVzNxMkJWZFp2N3VpRWd2RWRBTnhkUEp4djV4?=
 =?utf-8?B?bmpEQVZDNGV3ZEtMU0hUSmFBRWhHQlZNTjM4U21zeWw5VEZ2SkNNQ1A0Vytx?=
 =?utf-8?B?RktKdUc3WDFMUlhQT3o0K09nWVNjQXpJc20vclZFcVN5Ky9PL3ZaU2NZUUpo?=
 =?utf-8?B?TmdyNHd2US9iRGhoRlRLL0pMVUVQLzlGaTRIemsvb0pBdldldTN6MFJzTzZu?=
 =?utf-8?B?dzRSZGM5NDFNV0laWE5XWFJsajB0S2NvNVJFMmttS3BJV2UvU3d4ZkxlZi9V?=
 =?utf-8?B?S0N3Q2VKc1JWaTYyUloxYjc1eFNaS2NURDZDNlhmdjFPR3FCc29QRXVMVmNT?=
 =?utf-8?B?ekc0TTUyWGdjTUNRa3hqdmhxSEt3aEdxbkVmWWpSWmtsVmxtQThRMUdMUUFN?=
 =?utf-8?Q?CvrRTkL5nuVAYmSprZG/Zx3wuHkM1UW7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNzVHphUkRGZm92aUlTdDNFQ2Iwb1BiQzRxbTRjZmhuVVg1bk1Rcm1NS01T?=
 =?utf-8?B?RHhlZlRMQTVDV1RraGxNMURaVmtiZFRLUFRpSHBxclVwNDFaWVRvT2Y1TjVm?=
 =?utf-8?B?dDVMTUhpbTZ0b01OTWtXbFI4a0srSmF1aWVSZTZOUWxjTlBoV0NSUmtiYUJ2?=
 =?utf-8?B?UDdaUzVIa1JQd1NlTVEzc0E5YUsxdlpVdkd2MGg4QkdnK2lEUFJuMTR5SGdC?=
 =?utf-8?B?QXlQTmxlOGp0VWlzME1oMUVWSUsrenNkellwcTdvZE5ZNS8zUnhJZGxuYWIx?=
 =?utf-8?B?U1JEa0k2N3B2TFc0SmFUVkhuQ08yWkVOZnlkd205UTNaUjVaNFYrWlpOR01P?=
 =?utf-8?B?dGg0My80Ri9HbzBiaUFPck5Fd3VjZTRPaUx2TGtlZjkwcFVKK3pJRWlkVGpr?=
 =?utf-8?B?a1cxNUkvUE90bExWQmoxNUpVS0tNT1NKMFhMUHRqazUzVzU0RmFoeTF6bEFS?=
 =?utf-8?B?VGtpbXRpMXoyQWczWEJoSDJpbE00SDZPUU5DUjFORmhOcXVPR3pZbzJrSHdr?=
 =?utf-8?B?aTF2WGFMUlcyWUVuTjRVQjBxRzNXdmwxbnlycVhCbmJTa2hHZXgzaWQxLzRB?=
 =?utf-8?B?ZWNNQitNZG84Y3pDR0N3SDZwUnNJTG9SdmQ1U3NvdE5DOHNLZVVJYTJ3aUZC?=
 =?utf-8?B?V3FoZUg3Qm5hUjFPZUFrQXAxMWhkRHRzdGM1RGFkZnlrTTZ3Nytrb2pWMGVV?=
 =?utf-8?B?WEpCMy9aZ0VBeHNJNDR1UzN5d1NUZzVSeWFpZnZGN29Md0JDVS9OdVV6eFB1?=
 =?utf-8?B?aFpTTlVrTGVpbUhSYTljalMzNS9Dd3ZPNVl1dDMrd2Vmb0NLMHRId1lSQS9j?=
 =?utf-8?B?NXFUbC81dTd2Sm5MdE1NN3ZpYjBWQ2V6YW9MbS8rQzhkREJITUMvZzJiZjNm?=
 =?utf-8?B?WTUrUloyS2h4c2tFTWpZd1ZyR2ZLZFdUOE01UVRyYXIvQ0p3a1F5ejh4b2Yz?=
 =?utf-8?B?bTBEZ1k0YVNwbHdSRVljWThLaVp0cmgwbzEzMzRrdjFkZGN3RlNmclR4ZTAr?=
 =?utf-8?B?RzB4SkJ0ZXB6dFM1RmJkd2VoYzhLb0Y2WlVaUW5Xa2U2bFBJeG9pdzZDY05M?=
 =?utf-8?B?eThzQ21TYTBpZDZWM3p6TkNEVjRrQXQwZFhQL3UxVVBMaHA4MUNxTjlObHE3?=
 =?utf-8?B?Y1JocGI3bVI1N29hSU94TGNwN0dPM25BOWNDWE52ZmU1RnA1aEVRMG1GR0xW?=
 =?utf-8?B?QUwrTUoyVmxaRVh4RitPcFdSR01HMEo3eldNcmlyRGFDV1U2d2JjdDhSUEZ0?=
 =?utf-8?B?N0ExL2lpbmJuQVl6eG8wdnNGb2JWaGdUZ1ptTG5HVGZLNHJRMVVqV1UyMDJz?=
 =?utf-8?B?aFY1RjhpS1BWNkRtWTFDY05sRWYrUTVZUW1kZG9KSndzTXZZS0U3MU0zWEJV?=
 =?utf-8?B?ZnJrMXEvY1JlUDQ4YTdVVWIxRHRXaE92NUN1cytuREVaRUROQ0RIdHQrMkox?=
 =?utf-8?B?aU16VEg3U2tSblJ4NDZGU2dneXF5MlVVdCtzK2lqdWZmL3hXbXFsVHFGQTBO?=
 =?utf-8?B?SnNoWGRySU5lYnBqamdYWDBYTGFMbGVUL3VUd1NwNHIvKzFCeXgybytib2ts?=
 =?utf-8?B?T3pOWmRoNGlTci9UMnRNZVVSY2ZKTXFtNUNPVVdYYWNlM1B0Zll5OEFzSWts?=
 =?utf-8?B?QTdxQVFKa1RSSkNKQmVtbGt5dmkrTEZFRmNNWVVjZzRHRExhak9YaFFmQURu?=
 =?utf-8?B?YjVBaGZQQ1RsczNoY21EM2JEMERPdFQrRHRPS1ArZVNLVjRqTmF4SThWVFBF?=
 =?utf-8?B?WXdVZC9ISGtqdUt4SktlYUhaZmJPdkdmN240cW9nK0FlcllBYWVLam5Qa0JC?=
 =?utf-8?B?ZVhqZ1djYXNFeDBlc1oyZFNIeTJsQmpLRGJjdHlMSDg2MTZVVG93cjA0RGND?=
 =?utf-8?B?ZmJ1TkNVanlEbnlnK3cwRFAyeUlQZUowb0oxZ0FUMHNldkZPNlQraWlsdGdT?=
 =?utf-8?B?WlRkek1ZS1FoYk01UnJOMkpnY2cvQ1kyR2dJdFlPcDMvZTIxSkJJbnYwbVdS?=
 =?utf-8?B?ZHhmS0Jzd082SFhDdXFTeFRqWU1UZEs1dWJkQUh2bm04UkREWUQvNVl2QmUz?=
 =?utf-8?B?K05YUG1xaUN2ZGZjS2xLdXZtL1p1MVhhdDNJL2tHa0szNGZYUlpMMDFqdnhD?=
 =?utf-8?B?NFlROTZoZGdpaSthajQxR3p2TkZzT3RpNWE5WjBWZUc0NFVSNXJJQWw0QW1D?=
 =?utf-8?Q?fYiB46r/M3KqFkALvxri4i4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2187b677-fe10-4149-f5f6-08de33510f4d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:20:37.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBGF3QufLVIwsPTLy++yC4GL++3abdnylf5bL9jNHEajO23h/DrWPl/VSN+VuHuXiTLy9oRYcS9VCRFYgASnJIYuScXFLvtKVRtIQ4gdkkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 15/23] configs: stm32mp2: Enable LED_BOOT
 for stm32mp25_defconfig
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
