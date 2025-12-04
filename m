Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFCCA491B
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:42:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C18EC628D0;
	Thu,  4 Dec 2025 16:42:05 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8021BC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWtqUW/CWqp1CnNwGUipmB+0Cw7/oSnC/sNnUCP1Y4v4xpjzp3IG3TOSIohmdE+JPqbNvoowwK20DoZIt4Qp7r/pJFlBHlsj4eU5opv2l0xUA7H3Khuql/CZu1SUJ3Tb2qFQvm2D6qadecX83P1ed764lb+ytVPMx9wjQDjnqkCtZTLUeH3yejC52mdAusuKy9PI7x74hxXoJvvoLEaAKmc49rWt8a+yH7ApqBkZKJN7/slpbdAuvZaaMjb+YGiimRINcWhbfcD077ESv3U5JXQ2nEiLsAmsrfs4LwE2Z5vkd5DFHxUJUfkgx6mhzjXIBY3QpobB8fYBgorlt8cd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo6GHEk3VFzJupZtwqJJsIxXnrIcP69/P2O9Nehv9aY=;
 b=x1RNxnvvnjKw39rFe0wtRD2qAPRlMugcth6rOgGMHI66fL4VhVSg/K6gjyNDGSxypseKY7b81BYoSqkvqHx+JREw2EWzGBMO5aT7Cxk1s3bxSP4sK55U1DbWWtmJgtsUJ8j407WO6Y0Ci/kc78a6k5JDNakPaSkdXem6bPwff+b+oxwQLjGXmsbjy+DNILLiyrMYo8ufslNx9RcgsR0FxIUe0XZYY+vf9rk+DqolSa8BrevE1OhO0ClgYsrXP3z650FEgM4eJBU+S8/NtT6MNraMlWmOiFRyLqAj6ANRZAGGyrByV5HUWEBNm9eI2Q+lFCqrYKcBQHAEkn3M5v7otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo6GHEk3VFzJupZtwqJJsIxXnrIcP69/P2O9Nehv9aY=;
 b=R1JHpRiT7duDEzd8Ggy8eC7+r5vaWCz1K1uuuGC3DHW9hY08vOAdxRqyTwxReMdSbznvdJNwY0GQw5tkunvY9M3xEPhGl7RSEp6ISTjso8gx0jwgK4isT/7VKtuddMPle1vL5tBCi7c7XtI5yEDFh5iXmT8R28dRgBDY/7tVF38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:42:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:42:02 +0000
