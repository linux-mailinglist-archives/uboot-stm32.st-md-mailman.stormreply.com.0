Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6709AC14E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 10:17:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E45CBC71287;
	Wed, 23 Oct 2024 08:17:32 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383EEC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY7+m63s6Aug5iQxuvSg7d5dL39KhRhiz5FQ9+6gjkD2UvZkXUkoV1SZYXEgQKGmxkYdYslCormKZdyLfuSS8VtGH5RL9X2oEYDutKKOenAb7bDCwfzmPA3jiXBhRWcC8O34b4L1qkStBiDwTTcXMJPK0FnBDJnHl+Js3XCtrLdcdUnHKzzmAHX9FEecziWl1X0OQk8zQ61/FEW62eNWMgkHpVa12ljh1A6YHs+qvI7YZDQBgsJaLI9EOVvjZJvt19uHs0LD0KSclI3v8SNVz/ZQHSN3rgZBPx13L/Y6WFDcLo8WkedqOqZGwPV5ss50v0UfPMkt2oSBAThA0bmXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EJS4QPqhkXRMBgLA20QpmEtO+xaee1OgRM1l79pA8I=;
 b=k07bBLEDV20ZiExZaBSgcZew8sRmQJfH7gwv16CRUwCQAhgONEnyFpTPgD6E5jhWjlEMB/3jIqx8gEyvCbK0H3WiouGYa0biJF+tqV5pQDsXWxsyDqzyHabZ1FGH379qSXakm2qK5hU1Jz7aExvoUbWstmCV36NhUMJOXMRzs1IeJays4wuEY/v8SPHRU9+PVYHRRFGk5Loas+8+xTnDDw0ayGjJl6SQPgQo7aAH/77LAeo6wBgZAh7q7BnG6Qwws+fp/Z6ZhEaKBHnqg3b0uHEew5N6jIdVLWJh+njMcsAEQO6tSJPilp9MCmDXsHAJQ0lyPM1Z8irlLFbW4V4cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EJS4QPqhkXRMBgLA20QpmEtO+xaee1OgRM1l79pA8I=;
 b=SryJHBLjQ7IRrT+zd0Y7Wv+hyovnVbUAAZJ5+yDcHEKF2AysJj0PgaQF4BFAUHMPlIvCkT2a9SMFevv6LbJ8nl/k8apALIkpw52zqy8kNJHl7hNvbUQXTvr0dUtjZFih7+6W4ef//bsF/6X9+g/EiCBonwX+crtHPVTsli96qls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 08:17:23 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 08:17:22 +0000
