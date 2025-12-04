Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73113CA464C
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:03:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40FBFC628D3;
	Thu,  4 Dec 2025 16:03:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BD20C628D1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC3vYw7M/YPPZtQcwDVypfs8xZD+UDyiBQtRKPJ/6mU7sFTU8rgoTbEG93aKRZ94Snmt0pzOLz6U6qixh3rpg3P4KNDTGy5hq/tPzWdsQ4HFyZKlfIYhtTFcifzHOywv+iKc45ewMMw04BUwiMTbzqKmLjEtPGsBD9mVLdsKgbe0zWbd7ZQMYa9nhc9O7bDOgmwo61TWiHETLJj3gXkDMA9RhKoqwTwU0V7rFaIempKmJc0SIAxdNJWnURVph9bGsTWEP4GcrC0zA7LomnyqikSOkw68d0n3V6Cz6iRRPEuHjJYAiHT5/RrXIDxsM/172XJCUMRRFmpGK98cWMDuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=dO8wZ/gVbRnPoimrQ93Op21zTW0AqmoBJnixKT3TeNUx95iqgIw/o13eHuSM0/dQBC1uFC8VYFb7cAyM7t748w92aFXHZ2Nl2wFs4S4cz2OBsVtl/TP0dIWmE5xx4WkZcA/FUxFLFTDYctKXAcKjtrPoj1KZZ+IX1zplkFTnLpgj7pWdTA3ji8FE7G03rEdqw/lZVV38yNPeQXRk+/4bpA3ErO27reEBzYVxfcnms5hgy7ppLHYm7VM/VltPG//e9TRfcxnSycvpKHJi5XPs4uf1rmQ/Zlb+OV0Vw2zaDbfmEcZCTzIse2ih5QiQRiXGFCiG5ZJWDJQslsFQW2Zj/g==
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
 by DU6PR04MB11208.eurprd04.prod.outlook.com (2603:10a6:10:5c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:03:48 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:03:48 +0000
Message-ID: <6d50fe52-4a35-4366-8aa6-116bd491efbc@cherry.de>
Date: Thu, 4 Dec 2025 17:03:47 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-9-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-9-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU6PR04MB11208:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e2cbb2-2d95-412a-0d72-08de334eb5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWRKRVFDU3FaUHBsRGZTTytYOC92UnllbkU2cHhOa2JvaUFjbStrL1pVZU13?=
 =?utf-8?B?dnpKTkRhdnRaTlRvYUJ4Q2Vha0VCZGtVcnNRRWFLUUlKNVFNakRjemVoK215?=
 =?utf-8?B?MGVJTmlCR0FEN2VpQ3ZTa2d6cE0wcEN5QW1qQSs2VTV6TlpSK1gyLy85MWlC?=
 =?utf-8?B?V1dnZm1wRzRQRUZOdzFtNy9abktFY01xMVhNL3NqQnVGdXBoUUlmcEJUZ1A3?=
 =?utf-8?B?WkpXNnQzMXpXZ0lwdTZrWFJmMkp0RVZ0REZiNXhSQXJ6Tmp4Ui9JZkdET28w?=
 =?utf-8?B?eEkzaTA3YUNUZkYreFZHN1NKWDJSWW5UTG1YMklySU1CWnVEamg2b0tVd0NM?=
 =?utf-8?B?Y3ZVN1dXVDkxNnU5TlBMSmRHd1luTC9JejA1L3BoNXdIMDE2bkloN0czVCtN?=
 =?utf-8?B?dS9IRFk0Q2JhR3pIczVFSTNleTNlOGs1RzN1S01HVUoxWFJDSEw0OVlKeW9U?=
 =?utf-8?B?eTFXOUkwRldjdUl6RHVUMVhQMjMyYWNGVElhZVNTOTJJd2R6SWM5akdIUkx3?=
 =?utf-8?B?cXpUQUNwMWF1NXBBdkRZUy9iRGQzY0JyU2Z2RVFpVVU5NUs5a2NGa0k4RUdM?=
 =?utf-8?B?bEIyS2VRdHVtY0lJKzVySFVnaDZzajBzN0NwbjRNZ0d5K1M3Q2FPT2ZOenBL?=
 =?utf-8?B?djhHWWlGWWswUWxURWpGbHNxYmZMR0hTV2pJY0dEOFc2dStnSWt1cUMyU2RY?=
 =?utf-8?B?c1dzNXhYdmV6YjA3ZDJUb2NiQzZabjEzbHdTcjJzTGxWbjNWaFhJa2dlS2Jx?=
 =?utf-8?B?aXRIdWFQL1BBRVJaczloS1QxWjFlRUYvSEdqSFRvUUhDNTNZVC9jUFA5VjBS?=
 =?utf-8?B?V05WeEdINHBNNll0MG5MSTFrZGlPN0plemVhUzVYR0x4UkJ6OU1oa3ZXUGYx?=
 =?utf-8?B?UzRESzBYUWlqL1htNG9ocUNYQStVUS9rRkd0bmVsMm9uRUJoR3UxekxQZmRO?=
 =?utf-8?B?QlhpVkxZZXpLTldVNTRzcWVsU1ZlNmcwM2RRRXZJY0xpeHNLY0RhSjMvWlBv?=
 =?utf-8?B?b0JVRHZCTGlXQ210WUZWcTFrU2tCcUJsOVRKTE9SVklNYVNsdDVOQVFVNnlm?=
 =?utf-8?B?UHNHOFVPSFhINDFFS1JRcUxyZC8vRE96QlJ3TEF5dWY4QTA1NlRReDdCQmox?=
 =?utf-8?B?bHkxY0htTDBjQVQvRUx1VEFvSVBRWlYyQmdpWlF6T3FhaXBLdUdOS3kyTEt0?=
 =?utf-8?B?UEpzVC9mSlQrUWpaTzZkQmFYU2RmWG55aVBuQTFWUFZaYy9jZW9ndVZNZjZw?=
 =?utf-8?B?STFKemdtYTlHSlYwMVR5NmZxc2lDa0hsWmgxZ3U2K09KWHpJQmNFNjYrOGEx?=
 =?utf-8?B?cGw4Rk1OYmZjN2tKU1I5SnNJaEZ1VW1KZU1DdjNMS0NQMHg2eFk4eUxpbnJL?=
 =?utf-8?B?YzNqRmFibWRPdTMvakNxR2YxZmtjeFlySDJhYkwrT0FQdGpZbXZMaFJ2eVpE?=
 =?utf-8?B?Q1Y2VGV5MjJJV1A0NzF3K2dlRXZOMnV6ZTRtS25xZTRjUmcrTWdIZStndjhP?=
 =?utf-8?B?TzEwYmJyR2ZvNXlmQU1oc1lxQ3VrVlhxV0Y1dFhEaXhDbnZ6cGlIeUhPbnJr?=
 =?utf-8?B?Q0ZXT0Q1QTlNanMrUU1qL0EwUFVmcUVsMUhpeDVYR3pJTEFuT2dRYkJ1YXRC?=
 =?utf-8?B?QmZ2UUVNeHFYOEtFdGVWWlVNaC9ncnEyY3R2R3YweURSRG8xNWsvNC9NNmgr?=
 =?utf-8?B?Nk5hMFJ3RUx6R1lQRzRhd0VOWnp1TlRxRndkUHB3NktNdUNtNFZYb0xwcXNa?=
 =?utf-8?B?Rjk0blJYTWtIbzhseXY2UGVqbkE5NjQ5ZmNJM29mUFQ4dWFUaTZsVjhRazZP?=
 =?utf-8?B?RWtvaTQ2bkdRL25hWkxpSGZiUS9oNmlVQ0cxTzJEaEJYNWJmVWNrNXRGUDZr?=
 =?utf-8?B?YUtIL3htWW50dnN2RDVFelpVRUJBZ2JidXZkYmF1M2k5SzVRSjl4L1NqUUdE?=
 =?utf-8?Q?3CKr+FPGxsAahN1gzSufitH2MtFs7nrF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlBOY2gyVnB5eFJSZHNqTzRwazRoeHNudzR2Zm1EOVE2Kzl4ZEVHeGZJbDE0?=
 =?utf-8?B?SlJzOXk4ZnU0TzZGMHFEYityM09ya0lvUEZmYVYzUDZkVFIybUl6akxuRDdG?=
 =?utf-8?B?d2p4bjZxUG9Xb2RaNVRPaFFnV2pSQTJyT053Y1lNQXFmcWZJT0YzaXlFdW1J?=
 =?utf-8?B?M1NEaE5XL1pNaHY0MUc2dHRGSUVvNE9id0k2dEFXTVYwcUhSRUJVakdKK3dv?=
 =?utf-8?B?cEFrYXk3aVdxVXBaWmFhM0VlM1FuMk11UEZsQ000MFk1QkQzUWJ5NTA2eFd5?=
 =?utf-8?B?QVNFS3ZnN3h1YzBRTCtQZDF2YW13UkpvQ0JFblpDZjk5K2lKQmd5U3ROTzQ5?=
 =?utf-8?B?MzNYVkhVbk94ZlIvSE4veU5PbVJkK0RzQ3hKY0VBOFppNmNtSVhWK1NRaDRx?=
 =?utf-8?B?em44YmdTVXBoWlpReEJ1WTJPcFhObjdZWFlwZ3VZUlVuVkgrRHF6VktsNjlW?=
 =?utf-8?B?SktPTThMRXluMDFiSUVuK3BKSUhRdzFZdFVXa2xLNEMveGZVa0IyMVlidnlN?=
 =?utf-8?B?SlVSd2kvV243Uk1ndHUrb0J3MXBMZXZDSVlwbzN6RWFGUCtyc010UXUzZElu?=
 =?utf-8?B?dEdYd2tqaHB4YzJoUVArYUlNU0N4bGdGVUhoVHAyS2pwb0gwcnNXU2k2Zkc3?=
 =?utf-8?B?K2drL05CaEVYNDZEdnljdWZWVEY2ZDltZitqMWsrSjZhUlczdXA0NEg2ajB2?=
 =?utf-8?B?a3lEZG5OTVdycjR5dk5obVFMMExQeUFKajZyVEcwQXZhVGV4UWtUcGMrUjZK?=
 =?utf-8?B?OFIwUEE4UHZRdHdhbUNMakxoMUN2QzlPTzcyd2FCOG1hdmNELzR6eXNsbGFy?=
 =?utf-8?B?TS8rSENITlpJVUV4VUoybnhHZVk2c3JqbG1BRzJ2MlhqRm9scFl6ZnJZOHh4?=
 =?utf-8?B?UkpsKzlqQ0c4MW1LT2tnL0hkRlJsakRZTHA0ZXE2UzRnZFhzbjJTKzIxQlda?=
 =?utf-8?B?OGs1a0pHcjFPbTFlZGIwemhqTHNnUW5lOHR3NVE0UUVVbm5XZzl4V2t1N3Y3?=
 =?utf-8?B?endsTWFsQW5YakVzZ09rNzljVEZJY21uR0NiTHk5clBhNFRPVzlyQkdya3Vu?=
 =?utf-8?B?cjlXTEV1U1RNVFBmRUZ4Y3ZDZkRSZGFlbjJiRWJkQ2h1TTl5TUFFaVlTeDls?=
 =?utf-8?B?WENDUG4yY3c2Qm9tbEhINlhGbE1YYjFvUTcrTVh5NjQ2RGYyNlZaODNUS0xW?=
 =?utf-8?B?Wk5maFhoYTJ6Z0VqODBWZEhoRGZEdGZraG5rdkJNVWNsQWc4cU9EbjA2QjVJ?=
 =?utf-8?B?N3FNd2NpdXZXelEwa2VXT2pnV0tXVDFBcHNHNGpwZVZxbmNjQlVlQjh1b0lh?=
 =?utf-8?B?dHlka3RHdUVQQkMwZ3RrTUVyRmwvb3htQjFUZUlRZkJwbGdudFhjc0x0QUY5?=
 =?utf-8?B?blgvYVpLZFM5YlNCdGpRalZSY3JtYitZNU1LMnlOcFpNdXBLM3AvcEg5K2tH?=
 =?utf-8?B?SmVYYkdkSjBJeWxPcVJ1VVZ5TGZnTjBxTmJlWEFmMVd2M1hNQlppQ0VaQVFq?=
 =?utf-8?B?RXVmb3lOcjFVM2c2ZE5ISzUzLzZVbHZ1ODBMMVIxNEtjcDlNWDdBR2xYZVZX?=
 =?utf-8?B?MVliekJ3NWUwc3VEazR0SGpvWFM5RFp1U1BZWk5XT1U0WEJ2ekREZFBWejJ6?=
 =?utf-8?B?dzZsak8zSHdFVUxrMEh2bm51UjBsOFBoZldPL3FtbWpLRnRrUkFJaUFJQ3Vz?=
 =?utf-8?B?QndueHJ4RVVtV3l2bG0xVEwrOUxoL3d0Q1dkMnBDSExTV0hRZjZRTlhnTFJr?=
 =?utf-8?B?WEYwQzUraGdwbnNuSEYrNXFQRForUlBHRTNCN3F2b1l0NlgxblByNk1vSlNI?=
 =?utf-8?B?ZXF6a3RyZkJNVlpwUllYbVZDMWt5YURhWTY1SXRQTXJkWE94M3VHZzVVSmRK?=
 =?utf-8?B?WWZRYXFuVTd1Ylgwbnh5MkZxVlp1SjVkMFhKU2NyRnJzY0RqbjMvQ0tROFVS?=
 =?utf-8?B?NnJ5WlJyRXIweGI2Mld3dzlTa09JS0krUjR4ejNmVVdOUklRMlBhRVFaMUlW?=
 =?utf-8?B?ck5Db0ZnU3EvMk4xQlRZZ2JuTDFZZXFib1QrUWFiNG00Y2pwakV3Y2xPTGc5?=
 =?utf-8?B?NDNnbjh2VVJncHRzL0YyOXpZMHVuMld1UEROeTZpeEIra1lXZTkzay9FRHNa?=
 =?utf-8?B?TEdNSTIxaTJOSkVXN1FHazVvOGZDN3k5ZkplemthTndycm16VWk1c2I0RitT?=
 =?utf-8?Q?es0ygsS/1K4kZQHwRxYZiqg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e2cbb2-2d95-412a-0d72-08de334eb5be
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:03:48.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6VaPCdUEjFKbybTsxbKxnnBNYnllzsblbs8b0X/fChjRtjInl8rc+LfcxRiP7RGwV2YVipUmrdaETqfJHwaTf3IBCwrAim0sb7pGo5x0To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11208
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
