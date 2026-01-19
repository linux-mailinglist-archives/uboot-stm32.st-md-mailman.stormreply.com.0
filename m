Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DBD3A0AB
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 08:53:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2C8DC87ED3;
	Mon, 19 Jan 2026 07:53:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F026C555BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 07:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz4bXWvX0WBO1nl7FbSeiYhQS//Why4E7M0YqWao5gZ2dSiUqSDRhZPHbvTUMAvzD1mD2nrVsjmveMPbeQClTnV+yWzyPuBLG6kdnneKBwxcovaiROucnO/mQRY1dPqqTDRSBHi1k0DXljR0ejXmHn2SiFifT/C03PcQ/G/3Ur+lHUptj5U9MzrX6R7emOOOhZXvoeQWQx/nehixlno/9bjVXxEz3LSYTqlOSxnWAn/n/M+oCnAGoldKz9m8EpYQiq47dWvOuwRuc9M95pIa8tDojCbMBWcEm9C2dORz6hxsGcER8gvoOfiAGWkNVENzsgFJajd1+3BpTbQd5mGKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjXhLKOO5dga65Ju4H8+Ew7iIg0Tra7uwid2xvFy8oQ=;
 b=YUFVgq3KnJ+P3b/Tq1nGmhb/DT+TXr61tf/A+Z/hxqdDB2/d99gV+r9MrBakA4LyD+tN0wp/z5W/gMQ3KuNe3YBRyIru7VAqaRvaGMedgR7pehjlo9RaEbufnGvHD+izWNS7w5I1+8PfooDpQbZ+csZR5YRTmsOoGXFEyfH3Wy0sYbxorTVvqCh44zjaqfvsxHh814edBjLmCAi84QNwCDTlRXOqV2IxJksSL0cFoKDztlnPq9kVjkC8sT6XK98EOFqGZWVXlxM1V22ZS/0hZ+Y4As2FfB+vBuXwYtMWNLOaG+YwEp8vbRAAwSV8WqgoohcfUaeiHbSeTKAO9vM5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjXhLKOO5dga65Ju4H8+Ew7iIg0Tra7uwid2xvFy8oQ=;
 b=hrG5uU5ASd9U0YxliOoRt6i0l4FJoRzae25ilZEuBPdnrermgiKlsacf5J5WLQzglj8tKOWNyPBD3oagUN0nCaxTx6L/8rY839IzWlcxU0/DmmIl82Q9ZcHXf0XSjZwsVn+O3W+jt0xWkrgutNvsuenUYbLQCwQmW0Fj6qLWO8k27bMdRWg2i7D+BkW7zp7z8rbm6zsAShE8KEJBbT5eHdDZfb8Euff7AVOAcEZF9Xa0eYTAWG54raHyyeDiZ0QHX6xf75ons9wEPQ2v7uagMBjCGtXOusN2GbchQE8iSCX58RPHcCN/aSbojR/5xNNTlljhJbhKBGj0cDMHvoqy9g==