Message-ID: <b9cb3ec8-b6f2-4f38-8cda-d3d10278f503@amd.com>
Date: Wed, 23 Oct 2024 10:17:16 +0200
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, u-boot@lists.denx.de
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f041071-ec6b-4d48-5dd6-08dcf33b1eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ExUWgycVMwQmtZUnROSEJEOEpic25rMWFxQ3NPOW1NcDZZWXMyWHNhMDNJ?=
 =?utf-8?B?MGgxSm9Ibm1lQ3Z4T09XeStBa2x1ajJ4KzRWcXcxR2FTT3l5VXFWWkZYeUdl?=
 =?utf-8?B?UVN5SkdqL1lhQXliTm1EZ2p6NUxzV3NVRmp1YlY5dEdUazE3M01aNG1HSVRG?=
 =?utf-8?B?UXJERXZZYkYyNmZwSGNpMzdiUkVXNjhSTmVIRm9mWm1yblQrVzFmY2JCZEdn?=
 =?utf-8?B?cHkvYjZ1RUsybGdwam1wL3QxZndCOTl0QkRXZ1hXSHlOeUlIc2QvQUdRc1Jy?=
 =?utf-8?B?bHEvdDFqWEFQMi9OZmoySkxnN25IZ1lBaDc2Q0VReGYrTEJaSDllaDBBN0FB?=
 =?utf-8?B?N1dyWHBtcDlkT2doY1UvWU9rUU5JaVJ0My9KdmZBRzBKbHVTV29TdUFBNENa?=
 =?utf-8?B?aSswM0lSY1pNdERRdGxWN1MvVjlEdlgrK0NiVWJ3NWdXSVU1UU9YdlkwWk9P?=
 =?utf-8?B?WDFYaEZNOU5tZHl2U0ZoeURiSTU4NUdTbFBQc1ZGazVGQzJjK2dMZHlSdVNT?=
 =?utf-8?B?amQ4elNSeHlRd0ZCUnI2WmhPWFdxUFZSaTdPSUxsbDZPOXkyR1o2Vmo0d3BQ?=
 =?utf-8?B?OEgwTmVKVmJoT3dsM0tvaVVmN0E4TkNrVFdoNkFzY2ljTm9GOEZ5eWlUNEhR?=
 =?utf-8?B?Y3NjcEF6RFlkSW1wdUZMQktWa2xad1VVcGJBRzc2V28rZ0c1Vnlmb3VycHVx?=
 =?utf-8?B?YWRhNitDSEtULzhMMDNsWHVtbmRFZUIxMXlHL1c3cjN5dExieC93SUViRWFl?=
 =?utf-8?B?YVlteWprbUZPT3RQczJlUDRINitaK3NkZ3hjZ3FmWjE2SDVXcHJXNTBRaHhW?=
 =?utf-8?B?ZkdERElld3Y4TGY1VStXc3BVYlpocmdweWk4cENLSHhDQUcxZEoyTzRqeUgy?=
 =?utf-8?B?eHVZby8rRkNGbE8vR0RKT2orWXhzMk96K2t6bUg2bDFFT2xvNHlmanR4ZFp2?=
 =?utf-8?B?U3BwNjJqbW1HUFpualVoSVhWTkFrODJEWmQxR2dXUmdLYnBoQkpzVU1VUkM0?=
 =?utf-8?B?NW5QWDAyWjAwbEJaN3hrQnUrVitFR1FKSVBRL3k4M0lRYngyazVFYjd3TXRM?=
 =?utf-8?B?WEtnNklxTmlSVEZ4T0hNRWN4VVhhdXJIUEswT3Y2MnozZzU3c2JLT2JWYW5S?=
 =?utf-8?B?VkxPK0RaOHNQK2FjVHA0V0hEMVd1MjUzUkU0QzJpeTAzMHZGQjdZS0EzNENE?=
 =?utf-8?B?dkUrdjB5TEVrQUZsbGFlUGZKbVE3YzRKTUgxMzVBSTQyWGx1cHpGeUVleTNH?=
 =?utf-8?B?dDRhbVUxR2V1c1hDS0ErbVkzM2F2bEQ2UlRRSzhlb0dHZTlJMmhZaEZjT3hh?=
 =?utf-8?B?bE9MaTlsNHJvRnh0YWdyVTY4U2ltR2xXbzgycWh4MkJpVFhlTVhlQkFFQUo0?=
 =?utf-8?B?VFVkTWdpOGZoSG01NWZSd0cxQ1VwdkRBZWxPMlYrUFpYb2hadnVMdi9qSWFH?=
 =?utf-8?B?b0ZXZVJjZldNMmhkSFprMnE2dFRJMzlvYkZwTWpCSFNkR2pSQVlCZVgya2py?=
 =?utf-8?B?M1pLd1cwT29DNjdKTys3elN6TUVEaWhBUGdKUmlGb1I4bUpFdHUxcnV4K3VG?=
 =?utf-8?B?dWNyZkRyZ2ZsbVlHMDA2Mlp2dDgzUzVLc1Ztc2pINFIxMFNJNFF0Tm5XUXRO?=
 =?utf-8?B?KzVqbFFJazZtTTlaUkVSdlJNbHBySGI3UWFHMWlwcG1zalhEL2kyeGx1cGhU?=
 =?utf-8?B?M2RtYkh4ais5UW9iMHVGaHh2anNyaldGTFAvLzFBRnZuVXJab0xoQnorL0pV?=
 =?utf-8?Q?lj0F8loLFur/J2YwMaTuzF5+kbiUVPy6hw3oeNs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlHeXpWR0F3U0RXSFV2K1h0UkxhNWtxbTNOTVFSTjlYdnRvR1JTVGdQdU1p?=
 =?utf-8?B?dDdOemhMZVZkOWI1aXlNL3M4WEFFSDlFVit5SEMrTTZZVjZrN0U3WVlZZXlO?=
 =?utf-8?B?NlZrV0RiSC9PK2xheldlMHd0ek84VmEyZFlmM2RwT1owUHJzeU1NdkFoakly?=
 =?utf-8?B?UjdSam1HM2N2a3FwZ0I1S3ZQWGNsZUV0NU1uTWgwWVJpZDBzaTdicXdiRUxs?=
 =?utf-8?B?Y3h6Mno0Ni84QTBySFFqU2t0Y210NkZmeGhEUzd0VVZDVTZydEFmZWFVWFll?=
 =?utf-8?B?alo0b3laZzMvNlVyL1gzT1Z5VzUrWTE5ZWtyMGpiemtsNjdmM2x3TEtIRXkw?=
 =?utf-8?B?Szd1b0pQTk9tSng4SWpOK0l0S0NmRXBzUCtYeXJWMXRrVVdUODJ6YUpGak1B?=
 =?utf-8?B?VWd0OGdkb05tWXB5eE1hQ25COVZ1QUJrbVNpUHRRaSt5cmZWTXJZQlp3bk5j?=
 =?utf-8?B?MHpSZm94Qmx3d3FQK2dMaHZsOXZXNCsvRVJuc0ttbG5FNGZ0a0p1YURpM1h1?=
 =?utf-8?B?OGlZME1KbGJSay9GVXVDb0pWUEFaUjBYUkhGRFRDMSt6b2gvMGd5N2Jlam1Y?=
 =?utf-8?B?U0VyNGpQYms0MVo5YWxKU1VERDkxVHB3ME40QW1IeWp2RjhJVE1kREZ5RmRw?=
 =?utf-8?B?bW0veHQzTHFPdXY3eGNBcHJNMzh1YUNpQXFXcEtBMVZGWnZVZWwyTDJCU0NI?=
 =?utf-8?B?Y2ZFOE1IZWFmTVBsU0g2NGQrcitkOUV5RUxmTEJyb25ta3lGV09MYzV2UzN5?=
 =?utf-8?B?dXJzUkZDY21XZFYvc3pjSCs4WFBoV3hxYTQ3RHdvcVEveTFCL0x1NWFCbS9U?=
 =?utf-8?B?UytwVFFHalExbVNaL3djSWxVblNRd3JUSjl6cHFmL0hnKzhLQTNQK040Zlpa?=
 =?utf-8?B?WVNKbWNrTExwOEZEcllsd3pZN2JZeFFnNW95RlpOSVVPQ2owRWd6VG5yNWN0?=
 =?utf-8?B?YjcxV0FOMDJ6TFU2MUM4dnR6L2tDSERUNWNPRGdKZmpZU0pSNkdmN3NUbE5P?=
 =?utf-8?B?YlIwUVRObjNqbDh5SWxwbFZuTDgyemFKNXZwRHlxWHVZNGhLbFhmVEFKZVlX?=
 =?utf-8?B?WTBBaTZUT2xSaXFPMHpncmJrRUliRllOVTROTjVlRUxtall6a2VCNHlNZklu?=
 =?utf-8?B?U21jV0pIcDkwL3U5alJZa2M0ZkVFSG1IUTRtakhUTGFRcnJVeUt2QXZqaHEr?=
 =?utf-8?B?SGFGQXdQRUJHYlpvUmlnc29OYWFwZkh3ZFNpQXl4UTZKQzAzNW5QbWkwUmQ0?=
 =?utf-8?B?RTJwRURZYzYyR3FsSElrYjJwMk9tK1NWeFBpd09wZDdQaXRHN2Z2OW9KSXVE?=
 =?utf-8?B?dWpuaC84ZzNNQlR1TmZKczdVM0wxMzhUajdUYXArQ1QxVjF1cXJvZXVRcXJx?=
 =?utf-8?B?ZTYyWGZjcWdNZjFXQkNKOGpHZVFhK1hjN0s1VU91UFp1NVhud2orVC82MzVW?=
 =?utf-8?B?YXNpZXdTTys0K2FBV3hSUzJvOE9hYXNWN2xRN1dUaWI5N3RMbDFTOUZYeGhS?=
 =?utf-8?B?ZjJEd1FTYXpIQUpXREU0aEduWHNpWmRlWEZwVUgwcDMxZXNTb0RaNTBLb2ds?=
 =?utf-8?B?NktTV3hhVEcyREk5L1gwNWR6VGcyaEoxdkQrQUFuaEY3TXFnbThPN3RjUVpY?=
 =?utf-8?B?ZTB3eUNOanFPaHBWTnNQV1NBcWlFWHJXdW9SVnJoUjNOWTNMQUhzZXJQZzB4?=
 =?utf-8?B?NXppaEMrR1ZBbjAraEVMK0xCT3JwNjBDYnRVb1FRaUlRVlliOG9QK3JSTGtR?=
 =?utf-8?B?MmhXQUQwcS9SdDc4RmdBTVorSjREakZqQ3hYR2s5Mm9tZUM3TDJHV2ZxWXlT?=
 =?utf-8?B?OXNjUFZUbUxnbXY5THNkMEp2TGt1TGVmdlNuRS9XbGpRVWhkdVFNM05SMS9X?=
 =?utf-8?B?UmxQNHp3THhwZjY2N0dQVnhlTGRjbkJRd2JUL0RqVm0yaGNrWm54Y0M3QVBL?=
 =?utf-8?B?UGRZSm1oUStqMnlBSWdaUmhLRXc2UnZkaERDKzBOZGpkRTdPclJjanVNMjRl?=
 =?utf-8?B?bnFNTFdoVGhPdjM5Q1EveTRkSTZpaktDUVhsNndISHowb2ErdXRMbk1seE55?=
 =?utf-8?B?djhvbXVVVGkzTklaTkNwTWdRWHVteHc4a2poNVBWb0FFNFlYSUc3N3BidXNw?=
 =?utf-8?Q?UU4gk79N/UBJHK53wp89R78yM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f041071-ec6b-4d48-5dd6-08dcf33b1eec
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:17:22.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSG0BRoJoNKK+8V6HOskjB2q5M+QhxwA/5CMONY2bEAbjrzpDqtkeFz7vXipa7Bb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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



On 10/22/24 23:06, Marek Vasut wrote:
> This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
> 
> This parallel/stacked support breaks basic SPI NOR support,
> e.g. this no longer works:
> 
> => sf probe && sf update 0x50000000 0 0x160000
> SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB, total 64 MiB
> device 0 offset 0x0, size 0x160000
> SPI flash failed in read step

Reverting everything seems to me too much. Tom has tested it on his HW and 
didn't see any issue. That's why better to look at code which is causing this.
You are reverting everything but likely there is specific patch which is causing 
this. Which one is it?
Which board was used for your testing? Likely we don't have access to it.
Is there any QEMU available which can be used for debugging?

> 
> Since none of this seems to be in Linux either, revert it all.

This has been discussed with Tom before. It wasn't in sync even before and we 
can't really stop development on subsystems.

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
