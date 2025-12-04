Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B54CA47C5
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:27:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5AFCC628D0;
	Thu,  4 Dec 2025 16:27:45 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ED5DC628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB4DucQENUManLN4NP8Iq6vhxa0PzNTz8/Ie35mUcWLSvnaSoliiCin89G4/mhd9WNeoQiEsZiCr6gFTUNrxvbKzUyXAgJy3jT0tPoxk9p8lY2Wi0CPFhWqqBeN8DB7ZfTehzDYDvXbUKNOaDIJ6rVa1hDBVxkS/pufgTERU/ItWJly1NNI79kwhChJw9XRb5Y31GaFRSN11tBJVzSU0Z6gOpZmSfsk2a3IiEgSSkrN7E6br5kxR0y/NGrTdCPgSuSMTXe0uz5hRfsmMRdMdPwh7TcY+rkHNiorS+EtqS9gi5QYMqo19lNFj/63l4bCxueD3KHDiJ1j/tCiZAOWkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLqM1QkeiwDtj4ShDPWhQz5BImNzjW0Xgnb4hyn7354=;
 b=Jr4aIH+dlm8lWzWaS/3xI1YSS/3+APuDN5SigxkpE+AThrkZp7CNyDlzmpJFb/7ArjGnc7KILccKmhuMxziaNoi7ut2nx0042xaVobkZvxrawpXsqD1xy3mxcV4IIKFoYS/oWxZ6Hqr9w15oG1CV9AHmRSyUd5ovlD38lBRFRwq2JWjUPRR0RywnlVIR0oKD0NHkQi6aE8f8IXBu9Ifhyhsrwqgv6VHVLAM2W6BlQyjrKHMETgFC1FhJpim3L2H8JHWfq2Nlun1yG7/NIzCXrWXFeKZyf1/3yzIX6u5jTTSxhtal4a7Zv505U4WOu1vvh6ibs61vR3Ciipls5Rq2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLqM1QkeiwDtj4ShDPWhQz5BImNzjW0Xgnb4hyn7354=;
 b=D8U2ihvzL8DTca7g9dZOusKHypiDRInt2nHVbgafa7Yr/W32PEzKKtFYhiz6xibdCIHFIY0n1cduvYn19ambb51LbDbBYZ3W7t8yyHqI/+aSFpBcP2hNGg9sEWeHNJI1F6xK8JdAh6UQqx+rpVKT+8sVMMr0Ws6nQQkbFyII5Jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11682.eurprd04.prod.outlook.com (2603:10a6:150:2ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:27:42 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:27:42 +0000
Message-ID: <950e66be-0626-4bc7-b808-f342cb8f49f4@cherry.de>
Date: Thu, 4 Dec 2025 17:27:35 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-20-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-20-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11682:EE_
X-MS-Office365-Filtering-Correlation-Id: 464d5963-5448-4624-8fac-08de33520c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUNaTldiekxBdEtuTW5nM1lMTndUSU5GVDJHME1nNVBDdTJBVFk5b2xHZ2pV?=
 =?utf-8?B?R3lETGJHWVFMSy81cTcvM2hLWGl6aWFzZ0FYSzVOVWtmcGhYdytIalFDSW8v?=
 =?utf-8?B?YWo1NGxxYmV6ckxPR3llQ1JwajBhb0FPK1BCRTBwVUx5L0NRdUx4a1JEMWkz?=
 =?utf-8?B?RlVKWE1CQnhWT0w3SFNJUW5sQUphTmd3NlA3cjRWVG9kNmZhYzFFUkl0b0FD?=
 =?utf-8?B?dmNwUVlNUlgyNmFLenNYWHZyRE5Ra1ZIY3l0MnFkNVlrMnpHaVBBRjIwQ1ZL?=
 =?utf-8?B?Z3M5cUZ6Y29tYm9WMk54TEdJSWcxbURsWlhQYnU3dDZvekt0SWQ1OE4rUUZj?=
 =?utf-8?B?WEpXbjVRdnk0SFFmVVAxNmtQanFJbHVacFJLMnBLVW4rbkl6MFVhT1dRUWxE?=
 =?utf-8?B?cGxGS1k1SXFiMElrTkxtVUVSTkNJL3gxKzA3UjdCdHUya0tWSHhZZDhPQVMw?=
 =?utf-8?B?ZDZINW9hSTJVVnBvSWxDT2IxRW41S1BHVUVkdjIxMnhsbENmM1V6QmlRL20z?=
 =?utf-8?B?TnhteWhlRzlxem1TUzBWOFlvRExOdlorZkFwajh4NVBTcFd4SWUyL2RRMEdN?=
 =?utf-8?B?UDRUVFlSN0VJY0xLc1hOWEVYMFN5YytUYnlBQUhBVHBnZHdFaURNL1VaYTE4?=
 =?utf-8?B?NTRxajJBZ2ZHdmhOMm1vOEl5bUMrM2tHZStpMGJ2YnpTOFlGV0UzbVZQT0J5?=
 =?utf-8?B?QnJjdmVxK3N5MmEySlNpUDB4dThxTllKY0xqb0RzMFRmYVdrU2FhbEZyVlR1?=
 =?utf-8?B?ajZ5ZjJzbDdOeURiSWVic1dUcEUxN3RSOEwxWDdqbzlJY3dWV3AxUGVLWEQ4?=
 =?utf-8?B?cDBYN2ZQeUkxRTl5Q3orc0U4NjdLcGR0YW9XQ2czekRzNllXeW8zc2p0Rm5q?=
 =?utf-8?B?ZThpd1dBVWdiemVDeXlueWd1N2JkWjF2emVlUkRCR1VGdEZ2RzBkYVVQNFZ0?=
 =?utf-8?B?ZkJpYkFZQ3k5SzZRM3dJeWxpYmphY0NxRHpMcnJvU1J5d3o0N09OVVlZb2Uz?=
 =?utf-8?B?Z2phRjdxS05pMDlMUEh6enhZcnpmQ1ZRUVc4MjZ5cG5WZmJuZmYweGJoWDFl?=
 =?utf-8?B?QVNMOU9maVdrYlJWUFhNNTcwemowMFVaVXUyNE5YZlV5RUM4MzhjZWdOMmJ4?=
 =?utf-8?B?eWxGZlpOTG1vcEN6bjM5akJrRW9qcHRqUUVDeWpHV0ROVVBIUXlGaGJlWlZ2?=
 =?utf-8?B?SzBOOVczRHBZM3VibDluN3RMYXhZK2JUY2lmbU9GWlhSNnVYU2lHRDZUWnNT?=
 =?utf-8?B?VHREbCtIREREVEZPaU4zeUVHT3FicDJMcStUWHkyNG1Jdm5PZ1dkVDBXaHFG?=
 =?utf-8?B?RHdjUUVCQ2lDbDAva2F2OEZVMnpYM2RyYkEyYmRtSDQrZDI4dHcrcTRUWmpm?=
 =?utf-8?B?UjdjVjI3anJFMTdYZzh2Z1pxaU5JVUI2Z1ExZmdyWE11WW5yY2wrMHIvUlB5?=
 =?utf-8?B?WG1USFh6NC92Ukt3bzdaY0I4NHJEZk5BSG1zTlBGVDQ5VFZHTnZ3ZTFaM3FG?=
 =?utf-8?B?UHRxUVpZMXlwYldBMldaMUd5bFBHblNZQmlvWTdDSE1KdXIvbjR4emdEM2Jl?=
 =?utf-8?B?c0RzVEgxWU8rN09pS09FR2t1R3Q4bFRxWlVncWF0MkQwSm1xZzI4UDFxOXFN?=
 =?utf-8?B?djdERWsvNjRyK3hBN1JWZ09sV3Y4dnZsOW41YXYrNWhoekYwNGkzYTJkVGlE?=
 =?utf-8?B?ZmtGOFppWUlIZ3VjY3JwR2JuSXIvdlRuU3g1d2VEL25uNHQvcUs1dGdSQzN0?=
 =?utf-8?B?T2k0UXhDakFPV1pweVpjRHlDLzZXNHRvQWo0Mm5ZQTRmLzd2SnU2NGR6WVk5?=
 =?utf-8?B?NEM3SmNwTlVtbFpiYnB1WW5UWlQwbmdOV1ZVZ05vN2pBNkNDY3ZIc0NGWFQ0?=
 =?utf-8?B?WmtpUWFOVzhZenRNZHRES2pvYXNwcGFvcmpEWm5VZzBKTzZaMklUVDQ4UGtw?=
 =?utf-8?Q?okly1dC6UxoBh6mdfl5jsjr9gEeTwTwK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wks5OUFDVXgzZ3dsWm0xRTFKeDRRTndFaU5ncEF6Q29POFNYVmh6Z0x1YXhp?=
 =?utf-8?B?aHYrQndqZG85QUVoMDY0bXUyZVZOenoxN3pEZzdYYS9GaXRIdFNkc29QTC9p?=
 =?utf-8?B?Tkp6ZjkyWDFoVWdrQTJuZnBHWmtCRmZjTHRCVVZsUFZ3VXVGempPN1BuRXRn?=
 =?utf-8?B?eExqWGZ6L21vQ0c5dm9xU0Z5QWVNQTRFbjJiTE9Sa3NtekdoS3NtV3RKQ1ZX?=
 =?utf-8?B?b1Bva2p5eHNJNWVUTXJtTnhXVlN3bU5wOG92cnoxVTJDUTVVK0hZMzBKV1Fj?=
 =?utf-8?B?R2E2YlB1UHQ0UlBuZlVySEdBWk12SVBOeWd4M3FLMG1ZdmVKakZ3aktGM1dm?=
 =?utf-8?B?WHdsdXluMExZN2hJMFJyVU02SldiaW5tc1dUUndqNTZWdW0yNDJIakNVZGE0?=
 =?utf-8?B?VlUvTnZ4UDZFWlNLamYyKzVmN2V0aHZGKzZ6QmgrMzRkNkZyWS9MZ0ZidVg3?=
 =?utf-8?B?N1FLdmJkSFU1K3d3Qyt1VUlJemJFZEJ0cmpxamdVRjBHRHdvWlNSZXdwUVk5?=
 =?utf-8?B?YU1wNjNNdFhPaDZkTTVOL2lycFg3Sk81SVlWck1GNW5tc2xQaG9pVGJBTS9a?=
 =?utf-8?B?SDdEYnRtWFVIYlJKOG8wWll6MTM2OEpzTjhxRmRlenFJSkgwTVMyRjAyQ2Zs?=
 =?utf-8?B?eDNlTnkySkovM21ZVWR1cEZTc3JnSHRoZE56SHhiOGVqTFhtWHhCbVY5MUpa?=
 =?utf-8?B?amNoMEpUVUdjbGpXT1RIbzRmN1NSSko1V3FZK1NmRmJNbGU2ZGx6djJVdmFB?=
 =?utf-8?B?dENEY3pZTTZQZkJYVTQwZldJdm1iUnpDOHo5OHB2aE9COG5iK0dhNi9qTHND?=
 =?utf-8?B?VFJXeWZOalpZNDErTWhhK0ZCOFRSRjFtSERqazZNTmtYRVBYUHBiRVdic3R1?=
 =?utf-8?B?ZnpWTExaa1RhWjNSYzhOcWxiWGVrYTNOU0hwdmtqRTRrbnRnUWpZckpWNkNW?=
 =?utf-8?B?R1FlV2F1Q010N1NCWjZzNWJOWDNCS29QdndTU240K3VKOWZWSUY2K2ZSMGJL?=
 =?utf-8?B?d0xRd3dUOFNQSmRBdmRIdUdCY3ZHOVVzczJUNTc0NlJxZzZUeHZDUjdxSjJO?=
 =?utf-8?B?TVNnaC94bWdNdDJvZnZuSWxxc21zdzd3YXFCcFhRWWUvYjZzclNpalhCVDVF?=
 =?utf-8?B?MDJ5UGNvU3pEbXAvakJ4WHovTFl0TVhDV3R5TDhER3M1U2lXa0lRR2U4VkFC?=
 =?utf-8?B?c04za2JSY051WnBQb0c3TXpGSWRUeVNwTHlYd3FoTGJiMDMrRFRLVEZDU2t3?=
 =?utf-8?B?THBZRFNrRXBBaUFQWmE1V0d3cTdINFlGck1lVjhyU0xTYTR5emVNZVg4OVRZ?=
 =?utf-8?B?R0dLZlR3RzdOVGltVFZIWDhtMm12aE9lZ1R2Uk44WG1vTnAzc09JWUtBVEpI?=
 =?utf-8?B?Q3R3SWdRS1FiOVFMTHVVS3RGeXlpcyt4KzFLQTRsdm1Odk52WXFXQlI0NGIx?=
 =?utf-8?B?dkR4RS90M2JCYVNCNThGcTV2RlJzWXF3bmVxK3hGaWZNRjNaelN0Nm1qK0pm?=
 =?utf-8?B?a3dCVTlDeUthSWdyQXNrV05UNmZDRE9Xc1o5N3Y1SEJJTUdsbUsvV1pqcTlj?=
 =?utf-8?B?VzVJZEtpQzFkZkFDbXc1RkVzUGIwTk5FMm5xU284RG4rZy9vK3NQWDVDVGt5?=
 =?utf-8?B?THBUVlFiNlprVEtBZDhmTGdOVE9FNHRyM3RaVUUvNEJxOHRsRlpuZmQwS25Q?=
 =?utf-8?B?Mi9sY1NMbnFkZmNqK09ZKzVkSm5JejFmOURhck1jbkh0c2IyZFhHU042NFY2?=
 =?utf-8?B?Q05BL1cvQVR2WUl4OTR0Q281OXJ0VUdnT1FCYmdKTlhRU0IxazIwMm5WQVdC?=
 =?utf-8?B?UFVzai82K3gzVlhuMG1EWFNtcTZ4NnI3QlowMUFYZmtBUG0vZis4ZVZ4eXls?=
 =?utf-8?B?alRCd3g3ZTZ3Ujc4SXFUWHFKekRrcGN2WXFQcHlCWG1GR2xaNXBrb1J4VlFB?=
 =?utf-8?B?RTZtTllNRUNIdlh4OW9lTzhmZzduTTVvdXRjM3BrSGliSktlN2htYTZXU3RC?=
 =?utf-8?B?bXlDVEVFWHBSTGdXWDMyb01VRm03SGZ5Z0NUZng3YUJzdldRK00zT283UUYw?=
 =?utf-8?B?SzFzbS9Dd0J6VHZ0MU1WMnV2bkFmdTZCMmlhbWxJc2h5Sm1yMytyVkFhNDRK?=
 =?utf-8?B?Wmt1TExoWW9TbkJDS1ZERjk2SldsSC9tMnFNUHFPNXhvWm1Ta3BGUm0xZ1Jl?=
 =?utf-8?Q?z7DdlVGc5vydTF1XLdZAfhc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 464d5963-5448-4624-8fac-08de33520c73
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:27:42.4032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1r9/QlEDos4enIQP9qd1SvRk/A/4qdiCd8SddeNYclMV0QMPcNgagy6K1mIJIFbwTuRDP77xQ+LPz/Z/Fr2MDyIGwzLDsuWXdwLD5+A8LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11682
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 19/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp157a-dk1-u-boot
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
> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
> from stm32mp135f-dk-u-boot.dtsi.
> 
> Remove led-red which is now available in kernel DT.
> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
> 

You may want to wait for the DT to be sync'ed with Linux's for this 
patch so that the red LED can still be used with the led command?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
