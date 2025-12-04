Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B3FCA4861
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:34:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68BF9C628D0;
	Thu,  4 Dec 2025 16:34:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C32B5C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:34:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEwalbHlHywsBb2S5xGYJJtIo5A6icMrHCBe1mxRzjifJZslBKpuTTtw1EfIjIEfxv1ycANjpXNeh8w40wOL5Y8IboZzGG9WD8FurQqy8Xk+N3AIHBaUNELqsVpTVtng4AY6YRtm0D95OA8j399PGHlEt+5xSQH3JZ7wQxS9hMPY0lAJMu81WKSoiaABMdXd7LzpGfIFzyJGhFP6sqFYZhaEpLDbWsb8uvdvM1S++khFV1g1ik6BVl7CQK6GW4NyM76RPLL6BbX23L1wEW1/za1G671YSjZYARs1CGa7WhvnVgttfQkCGyvBkrBZEqKXwOaYWLZkjxHD4Ngf3qJ9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ+WVe/bHEHVE9tsLsTVtXZg/tbxGQJwLw7o9O3x2ME=;
 b=brKrylKWp0C6UlbTa/Ydihj72qQo5kWJ6a1zULtmVkKIrm7oHR8Th5eB65gD7Yy7d0UkiWeyFx/0TW7F63HjVYHkAAt8Y/o8rgPImQvhGJnvkqnUCw/3GNmVAscE5qhghzL24MkH9Rh/uhOp1nCcLlHG9B5+HomOC2Igh6FIuBjkdKoHB8VtJNwo1UWsuFJSpy5vg06aRpvz/jQM6hlY4JGPrz0QPk9XZZgLIQlfzSthOxjkO1FHKwDHgHtXySLvO8EWurAq5Al4+Fc16qFooC7QZbwlqYx2c2TeKVOVosCBIz5TvrGwWwONLyuVbn0vB84Shq8Ty9AzU/DqhERl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ+WVe/bHEHVE9tsLsTVtXZg/tbxGQJwLw7o9O3x2ME=;
 b=ReSlN53IiGgtoScxmli0BtCr1bb95YA6C2H5ZzTr3w9bZkBkDWtpcR7xw+4NH2PYhmLUGkT24oEMJWq2GW0Sj0VyWgmBCpFwpgioXCBgAiYYm1xPCz2RnDp8qozD+yPBagS35wJXkq1Co8c7J95iNXgKTkb9zdGtqT3bQj5u3Qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10769.eurprd04.prod.outlook.com (2603:10a6:102:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 16:34:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:34:16 +0000
Message-ID: <d132665c-bbb7-4182-a474-32c3aa7781bf@cherry.de>
Date: Thu, 4 Dec 2025 17:34:07 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-22-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-22-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10769:EE_
X-MS-Office365-Filtering-Correlation-Id: b96100ae-32e4-42d7-246b-08de3352f775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2ZQY3c3bjhNY01lVFVZckgrTmQ5S0c1ZGlVMmc0d1hxVGd4UlVUWXZCV2hR?=
 =?utf-8?B?NStsZlByN3JERUE1Y0lGbjNULytydWZyMnQ5ZnZjRDhtc0plMGVOWlFlWXVl?=
 =?utf-8?B?TnRxNlNhRHJtNzZGZkFySzZrc2lqTHB5YU1hV05EcFVsT3pzU29QSkoxbFE1?=
 =?utf-8?B?SXJWUXJnQmp5QjZ6eFpvSmhYRjBhSXNUTktPNFQ0Mkw5ZDBrVnQvVE02ano0?=
 =?utf-8?B?K2FhVW1oWldRVFYzY3hZa2poOEpUNGx4RTRkNyszallJQXV4czcwQU00YktV?=
 =?utf-8?B?d1hPay82MnM5SmxDK3hpb3R4d3V2SjZrQVRORzNoQ0FlSnR0UDQvQzJlR0ZG?=
 =?utf-8?B?blE1VGdhUjJtUSs3cmNzaTNrOWZ6WHNDYTlJZXFtTWtzblNkTlFrNHd1N2Q4?=
 =?utf-8?B?WEp3K3FmbFFKV2xSZ3orRmwrQ1ViQy9aYjRBMmxIVytVK0IvRGpCSXY3Tk13?=
 =?utf-8?B?UVhhRC96U1pJL3JMbEhrTnIrT21YSWpQRk42eWRLbmE0czVqZjNNYmFtOHJj?=
 =?utf-8?B?ZTdkT2xrRzRqL1dUVmFYU2NmNGlFQ1hCNS9ldkNxN1M3MTdXcGxCeFI1RGNx?=
 =?utf-8?B?YUZiaTltVGxmbEF4RlRtV25EMkcrUTZEZGFRUVNDejViYU5pNlRsUVVtbVFR?=
 =?utf-8?B?NEdRZkd1ODdtRENzQ2VDZkV0dE5KUjhad3dCcHpTa0RjMWhqYUpOeHh5WE1Q?=
 =?utf-8?B?eTY3S3J2clVIVjlNL3I2VjVPQjFlVzN4eVJ5dmFLMVIwejFldXB2SFZ4OWVa?=
 =?utf-8?B?MWtrVTRDeUZwTlVOakVWNHY1Tkc1NzF3RGNOQm1YMlN0MktMUjFMQmVXQjNJ?=
 =?utf-8?B?MVlya1V4OE8xL2s0amM2Y0I5MUNzUmdjZ0hPd004S0krSDVuTTVjR3FzdjJx?=
 =?utf-8?B?Y0tLdi9Ud0pBeW9XUnN2YVo2S2REZDhZcjIrVG1TZE4vcEdnRUhTb29Xc1hr?=
 =?utf-8?B?Z21Fd0htQUtxVnFnQ1oxZGdicVVkQ3dsY0FOSUhtelBEaE9OamExbFp3R0Zo?=
 =?utf-8?B?L2tEQkFyQXJiVlBqdDZkUjUwQjZIQ2xxNVhMNzgzaEVheXRYbHFkcUVwc0U5?=
 =?utf-8?B?cUN2SlQwalJjSitwQ0pOQmt1YnNrd2o4WXNxRGFVWUlPT3NUMzhIWTlaMmFH?=
 =?utf-8?B?K2xKN2FwdGcyNXJuWEFaVUJQMTl3OWpZWFd3TzllN1JxZ0NYZkhTTTFtZXRY?=
 =?utf-8?B?alBBRU94cllKUEtHWmN2MDROSGt1N09XdEZyV1Q0cDd2MjZOK01CbjRYRVBG?=
 =?utf-8?B?N2JsQ0xlWTZpYjBlejN5bHRFc21tY0laSTg3eng4SlVxT3JNdElKOUk5Z3Zh?=
 =?utf-8?B?K0NGak5GZHNxV3F3WXZ3UnQ5dVJNQUM1b0R6NmhmWWtQbzNhUHNzMmNhZ3Q1?=
 =?utf-8?B?WmUvQlVqWEI3MXpZRmxLODM5YzlZZWErVXQ4ZzFwS2QrQ3laUGhwa1dnbjNu?=
 =?utf-8?B?OUhBam9qRTM3TVhMRkFaSm00dkdPT0lBMVJ0dmpmNVBtL1BRdXl6dUVLczFW?=
 =?utf-8?B?THM2T0tqYVBRT2NMalY2MWZoL3duS1U2N3ExdTRmb3R6d3ZzZ0hrY1VDb01h?=
 =?utf-8?B?VnFtTU9ONW05Qy9lcngzRWk0bzY2aWgyRWJxUFEvRXJIcUhlZTJmU2tRQ1M5?=
 =?utf-8?B?dDlYTUtDS2tNQ1VobE53M1phMUpxRHhKNVQzZnY2NVZTYjRhdFhOZkJJT251?=
 =?utf-8?B?SXNRU05SR09iK1JpL1gwSHZBdk5LRktEUHpWR0V1RjExc3B6UmhWMkhpT1Q2?=
 =?utf-8?B?Y3NDYXd1a3RQWk9mc2E0Q1YyNUdLYXVjZ2VmREp3S0lFNWNqLzVUOXBQeDR6?=
 =?utf-8?B?R3I3VGEzVGROYk9KSUtKUmQvYUxpTGNEWDRVSDZXdUtaRXd1NmJNR1k1VTVz?=
 =?utf-8?B?U0VwMXRHVUh4aldNaGpiQUF2YTdDbTVVVyt5cUs4TzFucFIzZTlxYnoySjdh?=
 =?utf-8?Q?5H1HSnb8w4iKDVJcegk4eSRxiAZqzdX/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDc2SzBxR3NqVXc3ZFJXRkVDWUpzSDNoYU8ydDBWd3NNR1dYSzJ6ejZ3Mkhx?=
 =?utf-8?B?U25kelFRVUE3emJxREY4Mkc0VGpVcnI3OW5CSlczc0UvNnNmZ1V6QW9MbHlt?=
 =?utf-8?B?T2k2czE0bzlYdWpXdm5Jd1VXcWVuVHRQZ0ZTZGJoUnVDcEVnNXBtUk5TOGY5?=
 =?utf-8?B?ejVyMTVqbzl1ZjIvS09lVHFYTWRYR0tsVnJYZXFWQ05RcTRxWVlZMUFNTFBi?=
 =?utf-8?B?YlZJcUV0Wmx0SDNlQi9QbjdNTm41d1NXMWlqbmFMQTRqY1VwMExPVFFsa0hp?=
 =?utf-8?B?cksydDh5MmVhL3pyUEpXVjJTYmdTalpwRDRRUWdyclE4NnhKRW1lVFp0OVNJ?=
 =?utf-8?B?QXp1U2dZOW4xZkk4cDFnekZzdnZaV25FTVdxa1BJYUwvak1HUnEwakVpSE1l?=
 =?utf-8?B?N1RKN3VRaTNIZmlVS3kyL1QzK0NvNEtYZ09XR0xoNEg1czBVc0FsRUFXZWd1?=
 =?utf-8?B?N09xZWErZ3lWWGkySjd2elB3L3VlcTByUFBTVy9GSnF5WG43dDA4U2hodVdC?=
 =?utf-8?B?VzdHcUxPbWU0ZjdBb281NzVvNUhiTy90SUdJWENhWFdRRFhVeGhaWFBFMVNu?=
 =?utf-8?B?aVphamtRdE96YWxTQTdDNjc5SEJqbWV2aXJNM0krL3M3Wkl5OC9KcW5Gdndi?=
 =?utf-8?B?VGJ3ZFpaN3Y5Wk5tMXVqVG5hQXc1bmxtQnBkOExnQUpVMS9PQ3RvZmg5L0VV?=
 =?utf-8?B?NVBkRHdEdVVnSS92NkRhTHZmejFyQzhmRStxalBOVVRWNGNybXBKZ1VMTzh5?=
 =?utf-8?B?MEx2MzdNNVo1MUprRldFbE96bm8vK3ozV3JPMmVSdTB3aEt6MkgwZlNRTlN1?=
 =?utf-8?B?S3d6cnNmbEhqdEtEK0N4Z0NlNHBPVVRKUHRGQk1DK0xMRTVDbkZZUFJ5bk1w?=
 =?utf-8?B?ZHliMmM5Vjh3Z1hBV08wdmRqL2NDb0RoK0I0a3NoV2UxUGxqMXhRQTg3Z3F6?=
 =?utf-8?B?dmxkK09oTVd2ZE15dTFEcWdGWjNFMnB5TDh3SEZ2eUxWTFhKZ3k0TUMyRy9x?=
 =?utf-8?B?RlR5VHNNYUdKbkt5NjVCLzFaUFNLeVJvOHByQW1qNUUzbitubzJ0SEdacjlh?=
 =?utf-8?B?Uk9ZTHJpSnVOTE9FaDdTUVFBcGhSOW03eHRjZEdVNE5YK2s2OGJKaVBZaE9Y?=
 =?utf-8?B?MHdDaERmeE1WUURDdnJwWFBNTXZ5U1F6eG9tc0xuRTlyQmpkOVN2RkpXOWo5?=
 =?utf-8?B?TDJMUWpld1Fzbm16MXZGY1RBbDl3M0M1NXlUZUUvNGwwdi9tZWFxUlVycjZN?=
 =?utf-8?B?Nkw3bUtjQmpjcGpsYUpwZWJqWkFEM21ldVZXQjM2ZUsraVhSZGVlY01GbS9I?=
 =?utf-8?B?dldVZmg3RzhNeU0xcWNDdC9BUWgzZkxPK3pZWUJ5L0NKY3VrMUZIUHJNU0xy?=
 =?utf-8?B?NkthMnB6YWlVVm5TRmpUK2NWZmVPWDd2bTZHcy9ZYlFlZTNpM0RBK2o5K2lY?=
 =?utf-8?B?elRJeCtLZ0tmK2UzKzVuaExVV285cEk0OExQcTFOU0dQazFrMW1WU0JWdHJF?=
 =?utf-8?B?ck5XRURGOXRONXM2dnVBb1NPNHNlUHozWnA3NEM1WXRSaElrMmhENStzaWR1?=
 =?utf-8?B?ZStlWmNnZmlOT0E2VTA2eDYreng5WjlUS2ZINExtQVB6SG43ODNqL0I3SnRr?=
 =?utf-8?B?UndPcG4zREViMjdMZWRHTHBHUGZNYkt0emZSY2IxeE9GSk1EcWtzK1M3Zk9B?=
 =?utf-8?B?dG84R3VvaTlZQXFaRzhVQXBvRHoreVFqd1kxSk9sOEhEZnRGUHpTcEpyUWQy?=
 =?utf-8?B?LzVOY3ZtUzFMOGZoSmVGNGlhNGNOYVlRb2RZdXZGRVpiUkFEbmQrSDVUWU1K?=
 =?utf-8?B?QmNvR3ZLVk9CcTFzcDF3RUZBd1RvZng5UVR3VWkzQzlsbFdZeG5QSjg3RkZl?=
 =?utf-8?B?RXhHRXdxeHdnaHFJVDA3MUpzaWduQld6ZGFBSUhPc0s5dzNXeE5GMTZpbUUw?=
 =?utf-8?B?dDhDOVJINE43RSt3Sjg3MVBtcjJKNTZpZDgrWWhUSzJ1LzV2U3ZKRkRyN3pR?=
 =?utf-8?B?MzZUR2FQTFNLSzhqVkdabnpFSTd3bHdhMlVDOEVWZ2RsWExMN2RBUkdoSGFs?=
 =?utf-8?B?THBKQUJxaUlsNTk3VGdMQ0t5ZUpVOGJKSG9CSm43eTlpREZncWZ6QjBrc1B0?=
 =?utf-8?B?bzZ4YSs5aVpGZ29XSnB3OHBjdUIyRktQRmNic2ZTZlA3OFFxVmVhakZ3Ukc2?=
 =?utf-8?Q?kmd38Xl1C1tGrMzgqIHb9Bc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b96100ae-32e4-42d7-246b-08de3352f775
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:34:16.6843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeFFLlY9T1aKtqnboSmRpJTl3+ispi0Hltw0EbF7mxILtoZdFU025/vFKEasJREVqYm38RknPqWP/IIZQjMDy5EqQtGlYPZYeygbQUXD6jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10769
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 21/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp157c-ed1-u-boot
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
> from stm32mp157cf-ed1-u-boot.dtsi.
> 
> Remove led-red and led-blue nodes which are available in kernel DT.
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