Received: from DUZPR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::12) by AM7PR10MB3334.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:10b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 07:53:41 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::e1) by DUZPR01CA0058.outlook.office365.com
 (2603:10a6:10:469::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 07:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 07:53:41 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 08:54:59 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 08:53:40 +0100
Message-ID: <480a1eaa-c090-4293-bb1c-ebddc8a4d04a@foss.st.com>
Date: Mon, 19 Jan 2026 08:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
 <20260116192837.GO3416603@bill-the-cat>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260116192837.GO3416603@bill-the-cat>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|AM7PR10MB3334:EE_
X-MS-Office365-Filtering-Correlation-Id: c6537705-55b1-43a7-76cd-08de572fdcbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVdzR1lzK1pxWGxkTFVqaUNiWEJ0dmVMOVo3SUdVZS9WNnAxVFoxVlI2TkZJ?=
 =?utf-8?B?WkdJNkJucmZTSllNTDR0Sk9uazFhMFZwdTZaVzJzZy9raUxGNEk4ZGpacjlV?=
 =?utf-8?B?UXdHM3J5QmJhMEV5ZVJSQmhqVE9KMHNnYUNidEU0S0dWRmV3Kzg0Z2hTUUow?=
 =?utf-8?B?eDBhWURxZE1mMjFvWFllQkZDUTB0ZUoyTXRmMTdhcVl5MlRzOGdwWUdGMXYz?=
 =?utf-8?B?TCtMUGxvbFU1SkdXQjdHTy96UHVwazlnb05lRnY4NHQ0SnNBd0hvWTRURUpI?=
 =?utf-8?B?U3BLQW83TnVvbUVtVm5WMTFjbExIbWUvT1FTVTB0dVFXdnBzVnE1c2RtaWxQ?=
 =?utf-8?B?MFpGK2YwV2ZPVlhBZU1rcGcvc2NJQUhNNldtQnF0Q0ZiVFpYR0dGdmlKUVhs?=
 =?utf-8?B?MFlXR2djWXJPb0hxQ0JxRzRsckd5SHNGZEFRTzJkaVRqM21Sb0pPQ2E4VTNs?=
 =?utf-8?B?aExUL2IzT1J3V3Z0YUxFWVJDOWwwVlM3ZU1BUXVQOGdlNTZ3Uk41U1hLMDJN?=
 =?utf-8?B?M29jcGdIU2l1ajhySjNtRmFab0J3VmdWZ2tKY0ZZQzJOajMwK1F0QU1lUy9l?=
 =?utf-8?B?YnFXSFNXKzJNRmNwSit4K25wdUw0azZZaHZ1YWhkbG1nYXU3OWpZU0ZKSWhD?=
 =?utf-8?B?TUtkZml3Q1c5OTAySGV3ZnU2L2pYL2VYV2hxcTlvbHMveHF4bC8wUjhxN2dT?=
 =?utf-8?B?OFAyRTY4Ti9aRS9XN0x3bEFzUFczb2ZIZDlzSHZpNDRzUlBlQVNhWmtHOEZS?=
 =?utf-8?B?ZXhqVVJiMFZ0RzlHV09LRysvRE9MQzZuWGtMNWRnTmxLdnA4ZkFYblY3MkdZ?=
 =?utf-8?B?aEFoQmRpallkZ3pJRUtQc0JndldITTVVNnZ4NlJBU0c1clA2Ymg4aEhJdEZj?=
 =?utf-8?B?TnNHREk4TGRZU2wvTjcyVHo0b1NjOUxyWnRnNS8xVGJ1NTlGaXdBN1FzQVg4?=
 =?utf-8?B?R0JsUXNZWmRIOExpN3dqamt4TE55Vk5SeDBXOXdNeGw2czJlT3dRT2cxMTBG?=
 =?utf-8?B?c1hpaWFNT05XcnV6TDhKVy95aHYyMWpYWloxNDdxMXozbHY3cVU4c2kyNXlY?=
 =?utf-8?B?OGJRaTA2S2ErTmNVNWRRQkF5Ni80eTY1cUpLUDR6U2tsSmJDeHJiZytFa0Zi?=
 =?utf-8?B?UUl2NU9yL2Z0TTExbFlkQnM1VmNQQThLRGJ0ZkFZZkVUbi9qRnRzbzdjNUpQ?=
 =?utf-8?B?TFdGSjlOWWlNQWV6YUZHWExvajhRcGNkc3p2UEZ1OTluTktzZDgraWl5MU0w?=
 =?utf-8?B?SWZHdHJ6b3pRa21XbXByL25VdTBycUhvb3FsSlhSV244ZVFlUk5veDlxS2JG?=
 =?utf-8?B?SDZtcERmNU9tR3NOV0Y5S2Q4QzY2d214VWxaNTJSclFZUzFXTjUzcFZHWVR5?=
 =?utf-8?B?UFllZXF1N3d5VFZnNWs1Q2VOU2tlRWFEeVRtdTd4cUNUWUFHczJPby9sOGdW?=
 =?utf-8?B?UjRSeVpIZEZoOExWZU94dU50akh0emdFdFFTVWttNlJUVnBTdnpPYkIyaHdZ?=
 =?utf-8?B?RW1TRVlBRXJpcGJQdUlBeUNmRjhFRHBzaUl3NURpZHpESWtqZ0VTZVlHak0v?=
 =?utf-8?B?aGxnTFNqVzNlb2ZpcUxxMWZzZjlHRGE5M0JkcHZaS25EZVB4amNiT2wwNTI5?=
 =?utf-8?B?LzlVODMxc0MwVzlzYkU4Y0FUdU1neTBqRWFkUDMySkRoUUYxbnFKODlVbU5h?=
 =?utf-8?B?RzVaUG9oVGpWb2h1MWdBNERnS1poMzAzOU4zajRtajAvTFkzL000MFlPM3VV?=
 =?utf-8?B?Nk9DdGhFTjNNTFhaNGdncHZXWWU0aktmTXBaUWM5TlUxZE1qdGdZNEV6eFNQ?=
 =?utf-8?B?TWhrMFBpNDFMckVad1Y2R2dzbUsyd0tqZERhSDhDZlRwUm4zNTRZS2J2TXVI?=
 =?utf-8?B?SEFuVEdRUFRoL3pBVlEwK2dNRkZEUGlwODFFWXE0ck04TUd1RkdnYlhjd3Ru?=
 =?utf-8?B?azBNaHJMNFdpY3k3OHlWaVVtSVJmZjJML01uME1Ud0FhalFDdkt2VTd3TVJI?=
 =?utf-8?B?Z3RZanppQ0hhQlpnb0x4OWgrelA3RVNicHZtb3JqalpKaHJjRGRTOGZwM1Mr?=
 =?utf-8?B?eGZ6dkQ1S2txeVBtaERVQjRxRGhKOUM5aDhkNzR3MkZnL3FiL0V5bjdFMFJ1?=
 =?utf-8?B?M05BcWRNS1RZc3A4STFFRkhFa2R0cllwZWFORjNCeHRLQlpiS1pQNExRRVVt?=
 =?utf-8?B?SlJidlpHTkhlRmhhYTlHRTBrWU1QVXhRREFCYmFYZE5EbTFEcmRYdnBwTWN1?=
 =?utf-8?B?SlJaOFpaaUIzM244TnZvZ3czRlpRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: slHaUSw/z0M4oLMsDnIxyQiC7RQvP/Jrodp1Lwi6O8F+N5U4xBokIA+OO1Si37mqBDQxHlq9xvhDyNuNJYZaJytB4P8A0dn9Rk/L/VxqQa10vCyuQtBCO1TLDmsdqichSLreMJprEHTPnDy4sz8w/9vttCUmuBicCt7XPylJSWVNW0lyzR9nBmo8IIjh5/qkXY670YhNyM2TfHNKZN2kMUHK+BleT3Iar3OAM8RVNKe4Kv60q1Tg9jvs3j94jIYmnlf4KJiUTmMq+6wn8egKToHCyx5FT0/E+Ju11vmE/01Oj+KmE2x2UsD12IxT5pPOcs/qvKk822jxeDDio/JRafVDZck8OPkJw/kmvNicQLraaIU1+/KJgrzzvQvzVcnoRkhjdOwUOMCGQS8Og3RA8fMND8utwlrlvrgCcCy//HPoEWBA3Zg0sjUDlP6xfb1tzOtZPgH9+mmB0t1juDozc+hv10h4LT3A2zYDBHmTa0jpBUqegnXoOqfk3NnZTfi3BEC8M436uBMWNOeGfZz1PBXE0LYgWP2okOn6gl//X2shRiCTTOScErry4nVfz1rKUDfW77+8bCBYhLlw+XfA7+0QdnDFCgxOX6oGQ+UrBKwDQ5pf/vkkDcEC7eUzT2Yb/6dqhbz3vETy/F8NWW4TAbtuaPTxbOpO0cqI/PrEfmWM3up8Z55oA+hgdfCzwJcs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 07:53:41.0425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6537705-55b1-43a7-76cd-08de572fdcbc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3334
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc
 node in stm32mp257f-ev1-u-boot
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



On 1/16/26 20:28, Tom Rini wrote:
> On Fri, Jan 16, 2026 at 08:12:06PM +0100, Patrice Chotard wrote:
> 
>> Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
>> to fix the following issue :
>>
>> Video device 'display-controller@48010000' cannot allocate frame buffer
>> memory - ensure the device is set up beforen
>> stm32_rifsc bus@42080000: display-controller@48010000 failed to bind on
>> bus (-28)
>> stm32_rifsc bus@42080000: Some child failed to bind (-28)
>> initcall_run_r(): initcall initr_dm() failed
>> ERROR ### Please RESET the board ###
>>
>> Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] into dts/upstream")
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
>> index b70cd8b52ce..c3c9c94f165 100644
>> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
>> @@ -52,6 +52,10 @@
>>  	};
>>  };
>>  
>> +&ltdc {
>> +	bootph-all;
>> +};
>> +
>>  &usart2 {
>>  	bootph-all;
>>  };
>>
> 
> Are you upstreaming these? Thanks.
> 
Hi Tom

I didn't get your point. Is there a problem ?
Yes of course i'm upstreaming this.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