Message-ID: <2ed8a8dc-5814-46c6-8700-b66480deac84@cherry.de>
Date: Thu, 4 Dec 2025 17:41:42 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-24-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-24-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: d1600044-57a6-4788-6318-08de33540cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0Y5VHJzUkRCU2hKdjE0NUg1NUlOQkFMMnZxQjNwL2NTRGhGSSsvc3NTdWM5?=
 =?utf-8?B?T0kzWU10QnlVS1NSMHhwZHNBNVE2OThOVjNFSnEzTTlnL1VSRzVscG9UTkhw?=
 =?utf-8?B?WVlTNzM0UVdQNHFxYkV0YUNrcnliNFZwcC9vNGVZVE4zRmpIWVlJWUlBa3Nr?=
 =?utf-8?B?K1VOajdHeEd2aHVBeFVobld0SmErdENHdlJhSE1ORVRzRUhOalhtVHM3bnRO?=
 =?utf-8?B?NjRaSmxXTUVybW5QQitheGUrRlo1ai9ha0dqMisvcHhqUVZOYmFrVVRKYzVx?=
 =?utf-8?B?OUlFZ0VTZWJqYlZqOEFSVk9jRFFOZVdnUUROb0J1YUluQzNFSXoxNms5ZnFr?=
 =?utf-8?B?TG5iVjM3RzlXeEhMeFhvODJKazR2b3oxcG9oTXZwUGxFdEsxYXdrV3huN0dJ?=
 =?utf-8?B?QkRrYnBzdk9yajBvQWVLZjNQdWRaWjJyZDM5ODJVdU1wcDY1eFVxaGRLZGdJ?=
 =?utf-8?B?UkI5RmY5VE1xcUVHUnhUZy9CaVIzZkJDTHFXTGNTM0xVOGtzWG9MSEdEWEZ5?=
 =?utf-8?B?VUkzdzY2NHVlNXh2TklQVFcrSG5UNWltVjk1ZXhEeXc0bTlkVjhkdGxyNTh1?=
 =?utf-8?B?M1hTYVIydXRjaFJMWDBSck9FRFNuWHdTRGtGZ3VIZnc1U1JYMmpidWtJN0Vs?=
 =?utf-8?B?blNNelRYcDFaMkI0WnlMUCtOeFRocXM4TTNyTFQxbDBwSUFja1JWS3k5QU9G?=
 =?utf-8?B?RDNSMnpFSHRsZkttUkw0L2xmQTFDbitrZzdocWY3UHovUlcwYVRVTHpsTnZ2?=
 =?utf-8?B?aWZFS2FKMXAyaERWeUV2dUdsSmdUWDl4bEZMUlhJRVNFMW5ib01WZEhQUkpl?=
 =?utf-8?B?bzRhclhJQVFZRk1PREU0SnpBc1hOaStaK3NjTHV6UHBWVGFmSjZGYmZEVjlh?=
 =?utf-8?B?Vm8waWNkK05zYkFlM0h0Z0hHWWZDcHNmZmpYZ21wcGcyWjFHdEpHZUNlclNE?=
 =?utf-8?B?SnVVOFVJbE1xWHJyWnhzcUgzcFNpM3hsQTJ0eXVBWUlwNTVSS1hYclk5QjFK?=
 =?utf-8?B?NytmV2VubUUxaS9FWlN5Q2tjK3hsczRDc0ZWNkIwVFdvZzk0ZjEvZzFjMmx0?=
 =?utf-8?B?eHlpTFdvbkJiSkF6dDBTMERYRk96RjlObEZLcnZOQ3NCdzV3MFVnV0Vpa04v?=
 =?utf-8?B?S0VhVWQ3U0czaFVaLzRRbSttRmk2dHc1ZlNNNDk2UlZxaEM3eHVobDVBMXFn?=
 =?utf-8?B?SkZRcmh4MktITUFGVnRqMUFjb3QwaFVXMlllVUM3M1Z4RWNCcVRMVTVpaVBJ?=
 =?utf-8?B?WHozWXVrWm96TUZiQzhpQ0FPMUxITGprem1CNEFUamdhQ1BrMEFmaUdsYTBh?=
 =?utf-8?B?bjBnbGpQSEh5a2xZS2dvRC84ZzFsWEp0Z3dNYXByWmFsSVhnbmZBcVhTaXNx?=
 =?utf-8?B?NlFZQU1ocDhVRnBhb3pkQkcycTNwcnBNc0pCelczd3c2NUFiZWczaDhvQmN5?=
 =?utf-8?B?ZFZySjcrb1Rua3huMFF4b2lmaTBTZmZCUjhKOGE4VWgxY0gxWTRWbE4vTnRi?=
 =?utf-8?B?YlkvTWNKRnBpRnc0Vy9wVEZUNC82ZWV6VWp0K3krWkcvQnp6Nm1meTROdWlR?=
 =?utf-8?B?SytzdGlPVjhyVU1HajhTSjMzb2gySEhWdmNXK01jRC9Yc1JSaE5va1NCUmNp?=
 =?utf-8?B?TlFCalZUT1QxTkQrQlN2VFhHRVhZSEcyeWZDTVZoNTBPYXRlcW9FMEF4U1lq?=
 =?utf-8?B?ZlQvbDJzdkJaQVZGWnVuK2hhMmUzbWcxS2I4bU4vbXBIUWIvc2laZThXQVZL?=
 =?utf-8?B?N3JPbVNmMGp3MFZ2aUVsNHAzKzFWWmdSY0RIUldjejJxZXQ5YU8vOXIyNU83?=
 =?utf-8?B?QjBpWmplSjZjRXhWa080NWlFaXEzSmtEdnNCUitLRWhteUZpUmc4UE0zNVRh?=
 =?utf-8?B?ZVl4RVQrTVRPTWxrak1odEpkNVpzWkIvZlROVGVvRk1FWS9RaUZwN0syd3lt?=
 =?utf-8?Q?SwpynZEyK2o3OGc/DY0GYLbFZQ85KXrD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0g0SnlORkJGdUp5ekNxdUdObkF4Q0xZZ3lFbHFPQ1BtQXVIMUY0d2ZFMmhN?=
 =?utf-8?B?VWlaejZzRVQ5dW1MR0U1dVk1MFhObkcwK2ZKZkJGM3h2SHBLbGhKUnNSN2E2?=
 =?utf-8?B?Zi9ObURvOGNvRU93NlRKSHh3NHh5bGFWbFRnNnQzNDFIajBlbC9PM0tZc0g4?=
 =?utf-8?B?QStuT2FlU3JJSWljbFFjRlRrc3hMWXJKbG5UV3hRS1B2Z2RUT1o0NWxLRzVq?=
 =?utf-8?B?bmdoVnhxRk5abUc2a0FxN2FqTHZOOGkxbFBaRUJyOUErWlNEVW5Va1RQQnBV?=
 =?utf-8?B?c1hFNk5uRjcrcDYzcjFIdExaOEM2VWZiTTRJNEVTZUF5UkRKeFhrNDlqNkgw?=
 =?utf-8?B?bWc5YU16MkVtcmpIU0hnVFI3WUFDYlZhMjkwYWZmVWQ2anZEdS9McTQwZkRi?=
 =?utf-8?B?OXNtUHgxd2szSHVwdjRBY0tsRWhSU3B0Y2NzTHdvQklMMEJYZkZtNW0yU2pR?=
 =?utf-8?B?cFhBd09tdis1RnBmMit6QUZ6ZERPQzVqejdiV01XYTBjVG1ueGhkaFprV0R3?=
 =?utf-8?B?Y0E2V0VHZWFGWEFOcEJzR0lvYUIzczBudlRadWxnWk1hSlRQemVJWHNSTDZT?=
 =?utf-8?B?YVoxUFZyMm42bWZuZ01RVk5hNWZpVTV3MzhzU1A1OE1oWWhid1k5YU1idnFE?=
 =?utf-8?B?M2YyQWQ0L0ViNFo0S2xhdUJxZDVla1FIT2pRQXI4cDNPUk01VlkzbnhUaXdl?=
 =?utf-8?B?R0FhSWVqNDZFNzdwbWNYeVVlMkJlZWV3U1IxK1lrZ2xLeEhaa09DQWJwMFZF?=
 =?utf-8?B?UDIvbUZIQnBkRlozUWFaZW5FNlRuTmdGN0FEZHI3RCtlWEUwVG9WMjJyTjh0?=
 =?utf-8?B?Wjk5U28yc2NvRGp1QWYyNU9tUlFjNDlUVTdiNzgrTWhqdmVibU41TUMvM0J2?=
 =?utf-8?B?RS9zMS92QUVHcUZZUUZ4SmlWajZITmtoeE5uQmVySlJ0dkhQNEw1L1BKcnFu?=
 =?utf-8?B?V3g2VGNkNXhuR1lZaEJPY1pwaVZoVjc5V3FsOWZrZjhlZHlIMEttZmlsb2F5?=
 =?utf-8?B?Vm9Cck0wZE1rUE11eW56bm8wMFQ0WWVCNklUaTI2REdmM1p6VjNMNkpIR2Zi?=
 =?utf-8?B?NVZsSUpIaTVnVU80Y2Uybk00bG1MRGo1b3liQk8zQzRaN0xuYUtGZVlvc3p6?=
 =?utf-8?B?MkxReEpRK1o4QndxbUJkZVdORCt0SkdnMUpUVDl4Qk41T0FFZGl2VVVIVkxY?=
 =?utf-8?B?TWgxL1JyTTFCQWpsYjAwTWEzS2FWRUFNOUh5MXVkWlFQdGVPY1BPdkpIbE9D?=
 =?utf-8?B?cGFQbyswVWR0Ym5wTGVUWEtLS0R3T0ZBUlYwNS8vQkwzVHdXcjNNKzJPeFZR?=
 =?utf-8?B?Ukg5MXU0WEZQV3g3dFFQS2ZWblF6NzRpcnhucHNkRzhYZGp4d1VTTUlqM1Bo?=
 =?utf-8?B?WWpGRnlyZG5zNGNyYTBuNVZGMHkxUzh4SjJtSWhBdmtuQk5UM1VqS1JabVJV?=
 =?utf-8?B?aGNKdTZqaXFVQmdLQWwyQVRGMThGRllpWm1mejA5VzJDMHlDanM0YUlqb2JQ?=
 =?utf-8?B?TDlIbWN3WllIRnZMTC9tYTdnVUZrTGVuNWNPS0VDcitPcGhBN2NEODhLd3ZR?=
 =?utf-8?B?bHNuODEvT08zc2RsYnIzZDJ5ZlRZbHhOU2JDclJUdzdLb05qQzR4SkF0Rmxh?=
 =?utf-8?B?d0pnUmErb3BYNW1mU1ZEN2wxdEsyRTRHMzlQQlIxYTFJNGw5WnpMMUxqakRo?=
 =?utf-8?B?T1N4NGdnd2NkYVB5TC9BRjdOTzZESjNVZ2tRRzZ0Rit4cU5COUFIYUE4dW1s?=
 =?utf-8?B?MEdrZ0o1d29hU2tHTmxJZXhFaW5FS3l1cVZaMFZlYVh3cDVKejNOR1lmZndR?=
 =?utf-8?B?VWRtOEt5MmJqdUFKU0F0WGNEMEppbFRkWWlaVFFlUTRNZDlGT0hiUTREcVp3?=
 =?utf-8?B?YlZNQmJiYWNWNGlzL2dYblU4aDdMNWg3c1NTNDBYL2lGSWNERW9GL2x3cDlv?=
 =?utf-8?B?UU1pQXNULzJIejJnVXNad2w5YUtIV3U3cTJGemdnQmdDVWI5ckIwelY1YVh3?=
 =?utf-8?B?a3d5QlBKNjlRSWRCazJaNGdMUFdRbkhHUmorQ3ZzM3JEdWF3NitvdE0xQ3dG?=
 =?utf-8?B?WXRMWkk4U202bWZmMlJOeG1oQzJOUkVoTUtDZFlWL2pEc0o3cW5VUHRZSDZZ?=
 =?utf-8?B?Q2FOcEgva0I2QkYyWjRFcW05TlVlaUdlc3o3UG05dytqeDhFNzQ4QnZ3Wnht?=
 =?utf-8?Q?rsX3PcAZRhM9wgxd1Vr8xWU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d1600044-57a6-4788-6318-08de33540cd2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:42:02.0160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqMFQt5YhvvnXo/7o5pDxK87fpvm1+x4A8blC2V1NC93XX7gNiRbPbeYdwQ6bUa/jltVwfqUDEXQHnOwA2KBnHDUEowJFfD3keoaTAQZDx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 23/23] ARM: dts: stm32: Drop "u-boot-led"
 from stm32mp257f-ev1-u-boot
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
> Remove obsolete property "u-boot, u-boot-led" from
> stm32mp257f-ev1-u-boot.dtsi.
> 

There';ll be a replacement once Linux kernel merges 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251112-upstream_add_boot-led_for_stm32_boards-v1-15-50a3a9b339a8@foss.st.com/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
