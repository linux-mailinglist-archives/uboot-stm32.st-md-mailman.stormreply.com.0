Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B06CA463D
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:03:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A5FCC628D3;
	Thu,  4 Dec 2025 16:03:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011023.outbound.protection.outlook.com
 [40.107.130.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85894C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u86NIRJTeO2BUK5oJrhIYG98WksW92OrmyoEeg9WFQcl/aHSc3rLjCVQwgi0Cft781zxS35bO2ERnZgMemA3ev0R0Bo4zz5I8O+E7WEQrXB+Tm0vs3Mbq8DWOsXCdeP+qRTvli+pABK0Op3kUMqGmOdIxG8Z1w54IOkI8N96PYAwtAHHi0lTvVlLFcddeS94UEZ+rj89ZDynd17uP+qwifU8KB0kibmwvIkn2EG+rjhMXOkACKHiUgJhR3D8CUVw8bGP3eqyvSiP8Zc9dlhHti9GuT7Pw2CIYbSh+yBC1zLVvD6HsfnJ0EgXopFvltF70ggycGAK2/eeQNXIYqKHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=GcFHxIr86k+dXN5geZL9eVXNVMLXEa+Q8Wn0SQVxKhZGtzTL49nGLmMIBbYHO/MPNxdpbeGVepZq9mh9xtyvBeXhS1D1nVqB0r+B4hCfjUvRR2etoC9IdMy82RM6bHkwkteYV/aXcs1km9mB0kzCeFsWRhvZkn+PksoU2qblb4QEtoyiX0rvqZPBIBvRbZuHl2Lm4PTjLHcuXebOSmBD/up7rECZ6lQKhuthsLFQgHEZiYfP7T9ipPCs6bbxJQfWsQQCc/kRiYUVDQJXlb67uP8QpnonJld/4XKyZZkaX2L+iIKJlireT+bQuVv4w1tfX4GnCAi/pqw82y9HS9z5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=MBo4Ut5JWEd5fhFZ1HKJMqaC4uWBh/spZ/WtXdNgCcHU3WlOTlNurgfokwFmijn+LjsXZjatlmNYbAjnOE3Sh07UnqtHcS4tGGhYjIC4SLHgHIvrhG/NIY2bDfK6Wf6tQYVOrUZyQBJRNEb6zkYminKWuCDKE4FPcZKN9/kceVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:03:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:03:08 +0000
Message-ID: <9e5313f4-ac17-4d86-b10a-b3a426868f84@cherry.de>
Date: Thu, 4 Dec 2025 17:03:07 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-8-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-8-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c5f298-38c5-4c03-1d46-08de334e9e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akJOTWxrazdPS0tnZ2tVZFRoWkFBTUJUVjZzM1lNWjFSZmxaWlNCd0VxVUFY?=
 =?utf-8?B?eGNiTUUvSlBOd1A1K2R0OFl3Qm15SzVLdThPdGxNbzl5ZllpeWtPQlM0YWZm?=
 =?utf-8?B?eUdCUXppb3IzTmxRcWV6aVE5RXRrcnVsMVVhM3VZM1JONjZSWkwzSUVWSVJt?=
 =?utf-8?B?M1dhMU1yMHRwbWhCbXRUb0JKS1dCbGU5MEJZa0dUL2s3ZjFTVEdGUmh2b2JJ?=
 =?utf-8?B?Qi9ldVlXU2gzVjM3UlFrZ1lxTnhZYzFWdUJRb2MzNndRaGxxWmRacHNCanlj?=
 =?utf-8?B?TzFnWHBIWmM1eHZ4WWQ1eDlYN3oyUVRaN0loaHR4d3BDRFB6bW9KZEhVaW1i?=
 =?utf-8?B?a1Rwa0didEFvcUhpeEpPVXY0WUNPcHZjU084d2phakQ3WEQ5Y0Y0b0pLUzhY?=
 =?utf-8?B?N04yaGtoVnFYZGZwTFhuRjVGYUpWZm83MWphZklUWnRFZjVzQmpQMm9EV1FJ?=
 =?utf-8?B?ei9WL3VFMGlXeVRiUEhMb0h0RytMT1pjNkFENkdFRU8vWGFVSERoSmJpam5y?=
 =?utf-8?B?N2ZJQlVBdWV5QWRYb2ZXNUdyenlKTVdycnRjNCtwN3E2WnNkV3hGM0R1N2wx?=
 =?utf-8?B?RHF5SnFyOHEzWDVzZ3h0bllRNXhFOVFHaE1heEZ0QzVGU1Zkd0gxZk5EanRr?=
 =?utf-8?B?cXpiNC9Eb2J6WHlDZzJQOGtRKzVqVVF0bFl4Lzh4YXNhOVZnUXRNQXV2ODUy?=
 =?utf-8?B?ZytzOXFyZ2tLQklVa0xHemVVY3FGRG8rRjFPL2NpblRMdmliaEVaaU9heHRv?=
 =?utf-8?B?OTZtbGRvTVVPLzM5YjRzaW04N0dpSHJEZFBPVzlDM1dCUXVWMWVNeCtZNnQ4?=
 =?utf-8?B?Z0tFRklSMTVSRnpqd2hlU3VaQi9tblJiUThZcWI3Rkc1eWtlLzVZYVBDY1ZL?=
 =?utf-8?B?cU5XOTYyd2N1Um5uTzVZMnRXeUc5MEx0dUJvY3NiTmVZTjdVZVpFdHp1d1h3?=
 =?utf-8?B?emRqeVU4MkF4eHlab0hGZFdWSHJDNUlkcTZmUmxrdU1VUWFwa2pxNU5iZnlx?=
 =?utf-8?B?aTI3MjJoZGM3QjBNdUNLbnZoN2FZamZseXRFZ0JHQS9IK3V6TlNGUTdQSlZZ?=
 =?utf-8?B?VlArK1QvSDlIZlI3UHQ0MFNBaVUzYTJjN0V2elg0VHBrdjRseGUyejFaZ0xO?=
 =?utf-8?B?Vy9QQ1BCOFBBVEhuRXNOQzRaMUxvU0Rrczd6TXgyL2g5U0pMZDJObFpYWGtr?=
 =?utf-8?B?NEJ6TTdGYTM3UnFlUStYUUJGMlIyK3NnS1JpeUJtVS9OeHN5bjFsTHpNTHZq?=
 =?utf-8?B?ZUsxWWh5YjVTc1YrZEhmWXpTOEZJSlVHKzhtMFdpZEl5UmdPMTFUcHluejVN?=
 =?utf-8?B?aHB0M1Y2L1AyUkkvNWxhcG93TzNMYzM0a0RmMitrM1ozaXpxLy9yU3JWZkk2?=
 =?utf-8?B?aHNiakpuOVJZU1ErMStyVllna3BxbDRiOXY0T1ozZlNpVG82YXJsTVErZ1I1?=
 =?utf-8?B?b2JCMnhSSW9hOFg4ZndPcFVqang5aERsSU1RNk02dzZCUFoxU0tZa3ZYS3lq?=
 =?utf-8?B?Z1NWa1pXWEFqMG1aZEdacnhjenZYMHhMWGFFRTcwbkFBQXVmcjdQeEdRVzh3?=
 =?utf-8?B?MFJabXJ2Z0FHTW82N00wa0FjL0h5UzRVUTlvaWw2YXh6Y3ltWGdMd3ZlM3Yw?=
 =?utf-8?B?dTRhQUN4THgrblMzd1NWdXptRitsZHpjN0dVQmRVRzFzZVNLVWsrbHFSUHdn?=
 =?utf-8?B?bmhMOUlVWGVPSlZmd2NORVIzcm5RVEhzaVpsMzk3WnVmWkt5VFVuTXN4U0Np?=
 =?utf-8?B?dnBjNXd3RnV4OFJ5L0xWTmcwMEhOVGVYSmtuYmc1MFIwbFBtY0FBZ0s2Vm1j?=
 =?utf-8?B?VGxQL0RjOVg4TWErd2J4bEJvV0ZGQWUrT3RqeDdDMXZteUoyNHhQZDVIKzVU?=
 =?utf-8?B?c2FoSjZyRDAydnhadTVLNWszdHZsZGZoV0tKN1BjWlp6Uzl5c3hKR1BieUhx?=
 =?utf-8?Q?n+BH/UQT9noMj2PD3FzgZqRFJyEDCQhj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFHVFJRWG5ybitYZzg2RTgreVN1U0E0RE0rV29SUFc4VlY2WUtqdTFMdW1F?=
 =?utf-8?B?ZkVReUJTeW9tUWExeWFGU09sQ2JPbnptaXlJNzNNRkdrU0loblh1T1RtTnJC?=
 =?utf-8?B?R29QOU9Ib3pFODV4TU9FZjlSZktxdXRzUG9RWTdlVVlrbkFqNXY3TlZLRGVO?=
 =?utf-8?B?UUk0VWR2ZGxGcUN1bFRNd2o5bmpmZ2g2NHFEOStSdE4zdnVleks2S3JPenpm?=
 =?utf-8?B?Um84SkthMzB2Vk1RcjVXZjlMTnlpK3NKcEl1SUV0Sjl3Si9EaUwwZ2Vrazls?=
 =?utf-8?B?SC9DSUxyaWpsMzU5VjJrMDVrVzZia3JqcmNEZUNsR0MwekVhKytqN2orS1do?=
 =?utf-8?B?aG9jZnZ6RTBLNVlyQXE1QjhybHNrajh4V3c2SFZuZEpHdlZKOWVWK0doWmVC?=
 =?utf-8?B?TkhIeVNuMi84Z3Y1azk4V2hUNDRnNWlFMDdJMUJWNmRBRHZlcDVTTzZxbERY?=
 =?utf-8?B?eDlZeTJMbGEzNW1hM1BqUUlOVmpRL2pjRXFiSkt5WUJidTI1eTF4WXJQK0Rn?=
 =?utf-8?B?NlRvanJ4ck8yQ2wwVkMwRXFFL1FlMUovYThVZjdJVWdzM1N6am5uV2ZGbkly?=
 =?utf-8?B?Wm1od2FWTGgrMHZ6aDdWcVhKSmlpNER0dmpDMHNEenhvWWRhZmhwWmdZUEZ6?=
 =?utf-8?B?SWwvWjNUaTFEcFBKQ3lseTZrQ0VXMEtCeGhKWmtoVExmLzNUd3VIUC9GY21D?=
 =?utf-8?B?Vzl0dllkTkFPTU9vQW5zdmNrSWp4TFQwUk9EamY5R05tTEZzSkxiL1l2c0J1?=
 =?utf-8?B?VGNKd3BKR3MxVWlZQUh3eFQzL0ROa1F5ZW5ITUVDWUJLL0Y1V05iQ2daOTF0?=
 =?utf-8?B?OHJNR1lsa3h0bUxmcUgydmlaRjRvY1dCckRxYVBSeEJnUnllZFg5b0gzc3JJ?=
 =?utf-8?B?WHprTEJiS0xieWtPOHBYM09tb1VXRGJrSlNzUzJmZ2kvTEM0aXNjSmZyU1RP?=
 =?utf-8?B?SWthOVNuc1RvMW5VSmcwQ052emUyT2ZLRXB6QkY4VnZqUG1BKy94RXFhRGtV?=
 =?utf-8?B?eDBDOTFubWg0bEZ0YmUxV0k4RDAybUxZSnl0UUZVb05LWkt5Y3VRdi92dHhy?=
 =?utf-8?B?c1NoaWo0U1l6OWFaRnZqSU90b2RjY3h6SlpHT29Za2QxY01tUFRVL21LNktr?=
 =?utf-8?B?dGVISjdyQ0RWK3hhLzE3RC9UQnF6T1krSFNGZmo4eE52d2RqTmRoUUZESldx?=
 =?utf-8?B?Tk5VMjg0Qit4R1JObm5kcm1Lc1Vad1UxeXdlM0YwajIwd0krdEZvdDRHWnY2?=
 =?utf-8?B?d0d1Y0VwMERnYzZ6RzBWWk1PWHhBY0o4NTJjemlHaGtDZ2NPS2hYZWtUMHlP?=
 =?utf-8?B?Mm1iaXVlbzRicVV5bGoydmxpU3ZCY2Z0eUxLRy9jcDlGN2tMSk5LQnEzM3ps?=
 =?utf-8?B?aFRiR2JoN1BLU014L0NrZXltSHZBRkJIelhjbi9ncmRDUmtXUnlMTzR2MTFG?=
 =?utf-8?B?dGdYbENNMDlJQnJwcGNNM09objZLNXlKK3N0YVRqcmFDVnIyZWtuV29ETElW?=
 =?utf-8?B?SXlVT1NuYjRtcTYyRHROUlpYVENCRUhIS0l3cEFTeENaT08zV1JHNVVEWkRV?=
 =?utf-8?B?Q0ZablA0UitJVFBwRDBoSXR6dnRyeWhZR1VpdmtkdVRKeHJaR1RvL3k2Sm1L?=
 =?utf-8?B?dkM5UEc5eFpUK1RqME1ML3J3ZENDQW5RazJBbmFUSVFxS0xjM1U1a0JOYUNo?=
 =?utf-8?B?SnJ6dEdmL2U1c09GVEZ3WG1CZ1FRNUpsY25ZbDhZM1N5bk1VckFIRW5ndHU3?=
 =?utf-8?B?VWtQUDc4SE5EKzhIRk11MTZ3Y3pWZ3Z3ZjdtNFU2T1F0cjZjbUUvbVVhQitL?=
 =?utf-8?B?ellqMTB2WXllMHo4eUt6eUY0eUZralVabndJNU43VnhCMXlBMVBPTmZGNTN6?=
 =?utf-8?B?ZXhvb2VPc1NDMVllREZ0L0FGa1lQbG0rMTloUE1qdk5pRkh0dTMrNUhScHMv?=
 =?utf-8?B?NFhqZk5Jc2F1eXJGRXo4TnRMSWVWWUlRYnJxK1VMMm54eElBQS9ydFBKbkxr?=
 =?utf-8?B?WTh5anZYMlplZUxCVTY3a3NxbHBocW5EMG8reTJXcEVqZkdhdWt4VWFhWnJR?=
 =?utf-8?B?WGFYS2pqdFFxQldEY0JZTEZ3ekJwKy9kU3NCY3JKZkYwMXdPM3RkMXRQM0Vx?=
 =?utf-8?B?VURXcXV4YmVMNEczWVNZZnpWQ0w5SWJJbXRZdXJGSm9CNTZXM2swTFg5b2J2?=
 =?utf-8?Q?PzxwsyvjAHlat9xxbIXwGvw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c5f298-38c5-4c03-1d46-08de334e9e21
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:03:08.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6Ne9y1vVVSgEQGlbfstPZdSCyhtH7Q0kttN67kQFdrDqrsF/boad7z4fDBkOg0dt6HBp5EZpJ6DLtcKDTkpZXYsX0xtHhgjoqIfsoHjkkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 07/23] configs: stm32: Enable LED config
 flags for stm32f769-disco
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
