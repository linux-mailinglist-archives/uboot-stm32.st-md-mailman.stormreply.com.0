Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CFCA4626
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:01:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB758C5F1FC;
	Thu,  4 Dec 2025 16:01:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B09EEC58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av0ZPdZ8as5Yq9W9HS/k/m7aIOgv1IFjcnmoscveRiLouSaRd1zrnjzgl51wCpyqDenzuAIwhKwyOpmYrv9HhRYe9+BZ8RINFp+3mqESSehNr0jHOD92E4uLtnF2OMrZqogeo3VdYgenh5U5ix8/dvD5w1MLQxu63jaIeyUR+zb318tpS6EwoJ99UP5hqxE8nuzA+tqf15kIowUQeoZIGkPnipXhe86A35MbXevN0vqgMaUZbmpQBr+kWaXkNDC+lf38w2Tn/oWhW2JoyU5vQp2BxoWkVIx+d8ix3IyQmKPxZ0zsGx/bv2T7MGd5E5m9ePfzCT8Gg6gZrBbSo+ATmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=U3vAO6/0OVnjztx0dwLV+ORmlWwm+28Xxt4JdZq0xgvEF6RFe8OcPsOX6/8IhgiNUrmrqgzPgx4V3zrj1m9enniTWlPfu6JkQMZ7BEZT8gi9EAFTQspveAmKuI7KHDPZ1rQJ1Ea+rit7p8lMqpGnN2UmoMxizkg7rl02eUbOio+gldhmMBZtnMdDGk3FWp7FxBdWlNDySZCwkavJ6IRQuTDxPPXu7qkdnqTUVPsEyK7NjCFjNAtTpJMllkv2HsRN0KTkRNwHNqYiuqdx2AoJAVUC2RVWtyuPgQR/c/0X0I1PBxhwQYpBY5uAANYs49OohnRviBTDlpBgo2kHxCOzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=l6T72F4bJpqSV9GVPz3cXpZ/9FbSmlj/6snIQlEjmxvUs+kcVadmRWvAx+0sCn4aMGOEjwAFZnGXno+cjnNqIjG9gHKQFrwCILVgSGz8N5/VE5161zq6+58NbVFYFpZWDPIpq0KViqRpFXGIfvWV4AFKhqyya0xq8mFOeNQsBAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8075.eurprd04.prod.outlook.com (2603:10a6:10:25d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:01:20 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:01:20 +0000
Message-ID: <a8e2e7c9-a0ee-43f1-ba1d-eb1b4e8ebef0@cherry.de>
Date: Thu, 4 Dec 2025 17:00:52 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-7-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-7-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: d55542e5-8a7f-46a9-b176-08de334e5d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amk2MEdzTlRhcUI4d1NCZFhSNHMwZ3E3UWxGWmdsQzBMZ01FY2ZrOUtDaTZm?=
 =?utf-8?B?bmZnTkQwa2M4ckZnaE05UW4rUXdmb1Z5N0Y1ZklsVXhwSmtTYmhZanE5OG85?=
 =?utf-8?B?TUhaUHZVMVZoU1Nnd0JsK1c3Yi8vT3RvWUFMSHR3VFFZTDJCWjYrYkVnMWd1?=
 =?utf-8?B?alBtaWVKQ0RZQ0l1blRuVHl5WC8vaTFpR2c5ZHUwVXJXWFJmaDVJZUVvMUh3?=
 =?utf-8?B?bzJ5QUV3RkFMYVM2ajZpNjZ2Mk43VmYzelJaSUI4Y2Y2ZEcweVFibWJuSDRr?=
 =?utf-8?B?WjFScm0vbmlHa0tlWDZkM3lObHB2b1U2aThxTkN0NlZVaVUrQnR5elhTL3R2?=
 =?utf-8?B?Qk9jMnhHQnh3cTdFYkoxaUxMRUJmRUw3UGpralpCU3NaVkRPS3BNZSt1ME0v?=
 =?utf-8?B?aW9henFIdjlGOERFWWplSk90clpUeXFPUUxveFlhODY3NTJkdGRLVW0wTXFa?=
 =?utf-8?B?Ynl6K1pMaVlMYW5qNVl1ZDAvTjJ0L0g2bHR3K0pkMmFqZGdhOFByVVV0Rkoy?=
 =?utf-8?B?ZXQxcG1PaFRMRnhpYVlITDl4K0t0bVRaTHFmRDdZMEdtdGNEYTBrMzFsUlNB?=
 =?utf-8?B?cDBBYzhqV05nNXg3SnFIeUIrMmZRNjVXTnhHaUczeEhwNFJ3YkpLRTMrcFB5?=
 =?utf-8?B?V3lPcTF4VFF1SE1oWDQvZWY0eTg5cFN3enBWN3ZFSEtFQldpVU5MWWhlcWFI?=
 =?utf-8?B?UjVWWDVqcE9XSHN4V0ZBYWt2S3ZqUXNNdjVIZmlheDlZMUJOaEFjM1ZMcjlz?=
 =?utf-8?B?V2lqQUY4Vy9MRjUrbVlaakRxWjNZS0FqZ1htbElWTXN5MVF1ZTRWWHNBUGNE?=
 =?utf-8?B?VnZVcXVYZjhuRzN5R21LV1BtVWVJUFBnQlBqbGdVajlKYVlCcnZxMzd3RWlY?=
 =?utf-8?B?a1JzZmhKajhUdXVIWVMwRGkvVUtCRkVvOEpWQWhMeHBCU3FkcVNHdjRkcDZP?=
 =?utf-8?B?RXEwazdBM0VGbERTcE13N2FRdnVrNFg4eGcwMmZDNVo2Nk80RnBJa1FidHNY?=
 =?utf-8?B?NFR5MDZpcGtvVUUzQXJsNVpoRU5mb2g2TmNiN29keGxrVnRwd2NXdlJUUE9v?=
 =?utf-8?B?TjRVRmhUcjBDOVVlRFc3YUtwSkF6dUJUR0gzd01kQ2hmUXVzMUdERnRIbkpy?=
 =?utf-8?B?MVNDQnBNTVlFZlMybGhUNkE4ZHBXVlZoZWIxRG1uVENhT2tET3VHOUdOOG9W?=
 =?utf-8?B?TVFkZmU0Wjh2bGFIc0NNZmdlRm1sMlNnTWhiTUxRSlpvU0FPWm9KTjJvZWhS?=
 =?utf-8?B?SW1wV1BDRmhBekQxUExUeWljNjFFY2NtaTFuWUlPampFYi91eHV5OFRhOXZt?=
 =?utf-8?B?Z01FVC9PZG1MU1FzQUdTMHlENFAvNXFsZzFwMHNvclR2VGtMTndWMHdOMlIx?=
 =?utf-8?B?eTk3UVhvamxZNytnUVQybWpuVmRoUDQzRmIveXRMV3Bxdk9Fb21UeGRESThR?=
 =?utf-8?B?c1pVUXgvaGVFdTNPT1Z4b2FBei9wZVYyRHFMdmU2Z1JxNm5rRGdhczZkeXNZ?=
 =?utf-8?B?ZVk2QUYrS25VNnQyTitGSVdLdG8vL0NkakdOdm81ZzE2VnA5NkxSS0N5ODA4?=
 =?utf-8?B?MWl1bVoyVnozTHFRdDY3YklpWTMxeVRzdE1ZRW9aWG5ETi9udnF1QmlNaGVl?=
 =?utf-8?B?Vi93NlRkWVRWN1dyY1A2YmpDU0FxZU9vUy9WWmJQTk9FWEdFRk9pOTZiOFdz?=
 =?utf-8?B?VkVLUTJQNThWYlovOW9uVmRoY3JIanhPbTk1TmVDZU1WYXArRGVValB4Sk5x?=
 =?utf-8?B?TC9GUlBQdlBJMGhjZGxheGpPNXFtYXR1QUh4L2xCbkxrL1ZLSzVPYW5hMmph?=
 =?utf-8?B?ZzVxREdhYm9ZQk9GR2d4QjlFWERhblM0K1g0MnhaY0ZnblVWWEJZZVNiM2pE?=
 =?utf-8?B?dWo1NlJ3NTcrMjFRWi8zNFUydGdPOWpuMDZiR0ZYdWhzZ2VrNk0xUDdqL011?=
 =?utf-8?Q?JqAIjqkc2mayxM8WUQKHtR8EqDBD7Tk3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk5IQXRkeTlOVnoycXVhZ1Y2ME4yYXFJVjlWSXlyZ3QycUx6dWthbVZGa3h4?=
 =?utf-8?B?cWpLdWtScm1ZQThhN2dLbFlWVjJ6RFR2cVM3R0F0U0owZGhadnkyZXBHMEMw?=
 =?utf-8?B?cldpTnhHZjZEZUdWMGxGYVZxQTY1WjEvVmNZUnFzUDhiamIwTFpJOWU0aDY1?=
 =?utf-8?B?NGdHelg4UW8zemZ6aUx0NXp4NzVWM2h5c0J1Y0k0UEpnb1JFZ3hRYnFLQnBF?=
 =?utf-8?B?K1VYMSs3RUFSSW5YOWhoK1N5Y2JndXU0Mk9zMStTbWo3SlkyK1BrRHlqMjFU?=
 =?utf-8?B?UDArTVJpRUJ2QnNFdzJ1MjVGSFZFWGM2YmYwSmhDcDNDQms1M2FhQjhBRDVD?=
 =?utf-8?B?TXRSTHYwQmNUbWlxWnc2VGZ0SVpHeGV2K3hzZG5UcjlWSndaTUVpTTR3T2VY?=
 =?utf-8?B?WS9hK0ZndkxaTm9iVWVieGZsSTZ6V1FSTFlCUnBHNERnU0hmMlUvZW1LYTR1?=
 =?utf-8?B?US9vejMxc3QvUWtCTDNwQ1ZhbERsRnV1Z25saFhPVDlLUk5NYWszMEwyZ0Ru?=
 =?utf-8?B?M3pIb0ZQeUNockw2SEFrbDVHVU9aK0EzRkhMeHZRVncyWnNNVUNseUxuL0Ri?=
 =?utf-8?B?aCtsYmI5K3hqSDcvTG8vWXZIa3BkMmlqaGg5QUlCTXlOa2xRWW5KZkhtT0VS?=
 =?utf-8?B?azczQmhkNnY0eSsvY1BOZTJTVnE3NVQ1bnczYXFLUGxjK3p6eVR1QXptNHlM?=
 =?utf-8?B?Tmd2TUpvQmgxdlRWRTBIdndnTC8wOUpGL1BtbzM2SGhhVytscE5FZG4xcTBV?=
 =?utf-8?B?aGF1OURWV212TzFoSDNPUVp2UGRXeEh6OVZ2SDhDVVZ4Wk1WL0IzYWhlc3E5?=
 =?utf-8?B?NjRzb0dwRDVIMFJvblhPcDV5c1dHT3kxM1NVQTBRelg0OGpsaDY4ZUY2OU1m?=
 =?utf-8?B?UERERTNCYXlwSURuR3NFVG1JU2RrN0xMcjdmWFFSWVZXMmhubVFzbVdueG8w?=
 =?utf-8?B?QWM1eFF0cFJtZDJXdHgrOVRteDUxUWFtWFhXT1BqenNoN0lud3Nub3FsZlBi?=
 =?utf-8?B?SkI2N2kzd2VDMnNaMW5NZUdTL3hyNGJ4UTIveVZBOUowN0VQbHR0Uk9NOG45?=
 =?utf-8?B?eTlMWUY4RUtVTU5qOVcybkVDOHRRZHVZc2ErdWxzaHFVR0xPUTRmKzdDY0Yz?=
 =?utf-8?B?VmkxMVlaVHB6SDZSTWpodlRjazNlQTFGU3lCdENRNlVscFpwSVpWU2Y0cUdL?=
 =?utf-8?B?eEtlS29LaXljQzcvNWFUWGdDd1BSSE9XOG1CQUZTWUpMUXFLS3NsMXhWQitl?=
 =?utf-8?B?T0xDNjBSN2dpK0dCOTlZb0NFb3lvMXhNbHljdzVxbzIzc1E4ejREZjIzd2pG?=
 =?utf-8?B?NHYyQyt5cVJzU0o0T0VxNS9mc1YzckMrUW5vT2VrVkxicUVxQlBKTTcvUHdu?=
 =?utf-8?B?QzRMU1RlTzFLbHY0dzRhLzlvUFk3eXYrVm1sbzV5eHVZV1JjN3lNTkNtQ3Ro?=
 =?utf-8?B?aklDRHRDcXhqU2lUcDBvR012QlcxbUh3K2VudG13b1ZGNjduYitQamo4Y1ky?=
 =?utf-8?B?YTl2RDE0eWY4bUNON09sUjk4UTV5WkRCK1RyU2kzSURYQzFkSFNZck15WGZl?=
 =?utf-8?B?bGl4NERjQTFQMjNJY0VKa3g4c3ROU0p1TUFBTG9pOFRxU25Cb0lmQng2MThn?=
 =?utf-8?B?RVo1UWRvc1J1bFJsa0ZFazJJKy9MT082SmRoNmpWQlZzUEM2d0daa1h6VExa?=
 =?utf-8?B?UE9XTFkxSkM3cm1adFNKR24xSHNzRnVMNUZGMnQ1bGxITEhMS2lUU1Vzb3dH?=
 =?utf-8?B?ZFVySFZCWGJ0ZmJEZUNIWHJqMHpabHZ6VjNJMVZtSmNCYVl6RThqZHU2Tk9q?=
 =?utf-8?B?bWxCcHJRT1gwbzhOOS92WTh3SnVhV2hDdDdiZGNiekN5eTdnVjZ2VG15Q2hp?=
 =?utf-8?B?ZUZoSTNMNDUrR0tvSnJKUXdnNGp1azYrMzFibDVmUnZRa2NWV1FFcXRzY1F0?=
 =?utf-8?B?bUcwK3dyMzZGV3NkUEtYTTlodlJpNHJBOGwyQzk4UENJSW9kSDhDMU4zRGkz?=
 =?utf-8?B?VndkaUtSc3RBVGpsbU4zQUxpY2lxcDZlYzgvY1VPTG9HL25QTEJ1dDFZTW4y?=
 =?utf-8?B?dnpBRmxWVlNTMlZUZHJxVkNNMXhBVTh5elVRK2xHemNlT0U3bHhQWCtvMEx5?=
 =?utf-8?B?eTJDaE5OSXJQcUc1dGJGd0Ywdi95bWlMUEJ3b0JFYmxob0phN3dYUHRPa0JO?=
 =?utf-8?Q?0xeuOzpaupkr3iQvc2kI2Ts=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d55542e5-8a7f-46a9-b176-08de334e5d5c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:01:20.2296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6zK61msjCmsRuxG0/BE+0hw74KPxXaT9XrM5LCBcZeDYJptUtBiUI/ZG4qnThbMYBIfps4TJTDpOicYU7ONvXyUvRaW3WyLBt06txefdPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8075
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/23] configs: stm32: Enable LED config
 flags for stm32f746-disco
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
